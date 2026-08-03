#ifndef __CE_STOP_LOSS_ANALYZER_MQH__
#define __CE_STOP_LOSS_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"

class CEStopLossAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Stop Loss Analyzer";
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

      if(!context.TradeEntry.Valid)
         return true;

      //------------------------------------
      // BUY
      //------------------------------------

      if(context.Decision.Type==DECISION_BUY)
      {
         CalculateBuy(context);

         return true;
      }

      //------------------------------------
      // SELL
      //------------------------------------

      if(context.Decision.Type==DECISION_SELL)
      {
         CalculateSell(context);

         return true;
      }

      return true;
   }

private:

   //---------------------------------------------------
   // BUY
   //---------------------------------------------------

   void CalculateBuy(
      CEAnalysisContext &context)
   {
      for(int ob=context.OrderBlockSeries.Count()-1;
          ob>=0;
          ob--)
      {
         CEOrderBlockPoint block=
            context.OrderBlockSeries.At(ob);
            
         if(!block.IsActive())
            continue;

         if(!block.IsBullish())
            continue;

         //-----------------------------------
         // Swing Low gần nhất trước OB
         //-----------------------------------

         for(int s=context.SwingSeries.Count()-1;
             s>=0;
             s--)
         {
            CESwingPoint swing=
               context.SwingSeries.At(s);

            if(swing.Type!=SWING_LOW)
               continue;

            if(swing.Index>=block.Index)
               continue;

            context.StopLoss.Valid=true;

            context.StopLoss.Price=
               swing.Price;

            context.StopLoss.Source=
               STOP_LOSS_SWING;

            return;
         }

         //-----------------------------------
         // fallback = OB Low
         //-----------------------------------

         context.StopLoss.Valid=true;

         context.StopLoss.Price=
            block.Low;

         context.StopLoss.Source=
            STOP_LOSS_ORDER_BLOCK;
            
         context.TradeSetup.StopLoss =
            context.StopLoss;

         return;
      }
   }

   //---------------------------------------------------
   // SELL
   //---------------------------------------------------

   void CalculateSell(
      CEAnalysisContext &context)
   {
      for(int ob=context.OrderBlockSeries.Count()-1;
          ob>=0;
          ob--)
      {
         CEOrderBlockPoint block=
            context.OrderBlockSeries.At(ob);
            
         if(!block.IsActive())
            continue;

         if(!block.IsBearish())
            continue;

         //-----------------------------------
         // Swing High gần nhất trước OB
         //-----------------------------------

         for(int s=context.SwingSeries.Count()-1;
             s>=0;
             s--)
         {
            CESwingPoint swing=
               context.SwingSeries.At(s);

            if(swing.Type!=SWING_HIGH)
               continue;

            if(swing.Index>=block.Index)
               continue;

            context.StopLoss.Valid=true;

            context.StopLoss.Price=
               swing.Price;

            context.StopLoss.Source=
               STOP_LOSS_SWING;

            return;
         }

         //-----------------------------------
         // fallback = OB High
         //-----------------------------------

         context.StopLoss.Valid=true;

         context.StopLoss.Price=
            block.High;

         context.StopLoss.Source=
            STOP_LOSS_ORDER_BLOCK;
            
         context.TradeSetup.StopLoss =
            context.StopLoss;

         return;
      }
   }
};

#endif