#ifndef __CE_DECISION_ANALYZER_FACTORY_MQH__
#define __CE_DECISION_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEDecisionAnalyzer.mqh"

class CEDecisionAnalyzerFactory
{
public:

   static ICEAnalyzer *Create()
   {
      return new CEDecisionAnalyzer();
   }
};

#endif