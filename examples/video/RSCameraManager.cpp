#include "RSCameraManager.h"
#include <stdexcept>

CameraManager::CameraManager(
        unsigned int rgb_width,
        unsigned int rgb_height,
        unsigned int depth_width,
        unsigned int depth_height,
        unsigned int fps
        ){
    //TODO do configuration for depth later 
    //Set up the camera
    _config.enable_stream(RS2_STREAM_COLOR,
            rgb_width, 
            rgb_height,
            RS2_FORMAT_RGB8,
            fps);
    _pipeline.start(_config);

    //WOrk up the cam
    for(int i = 0; i < 30; i++)
    {
        //Wait for all configured streams to produce a frame
        _frameset = _pipeline.wait_for_frames();
    }
    //Done with the initialization
}

void CameraManager::run(){
    _frameset = _pipeline.wait_for_frames();
    rs2::frame rgb_frame = _frameset.get_color_frame();
    auto q_rgb = rsFrameToQImage(rgb_frame);

    emit framesReady(q_rgb);
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
    }else if(f.get_profile().format() == RS2_FORMAT_Z16){
        auto r = QImage((uchar*)f.get_data(), w,h,w*2,
                QImage::Format_Grayscale16);
    }
    throw std::runtime_error("Frame format not yet supported");

}
