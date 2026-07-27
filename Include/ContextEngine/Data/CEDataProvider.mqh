#ifndef __CE_DATA_PROVIDER_MQH__
#define __CE_DATA_PROVIDER_MQH__

#include <ContextEngine/Domain/CECandle.mqh>

class CEDataProvider
{
public:

   bool GetLatestCandle(
      const string symbol,
      ENUM_TIMEFRAMES timeframe,
      CECandle &candle)
   {
      CECandle candles[];
   
      if(!GetCandles(
            symbol,
            timeframe,
            1,
            candles))
      {
         return false;
      }
   
      candle = candles[0];
   
      return true;
   }
   
   bool GetCandles(
      const string symbol,
      ENUM_TIMEFRAMES timeframe,
      const int count,
      CECandle &candles[])
   {
      MqlRates rates[];
   
      ArrayResize(candles, count);
   
      int copied = CopyRates(
                        symbol,
                        timeframe,
                        0,
                        count,
                        rates);
   
      if(copied != count)
         return false;
   
      for(int i = 0; i < count; i++)
      {
         candles[i].Time       = rates[i].time;
         candles[i].Open       = rates[i].open;
         candles[i].High       = rates[i].high;
         candles[i].Low        = rates[i].low;
         candles[i].Close      = rates[i].close;
         candles[i].TickVolume = rates[i].tick_volume;
         candles[i].RealVolume = rates[i].real_volume;
         candles[i].Spread     = rates[i].spread;
      }
   
      return true;
   }

};

#endif