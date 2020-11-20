#pragma once
#include <QThread>
#include <QImage>
#include <QReadWriteLock>

#include <librealsense2/hpp/rs_context.hpp>
#include <librealsense2/hpp/rs_pipeline.hpp>
#include <librealsense2/rs.hpp>
//Note: All we might actually need to synchronize is a list of which 
//cameras have already been initialized and thus should not go through the
//same progress again. 
//  Theres now reason why multiple models cant have the same stream sourece
typedef struct ViewPort{
    //This will allow us to get the device DS
    rs2::pipeline_profile profile;
    rs2::pipeline pipeline;
}ViewPort;
class CameraManager: public QThread {
    Q_OBJECT

public:
        CameraManager(
                std::string serial,
                unsigned int rgb_width,
                unsigned int rgb_heightm,
                unsigned int depth_width,
                unsigned int depth_height,
                unsigned int fps);
        //Nothing much here
        //~CameraManager();
        //static bool isManagerRunning = false;
        void run() override;
        void stop() {camera_running = false;}

private:
        //This should in theory be shared among all camera objects
        //TODO : try to remove static to see if something blows up
        //TODO : also make sure these are synchronized(as needed)
        //TODO : not sure if the map should have ulong as its key or 
        //some other shorter/longer memory ds
        const static rs2::context  ctx;
        static QReadWriteLock _mapLock;
        static std::map<std::string, ViewPort> _viewPorts;
        std::string _selViewSerial;

        bool camera_running = false;
        rs2::config _config;
        //Vector to support multiple pipelines(cameras)
        rs2::frameset _frameset;
public:
        static void changeInDevice(rs2::event_information &);
        //Should only ever be calleed once
        static void initializeManager();
        static rs2::device_list getDeviceList(){ return ctx.query_devices();}
        static void enableDevice(rs2::device dev);

        //Non-static
        //Change serial for this particular
        void setSerialNo(std::string);
signals:
        //Will fire when we can get a frame
        void framesReady(QImage frameRGB);
        //Will fire when we find out that 
        //either a camera was conneted or disconneted
        void changeInCameras(QList<QString>);
private:
        QImage rsFrameToQImage(const rs2::frame & f);
        bool changeInCameras();
};
