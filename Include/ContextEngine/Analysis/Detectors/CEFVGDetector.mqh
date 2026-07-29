#ifndef __CE_FVG_DETECTOR_MQH__
#define __CE_FVG_DETECTOR_MQH__

#include "../Interfaces/IFVGDetector.mqh"
#include "../../Config/CEFVGConfig.mqh"

class CEFVGDetector : public IFVGDetector
{
private:

   const CEFVGConfig *m_config;

public:

   CEFVGDetector(
      const CEFVGConfig &config)
   {
      m_config = &config;
   }

   virtual int Detect(
      const CECandleSeries &candles,
      CEFVGSeries &series)
   {
      series.Clear();

      if(candles.Count() < 3)
         return 0;

      for(int i = 2; i < candles.Count(); i++)
      {
         CECandle first  = candles.At(i - 2);
         CECandle middle = candles.At(i - 1);
         CECandle third  = candles.At(i);

         // Bullish FVG
         if(first.High < third.Low)
         {
            CEFVGPoint point;

            point.Index = i;
            point.Time  = third.Time;
            point.Type  = FVG_BULLISH;

            point.LowerPrice = first.High;
            point.UpperPrice = third.Low;

            point.Gap = point.UpperPrice - point.LowerPrice;

            if(point.Gap < m_config.MinGap)
               continue;

            point.Filled = false;

            series.Add(point);
         }

         // Bearish FVG
         if(first.Low > third.High)
         {
            CEFVGPoint point;

            point.Index = i;
            point.Time  = third.Time;
            point.Type  = FVG_BEARISH;

            point.UpperPrice = first.Low;
            point.LowerPrice = third.High;

            point.Gap = point.UpperPrice - point.LowerPrice;

            if(point.Gap < m_config.MinGap)
               continue;

            point.Filled = false;

            series.Add(point);
         }
      }

      return series.Count();
   }
};

#endif