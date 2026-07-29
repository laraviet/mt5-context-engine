#ifndef __CE_BOS_POINT_MQH__
#define __CE_BOS_POINT_MQH__

#include "CEBOSType.mqh"

class CEBOSPoint
{
public:

   int Index;

   datetime Time;

   CEBOSType Type;

   int StructureIndex;

   double BreakPrice;

public:

   CEBOSPoint()
   {
      Reset();
   }

   void Reset()
   {
      Index = -1;

      Time = 0;

      Type = BOS_UNKNOWN;

      StructureIndex = -1;

      BreakPrice = 0;
   }
};

#endif