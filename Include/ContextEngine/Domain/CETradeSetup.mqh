#ifndef __CE_TRADE_SETUP_MQH__
#define __CE_TRADE_SETUP_MQH__

#include "CETradeEntry.mqh"
#include "CEStopLoss.mqh"
#include "CETakeProfit.mqh"

class CETradeSetup
{
public:

   CETradeEntry Entry;

   CEStopLoss StopLoss;

   CETakeProfit TakeProfit;

public:

   void Reset()
   {
      Entry.Reset();

      StopLoss.Reset();

      TakeProfit.Reset();
   }

   bool IsValid() const
   {
      return
         Entry.Valid &&
         StopLoss.Valid &&
         TakeProfit.Valid;
   }
};

#endif