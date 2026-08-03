#ifndef __CE_TRADE_ENTRY_ANALYZER_MQH__
#define __CE_TRADE_ENTRY_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"

class CETradeEntryAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Trade Entry Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE_FINAL + 30;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.TradeEntry.Reset();

      if(context.CandleSeries.Count() <= 0)
         return true;

      if(context.Decision.Type == DECISION_BUY)
      {
         CalculateBuy(context);
         return true;
      }

      if(context.Decision.Type == DECISION_SELL)
      {
         CalculateSell(context);
         return true;
      }

      return true;
   }

private:

   //----------------------------------------------------------
   // BUY
   //----------------------------------------------------------

   void CalculateBuy(
      CEAnalysisContext &context)
   {
      const CECandle candle =
         context.CandleSeries.At(
            context.CandleSeries.Count()-1);

      double currentPrice =
         candle.Close;

      double bestDistance = DBL_MAX;
      int    bestIndex    = -1;

      for(int i=context.OrderBlockSeries.Count()-1;
          i>=0;
          i--)
      {
         CEOrderBlockPoint block =
            context.OrderBlockSeries.At(i);

         if(!block.IsActive())
            continue;

         if(!block.IsBullish())
            continue;
            
            
         //------------------------------------------
         // Bullish OB phải nằm dưới giá hiện tại
         //------------------------------------------
         
         if(block.High > currentPrice)
            continue;

         double distance =
            MathAbs(
               block.High-currentPrice);

         if(distance<bestDistance)
         {
            bestDistance = distance;
            bestIndex    = i;
         }
      }

      if(bestIndex<0)
         return;

      CEOrderBlockPoint block =
         context.OrderBlockSeries.At(bestIndex);
         
      //-------------------------------------
      // Maximum Entry Distance
      //-------------------------------------
      
      const int MAX_ENTRY_DISTANCE_POINTS = 300;
      
      double distancePoints =
         MathAbs(
            currentPrice -
            block.High) / _Point;
      
      if(distancePoints >
         MAX_ENTRY_DISTANCE_POINTS)
      {
         return;
      }

      context.TradeEntry.Valid  = true;

      context.TradeEntry.Price  = block.High;

      context.TradeEntry.Source =
         ENTRY_SOURCE_ORDER_BLOCK;
         
      // Sync TradeSetup

      context.TradeSetup.Entry =
         context.TradeEntry;
   }

   //----------------------------------------------------------
   // SELL
   //----------------------------------------------------------

   void CalculateSell(
      CEAnalysisContext &context)
   {
      const CECandle candle =
         context.CandleSeries.At(
            context.CandleSeries.Count()-1);

      double currentPrice =
         candle.Close;

      double bestDistance = DBL_MAX;
      int    bestIndex    = -1;

      for(int i=context.OrderBlockSeries.Count()-1;
          i>=0;
          i--)
      {
         CEOrderBlockPoint block =
            context.OrderBlockSeries.At(i);

         if(!block.IsActive())
            continue;

         if(!block.IsBearish())
            continue;
            
         //------------------------------------------
         // Bearish OB phải nằm trên giá hiện tại
         //------------------------------------------
         
         if(block.Low < currentPrice)
            continue;

         double distance =
            MathAbs(
               block.Low-currentPrice);

         if(distance<bestDistance)
         {
            bestDistance = distance;
            bestIndex    = i;
         }
      }

      if(bestIndex<0)
         return;

      CEOrderBlockPoint block =
         context.OrderBlockSeries.At(bestIndex);
         
      //-------------------------------------
      // Maximum Entry Distance
      //-------------------------------------
      
      const int MAX_ENTRY_DISTANCE_POINTS = 300;
      
      double distancePoints =
         MathAbs(
            currentPrice -
            block.Low) / _Point;
      
      if(distancePoints >
         MAX_ENTRY_DISTANCE_POINTS)
      {
         return;
      }

      context.TradeEntry.Valid  = true;

      context.TradeEntry.Price  = block.Low;

      context.TradeEntry.Source =
         ENTRY_SOURCE_ORDER_BLOCK;
         
      // Sync TradeSetup

      context.TradeSetup.Entry =
         context.TradeEntry;
   }

};

#endif