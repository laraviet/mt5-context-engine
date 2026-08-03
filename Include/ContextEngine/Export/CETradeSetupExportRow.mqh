#ifndef __CE_TRADE_SETUP_EXPORT_ROW_MQH__
#define __CE_TRADE_SETUP_EXPORT_ROW_MQH__

class CETradeSetupExportRow
{
public:

   datetime Time;

   string Symbol;

   string Timeframe;

   string Direction;

   double Entry;

   double StopLoss;

   double TakeProfit;

   double Risk;

   double Reward;

   double RR;

   int Quality;

   bool Allowed;

   string Reason;

public:

   CETradeSetupExportRow()
   {
      Reset();
   }

   void Reset()
   {
      Time       = 0;

      Symbol     = "";

      Timeframe  = "";

      Direction  = "";

      Entry      = 0;

      StopLoss   = 0;

      TakeProfit = 0;

      Risk       = 0;

      Reward     = 0;

      RR         = 0;

      Quality    = 0;

      Allowed    = false;

      Reason     = "";
   }
};

#endif