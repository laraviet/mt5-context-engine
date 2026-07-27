#ifndef __CE_DATA_PROVIDER_MQH__
#define __CE_DATA_PROVIDER_MQH__

#include <ContextEngine/Domain/CECandle.mqh>

class CEDataProvider
{
public:

   bool GetLatestCandle(CECandle &candle)
   {
      MqlRates rates[];

      if(CopyRates(
            _Symbol,
            _Period,
            0,
            1,
            rates) != 1)
      {
         return false;
      }

      candle.Time       = rates[0].time;
      candle.Open       = rates[0].open;
      candle.High       = rates[0].high;
      candle.Low        = rates[0].low;
      candle.Close      = rates[0].close;
      candle.TickVolume = rates[0].tick_volume;
      candle.RealVolume = rates[0].real_volume;
      candle.Spread     = rates[0].spread;

      return true;
   }

};

#endif