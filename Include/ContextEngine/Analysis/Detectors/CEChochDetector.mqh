#ifndef __CE_CHOCH_DETECTOR_MQH__
#define __CE_CHOCH_DETECTOR_MQH__

#include "../Interfaces/IChochDetector.mqh"

class CEChochDetector : public IChochDetector
{
private:

   bool ValidateBullishSwing(
      const CESwingSeries &swings,
      const CEBOSPoint &bos)
   {
      for(int i = swings.Count() - 1; i >= 0; i--)
      {
         CESwingPoint swing = swings.At(i);

         if(swing.Type != SWING_HIGH)
            continue;

         if(swing.Price < bos.BreakPrice)
            return true;

         break;
      }

      return false;
   }

   bool ValidateBearishSwing(
      const CESwingSeries &swings,
      const CEBOSPoint &bos)
   {
      for(int i = swings.Count() - 1; i >= 0; i--)
      {
         CESwingPoint swing = swings.At(i);

         if(swing.Type != SWING_LOW)
            continue;

         if(swing.Price > bos.BreakPrice)
            return true;

         break;
      }

      return false;
   }

public:

   virtual int Detect(
      const CESwingSeries &swings,
      const CEBOSSeries &bos,
      CEChochSeries &choch)
   {
      choch.Clear();

      if(bos.Count() < 2)
         return 0;

      CEBOSType previous =
         bos.At(0).Type;

      for(int i = 1; i < bos.Count(); i++)
      {
         CEBOSPoint current =
            bos.At(i);

         if(current.Type != previous)
         {
            CEChochPoint point;

            point.Index = current.Index;
            point.Time = current.Time;
            point.BOSIndex = i;
            point.Price = current.BreakPrice;

            if(current.Type == BOS_BULLISH)
            {
               point.Type = CHOCH_BULLISH;

               if(ValidateBullishSwing(
                     swings,
                     current))
               {
                  point.Confirm();
               }
            }
            else
            {
               point.Type = CHOCH_BEARISH;

               if(ValidateBearishSwing(
                     swings,
                     current))
               {
                  point.Confirm();
               }
            }

            choch.Add(point);
         }

         previous = current.Type;
      }

      return choch.Count();
   }
};

#endif