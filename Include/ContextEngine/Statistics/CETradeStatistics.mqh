#ifndef __CE_TRADE_STATISTICS_MQH__
#define __CE_TRADE_STATISTICS_MQH__

class CETradeStatistics
{
public:

   int TotalTrades;

   int BuyTrades;

   int SellTrades;

   int WaitTrades;

   double AverageConfidence;

   double AverageQuality;

   double AverageRatio;

public:

   CETradeStatistics()
   {
      Reset();
   }

   void Reset()
   {
      TotalTrades = 0;

      BuyTrades = 0;

      SellTrades = 0;

      WaitTrades = 0;

      AverageConfidence = 0.0;

      AverageQuality = 0.0;

      AverageRatio = 0.0;
   }
   
   bool HasTrades() const
   {
      return TotalTrades > 0;
   }
   
   bool HasExecutedTrades() const
   {
      return BuyTrades + SellTrades > 0;
   }
   
   bool IsValid() const
   {
      return TotalTrades ==
         (BuyTrades +
          SellTrades +
          WaitTrades);
   }
   
   string ToString() const
   {
      return StringFormat(
         "Trades=%d BUY=%d SELL=%d WAIT=%d AvgConf=%.1f AvgQuality=%.1f AvgRatio=%.2f",
         TotalTrades,
         BuyTrades,
         SellTrades,
         WaitTrades,
         AverageConfidence,
         AverageQuality,
         AverageRatio);
   }
   
};

#endif