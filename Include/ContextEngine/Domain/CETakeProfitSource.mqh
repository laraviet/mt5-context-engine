#ifndef __CE_TAKE_PROFIT_SOURCE_MQH__
#define __CE_TAKE_PROFIT_SOURCE_MQH__

enum CETakeProfitSource
{
   TAKE_PROFIT_UNKNOWN = 0,

   TAKE_PROFIT_LIQUIDITY,

   TAKE_PROFIT_FVG,

   TAKE_PROFIT_FIXED_RR
};

class CETakeProfitSourceHelper
{
public:

   static string ToString(
      const CETakeProfitSource source)
   {
      switch(source)
      {
         case TAKE_PROFIT_LIQUIDITY:
            return "Liquidity";

         case TAKE_PROFIT_FVG:
            return "FVG";

         case TAKE_PROFIT_FIXED_RR:
            return "Fixed RR";

         default:
            return "-";
      }
   }
};

#endif