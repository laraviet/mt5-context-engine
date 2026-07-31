#ifndef __CE_TREND_STRENGTH_ANALYZER_FACTORY_MQH__
#define __CE_TREND_STRENGTH_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CETrendStrengthAnalyzer.mqh"

class CETrendStrengthAnalyzerFactory
{
public:

   static ICEAnalyzer *Create(
      const CEEngineConfig &config)
   {
      return new CETrendStrengthAnalyzer();
   }
};

#endif