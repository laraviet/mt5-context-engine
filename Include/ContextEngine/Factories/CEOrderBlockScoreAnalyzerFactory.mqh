#ifndef __CE_ORDER_BLOCK_SCORE_ANALYZER_FACTORY_MQH__
#define __CE_ORDER_BLOCK_SCORE_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEOrderBlockScoreAnalyzer.mqh"

class CEOrderBlockScoreAnalyzerFactory
{
public:

   static CEOrderBlockScoreAnalyzer *Create()
   {
      return new CEOrderBlockScoreAnalyzer();
   }
};

#endif