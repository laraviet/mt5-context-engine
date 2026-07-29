#ifndef __CE_CONTEXT_INITIALIZE_ANALYZER_MQH__
#define __CE_CONTEXT_INITIALIZE_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CEContextInitializeAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Context Initialize Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_INITIALIZE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_DEFAULT;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.ClearAnalysis();

      return true;
   }
};

#endif