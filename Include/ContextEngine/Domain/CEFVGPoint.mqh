#ifndef __CE_FVG_POINT_MQH__
#define __CE_FVG_POINT_MQH__

#include "CEFVGType.mqh"

class CEFVGPoint
{
public:

   int Index;

   datetime Time;

   CEFVGType Type;

   double UpperPrice;

   double LowerPrice;

   bool Filled;

public:

   CEFVGPoint()
   {
      Reset();
   }

   void Reset()
   {
      Index = -1;

      Time = 0;

      Type = FVG_UNKNOWN;

      UpperPrice = 0;

      LowerPrice = 0;

      Filled = false;
   }

   bool IsBullish() const
   {
      return Type == FVG_BULLISH;
   }

   bool IsBearish() const
   {
      return Type == FVG_BEARISH;
   }
};

#endif