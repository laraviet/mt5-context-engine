#ifndef __CE_BOS_ANALYZER_MQH__
#define __CE_BOS_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Analysis/Interfaces/IBOSDetector.mqh"

class CEBOSAnalyzer : public ICEAnalyzer
{
private:

   IBOSDetector *m_detector;

public:

   CEBOSAnalyzer(
      IBOSDetector *detector)
   {
      m_detector=detector;
   }

   virtual ~CEBOSAnalyzer()
   {
      if(CheckPointer(m_detector)!=POINTER_INVALID)
         delete m_detector;
   }

   virtual string Name() const override
   {
      return "BOS Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_BOS;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_BOS;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      return m_detector.Detect(
         context.StructureSeries,
         context.BOSSeries)>0;
   }
};

#endif