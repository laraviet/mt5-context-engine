#ifndef __CE_ORDER_BLOCK_DETECTOR_MQH__
#define __CE_ORDER_BLOCK_DETECTOR_MQH__

#include "../Interfaces/IOrderBlockDetector.mqh"

class CEOrderBlockDetector : public IOrderBlockDetector
{
public:

   virtual int Detect(
      const CECandleSeries &candles,
      const CEBOSSeries &bos,
      CEOrderBlockSeries &blocks)
   {
      blocks.Clear();

      for(int i=0;i<bos.Count();i++)
      {
         CEBOSPoint bosPoint = bos.At(i);

         if(bosPoint.Type == BOS_BULLISH)
         {
            DetectBullish(
               candles,
               bosPoint,
               blocks);
         }
         else
         if(bosPoint.Type == BOS_BEARISH)
         {
            DetectBearish(
               candles,
               bosPoint,
               blocks);
         }
      }

      return blocks.Count();
   }

private:

   void DetectBullish(
      const CECandleSeries &candles,
      const CEBOSPoint &bos,
      CEOrderBlockSeries &blocks)
   {
      for(int i=bos.Index;i>=0;i--)
      {
         CECandle candle = candles.At(i);

         if(candle.Close < candle.Open)
         {
            CEOrderBlockPoint point;

            point.Reset();

            point.Index = i;

            point.Time = candle.Time;

            point.Type = ORDER_BLOCK_BULLISH;

            point.High = candle.High;

            point.Low = candle.Low;

            blocks.Add(point);

            return;
         }
      }
   }

   void DetectBearish(
      const CECandleSeries &candles,
      const CEBOSPoint &bos,
      CEOrderBlockSeries &blocks)
   {
      for(int i=bos.Index;i>=0;i--)
      {
         CECandle candle = candles.At(i);

         if(candle.Close > candle.Open)
         {
            CEOrderBlockPoint point;

            point.Reset();

            point.Index = i;

            point.Time = candle.Time;

            point.Type = ORDER_BLOCK_BEARISH;

            point.High = candle.High;

            point.Low = candle.Low;

            blocks.Add(point);

            return;
         }
      }
   }
};

#endif