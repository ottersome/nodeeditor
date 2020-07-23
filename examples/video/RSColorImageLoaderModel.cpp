#include "RSColorImageLoaderModel.hpp"

#include <QtCore/QEvent>
#include <QtCore/QDir>

#include <QtWidgets/QFileDialog>
#include <memory>
#include <stdexcept>

#include "RSCameraManager.h"

RSColorImageLoaderModel::
RSColorImageLoaderModel()
  : _label(new QLabel("Double click to load image"))
{
    _label->setAlignment(Qt::AlignVCenter | Qt::AlignHCenter);

    QFont f = _label->font();
    f.setBold(true);
    f.setItalic(true);

    _label->setFont(f);

    _label->setFixedSize(200, 200);

    _label->installEventFilter(this);

    //Start Real Sense Pipeline to later pull Images
    //TODO: Might want to create a thread for this here
    //  since the function may block for a bit and make
    //  the program unresponsive
    CameraManager camman(200,200,200,200,30);
    camman.start();
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
  if (object == _label)
  {
    int w = _label->width();
    int h = _label->height();

    if (event->type() == QEvent::MouseButtonPress)
    {

      QString fileName =
        QFileDialog::getOpenFileName(nullptr,
                                     tr("Open Image"),
                                     QDir::homePath(),
                                     tr("Image Files (*.png *.jpg *.bmp)"));

      //Create new pixmap for some reason
      _pixmap = QPixmap(fileName);

      //Set the image to the  QT Label
      _label->setPixmap(_pixmap.scaled(w, h, Qt::KeepAspectRatio));

      //Emit Signal
      Q_EMIT dataUpdated(0);

      return true;
    }
    else if (event->type() == QEvent::Resize)
    {
      if (!_pixmap.isNull())
        _label->setPixmap(_pixmap.scaled(w, h, Qt::KeepAspectRatio));
    }
  }

  return false;
}
void RSColorImageLoaderModel::setInData(std::shared_ptr<NodeData> nodedata, int port) {
    //LUIS: IN this case the data will simply be an event indicating that 
    //we can run again our ucode

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
    _label->setPixmap(QPixmap::fromImage(rgb_image));
}
