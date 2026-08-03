#ifndef __CE_RISK_REWARD_ANALYZER_FACTORY_MQH__
#define __CE_RISK_REWARD_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CERiskRewardAnalyzer.mqh"

class CERiskRewardAnalyzerFactory
{
public:

   static ICEAnalyzer *Create()
   {
      return new CERiskRewardAnalyzer();
   }
};

#endif