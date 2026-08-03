#ifndef __CE_TRADE_FILTER_ANALYZER_MQH__
#define __CE_TRADE_FILTER_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"

class CETradeFilterAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Trade Filter Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE_FINAL + 90;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.TradeSetup.Filter.Reset();

      //--------------------------------------------------
      // Entry phải hợp lệ
      //--------------------------------------------------

      if(!context.TradeEntry.Valid)
      {
         context.TradeSetup.Filter.Reason =
            FILTER_REASON_INVALID_ENTRY;

         return true;
      }

      //--------------------------------------------------
      // Quality phải hợp lệ
      //--------------------------------------------------

      if(!context.TradeQuality.Valid)
      {
         context.TradeSetup.Filter.Reason =
            FILTER_REASON_LOW_QUALITY;

         return true;
      }

      //--------------------------------------------------
      // Quality tối thiểu
      //--------------------------------------------------

      if(context.TradeQuality.Score < 80)
      {
         context.TradeSetup.Filter.Reason =
            FILTER_REASON_LOW_QUALITY;

         return true;
      }

      //--------------------------------------------------
      // RR phải hợp lệ
      //--------------------------------------------------

      if(!context.TradeSetup.RiskReward.Valid)
      {
         context.TradeSetup.Filter.Reason =
            FILTER_REASON_LOW_RR;

         return true;
      }

      //--------------------------------------------------
      // RR tối thiểu
      //--------------------------------------------------

      if(context.TradeSetup.RiskReward.Ratio < 2.0)
      {
         context.TradeSetup.Filter.Reason =
            FILTER_REASON_LOW_RR;

         return true;
      }

      //--------------------------------------------------
      // Passed
      //--------------------------------------------------

      context.TradeSetup.Filter.Allowed = true;

      context.TradeSetup.Filter.Reason =
         FILTER_REASON_NONE;

      return true;
   }
};

#endif