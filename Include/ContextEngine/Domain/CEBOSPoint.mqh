#ifndef __CE_BOS_POINT_MQH__
#define __CE_BOS_POINT_MQH__

enum CEBOSType
{
   BOS_NONE = 0,
   BOS_UP,
   BOS_DOWN
};

struct CEBOSPoint
{
   int Index;
   double Price;
   CEBOSType Type;
};

#endif