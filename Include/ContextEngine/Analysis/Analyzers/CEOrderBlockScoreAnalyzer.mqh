#ifndef __CE_ORDER_BLOCK_SCORE_ANALYZER_MQH__
#define __CE_ORDER_BLOCK_SCORE_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CEOrderBlockScoreAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Order Block Score Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_ORDER_BLOCK_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_ORDER_BLOCK_SCORE;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      int bullishActive = 0;
      int bearishActive = 0;

      for(int i = 0; i < context.OrderBlockSeries.Count(); i++)
      {
         CEOrderBlockPoint point =
            context.OrderBlockSeries.At(i);

         if(point.Mitigated)
            continue;

         if(point.Type == ORDER_BLOCK_BULLISH)
            bullishActive++;

         if(point.Type == ORDER_BLOCK_BEARISH)
            bearishActive++;
      }

      int score = 0;

      if(bullishActive >= 2)
         score += 10;

      if(bearishActive >= 2)
         score -= 10;

      context.Summary.Score.Liquidity = score;

      return true;
   }
};

#endif