#ifndef __CE_TREND_ANALYZER_MQH__
#define __CE_TREND_ANALYZER_MQH__

#include "../Core/ICEAnalyzer.mqh"
#include "../Core/CEAnalysisContext.mqh"
#include "CETrendDetector.mqh"
#include "../Constants.mqh"

class CETrendAnalyzer : public ICEAnalyzer
{
private:

   CETrendDetector m_detector;

public:

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
};

#endif