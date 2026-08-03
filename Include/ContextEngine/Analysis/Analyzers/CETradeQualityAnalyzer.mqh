#ifndef __CE_TRADE_QUALITY_ANALYZER_MQH__
#define __CE_TRADE_QUALITY_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"

class CETradeQualityAnalyzer :
   public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Trade Quality Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE_FINAL + 80;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.TradeSetup.Quality.Reset();

      if(!context.TradeSetup.RiskReward.Valid)
         return true;

      int score = 0;

      //---------------------------------
      // Risk Reward
      //---------------------------------

      double rr =
         context.TradeSetup.RiskReward.Ratio;

      if(rr >= 3.0)
         score += 40;

      else
      if(rr >= 2.0)
         score += 30;

      else
      if(rr >= 1.5)
         score += 20;

      //---------------------------------
      // Trend
      //---------------------------------

      if(context.Summary.Market.Strength >= 70)
         score += 20;

      //---------------------------------
      // Market Bias
      //---------------------------------

      if(context.Decision.Type == DECISION_BUY &&
         context.Summary.Bias.Type == MARKET_BIAS_BULLISH)
      {
          score += 20;
      }
      
      if(context.Decision.Type == DECISION_SELL &&
         context.Summary.Bias.Type == MARKET_BIAS_BEARISH)
      {
          score += 20;
      }

      //---------------------------------
      // Order Block
      //---------------------------------

      if(context.TradeEntry.Source ==
         ENTRY_SOURCE_ORDER_BLOCK)
      {
         score += 10;
      }

      //---------------------------------
      // Liquidity TP
      //---------------------------------

      if(context.TakeProfit.Source ==
         TAKE_PROFIT_LIQUIDITY)
      {
         score += 10;
      }

      if(score > 100)
         score = 100;

      context.TradeSetup.Quality.Valid = true;

      context.TradeSetup.Quality.Score = score;

      return true;
   }
};

#endif