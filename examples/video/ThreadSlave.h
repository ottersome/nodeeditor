#ifndef THREADSLAVE_H
#define THREADSLAVE_H
#include <QPixmap>
#include "realsense.h"

class ThreadSlave: public QObject{
    Q_OBJECT
    public:
        ThreadSlave(RealSense *,QPixmap* pixmap);
    private:
    QPixmap* pmToUpdate;
    RealSense* rs_man;
    cv::Mat ground_truth,color_img,depth_img,infrared_img;
    public slots:
        void doWork();
signals:
    void pixMapUpdated(QImage frameRGB);
};
#endif
