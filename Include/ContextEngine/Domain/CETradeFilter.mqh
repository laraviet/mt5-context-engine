#ifndef __CE_TRADE_FILTER_MQH__
#define __CE_TRADE_FILTER_MQH__

#include "CETradeFilterReason.mqh"

class CETradeFilter
{
public:

   bool Allowed;

   CETradeFilterReason Reason;

public:

   CETradeFilter()
   {
      Reset();
   }

   void Reset()
   {
      Allowed = false;

      Reason = FILTER_REASON_NONE;
   }

   bool IsAllowed() const
   {
      return Allowed;
   }
};

#endif