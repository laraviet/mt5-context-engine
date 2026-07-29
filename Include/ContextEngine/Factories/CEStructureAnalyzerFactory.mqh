#ifndef __CE_STRUCTURE_ANALYZER_FACTORY_MQH__
#define __CE_STRUCTURE_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEStructureAnalyzer.mqh"
#include "../Infrastructure/CEDetectorRegistry.mqh"
#include "../Config/CEEngineConfig.mqh"

class CEStructureAnalyzerFactory
{
public:

   static CEStructureAnalyzer *Create(
      const CEEngineConfig &config)
   {
      return new CEStructureAnalyzer(
         CEDetectorRegistry::CreateStructureDetector(config));
   }
};

#endif