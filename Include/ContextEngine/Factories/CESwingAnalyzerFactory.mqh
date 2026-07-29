#ifndef __CE_SWING_ANALYZER_FACTORY_MQH__
#define __CE_SWING_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CESwingAnalyzer.mqh"
#include "../Infrastructure/CEDetectorRegistry.mqh"
#include "../Config/CEEngineConfig.mqh"

class CESwingAnalyzerFactory
{
public:

   static CESwingAnalyzer *Create(
      const CEEngineConfig &config)
   {
      return new CESwingAnalyzer(
         CEDetectorRegistry::CreateSwingDetector(config));
   }
};

#endif