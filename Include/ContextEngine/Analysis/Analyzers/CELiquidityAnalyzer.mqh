#ifndef __CE_LIQUIDITY_ANALYZER_MQH__
#define __CE_LIQUIDITY_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

#include "../Interfaces/ILiquidityDetector.mqh"

class CELiquidityAnalyzer : public ICEAnalyzer
{
private:

   ILiquidityDetector *m_detector;

public:

   CELiquidityAnalyzer(
      ILiquidityDetector *detector)
   {
      m_detector = detector;
   }

   virtual ~CELiquidityAnalyzer()
   {
      if(CheckPointer(m_detector) != POINTER_INVALID)
         delete m_detector;
   }

   virtual string Name() const override
   {
      return "Liquidity Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_LIQUIDITY;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_LIQUIDITY;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      m_detector.Detect(
         context.BOSSeries,
         context.LiquiditySeries);

      return true;
   }
};

#endif