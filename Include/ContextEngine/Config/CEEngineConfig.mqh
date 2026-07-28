#ifndef __CE_ENGINE_CONFIG_MQH__
#define __CE_ENGINE_CONFIG_MQH__

#include "CESwingConfig.mqh"
#include "CEStructureConfig.mqh"
#include "CETrendConfig.mqh"

class CEEngineConfig
{
public:

   CESwingConfig Swing;

   CEStructureConfig Structure;

   CETrendConfig Trend;

public:

   CEEngineConfig()
   {
   }
};

#endif