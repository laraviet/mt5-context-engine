#ifndef __CE_TRADE_FILTER_ANALYZER_FACTORY_MQH__
#define __CE_TRADE_FILTER_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CETradeFilterAnalyzer.mqh"

class CETradeFilterAnalyzerFactory
{
public:

   static ICEAnalyzer *Create()
   {
      return new CETradeFilterAnalyzer();
   }
};

#endif