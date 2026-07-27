#ifndef __CE_TREND_DETECTOR_MQH__
#define __CE_TREND_DETECTOR_MQH__

#include "../Domain/CEMarketStructureSeries.mqh"
#include "../Domain/CETrendSeries.mqh"

class CETrendDetector
{
public:

   int Detect(
      const CEMarketStructureSeries &structures,
      CETrendSeries &trends)
   {
      trends.Clear();
   
      for(int i = 0; i < structures.Count(); i++)
      {
         CEMarketStructurePoint structure = structures.At(i);
   
         CETrendPoint point;
   
         point.Index = structure.Index;
         point.Time  = structure.Time;
         point.TrendType = DetectTrend(
            structures,
            i);
   
         trends.Add(point);
      }
   
      return trends.Count();
   }

private:

   CETrendType DetectTrend(
      const CEMarketStructureSeries &structures,
      const int index) const
   {
      CEMarketStructurePoint current = structures.At(index);
   
      if(current.StructureType == STRUCTURE_HH)
      {
         for(int i = index - 1; i >= 0; i--)
         {
            CEMarketStructurePoint previous = structures.At(i);
   
            if(previous.StructureType == STRUCTURE_HL)
               return TREND_UP;
         }
      }
   
      if(current.StructureType == STRUCTURE_LL)
      {
         for(int i = index - 1; i >= 0; i--)
         {
            CEMarketStructurePoint previous = structures.At(i);
   
            if(previous.StructureType == STRUCTURE_LH)
               return TREND_DOWN;
         }
      }
   
      return TREND_UNKNOWN;
   }
};

#endif