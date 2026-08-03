#ifndef __CE_TRADE_ENTRY_ANALYZER_MQH__
#define __CE_TRADE_ENTRY_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Domain/CEOrderBlockPoint.mqh"

class CETradeEntryAnalyzer :
   public ICEAnalyzer
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

      if(context.Decision.Type==DECISION_BUY)
      {
          for(int i=context.OrderBlockSeries.Count()-1;i>=0;i--)
          {
              CEOrderBlockPoint block = context.OrderBlockSeries.At(i);
      
              if(block.IsBullish())
              {
                  context.TradeEntry.Valid = true;
      
                  context.TradeEntry.Price = block.High;
                      
                  context.TradeEntry.Source = ENTRY_SOURCE_ORDER_BLOCK;
      
                  return true;
              }
          }
      }
      
      if(context.Decision.Type==DECISION_SELL)
      {
          for(int i=context.OrderBlockSeries.Count()-1;i>=0;i--)
          {
              CEOrderBlockPoint block = context.OrderBlockSeries.At(i);
      
              if(block.IsBearish())
              {
                  context.TradeEntry.Valid = true;
      
                  context.TradeEntry.Price = block.Low;
                  
                  context.TradeEntry.Source = ENTRY_SOURCE_ORDER_BLOCK;
      
                  return true;
              }
          }
      }
      
      return true;
   }
};

#endif