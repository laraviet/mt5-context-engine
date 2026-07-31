#ifndef __CE_CONTEXT_MARKET_MQH__
#define __CE_CONTEXT_MARKET_MQH__

#include "CETrendPoint.mqh"
#include "CEMarketPhase.mqh"

class CEContextMarket
{
public:

   CETrendType Trend;

   CETrendStrength Strength;

   CEMarketPhase Phase;
   
   int Quality;

public:

   CEContextMarket()
   {
      Reset();
   }

   void Reset()
   {
      Trend = TREND_UNKNOWN;

      Strength = TREND_STRENGTH_UNKNOWN;

      Phase = MARKET_PHASE_UNKNOWN;
      
      Quality = 0;
   }
};

#endif