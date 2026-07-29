#ifndef __CE_CHOCH_DETECTOR_MQH__
#define __CE_CHOCH_DETECTOR_MQH__

#include "../Interfaces/IChochDetector.mqh"

class CEChochDetector : public IChochDetector
{
public:

   virtual int Detect(
      const CEBOSSeries &bos,
      CEChochSeries &choch)
   {
      choch.Clear();

      if(bos.Count()<2)
         return 0;

      CEBOSType previous =
         bos.At(0).Type;

      for(int i=1;i<bos.Count();i++)
      {
         CEBOSPoint current =
            bos.At(i);

         if(current.Type!=previous)
         {
            CEChochPoint point;

            point.Index = current.Index;

            point.Time = current.Time;

            point.BOSIndex = i;

            point.Price = current.BreakPrice;

            if(current.Type==BOS_BULLISH)
               point.Type = CHOCH_BULLISH;

            else if(current.Type==BOS_BEARISH)
               point.Type = CHOCH_BEARISH;

            choch.Add(point);
         }

         previous = current.Type;
      }

      return choch.Count();
   }
};

#endif