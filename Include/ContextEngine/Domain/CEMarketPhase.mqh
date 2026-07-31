#ifndef __CE_MARKET_PHASE_MQH__
#define __CE_MARKET_PHASE_MQH__

enum CEMarketPhase
{
   MARKET_PHASE_UNKNOWN = 0,

   MARKET_PHASE_ACCUMULATION,

   MARKET_PHASE_MARKUP,

   MARKET_PHASE_DISTRIBUTION,

   MARKET_PHASE_MARKDOWN
};

class CEMarketPhaseHelper
{
public:

   static string ToString(
      const CEMarketPhase phase)
   {
      switch(phase)
      {
         case MARKET_PHASE_ACCUMULATION:
            return "Accumulation";

         case MARKET_PHASE_MARKUP:
            return "Markup";

         case MARKET_PHASE_DISTRIBUTION:
            return "Distribution";

         case MARKET_PHASE_MARKDOWN:
            return "Markdown";

         default:
            return "Unknown";
      }
   }
};

#endif