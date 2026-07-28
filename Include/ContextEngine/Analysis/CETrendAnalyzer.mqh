#ifndef __CE_TREND_ANALYZER_MQH__
#define __CE_TREND_ANALYZER_MQH__

#include "../Core/ICEAnalyzer.mqh"
#include "../Core/CEAnalysisContext.mqh"
#include "ITrendDetector.mqh"
#include "../Constants.mqh"

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

   virtual bool Analyze(CEAnalysisContext &context)
   {
      m_detector.Detect(
         context.StructureSeries,
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