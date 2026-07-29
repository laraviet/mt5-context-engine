#ifndef __CE_FVG_DETECTOR_MQH__
#define __CE_FVG_DETECTOR_MQH__

#include "../Interfaces/IFVGDetector.mqh"

class CEFVGDetector : public IFVGDetector
{
public:

   virtual int Detect(
      CEFVGSeries &series)
   {
      series.Clear();

      int bars = Bars(_Symbol, _Period);

      for(int i = bars - 3; i >= 2; i--)
      {
         double high1 = iHigh(_Symbol, _Period, i);
         double low1  = iLow (_Symbol, _Period, i);

         double high3 = iHigh(_Symbol, _Period, i - 2);
         double low3  = iLow (_Symbol, _Period, i - 2);

         datetime time =
            iTime(_Symbol, _Period, i - 1);

         // Bullish FVG
         if(high1 < low3)
         {
            CEFVGPoint point;

            point.Index = i - 1;

            point.Time = time;

            point.Type = FVG_BULLISH;

            point.LowerPrice = high1;

            point.UpperPrice = low3;

            point.Filled = false;

            series.Add(point);
         }

         // Bearish FVG
         if(low1 > high3)
         {
            CEFVGPoint point;

            point.Index = i - 1;

            point.Time = time;

            point.Type = FVG_BEARISH;

            point.UpperPrice = low1;

            point.LowerPrice = high3;

            point.Filled = false;

            series.Add(point);
         }
      }

      return series.Count();
   }
};

#endif