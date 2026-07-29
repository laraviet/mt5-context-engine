#ifndef __CE_FVG_SUMMARY_ANALYZER_FACTORY_MQH__
#define __CE_FVG_SUMMARY_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEFVGSummaryAnalyzer.mqh"

class CEFVGSummaryAnalyzerFactory
{
public:

   static CEFVGSummaryAnalyzer *Create()
   {
      return new CEFVGSummaryAnalyzer();
   }
};

#endif