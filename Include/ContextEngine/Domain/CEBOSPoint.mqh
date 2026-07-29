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

   int BrokenSwingIndex;

   double BreakPrice;

   double Distance;

   bool Confirmed;

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

      BrokenSwingIndex = -1;

      BreakPrice = 0;

      Distance = 0;

      Confirmed = false;
   }
   
   bool IsBullish() const
   {
      return Type==BOS_BULLISH;
   }
   
   bool IsBearish() const
   {
      return Type==BOS_BEARISH;
   }
   
   bool IsConfirmed() const
   {
      return Confirmed;
   }
};

#endif