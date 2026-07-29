#ifndef __CE_FVG_FILL_ANALYZER_FACTORY_MQH__
#define __CE_FVG_FILL_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEFVGFillAnalyzer.mqh"

class CEFVGFillAnalyzerFactory
{
public:

   static CEFVGFillAnalyzer *Create()
   {
      return new CEFVGFillAnalyzer();
   }
};

#endif