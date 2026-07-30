#ifndef __CE_CONTEXT_SCORE_MQH__
#define __CE_CONTEXT_SCORE_MQH__

class CEContextScore
{
public:

   int Trend;

   int Structure;

   int Liquidity;

   int Momentum;

   int Volatility;

   int Total;

public:

   CEContextScore()
   {
      Reset();
   }

   void Reset()
   {
      Trend      = 0;

      Structure  = 0;

      Liquidity  = 0;

      Momentum   = 0;

      Volatility = 0;

      Total      = 0;
   }
   
};

#endif