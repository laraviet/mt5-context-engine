#ifndef __CE_DETECTOR_REGISTRY_MQH__
#define __CE_DETECTOR_REGISTRY_MQH__

#include "../Analysis/Detectors/CESwingDetector.mqh"
#include "../Analysis/Detectors/CEMarketStructureDetector.mqh"
#include "../Analysis/Detectors/CETrendDetector.mqh"
#include "../Analysis/Interfaces/ISwingDetector.mqh"
#include "../Analysis/Interfaces/IMarketStructureDetector.mqh"
#include "../Analysis/Interfaces/ITrendDetector.mqh"

class CEDetectorRegistry
{
public:

   static ISwingDetector *CreateSwingDetector()
   {
      return new CESwingDetector();
   }

   static IMarketStructureDetector *CreateStructureDetector()
   {
      return new CEMarketStructureDetector();
   }

   static ITrendDetector *CreateTrendDetector()
   {
      return new CETrendDetector();
   }
};

#endif