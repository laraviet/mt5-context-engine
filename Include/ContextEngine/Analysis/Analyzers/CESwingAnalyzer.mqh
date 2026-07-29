#ifndef __CE_SWING_ANALYZER_MQH__
#define __CE_SWING_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../Interfaces/ISwingDetector.mqh"
#include "../../Constants.mqh"

class CESwingAnalyzer : public ICEAnalyzer
{
private:

   ISwingDetector *m_detector;

public:

   CESwingAnalyzer(ISwingDetector *detector)
   {
      m_detector = detector;
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
   
   ~CESwingAnalyzer()
   {
      if(CheckPointer(m_detector)!=POINTER_INVALID)
         delete m_detector;
   }
};

#endif