#ifndef __CE_MARKET_BIAS_ANALYZER_FACTORY_MQH__
#define __CE_MARKET_BIAS_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEMarketBiasAnalyzer.mqh"

class CEMarketBiasAnalyzerFactory
{
public:

   static CEMarketBiasAnalyzer *Create()
   {
      return new CEMarketBiasAnalyzer();
   }
};

#endif