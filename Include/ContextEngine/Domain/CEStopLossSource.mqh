#ifndef __CE_STOP_LOSS_SOURCE_MQH__
#define __CE_STOP_LOSS_SOURCE_MQH__

enum CEStopLossSource
{
   STOP_LOSS_UNKNOWN = 0,

   STOP_LOSS_SWING,

   STOP_LOSS_ORDER_BLOCK,

   STOP_LOSS_FVG
};

class CEStopLossSourceHelper
{
public:

   static string ToString(
      const CEStopLossSource source)
   {
      switch(source)
      {
         case STOP_LOSS_SWING:
            return "Swing";

         case STOP_LOSS_ORDER_BLOCK:
            return "Order Block";

         case STOP_LOSS_FVG:
            return "FVG";

         default:
            return "-";
      }
   }
};

#endif