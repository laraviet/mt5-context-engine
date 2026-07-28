#ifndef __CE_DETECTOR_REGISTRY_MQH__
#define __CE_DETECTOR_REGISTRY_MQH__

#include "../Analysis/CESwingDetector.mqh"
#include "../Analysis/CEMarketStructureDetector.mqh"
#include "../Analysis/CETrendDetector.mqh"
#include "../Analysis/ISwingDetector.mqh"
#include "../Analysis/IMarketStructureDetector.mqh"
#include "../Analysis/ITrendDetector.mqh"

class CEDetectorRegistry
{
public:

   static ISwingDetector *CreateSwingDetector()
   {
      return new CESwingDetector(2);
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