#ifndef __CE_TREND_ANALYZER_MQH__
#define __CE_TREND_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../Interfaces/ITrendDetector.mqh"
#include "../../Constants.mqh"

class CETrendAnalyzer : public ICEAnalyzer
{
private:

   ITrendDetector *m_detector;

public:

   CETrendAnalyzer(ITrendDetector *detector)
   {
      m_detector = detector;
   }

   virtual string Name() const
   {
      return "Trend Analyzer";
   }

   virtual int Priority() const
   {
      return CE_PRIORITY_TREND;
   }
   
   int Stage() const override
   {
      return CE_STAGE_TREND;
   }

   virtual bool Analyze(CEAnalysisContext &context)
   {
      m_detector.Detect(
         context.BOSSeries,
         context.TrendSeries);

      return true;
   }
   
   ~CETrendAnalyzer()
   {
      if(CheckPointer(m_detector)!=POINTER_INVALID)
         delete m_detector;
   }
};

#endif