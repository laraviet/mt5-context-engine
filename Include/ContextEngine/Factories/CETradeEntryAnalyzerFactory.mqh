#ifndef __CE_TRADE_ENTRY_ANALYZER_FACTORY_MQH__
#define __CE_TRADE_ENTRY_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CETradeEntryAnalyzer.mqh"

class CETradeEntryAnalyzerFactory
{
public:

   static ICEAnalyzer *Create()
   {
      return new CETradeEntryAnalyzer();
   }
};

#endif