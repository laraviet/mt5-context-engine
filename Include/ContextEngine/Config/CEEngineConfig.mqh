#ifndef __CE_ENGINE_CONFIG_MQH__
#define __CE_ENGINE_CONFIG_MQH__

#include "CESwingConfig.mqh"
#include "CEStructureConfig.mqh"
#include "CETrendConfig.mqh"
#include "../Core/CEScoreProfile.mqh"
#include "../Core/CEScoreProfiles.mqh"
#include "CECandleConfig.mqh"
#include "CEFVGConfig.mqh"

class CEEngineConfig
{
public:

   CESwingConfig Swing;

   CEStructureConfig Structure;

   CETrendConfig Trend;
   
   CEScoreProfile ScoreProfile;
   
   CECandleConfig Candle;
   
   CEFVGConfig FVG;

public:

   CEEngineConfig()
   {
      ScoreProfile = CEScoreProfiles::Default();
   }
};

#endif