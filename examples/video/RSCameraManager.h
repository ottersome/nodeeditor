#pragma once

#include <QThread>
#include <QImage>

#include <librealsense2/rs.hpp>

class CameraManager: public QThread {
    Q_OBJECT

public:
        CameraManager(
                unsigned int rgb_width,
                unsigned int rgb_heightm,
                unsigned int depth_width,
                unsigned int depth_height,
                unsigned int fps);
        //Nothing much here
        //~CameraManager();
        void run() override;
        void stop() {camera_running = false;}

private:
        bool camera_running = false;

        rs2::config _config;
        rs2::pipeline _pipeline;
        rs2::frameset _frameset;


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
