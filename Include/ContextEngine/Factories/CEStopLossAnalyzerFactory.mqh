#ifndef __CE_TRADE_STOP_LOSS_ANALYZER_FACTORY_MQH__
#define __CE_TRADE_STOP_LOSS_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEStopLossAnalyzer.mqh"

class CEStopLossAnalyzerFactory
{
public:

   static ICEAnalyzer *Create()
   {
      return new CEStopLossAnalyzer();
   }
};

#endif