#ifndef __CE_RISK_REWARD_ANALYZER_MQH__
#define __CE_RISK_REWARD_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"

class CERiskRewardAnalyzer :
   public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Risk Reward Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE_FINAL + 70;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.TradeSetup.RiskReward.Reset();

      if(!context.TradeSetup.IsValid())
         return true;

      double risk =
         MathAbs(
            context.TradeSetup.Entry.Price -
            context.TradeSetup.StopLoss.Price);

      double reward =
         MathAbs(
            context.TradeSetup.TakeProfit.Price -
            context.TradeSetup.Entry.Price);

      if(risk <= 0.0)
         return true;

      context.TradeSetup.RiskReward.Valid = true;

      context.TradeSetup.RiskReward.Risk = risk;

      context.TradeSetup.RiskReward.Reward = reward;

      context.TradeSetup.RiskReward.Ratio =
         reward / risk;

      return true;
   }
};

#endif