#ifndef __CE_TREND_ANALYZER_FACTORY_MQH__
#define __CE_TREND_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CETrendAnalyzer.mqh"
#include "../Infrastructure/CEDetectorRegistry.mqh"
#include "../Config/CEEngineConfig.mqh"

class CETrendAnalyzerFactory
{
public:

   static CETrendAnalyzer *Create(
      const CEEngineConfig &config)
   {
      return new CETrendAnalyzer(
         CEDetectorRegistry::CreateTrendDetector(config));
   }
};

#endif