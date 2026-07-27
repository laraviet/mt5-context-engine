#ifndef __CE_TREND_POINT_MQH__
#define __CE_TREND_POINT_MQH__

enum CETrendType
{
   TREND_UNKNOWN = 0,

   TREND_UP,

   TREND_DOWN,

   TREND_RANGE
};

class CETrendPoint
{
public:

   int Index;

   datetime Time;

   CETrendType TrendType;

   CETrendPoint()
   {
      Index = -1;
      Time = 0;
      TrendType = TREND_UNKNOWN;
   }
};

#endif