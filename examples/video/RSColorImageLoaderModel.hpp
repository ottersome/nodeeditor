#pragma once

#include <iostream>

#include <QtCore/QObject>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QVBoxLayout>

#include <nodes/DataModelRegistry>
#include <nodes/NodeDataModel>


#include <librealsense2/rs.hpp>
#include <qcombobox.h>
#include "RSCameraManager.h"

//Not sure if we need this quite yet
//Theres a dependency issue or smth like that here
//#include <opencv4/opencv2/opencv.hpp>

#include "PixmapData.hpp"

using QtNodes::PortType;
using QtNodes::PortIndex;
using QtNodes::NodeData;
using QtNodes::NodeDataType;
using QtNodes::NodeDataModel;
using QtNodes::NodeValidationState;

/// The model dictates the number of inputs and outputs for the Node.
/// In this example it has no logic.
class RSColorImageLoaderModel : public NodeDataModel
{
  Q_OBJECT

public:
  RSColorImageLoaderModel();

  virtual
  ~RSColorImageLoaderModel() {}

public:

  QString
  caption() const override
  { return QString("Image Source"); }
  QString
  name() const override { return QString("RSColorImageLoaderModel"); }

public:

  virtual QString
  modelName() const
  { return QString("Source Image"); }

  unsigned int
  nPorts(PortType portType) const override;

  NodeDataType
  dataType(PortType portType, PortIndex portIndex) const override;

  std::shared_ptr<NodeData>
  outData(PortIndex port) override;

  void
  setInData(std::shared_ptr<NodeData>, int) override;

  //LUIS:  Changing this from label to widget to fit more 
  //child widgets
  QWidget *
  embeddedWidget() override { return & _parentWidget; }

  bool
  resizable() const override { return true; }

protected:

  bool
  eventFilter(QObject *object, QEvent *event) override;

private:


  //Will encapsualte everything.
  QWidget  _parentWidget;

  QVBoxLayout * _layout;

  QLabel * _label;
  QComboBox  * _cbCameraList;
  unsigned int _curIndex = 0;
  QPushButton  * _b_refreshList;

  QPixmap _pixmap;

  CameraManager * _camman = NULL;

private:
  //Helper functions
  void startRSPipeline();
  void refreshList(bool initializeManager);

private slots:
  void receiveFrame(QImage rgb_image);
  void changeCamera(int index);
  void refreshSlot(bool);
};
