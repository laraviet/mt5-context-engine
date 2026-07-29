#ifndef __CE_BOS_ANALYZER_FACTORY_MQH__
#define __CE_BOS_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEBOSAnalyzer.mqh"
#include "../Infrastructure/CEDetectorRegistry.mqh"
#include "../Config/CEEngineConfig.mqh"

class CEBOSAnalyzerFactory
{
public:

   static CEBOSAnalyzer *Create(
      const CEEngineConfig &config)
   {
      return new CEBOSAnalyzer(
         CEDetectorRegistry::CreateBOSDetector(config));
   }
};

#endif