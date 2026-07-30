#ifndef __CE_ORDER_BLOCK_FILL_ANALYZER_MQH__
#define __CE_ORDER_BLOCK_FILL_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../Interfaces/IOrderBlockFillDetector.mqh"
#include "../../Constants.mqh"

class CEOrderBlockFillAnalyzer :
   public ICEAnalyzer
{
private:

   IOrderBlockFillDetector *m_detector;

public:

   CEOrderBlockFillAnalyzer(
      IOrderBlockFillDetector *detector)
   {
      m_detector=detector;
   }

   virtual string Name() const override
   {
      return "Order Block Fill Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_ORDER_BLOCK_FILL;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_ORDER_BLOCK_FILL;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      m_detector.Detect(
         context.CandleSeries,
         context.OrderBlockSeries);

      return true;
   }

   virtual ~CEOrderBlockFillAnalyzer()
   {
      if(CheckPointer(m_detector)!=POINTER_INVALID)
         delete m_detector;
   }
};

#endif