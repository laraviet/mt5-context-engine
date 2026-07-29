#ifndef __CE_SCORE_PROFILE_MQH__
#define __CE_SCORE_PROFILE_MQH__

#include "CEScoreRule.mqh"

class CEScoreProfile
{
public:

   CEScoreRule Trend;

   CEScoreRule Structure;

   CEScoreRule Momentum;

   CEScoreRule Liquidity;

   CEScoreRule Volatility;

public:

   CEScoreProfile()
   {
      Reset();
   }

   void Reset()
   {
      Trend.Reset();

      Structure.Reset();

      Momentum.Reset();

      Liquidity.Reset();

      Volatility.Reset();
   }
};

#endif