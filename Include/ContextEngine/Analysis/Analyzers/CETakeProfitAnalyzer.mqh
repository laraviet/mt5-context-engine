#ifndef __CE_TAKE_PROFIT_ANALYZER_MQH__
#define __CE_TAKE_PROFIT_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"

class CETakeProfitAnalyzer :
   public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Take Profit Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE_FINAL + 60;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.TakeProfit.Reset();

      if(!context.TradeEntry.Valid)
         return true;

      if(context.Decision.Type==DECISION_BUY)
         CalculateBuy(context);

      if(context.Decision.Type==DECISION_SELL)
         CalculateSell(context);

      context.TradeSetup.TakeProfit =
         context.TakeProfit;

      return true;
   }

private:

   //------------------------------------------------

   void CalculateBuy(
      CEAnalysisContext &context)
   {
      double entry =
         context.TradeEntry.Price;

      double bestDistance =
         DBL_MAX;

      int bestIndex = -1;

      for(int i=0;
          i<context.LiquiditySeries.Count();
          i++)
      {
         CELiquidityPoint liquidity =
            context.LiquiditySeries.At(i);

         if(!liquidity.IsBuySide())
            continue;

         //----------------------------------
         // đã sweep -> bỏ
         //----------------------------------

         if(liquidity.IsConfirmedSweep())
            continue;

         //----------------------------------

         if(liquidity.Price<=entry)
            continue;

         double distance =
            liquidity.Price-entry;

         if(distance<bestDistance)
         {
            bestDistance=distance;
            bestIndex=i;
         }
      }

      if(bestIndex<0)
         return;

      CELiquidityPoint liquidity =
         context.LiquiditySeries.At(bestIndex);

      context.TakeProfit.Valid=true;

      context.TakeProfit.Price=
         liquidity.Price;

      context.TakeProfit.Source=
         TAKE_PROFIT_LIQUIDITY;
   }

   //------------------------------------------------

   void CalculateSell(
      CEAnalysisContext &context)
   {
      double entry =
         context.TradeEntry.Price;

      double bestDistance =
         DBL_MAX;

      int bestIndex = -1;

      for(int i=0;
          i<context.LiquiditySeries.Count();
          i++)
      {
         CELiquidityPoint liquidity =
            context.LiquiditySeries.At(i);

         if(!liquidity.IsSellSide())
            continue;

         //----------------------------------
         // đã sweep -> bỏ
         //----------------------------------

         if(liquidity.IsConfirmedSweep())
            continue;

         //----------------------------------

         if(liquidity.Price>=entry)
            continue;

         double distance =
            entry-liquidity.Price;

         if(distance<bestDistance)
         {
            bestDistance=distance;
            bestIndex=i;
         }
      }

      if(bestIndex<0)
         return;

      CELiquidityPoint liquidity =
         context.LiquiditySeries.At(bestIndex);

      context.TakeProfit.Valid=true;

      context.TakeProfit.Price=
         liquidity.Price;

      context.TakeProfit.Source=
         TAKE_PROFIT_LIQUIDITY;
   }

};

#endif