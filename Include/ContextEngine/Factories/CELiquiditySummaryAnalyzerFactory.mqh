#ifndef __CE_LIQUIDITY_SUMMARY_ANALYZER_FACTORY_MQH__
#define __CE_LIQUIDITY_SUMMARY_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CELiquiditySummaryAnalyzer.mqh"

class CELiquiditySummaryAnalyzerFactory
{
public:

   static CELiquiditySummaryAnalyzer *Create()
   {
      return new CELiquiditySummaryAnalyzer();
   }
};

#endif