#ifndef __CE_STRUCTURE_ANALYZER_MQH__
#define __CE_STRUCTURE_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

#include "../Interfaces/IMarketStructureDetector.mqh"

class CEStructureAnalyzer : public ICEAnalyzer
{
private:

   IMarketStructureDetector *m_detector;

public:

   CEStructureAnalyzer(
      IMarketStructureDetector *detector)
   {
      m_detector = detector;
   }
   
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
   
   ~CEStructureAnalyzer()
   {
      if(CheckPointer(m_detector)!=POINTER_INVALID)
         delete m_detector;
   }
   
};

#endif