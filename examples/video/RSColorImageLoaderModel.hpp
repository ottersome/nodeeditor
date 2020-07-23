#pragma once

#include <iostream>

#include <QtCore/QObject>
#include <QtWidgets/QLabel>

#include <nodes/DataModelRegistry>
#include <nodes/NodeDataModel>


#include <librealsense2/rs.hpp>

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

  QWidget *
  embeddedWidget() override { return _label; }

  bool
  resizable() const override { return true; }

protected:

  bool
  eventFilter(QObject *object, QEvent *event) override;

private:

  QLabel * _label;

  QPixmap _pixmap;


private:
  //Helper functions
  void startRSPipeline();

private slots:
  void receiveFrame(QImage rgb_image);


};
