#include "RSCameraManager.h"
#include <librealsense2/h/rs_sensor.h>
#include <librealsense2/hpp/rs_context.hpp>
#include <librealsense2/hpp/rs_pipeline.hpp>
#include <stdexcept>

rs2::context CameraManager::ctx;
QReadWriteLock CameraManager::_mapLock;
std::map<std::string, ViewPort> CameraManager::_viewPorts;
static const std::string PLAT_CAM = "Platform Camera";

CameraManager::CameraManager(
        std::string serial, 
        unsigned int rgb_width,
        unsigned int rgb_height,
        unsigned int depth_width,
        unsigned int depth_height,
        unsigned int fps
        ):
    _selViewSerial(serial)
{
    //Not much to do here tbh.
    printf("Initializing Camera...\n");
    //Para calentar la camara
    //for(int i = 0; i < 30; i++)
    //{
        ////Wait for all configured streams to produce a frame
        //_frameset = _selectedPipeline->wait_for_frames();
    //}
    //Done with the initialization
    camera_running=true;

}
//This run is per thread, meaning that it will 
//  be capable of indicating changes per model
void CameraManager::run(){
    printf("Running a single thread here\n");
    while(camera_running){
        //printf"Still running lol\n");
        //By this point we should have a single camera
        //selected for this particular model
        //and assigned into _selectedPipeline
        //Not sure if i should have a lock here
        _mapLock.lockForRead();
        //_frameset = _viewPorts.find(_selViewSerial)
            //->second.pipeline.wait_for_frames();
        auto itr =  _viewPorts.find(_selViewSerial);
        //TODO should we use semaphores for this?
        if(itr == _viewPorts.end()){
            //TODO: handle this better
            _mapLock.unlock();
            continue;
        }else{
            try{
                _frameset = itr->second.pipeline.wait_for_frames();
            }catch(std::exception e){
                _mapLock.unlock();
                continue;
            }
        }
        //if(_frameset==NULL){
            //printf("Error with framese\n");
            //return;
        //}
        rs2::frame rgb_frame = _frameset.get_color_frame();
        auto q_rgb = rsFrameToQImage(rgb_frame);

        emit framesReady(q_rgb);

        _mapLock.unlock();//TODO make sure this is right
    }
}
//Our special function that voids the need of opencv2
QImage CameraManager::rsFrameToQImage(const rs2::frame &f){
    using namespace rs2;

    ///Get width and height
    auto vf = f.as<video_frame>();
    const int w = vf.get_width();
    const int h = vf.get_height();

    if(f.get_profile().format() == RS2_FORMAT_RGB8){
        auto r = QImage((uchar*) f.get_data(),
                w, h, w*3,QImage::Format_RGB888);
        return r; }else if(f.get_profile().format() == RS2_FORMAT_Z16){
        auto r = QImage((uchar*)f.get_data(), w,h,w*2,
                QImage::Format_Grayscale16);
        return r;
    }
    throw std::runtime_error("Frame format not yet supported");

}
//Static funciton called everytime theres a change in device
void CameraManager::changeInDevice(rs2::event_information &evi){
            //Whenever theres a change in device we will reorganize
            //  our pipelines data structure.
            printf("There has been a change in devices\n");
            //To organize we must acqurie a write lock
            _mapLock.lockForWrite();
            printf("Locking fore change in devices\n");
            //Check for removed devices
            auto vp = _viewPorts.begin();//iterator
            while(vp!= _viewPorts.end()){
                if(evi.was_removed(vp->second.profile.get_device())){
                    //returns next iterator
                    vp=_viewPorts.erase(vp);
                }else{
                    vp++;
                }
            }
            _mapLock.unlock();
            //Check for added devices
            //This locks mutex on the inside
            for(auto&& dev: evi.get_new_devices()){
                //Add these new devices
                enableDevice(dev);
            }
            //TODO somehow let the GUI know theres been a change.
            //  Maybe we can just use timers for that
}
void CameraManager::enableDevice(rs2::device dev){
    std::string serial = dev.get_info(RS2_CAMERA_INFO_SERIAL_NUMBER);

    //Get lock before accessing the viewPorts hash
    printf("Locking for enable Device\n");
    _mapLock.lockForWrite();
    if(_viewPorts.find(serial) != _viewPorts.end()){
        //its already mapped, nothing to do 
        _mapLock.unlock();
        return;
    }
    //Otherwise initialize and add it to the map
    if(dev.get_info(RS2_CAMERA_INFO_NAME) == PLAT_CAM){
        _mapLock.unlock();
        return;//Dont add Platform Cameras
    }

    //Create pipline for deivice
    rs2::pipeline p;
    rs2::config c;
    c.enable_device(serial);
    c.enable_stream(RS2_STREAM_COLOR,
            640, 
            480,
            RS2_FORMAT_RGB8,
            30);
    rs2::pipeline_profile profile = p.start(c);
    //Emplacing Viewpoerts
    _viewPorts.emplace(serial,ViewPort{profile,p});

    printf("Unlocking for enableDevice\n");
    _mapLock.unlock();
}
void CameraManager::initializeManager(){
    //Register the function that will manage changes in devices
    printf("initializing manager\n");
    ctx.set_devices_changed_callback(changeInDevice);
    //Now emaplace all currently available devices
    for(auto&& dev: ctx.query_devices()){
        enableDevice(dev);
    }
    printf("Initial size of hash %d\n",_viewPorts.size());
}

void CameraManager::setSerialNo(std::string serialNo){
    _mapLock.lockForWrite();
    _selViewSerial = serialNo;
    _mapLock.unlock();
}
