#ifndef __CE_SCORE_CALCULATOR_MQH__
#define __CE_SCORE_CALCULATOR_MQH__

#include "../../Core/CEAnalysisContext.mqh"

class CEScoreCalculator
{
public:

   void Calculate(
      CEAnalysisContext &context)
   {
      context.Summary.Score.Total =
            context.Summary.Score.Trend
         +  context.Summary.Score.Structure
         +  context.Summary.Score.Liquidity
         +  context.Summary.Score.Momentum
         +  context.Summary.Score.Volatility;
   }
};

#endif