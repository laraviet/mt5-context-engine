#ifndef __CE_ORDER_BLOCK_POINT_MQH__
#define __CE_ORDER_BLOCK_POINT_MQH__

#include "CEOrderBlockType.mqh"

class CEOrderBlockPoint
{
public:

   int Index;

   datetime Time;

   CEOrderBlockType Type;

   double High;

   double Low;

   bool Mitigated;

public:

   CEOrderBlockPoint()
   {
      Reset();
   }

   void Reset()
   {
      Index = -1;

      Time = 0;

      Type = ORDER_BLOCK_UNKNOWN;

      High = 0;

      Low = 0;

      Mitigated = false;
   }

   bool IsBullish() const
   {
      return Type == ORDER_BLOCK_BULLISH;
   }

   bool IsBearish() const
   {
      return Type == ORDER_BLOCK_BEARISH;
   }

   bool IsActive() const
   {
      return !Mitigated;
   }

   bool IsMitigated() const
   {
      return Mitigated;
   }
};

#endif