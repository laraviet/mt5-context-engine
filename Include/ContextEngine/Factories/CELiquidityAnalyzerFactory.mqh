#ifndef __CE_LIQUIDITY_ANALYZER_FACTORY_MQH__
#define __CE_LIQUIDITY_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CELiquidityAnalyzer.mqh"
#include "../Analysis/Detectors/CELiquidityDetector.mqh"

class CELiquidityAnalyzerFactory
{
public:

   static CELiquidityAnalyzer *Create(
      const CEEngineConfig &config)
   {
      return new CELiquidityAnalyzer(
         new CELiquidityDetector());
   }
};

#endif