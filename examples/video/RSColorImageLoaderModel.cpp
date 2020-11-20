#include "RSColorImageLoaderModel.hpp"

#include <QtCore/QEvent>
#include <QtCore/QDir>

#include <QtWidgets/QFileDialog>
#include <QComboBox>
#include <librealsense2/h/rs_sensor.h>
#include <memory>
#include <qnamespace.h>
#include <stdexcept>


static const QString NOCAM = "No Camera Connected.";

RSColorImageLoaderModel::
RSColorImageLoaderModel()
  : _layout(new QVBoxLayout()),
    _cbCameraList(new QComboBox()),
    _b_refreshList(new QPushButton("Refresh List"))
{
    printf("New Rs image loader\n");
    _cbCameraList->installEventFilter(this);

    //Create Signal-Slot COnnetions
    connect(_cbCameraList, SIGNAL(activated(int)), this, SLOT(changeCamera(int)));
    connect(_b_refreshList, SIGNAL(clicked(bool)), this, SLOT(refreshSlot(bool)));
    connect(_b_refreshList, SIGNAL(clicked(bool)), this, SLOT(refreshSlot(bool)));
    //Initialize the button

    //Add to layout
    _layout->addWidget(_cbCameraList);
    _layout->addWidget(_b_refreshList);

    _parentWidget.setLayout(_layout);

}

//TODO delete this function from this file and from 
//the header, too lazy atm
void RSColorImageLoaderModel::startRSPipeline(){}

unsigned int
RSColorImageLoaderModel::nPorts(PortType portType) const
{
  unsigned int result = 1;

  switch (portType)
  {
    case PortType::In:
      //This will receive an event that will tell it to execute
      result = 1;
      break;

    case PortType::Out:
      result = 1;

    default:
      break;
  }

  return result;
}

bool
RSColorImageLoaderModel::
eventFilter(QObject *object, QEvent *event)
{
  if(object == _cbCameraList){
      if (event->type() == QEvent::Show)
      {//TODO, not sure if this is the appropriate place to initialize the
          ///camera
          //if(_camman!=NULL){
                refreshList(true);
                //_camman->start();
          //}
      }
  }

  return false;
}
void RSColorImageLoaderModel::setInData(std::shared_ptr<NodeData> nodedata, int port) {
    //LUIS: IN this case the data will simply be an event indicating that 
    //we can run again our ucode
    printf("Setting in data\n");

}

NodeDataType
RSColorImageLoaderModel::
dataType(PortType, PortIndex) const
{
  return PixmapData().type();
}

std::shared_ptr<NodeData>
RSColorImageLoaderModel::
outData(PortIndex)
{
  return std::make_shared<PixmapData>(_pixmap);
}

void RSColorImageLoaderModel::receiveFrame(QImage rgb_image){
    //Now that we have received a new frame we must update the 
    //label
    //_label->setPixmap(QPixmap::fromImage(rgb_image));
    _pixmap = QPixmap::fromImage(rgb_image);
    Q_EMIT dataUpdated(0);

}

void RSColorImageLoaderModel::changeCamera(int index){
    //Get Serial Number from the combobox
    _curIndex = index;
    QVariant data = _cbCameraList->itemData(_curIndex);
    printf("Using index : %d and serial:%s\n",_curIndex,data.toString().toStdString().c_str());
    //_camman->setSerialNo(data.toString().toStdString());
};
void RSColorImageLoaderModel::refreshList(bool initializeManager){
    //Now we poll from our camera manager this available devices
    std::cout << "Refreshing List\n"<<std::endl;
    _cbCameraList->clear();
    if(true/*CameraManager::getDeviceList().size() >0 */){
        _cbCameraList->setDisabled(false);

        int counter = 0;
        std::string serial;
        //for(auto&& dev :  CameraManager::getDeviceList()){
            if(counter == 0 && initializeManager){
                std::string emptystring = "";
                printf("We want to try with serial %s\n",serial.c_str());
                if(rs_man.initialize(emptystring,emptystring)){
                    std::cout << "Lance Camera connected successfully!"
                        <<std::endl;
                   //Ill do everything here since its what we need 
                }else 
                    std::cout << "Lance Camera could not connect!"
                        <<std::endl;

                //_camman = new CameraManager(serial,640,480,640,480,30);

                //connect(_camman, &CameraManager::framesReady, this, &RSColorImageLoaderModel::receiveFrame);
                //_camman->start();
                _curIndex = 0;
            }
            //serial = dev.get_info(RS2_CAMERA_INFO_SERIAL_NUMBER);
            //printf("This is a camera : %s\n",dev.get_info(RS2_CAMERA_INFO_NAME));
            //_cbCameraList->addItem(dev.get_info(RS2_CAMERA_INFO_NAME), QVariant(dev.get_info(RS2_CAMERA_INFO_SERIAL_NUMBER)));
            //_cbCameraList->setCurrentIndex(_curIndex);
            //Set serial here
        //}
    }else{
        _cbCameraList->setDisabled(true);
        _cbCameraList->addItem(NOCAM);
    }
}
void RSColorImageLoaderModel::refreshSlot(bool checked){
    //refreshList(false);
    printf("Refreshing list\n");
    cv::Mat ground_truth,color_img,depth_img,infrared_img;
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr layers;
    rs_man.run(color_img,depth_img,infrared_img,layers);
    printf("Ran\n");

    //By know we should have a color frame ready
    rs2::frame colFrame = rs_man.returnColorFrame();
    if(colFrame)
        printf("We got the color frame\n");
    else
        printf("Col frame seems iffy\n");
    auto q_rgb = rs_man.rsFrameToQImage(colFrame);
    printf("changed it to qimage\n");

    _pixmap = QPixmap::fromImage(q_rgb);
    printf("Set the pixmap\n");
    Q_EMIT dataUpdated(0);
}
