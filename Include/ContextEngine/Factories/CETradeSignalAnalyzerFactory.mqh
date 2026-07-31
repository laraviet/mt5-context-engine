#ifndef __CE_TRADE_SIGNAL_ANALYZER_FACTORY_MQH__
#define __CE_TRADE_SIGNAL_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CETradeSignalAnalyzer.mqh"

class CETradeSignalAnalyzerFactory
{
public:

   static ICEAnalyzer *Create()
   {
      return new CETradeSignalAnalyzer();
   }
};

#endif