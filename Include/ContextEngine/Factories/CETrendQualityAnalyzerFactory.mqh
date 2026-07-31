#ifndef __CE_TREND_QUALITY_ANALYZER_FACTORY_MQH__
#define __CE_TREND_QUALITY_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CETrendQualityAnalyzer.mqh"

class CETrendQualityAnalyzerFactory
{
public:

   static ICEAnalyzer *Create(
      const CEEngineConfig &config)
   {
      return new CETrendQualityAnalyzer();
   }
};

#endif