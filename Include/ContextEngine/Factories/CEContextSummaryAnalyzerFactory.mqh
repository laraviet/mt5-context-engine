#ifndef __CE_CONTEXT_SUMMARY_ANALYZER_FACTORY_MQH__
#define __CE_CONTEXT_SUMMARY_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEContextSummaryAnalyzer.mqh"
#include "../Config/CEEngineConfig.mqh"

class CEContextSummaryAnalyzerFactory
{
public:

   static CEContextSummaryAnalyzer *Create(
      const CEEngineConfig &config)
   {
      return new CEContextSummaryAnalyzer();
   }
};

#endif