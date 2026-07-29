#ifndef __CE_CONTEXT_INITIALIZE_ANALYZER_FACTORY_MQH__
#define __CE_CONTEXT_INITIALIZE_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEContextInitializeAnalyzer.mqh"

class CEContextInitializeAnalyzerFactory
{
public:

   static CEContextInitializeAnalyzer *Create()
   {
      return new CEContextInitializeAnalyzer();
   }
};

#endif