#ifndef __CE_MARKET_STRUCTURE_DETECTOR_MQH__
#define __CE_MARKET_STRUCTURE_DETECTOR_MQH__

#include "../Domain/CESwingSeries.mqh"
#include "../Domain/CEMarketStructureSeries.mqh"

class CEMarketStructureDetector
{
public:

   int Detect(
      const CESwingSeries &swings,
      CEMarketStructureSeries &structures)
   {
      structures.Clear();
   
      for(int i = 0; i < swings.Count(); i++)
      {
         CESwingPoint swing = swings.At(i);
   
         CEMarketStructurePoint point;
   
         point.Index = swing.Index;
         point.Time = swing.Time;
         point.Price = swing.Price;
         point.SwingType = swing.Type;
   
         if(swing.Type == SWING_HIGH)
         {
            point.StructureType = DetectHigh(
               swings,
               i);
         }
         else
         {
            point.StructureType = DetectLow(
               swings,
               i);
         }
   
         structures.Add(point);
      }
   
      return structures.Count();
   }

private:

   CEStructureType DetectHigh(
      const CESwingSeries &swings,
      const int index) const
   {
      CESwingPoint current = swings.At(index);
   
      for(int i = index - 1; i >= 0; i--)
      {
         CESwingPoint previous = swings.At(i);
   
         if(previous.Type != SWING_HIGH)
            continue;
   
         if(current.Price > previous.Price)
            return STRUCTURE_HH;
   
         return STRUCTURE_LH;
      }
   
      return STRUCTURE_NONE;
   }

   CEStructureType DetectLow(
      const CESwingSeries &swings,
      const int index) const
   {
      CESwingPoint current = swings.At(index);
   
      for(int i = index - 1; i >= 0; i--)
      {
         CESwingPoint previous = swings.At(i);
   
         if(previous.Type != SWING_LOW)
            continue;
   
         if(current.Price > previous.Price)
            return STRUCTURE_HL;
   
         return STRUCTURE_LL;
      }
   
      return STRUCTURE_NONE;
   }
   
};

#endif