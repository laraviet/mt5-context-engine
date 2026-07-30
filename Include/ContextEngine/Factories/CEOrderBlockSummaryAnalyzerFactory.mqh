#ifndef __CE_ORDER_BLOCK_SUMMARY_ANALYZER_FACTORY_MQH__
#define __CE_ORDER_BLOCK_SUMMARY_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEOrderBlockSummaryAnalyzer.mqh"

class CEOrderBlockSummaryAnalyzerFactory
{
public:

   static CEOrderBlockSummaryAnalyzer *Create()
   {
      return new CEOrderBlockSummaryAnalyzer();
   }
};

#endif