#ifndef __CE_TREND_STATE_MQH__
#define __CE_TREND_STATE_MQH__

enum CETrendState
{
   TREND_STATE_UNKNOWN = 0,

   TREND_STATE_STARTING,

   TREND_STATE_CONTINUATION,

   TREND_STATE_WEAKENING,

   TREND_STATE_REVERSING
};

inline string TrendStateToString(
   const CETrendState state)
{
   switch(state)
   {
      case TREND_STATE_STARTING:
         return "STARTING";

      case TREND_STATE_CONTINUATION:
         return "CONTINUATION";

      case TREND_STATE_WEAKENING:
         return "WEAKENING";

      case TREND_STATE_REVERSING:
         return "REVERSING";

      default:
         return "UNKNOWN";
   }
}

#endif