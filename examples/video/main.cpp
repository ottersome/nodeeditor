#include <nodes/NodeData>
#include <nodes/FlowScene>
#include <nodes/FlowView>
#include <QtWidgets/QApplication>

#include "ImageShowModel.hpp"
#include "RSColorImageLoaderModel.hpp"
#include "RSCameraManager.h"

using QtNodes::DataModelRegistry;
using QtNodes::FlowScene;
using QtNodes::FlowView;

static std::shared_ptr<DataModelRegistry>
registerDataModels()
{
  auto ret = std::make_shared<DataModelRegistry>();
  ret->registerModel<ImageShowModel>();

  ret->registerModel<RSColorImageLoaderModel>();

  return ret;
}


int
main(int argc, char *argv[])
{
  QApplication app(argc, argv);
  CameraManager::initializeManager();

  FlowScene scene(registerDataModels());

  FlowView view(&scene);

  view.setWindowTitle("Node-based flow editor");
  view.resize(800, 600);
  view.show();

  return app.exec();
}
