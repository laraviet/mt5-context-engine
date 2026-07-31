#ifndef __CE_TRADE_SIGNAL_ANALYZER_MQH__
#define __CE_TRADE_SIGNAL_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Constants.mqh"

class CETradeSignalAnalyzer :
   public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Trade Signal Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE_FINAL + 20;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.TradeSignal.Reset();

      switch(context.Decision.Type)
      {
         case DECISION_BUY:

            context.TradeSignal.Type =
               SIGNAL_BUY;

            break;

         case DECISION_SELL:

            context.TradeSignal.Type =
               SIGNAL_SELL;

            break;

         default:

            context.TradeSignal.Type =
               SIGNAL_NONE;

            break;
      }

      context.TradeSignal.Confidence =
         context.Decision.Confidence;

      return true;
   }
};

#endif