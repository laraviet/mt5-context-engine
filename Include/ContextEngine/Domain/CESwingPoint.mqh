#ifndef __CE_SWING_POINT_MQH__
#define __CE_SWING_POINT_MQH__

enum CESwingType
{
   SWING_NONE = 0,
   SWING_HIGH,
   SWING_LOW
};

struct CESwingPoint
{
   int Index;
   datetime Time;
   double Price;
   CESwingType Type;

   CESwingPoint()
   {
      Index = -1;
      Time = 0;
      Price = 0.0;
      Type = SWING_NONE;
   }
};

#endif