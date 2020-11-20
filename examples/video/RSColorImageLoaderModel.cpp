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
    _b_refreshList(new QPushButton("Connect to Camera")),
    _b_startStream(new QPushButton("Start Stream"))

{
    printf("New Rs image loader\n");
    _cbCameraList->installEventFilter(this);

    //Create Signal-Slot COnnetions
    connect(_cbCameraList, SIGNAL(activated(int)), this, SLOT(changeCamera(int)));
    connect(_b_refreshList, SIGNAL(clicked(bool)), this, SLOT(refreshSlot(bool)));
    connect(_b_startStream, SIGNAL(clicked(bool)), this, SLOT(startStream(bool)));
    //Initialize the button

    //Add to layout
    _layout->addWidget(_cbCameraList);
    _layout->addWidget(_b_refreshList);
    _layout->addWidget(_b_startStream);

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
    if(RealSense::getDeviceList().size() >0 ){
        _cbCameraList->setDisabled(false);

        int counter = 0;
        std::string serial;
        for(auto&& dev :  RealSense::getDeviceList()){
            if(counter == 0 && initializeManager){
                printf("We want to try with serial %s\n",serial.c_str());

                //_camman = new CameraManager(serial,640,480,640,480,30);

                //connect(_camman, &CameraManager::framesReady, this, &RSColorImageLoaderModel::receiveFrame);
                //_camman->start();
                _curIndex = 0;
            }
            serial = dev.get_info(RS2_CAMERA_INFO_SERIAL_NUMBER);
            //printf("This is a camera : %s\n",dev.get_info(RS2_CAMERA_INFO_NAME));
            _cbCameraList->addItem(dev.get_info(RS2_CAMERA_INFO_SERIAL_NUMBER), QVariant(dev.get_info(RS2_CAMERA_INFO_SERIAL_NUMBER)));
            _cbCameraList->setCurrentIndex(_curIndex);
            //Set serial here
        }
    }else{
        _cbCameraList->setDisabled(true);
        _cbCameraList->addItem(NOCAM);
    }
}
void RSColorImageLoaderModel::refreshSlot(bool checked){
    //refreshList(false);
    std::string serial = _cbCameraList->currentText().toStdString();
    printf("Connecting list to %s\n",serial.c_str());
    std::string emptystring = "";
    if(rs_man.initialize(serial,emptystring)){
        std::cout << "Lance Camera connected successfully!"
            <<std::endl;
        //Ill do everything here since its what we need 
    }else 
        std::cout << "Lance Camera could not connect!"
            <<std::endl;
}

void RSColorImageLoaderModel::startStream(bool){
    if(rs_man.init_status){
        printf("Starting Stream...\n");
        ThreadSlave* worker  = new ThreadSlave(&rs_man,&_pixmap);
        worker->moveToThread(&workerThread);
        connect(&workerThread,&QThread::finished,worker, &QObject::deleteLater);
        connect(this, &RSColorImageLoaderModel::startThread,worker, &ThreadSlave::doWork);
        connect(worker, &ThreadSlave::pixMapUpdated,this, &RSColorImageLoaderModel::receiveFrame);
        workerThread.start();

        Q_EMIT startThread();
        //Launch Thread with function
        //  Thread should have a loop where it gets its frames
    }else{
        printf("Realsense not initialized\n");
    }
}
