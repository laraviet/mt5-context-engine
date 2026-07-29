#ifndef __CE_SCORE_PROFILES_MQH__
#define __CE_SCORE_PROFILES_MQH__

#include "CEScoreProfile.mqh"
#include "CEScoreWeights.mqh"

class CEScoreProfiles
{
public:

   static CEScoreProfile Default()
   {
      CEScoreProfile profile;

      profile.Trend.Set(
         SCORE_TREND_STRONG,
         SCORE_TREND_NORMAL,
         SCORE_TREND_WEAK);
      
      profile.Structure.Set(
         SCORE_STRUCTURE_STRONG,
         SCORE_STRUCTURE_NORMAL,
         SCORE_STRUCTURE_WEAK);
      
      profile.Momentum.Set(
         SCORE_MOMENTUM_STRONG,
         SCORE_MOMENTUM_NORMAL,
         SCORE_MOMENTUM_WEAK);
      
      profile.Liquidity.Set(
         SCORE_LIQUIDITY_STRONG,
         SCORE_LIQUIDITY_NORMAL,
         SCORE_LIQUIDITY_WEAK);
      
      profile.Volatility.Set(
         SCORE_VOLATILITY_STRONG,
         SCORE_VOLATILITY_NORMAL,
         SCORE_VOLATILITY_WEAK);

      return profile;
   }
};

#endif