#ifndef __CE_TRADE_SETUP_EXPORT_MAPPER_MQH__
#define __CE_TRADE_SETUP_EXPORT_MAPPER_MQH__

#include "CETradeSetupExportRow.mqh"
#include "../Domain/CEDecisionTypeHelper.mqh"

class CETradeSetupExportMapper
{
private:

   static string TimeframeToString(
      const ENUM_TIMEFRAMES tf)
   {
      switch(tf)
      {
         case PERIOD_M1:  return "M1";
         case PERIOD_M5:  return "M5";
         case PERIOD_M15: return "M15";
         case PERIOD_M30: return "M30";

         case PERIOD_H1:  return "H1";
         case PERIOD_H4:  return "H4";

         case PERIOD_D1:  return "D1";
         case PERIOD_W1:  return "W1";
         case PERIOD_MN1: return "MN";

         default:

            return "UNKNOWN";
      }
   }

public:

   static CETradeSetupExportRow Map(
      const CEAnalysisContext &context)
   {
      CETradeSetupExportRow row;

      row.Time = TimeCurrent();

      row.Symbol = context.Symbol;

      row.Timeframe =
         TimeframeToString(
            context.Timeframe);

      row.Direction =
         CEDecisionTypeHelper::ToString(
            context.Decision.Type);

      row.Entry =
         context.TradeSetup.Entry.Price;

      row.StopLoss =
         context.TradeSetup.StopLoss.Price;

      row.TakeProfit =
         context.TradeSetup.TakeProfit.Price;

      row.Risk =
         context.TradeSetup.RiskReward.Risk / _Point;

      row.Reward =
         context.TradeSetup.RiskReward.Reward / _Point;

      row.RR =
         context.TradeSetup.RiskReward.Ratio;

      row.Quality =
         context.TradeSetup.Quality.Score;

      row.Allowed =
         context.TradeSetup.Filter.Allowed;

      row.Reason =
         CETradeFilterReasonHelper::ToString(
            context.TradeSetup.Filter.Reason);

      return row;
   }
};

#endif