#ifndef __CE_ORDER_BLOCK_ANALYZER_MQH__
#define __CE_ORDER_BLOCK_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../Interfaces/IOrderBlockDetector.mqh"
#include "../../Constants.mqh"

class CEOrderBlockAnalyzer : public ICEAnalyzer
{
private:

   IOrderBlockDetector *m_detector;

public:

   CEOrderBlockAnalyzer(
      IOrderBlockDetector *detector)
   {
      m_detector = detector;
   }

   virtual string Name() const override
   {
      return "Order Block Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_ORDER_BLOCK;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_ORDER_BLOCK;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      m_detector.Detect(
         context.CandleSeries,
         context.BOSSeries,
         context.OrderBlockSeries);

      return true;
   }

   virtual ~CEOrderBlockAnalyzer()
   {
      if(CheckPointer(m_detector)!=POINTER_INVALID)
         delete m_detector;
   }
};

#endif