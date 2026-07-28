#ifndef __CE_TREND_POINT_MQH__
#define __CE_TREND_POINT_MQH__

#include "CETrendStrength.mqh"
#include "CETrendState.mqh"

enum CETrendType
{
   TREND_UNKNOWN = 0,

   TREND_UP,

   TREND_DOWN,

   TREND_RANGE
};

inline string TrendTypeToString(
   const CETrendType type)
{
   switch(type)
   {
      case TREND_UP:
         return "UP";

      case TREND_DOWN:
         return "DOWN";

      case TREND_RANGE:
         return "RANGE";

      default:
         return "UNKNOWN";
   }
}

class CETrendPoint
{
public:

   int Index;

   datetime Time;

   CETrendType TrendType;   
   CETrendStrength Strength;   
   CETrendState State;

   CETrendPoint()
   {
      Index = -1;
      Time = 0;
      TrendType = TREND_UNKNOWN;
      Strength = TREND_STRENGTH_UNKNOWN;
      State = TREND_STATE_UNKNOWN;
   }
};

#endif