#ifndef __CE_TRADE_STOP_LOSS_ANALYZER_MQH__
#define __CE_TRADE_STOP_LOSS_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"

class CEStopLossAnalyzer :
   public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Trade Stop Loss Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE_FINAL + 40;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.StopLoss.Reset();
      
      return true;
   }
};

#endif