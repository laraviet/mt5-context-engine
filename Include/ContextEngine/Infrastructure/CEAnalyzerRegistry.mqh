#ifndef __CE_ANALYZER_REGISTRY_MQH__
#define __CE_ANALYZER_REGISTRY_MQH__

#include "../Core/CEAnalysisPipeline.mqh"
#include "../Analysis/CESwingAnalyzer.mqh"

class CEAnalyzerRegistry
{
public:

   static void Register(CEAnalysisPipeline &pipeline)
   {
      pipeline.Add(new CESwingAnalyzer());
   }
};

#endif