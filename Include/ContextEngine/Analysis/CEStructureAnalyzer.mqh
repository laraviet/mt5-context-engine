#ifndef __CE_STRUCTURE_ANALYZER_MQH__
#define __CE_STRUCTURE_ANALYZER_MQH__

#include "../Core/ICEAnalyzer.mqh"
#include "../Core/CEAnalysisContext.mqh"
#include "../Constants.mqh"

#include "CEMarketStructureDetector.mqh"

class CEStructureAnalyzer : public ICEAnalyzer
{
private:

   CEMarketStructureDetector m_detector;

public:

   virtual string Name() const
   {
      return "Structure Analyzer";
   }

   virtual int Priority() const
   {
      return CE_PRIORITY_STRUCTURE;
   }

   virtual bool Analyze(CEAnalysisContext &context)
   {
      m_detector.Detect(context.SwingSeries, context.StructureSeries);

      return true;
   }
};

#endif