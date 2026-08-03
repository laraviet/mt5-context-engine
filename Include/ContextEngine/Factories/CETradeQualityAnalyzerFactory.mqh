#ifndef __CE_TRADE_QUALITY_ANALYZER_FACTORY_MQH__
#define __CE_TRADE_QUALITY_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CETradeQualityAnalyzer.mqh"

class CETradeQualityAnalyzerFactory
{
public:

   static ICEAnalyzer *Create()
   {
      return new CETradeQualityAnalyzer();
   }
};

#endif