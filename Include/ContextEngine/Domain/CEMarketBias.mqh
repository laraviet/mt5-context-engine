#ifndef __CE_MARKET_BIAS_MQH__
#define __CE_MARKET_BIAS_MQH__

enum CEMarketBiasType
{
   MARKET_BIAS_UNKNOWN = 0,

   MARKET_BIAS_BULLISH,

   MARKET_BIAS_BEARISH,

   MARKET_BIAS_NEUTRAL
};

class CEMarketBias
{
public:

   CEMarketBiasType Type;

public:

   void Reset()
   {
      Type = MARKET_BIAS_UNKNOWN;
   }

   string ToString() const
   {
      switch(Type)
      {
         case MARKET_BIAS_BULLISH:
            return "Bullish";

         case MARKET_BIAS_BEARISH:
            return "Bearish";

         case MARKET_BIAS_NEUTRAL:
            return "Neutral";

         default:
            return "Unknown";
      }
   }
};

#endif