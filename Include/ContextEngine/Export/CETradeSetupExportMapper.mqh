#ifndef __CE_TRADE_SETUP_EXPORT_MAPPER_MQH__
#define __CE_TRADE_SETUP_EXPORT_MAPPER_MQH__

#include "CETradeSetupExportRow.mqh"
#include "../Domain/CEDecisionTypeHelper.mqh"
#include "../Journal/CETradeJournalEntry.mqh"

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
      const CETradeJournalEntry &entry)
   {
      CETradeSetupExportRow row;

      row.Time = entry.Time;

      row.Symbol = entry.Symbol;

      row.Timeframe =
         TimeframeToString(
            entry.Timeframe);

      row.Direction =
         CEDecisionTypeHelper::ToString(
            entry.Decision.Type);

      row.Entry =
         entry.TradeSetup.Entry.Price;

      row.StopLoss =
         entry.TradeSetup.StopLoss.Price;

      row.TakeProfit =
         entry.TradeSetup.TakeProfit.Price;

      row.Risk =
         entry.TradeSetup.RiskReward.Risk / _Point;

      row.Reward =
         entry.TradeSetup.RiskReward.Reward / _Point;

      row.RR =
         entry.TradeSetup.RiskReward.Ratio;

      row.Quality =
         entry.TradeSetup.Quality.Score;

      row.Allowed =
         entry.TradeSetup.Filter.Allowed;

      row.Reason =
         CETradeFilterReasonHelper::ToString(
            entry.TradeSetup.Filter.Reason);

      return row;
   }
};

#endif