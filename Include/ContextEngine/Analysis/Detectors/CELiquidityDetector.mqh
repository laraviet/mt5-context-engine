#ifndef __CE_LIQUIDITY_DETECTOR_MQH__
#define __CE_LIQUIDITY_DETECTOR_MQH__

#include "../Interfaces/ILiquidityDetector.mqh"

class CELiquidityDetector : public ILiquidityDetector
{
public:

   virtual int Detect(
      const CEBOSSeries &bos,
      CELiquiditySeries &liquidity)
   {
      liquidity.Clear();

      for(int i = 0; i < bos.Count(); i++)
      {
         CEBOSPoint current = bos.At(i);

         CELiquidityPoint point;

         point.Index = current.Index;
         point.Time  = current.Time;

         point.BOSIndex = i;

         point.SwingIndex = current.BrokenSwingIndex;

         point.Price = current.BreakPrice;

         point.Swept = current.Confirmed;

         if(current.IsBullish())
            point.Type = LIQUIDITY_BUY_SIDE;

         else if(current.IsBearish())
            point.Type = LIQUIDITY_SELL_SIDE;

         liquidity.Add(point);
      }

      return liquidity.Count();
   }
};

#endif