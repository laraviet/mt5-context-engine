#ifndef __CE_ANALYZER_REGISTRY_MQH__
#define __CE_ANALYZER_REGISTRY_MQH__

#include "../Core/CEAnalysisPipeline.mqh"
#include "../Analysis/CESwingAnalyzer.mqh"
#include "../Analysis/CEStructureAnalyzer.mqh"
#include "../Analysis/CEMarketStructureDetector.mqh"
#include "../Analysis/CETrendAnalyzer.mqh"
#include "CEDetectorRegistry.mqh"

class CEAnalyzerRegistry
{
public:

   static void Register(CEAnalysisPipeline &pipeline)
   {
      pipeline.Add(
         new CESwingAnalyzer(
            CEDetectorRegistry::CreateSwingDetector()));
      
      pipeline.Add(
         new CEStructureAnalyzer(
            CEDetectorRegistry::CreateStructureDetector()));
      
      pipeline.Add(
         new CETrendAnalyzer(
            CEDetectorRegistry::CreateTrendDetector()));
   }
};

#endif