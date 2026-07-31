#ifndef __CE_CHOCH_ANALYZER_MQH__
#define __CE_CHOCH_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"

#include "../Interfaces/IChochDetector.mqh"

class CEChochAnalyzer : public ICEAnalyzer
{
private:

   IChochDetector *m_detector;

public:

   CEChochAnalyzer(
      IChochDetector *detector)
   {
      m_detector = detector;
   }

   virtual ~CEChochAnalyzer()
   {
      if(CheckPointer(m_detector)!=POINTER_INVALID)
         delete m_detector;
   }

   virtual string Name() const override
   {
      return "CHOCH Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_CHOCH;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_CHOCH;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      m_detector.Detect(
         context.SwingSeries,
         context.BOSSeries,
         context.CHOCHSeries);

      return true;
   }
};

#endif