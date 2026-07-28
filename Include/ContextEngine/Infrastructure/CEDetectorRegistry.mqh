#ifndef __CE_DETECTOR_REGISTRY_MQH__
#define __CE_DETECTOR_REGISTRY_MQH__

#include "../Analysis/Detectors/CESwingDetector.mqh"
#include "../Analysis/Detectors/CEMarketStructureDetector.mqh"
#include "../Analysis/Detectors/CETrendDetector.mqh"
#include "../Analysis/Interfaces/ISwingDetector.mqh"
#include "../Analysis/Interfaces/IMarketStructureDetector.mqh"
#include "../Analysis/Interfaces/ITrendDetector.mqh"
#include "../Config/CEEngineConfig.mqh"

class CEDetectorRegistry
{
public:

   static ISwingDetector *CreateSwingDetector(
      const CEEngineConfig &config)
   {
      return new CESwingDetector(
         config.Swing);
   }

   static IMarketStructureDetector *CreateStructureDetector(
      const CEEngineConfig &config)
   {
      return new CEMarketStructureDetector();
   }

   static ITrendDetector *CreateTrendDetector(
      const CEEngineConfig &config)
   {
      return new CETrendDetector();
   }
   
};

#endif