#ifndef __CE_SWING_ANALYZER_MQH__
#define __CE_SWING_ANALYZER_MQH__

#include "../Core/ICEAnalyzer.mqh"
#include "../Core/CEAnalysisContext.mqh"
#include "CESwingDetector.mqh"

class CESwingAnalyzer : public ICEAnalyzer
{
private:

   CESwingDetector m_detector;

public:

   CESwingAnalyzer()
      : m_detector(2)
   {
   }

   virtual string Name() const override
   {
      return "Swing Analyzer";
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SWING;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      m_detector.Detect(
         context.PriceSeries,
         context.SwingSeries);

      return true;
   }
};

#endif