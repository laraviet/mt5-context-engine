#ifndef __CE_TREND_TYPE_HELPER_MQH__
#define __CE_TREND_TYPE_HELPER_MQH__

#include "CETrendPoint.mqh"

class CETrendTypeHelper
{
public:

   static string ToString(
      const CETrendType type)
   {
      switch(type)
      {
         case TREND_UP:
            return "Up";

         case TREND_DOWN:
            return "Down";

         case TREND_RANGE:
            return "Range";

         default:
            return "Unknown";
      }
   }
};

#endif