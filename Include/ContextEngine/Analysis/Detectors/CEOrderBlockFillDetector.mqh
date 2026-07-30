#ifndef __CE_ORDER_BLOCK_FILL_DETECTOR_MQH__
#define __CE_ORDER_BLOCK_FILL_DETECTOR_MQH__

#include "../Interfaces/IOrderBlockFillDetector.mqh"

class CEOrderBlockFillDetector :
   public IOrderBlockFillDetector
{
public:

   virtual void Detect(
      const CECandleSeries &candles,
      CEOrderBlockSeries &blocks)
   {
      for(int i=0;i<blocks.Count();i++)
      {
         CEOrderBlockPoint point =
            blocks.At(i);

         point.Mitigated =
            IsMitigated(
               candles,
               point);

         blocks.Update(
            i,
            point);
      }
   }

private:

   bool IsMitigated(
      const CECandleSeries &candles,
      const CEOrderBlockPoint &block)
   {
      for(int i=block.Index+1;
          i<candles.Count();
          i++)
      {
         CECandle candle =
            candles.At(i);

         if(block.Type==
            ORDER_BLOCK_BULLISH)
         {
            if(candle.Low<=block.Low)
               return true;
         }

         if(block.Type==
            ORDER_BLOCK_BEARISH)
         {
            if(candle.High>=block.High)
               return true;
         }
      }

      return false;
   }
};

#endif