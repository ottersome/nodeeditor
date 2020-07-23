#pragma once

#include <nodes/NodeDataModel>


using QtNodes::NodeData;
using QtNodes::NodeDataType;

class EventData: public NodeData{

public:
    EventData(){
    }
    EventData(bool evento)
        :_evento(evento){}

    NodeDataType type() const override
    {
        //Dont know what they mean by name
        //      id      name
        return {"event","E"};
    }

private:
    bool _evento;
}
