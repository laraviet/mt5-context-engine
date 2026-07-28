#ifndef __CE_ANALYZER_REGISTRY_MQH__
#define __CE_ANALYZER_REGISTRY_MQH__

#include "../Core/CEAnalysisPipeline.mqh"
#include "../Analysis/CESwingAnalyzer.mqh"
#include "../Analysis/CEStructureAnalyzer.mqh"
#include "../Analysis/CETrendAnalyzer.mqh"

class CEAnalyzerRegistry
{
public:

   static void Register(CEAnalysisPipeline &pipeline)
   {
      pipeline.Add(new CESwingAnalyzer());
      pipeline.Add(new CEStructureAnalyzer());
      pipeline.Add(new CETrendAnalyzer());
   }
};

#endif