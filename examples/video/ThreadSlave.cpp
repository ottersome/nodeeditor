#include "ThreadSlave.h"

ThreadSlave::ThreadSlave(RealSense* rs,QPixmap* pixmap):
    rs_man(rs),
    pmToUpdate(pixmap){
    }
void ThreadSlave::doWork(){
    printf("Slave is working now...\n");
    while(true){
        pcl::PointCloud<pcl::PointXYZRGB>::Ptr layers;
        rs_man->run(color_img,depth_img,infrared_img,layers);

        //By know we should have a color frame ready
        rs2::frame colFrame = rs_man->returnColorFrame();
        auto q_rgb = rs_man->rsFrameToQImage(colFrame);

        //*pmToUpdate = QPixmap::fromImage(q_rgb);
        Q_EMIT pixMapUpdated(q_rgb);
    }
}
