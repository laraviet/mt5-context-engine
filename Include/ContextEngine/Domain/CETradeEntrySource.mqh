#ifndef __CE_TRADE_ENTRY_SOURCE_MQH__
#define __CE_TRADE_ENTRY_SOURCE_MQH__

enum CETradeEntrySource
{
   ENTRY_SOURCE_UNKNOWN = 0,

   ENTRY_SOURCE_ORDER_BLOCK,

   ENTRY_SOURCE_FVG,

   ENTRY_SOURCE_LIQUIDITY
};

class CETradeEntrySourceHelper
{
public:

   static string ToString(
      const CETradeEntrySource source)
   {
      switch(source)
      {
         case ENTRY_SOURCE_ORDER_BLOCK:
            return "Order Block";

         case ENTRY_SOURCE_FVG:
            return "FVG";

         case ENTRY_SOURCE_LIQUIDITY:
            return "Liquidity";

         default:
            return "-";
      }
   }
};

#endif