#ifndef __CE_TAKE_PROFIT_ANALYZER_FACTORY_MQH__
#define __CE_TAKE_PROFIT_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CETakeProfitAnalyzer.mqh"

class CETakeProfitAnalyzerFactory
{
public:

   static ICEAnalyzer *Create()
   {
      return new CETakeProfitAnalyzer();
   }
};

#endif