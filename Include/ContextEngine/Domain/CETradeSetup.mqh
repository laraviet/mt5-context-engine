#ifndef __CE_TRADE_SETUP_MQH__
#define __CE_TRADE_SETUP_MQH__

#include "CETradeEntry.mqh"
#include "CEStopLoss.mqh"
#include "CETakeProfit.mqh"
#include "CERiskReward.mqh"
#include "CETradeQuality.mqh"
#include "CETradeFilter.mqh"

class CETradeSetup
{
public:

   CETradeEntry Entry;

   CEStopLoss StopLoss;

   CETakeProfit TakeProfit;
   
   CERiskReward RiskReward;
   
   CETradeQuality Quality;
   
   CETradeFilter Filter;

public:

   void Reset()
   {
      Entry.Reset();

      StopLoss.Reset();

      TakeProfit.Reset();
      
      RiskReward.Reset();
      
      Quality.Reset();
      
      Filter.Reset();
   }

   bool IsValid() const
   {
      return Entry.Valid &&
             StopLoss.Valid &&
             TakeProfit.Valid;
   }
   
   bool IsTradable() const
   {
      return IsValid() &&
             Filter.Allowed;
   }
   
};

#endif