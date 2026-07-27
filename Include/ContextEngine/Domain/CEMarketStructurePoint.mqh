#ifndef __CE_MARKET_STRUCTURE_POINT_MQH__
#define __CE_MARKET_STRUCTURE_POINT_MQH__

#include "CESwingPoint.mqh"

enum CEStructureType
{
   STRUCTURE_NONE = 0,

   STRUCTURE_HH,
   STRUCTURE_HL,

   STRUCTURE_LH,
   STRUCTURE_LL
};

class CEMarketStructurePoint
{
public:

   int Index;

   datetime Time;

   double Price;

   CESwingType SwingType;

   CEStructureType StructureType;

   CEMarketStructurePoint()
   {
      Index = -1;
      Time = 0;
      Price = 0;

      SwingType = SWING_NONE;
      StructureType = STRUCTURE_NONE;
   }
};

#endif