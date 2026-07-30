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

   void Reset()
   {
      Index = -1;

      Time = 0;

      Type = ORDER_BLOCK_UNKNOWN;

      High = 0;

      Low = 0;

      Mitigated = false;
   }
};

#endif