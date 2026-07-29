#ifndef __CE_FVG_ANALYZER_MQH__
#define __CE_FVG_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

#include "../Interfaces/IFVGDetector.mqh"

class CEFVGAnalyzer : public ICEAnalyzer
{
private:

   IFVGDetector *m_detector;

public:

   CEFVGAnalyzer(
      IFVGDetector *detector)
   {
      m_detector = detector;
   }

   virtual ~CEFVGAnalyzer()
   {
      if(CheckPointer(m_detector) != POINTER_INVALID)
         delete m_detector;
   }

   virtual string Name() const override
   {
      return "FVG Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_FVG;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_FVG;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      m_detector.Detect(
         context.FVGSeries);

      return true;
   }
};

#endif