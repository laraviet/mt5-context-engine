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
   int index;
   datetime time;
   double price;
   CESwingType type;

   CESwingPoint()
   {
      index = -1;
      time = 0;
      price = 0.0;
      type = SWING_NONE;
   }
};

#endif