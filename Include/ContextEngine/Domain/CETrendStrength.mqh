#ifndef __CE_TREND_STRENGTH_MQH__
#define __CE_TREND_STRENGTH_MQH__

enum CETrendStrength
{
   TREND_STRENGTH_UNKNOWN = 0,

   TREND_STRENGTH_WEAK,

   TREND_STRENGTH_NORMAL,

   TREND_STRENGTH_STRONG
};

inline string TrendStrengthToString(
   const CETrendStrength strength)
{
   switch(strength)
   {
      case TREND_STRENGTH_WEAK:
         return "WEAK";

      case TREND_STRENGTH_NORMAL:
         return "NORMAL";

      case TREND_STRENGTH_STRONG:
         return "STRONG";

      default:
         return "UNKNOWN";
   }
}

#endif