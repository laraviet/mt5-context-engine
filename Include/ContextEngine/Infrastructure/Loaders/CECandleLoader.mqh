#ifndef __CE_CANDLE_LOADER_MQH__
#define __CE_CANDLE_LOADER_MQH__

#include "../../Domain/CECandleSeries.mqh"

class CECandleLoader
{
public:

   bool Load(
      const string symbol,
      ENUM_TIMEFRAMES timeframe,
      const int maxBars,
      CECandleSeries &series)
   {
      series.Clear();

      MqlRates rates[];

      int copied=
         CopyRates(
            symbol,
            timeframe,
            0,
            maxBars,
            rates);

      if(copied<=0)
         return false;

      ArraySetAsSeries(rates,true);

      for(int i=copied-1;i>=0;i--)
      {
         CECandle candle;

         candle.Time=rates[i].time;

         candle.Open=rates[i].open;

         candle.High=rates[i].high;

         candle.Low=rates[i].low;

         candle.Close=rates[i].close;

         series.Add(candle);
      }

      return true;
   }
};

#endif