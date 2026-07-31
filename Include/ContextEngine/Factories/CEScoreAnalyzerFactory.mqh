#ifndef __CE_SCORE_ANALYZER_FACTORY_MQH__
#define __CE_SCORE_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEScoreAnalyzer.mqh"
#include "../Config/CEEngineConfig.mqh"

class CEScoreAnalyzerFactory
{
public:

   static CEScoreAnalyzer *Create(
      const CEEngineConfig &config)
   {
      return new CEScoreAnalyzer();
   }
};

#endif