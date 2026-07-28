#ifndef __CE_ANALYZER_REGISTRY_MQH__
#define __CE_ANALYZER_REGISTRY_MQH__

#include "../Core/CEAnalysisPipeline.mqh"
#include "../Analysis/Analyzers/CESwingAnalyzer.mqh"
#include "../Analysis/Analyzers/CEStructureAnalyzer.mqh"
#include "../Analysis/Detectors/CEMarketStructureDetector.mqh"
#include "../Analysis/Analyzers/CETrendAnalyzer.mqh"
#include "CEDetectorRegistry.mqh"

class CEAnalyzerRegistry
{
public:

   static void Register(CEAnalysisPipeline &pipeline, const CEEngineConfig &config)
   {
      pipeline.Add(
         new CESwingAnalyzer(
            CEDetectorRegistry::CreateSwingDetector(config)));
      
      pipeline.Add(
         new CEStructureAnalyzer(
            CEDetectorRegistry::CreateStructureDetector(config)));
      
      pipeline.Add(
         new CETrendAnalyzer(
            CEDetectorRegistry::CreateTrendDetector(config)));
   }
};

#endif