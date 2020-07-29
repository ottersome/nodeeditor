#include "RSColorImageLoaderModel.hpp"

#include <QtCore/QEvent>
#include <QtCore/QDir>

#include <QtWidgets/QFileDialog>
#include <QComboBox>
#include <librealsense2/h/rs_sensor.h>
#include <memory>
#include <qnamespace.h>
#include <stdexcept>

RSColorImageLoaderModel::
RSColorImageLoaderModel()
  : _layout(new QVBoxLayout()),
    _cbCameraList(new QComboBox()),
    _b_refreshList(new QPushButton("Refresh List"))
{
    printf("New Rs image loader\n");
    //Create Timer Label
    _cbCameraList->addItem(QString("No camera connected."));
    _cbCameraList->setDisabled(true);
    //We might want to create a thread to populate this combobox as we
    //connect and disconnect devices.
    //...or maybe just a refresh button. either or, not now
    _cbCameraList->installEventFilter(this);
    //Once updated we loop through it and populate the combobox

    connect(_cbCameraList, SIGNAL(activated(int)), this, SLOT(changeCamera(int)));
    if(CameraManager::getDeviceList().size() >0 ){
        _cbCameraList->clear();
        _cbCameraList->setDisabled(false);

        int counter = 0;
        for(auto&& dev :  CameraManager::getDeviceList()){
            if(counter==0){
                _camman = new CameraManager(dev.get_info(RS2_CAMERA_INFO_SERIAL_NUMBER),640,480,640,480,30);
                connect(_camman, &CameraManager::framesReady, this, &RSColorImageLoaderModel::receiveFrame);
                _camman->start();
            }

            printf("This is a camera : %s\n",dev.get_info(RS2_CAMERA_INFO_NAME));
            _cbCameraList->addItem(dev.get_info(RS2_CAMERA_INFO_NAME));
        }
    }
    //Initialize the button

    //Add to layout
    _layout->addWidget(_cbCameraList);
    _layout->addWidget(_b_refreshList);

    _parentWidget.setLayout(_layout);

    //Start Real Sense Pipeline to later pull Images
    //TODO: Might want to create a thread for this here
    //  since the function may block for a bit and make
    //  the program unresponsive
}

//TODO delete this function from this file and from 
//the header, too lazy atm
void RSColorImageLoaderModel::startRSPipeline(){}

unsigned int
RSColorImageLoaderModel::
nPorts(PortType portType) const
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
      if (event->type() == QEvent::MouseButtonPress)
      {
          printf("Starting Camera\n");

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
    QVariant data = _cbCameraList->itemData(index);
    _camman->setSerialNo(data.toString().toStdString());
};
