#ifndef __CE_DECISION_TYPE_HELPER_MQH__
#define __CE_DECISION_TYPE_HELPER_MQH__

#include "CEDecisionType.mqh"

class CEDecisionTypeHelper
{
public:

   static string ToString(
      const CEDecisionType type)
   {
      switch(type)
      {
         case DECISION_BUY:

            return "BUY";

         case DECISION_SELL:

            return "SELL";

         case DECISION_WAIT:

            return "WAIT";

         case DECISION_NONE:

            return "UNKNOWN";
      }

      return "UNKNOWN";
   }

   static bool IsTrade(
      const CEDecisionType type)
   {
      return
         type == DECISION_BUY ||
         type == DECISION_SELL;
   }

   static bool IsWaiting(
      const CEDecisionType type)
   {
      return
         type == DECISION_WAIT;
   }

   static bool IsUnknown(
      const CEDecisionType type)
   {
      return
         type == DECISION_NONE;
   }
};

#endif