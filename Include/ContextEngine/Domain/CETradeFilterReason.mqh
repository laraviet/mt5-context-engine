#ifndef __CE_TRADE_FILTER_REASON_MQH__
#define __CE_TRADE_FILTER_REASON_MQH__

enum CETradeFilterReason
{
   FILTER_REASON_NONE = 0,

   FILTER_REASON_LOW_QUALITY,

   FILTER_REASON_LOW_RR,

   FILTER_REASON_WEAK_BIAS,

   FILTER_REASON_INVALID_ENTRY
};

class CETradeFilterReasonHelper
{
public:

   static string ToString(
      const CETradeFilterReason reason)
   {
      switch(reason)
      {
         case FILTER_REASON_LOW_QUALITY:
            return "Low Quality";

         case FILTER_REASON_LOW_RR:
            return "Low RR";

         case FILTER_REASON_WEAK_BIAS:
            return "Weak Bias";

         case FILTER_REASON_INVALID_ENTRY:
            return "Invalid Entry";

         default:
            return "None";
      }
   }
};

#endif