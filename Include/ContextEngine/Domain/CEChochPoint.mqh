#ifndef __CE_CHOCH_POINT_MQH__
#define __CE_CHOCH_POINT_MQH__

#include "CEChochType.mqh"

class CEChochPoint
{
public:

   int Index;

   datetime Time;

   CEChochType Type;

   int BOSIndex;

   double Price;

   bool Confirmed;

public:

   CEChochPoint()
   {
      Reset();
   }

   void Reset()
   {
      Index = -1;

      Time = 0;

      Type = CHOCH_UNKNOWN;

      BOSIndex = -1;

      Price = 0;

      Confirmed = false;
   }

   void Confirm()
   {
      Confirmed = true;
   }

   bool IsBullish() const
   {
      return Type == CHOCH_BULLISH;
   }

   bool IsBearish() const
   {
      return Type == CHOCH_BEARISH;
   }
};

#endif