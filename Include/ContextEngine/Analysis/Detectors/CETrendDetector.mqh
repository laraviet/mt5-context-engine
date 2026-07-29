#ifndef __CE_TREND_DETECTOR_MQH__
#define __CE_TREND_DETECTOR_MQH__

#include "../../Domain/CEBOSSeries.mqh"
#include "../../Domain/CETrendSeries.mqh"
#include "../../Domain/CETrendStrength.mqh"
#include "../../Domain/CEBOSType.mqh"

#include "../Interfaces/ITrendDetector.mqh"

class CETrendDetector : public ITrendDetector
{
public:

   virtual int Detect(
      const CEBOSSeries &bos,
      CETrendSeries &trends)
   {
      trends.Clear();

      for(int i=0;i<bos.Count();i++)
      {
         CEBOSPoint current = bos.At(i);

         CETrendPoint point;

         point.Index = current.Index;
         point.Time  = current.Time;

         point.TrendType =
            DetectTrend(current);

         point.Strength =
            DetectStrength(
               bos,
               i,
               point.TrendType);

         trends.Add(point);
      }

      return trends.Count();
   }

private:

   CETrendType DetectTrend(
      const CEBOSPoint &bos) const
   {
      switch(bos.Type)
      {
         case BOS_BULLISH:

            return TREND_UP;

         case BOS_BEARISH:

            return TREND_DOWN;

         default:

            return TREND_UNKNOWN;
      }
   }

   CETrendStrength DetectStrength(
      const CEBOSSeries &bos,
      const int index,
      const CETrendType trend) const
   {
      int count = 0;

      for(int i=index;i>=0;i--)
      {
         CEBOSPoint point = bos.At(i);

         if(trend==TREND_UP &&
            point.Type==BOS_BULLISH)
         {
            count++;
            continue;
         }

         if(trend==TREND_DOWN &&
            point.Type==BOS_BEARISH)
         {
            count++;
            continue;
         }

         break;
      }

      if(count>=4)
         return TREND_STRENGTH_STRONG;

      if(count>=2)
         return TREND_STRENGTH_NORMAL;

      if(count>=1)
         return TREND_STRENGTH_WEAK;

      return TREND_STRENGTH_UNKNOWN;
   }
};

#endif