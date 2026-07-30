#ifndef __CE_LIQUIDITY_SCORE_ANALYZER_MQH__
#define __CE_LIQUIDITY_SCORE_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CELiquidityScoreAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Liquidity Score Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE - 90;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      CEContextScore score =
         context.Summary.Score;

      score.Liquidity = 0;

      const CELiquiditySummary summary =
         context.Summary.Liquidity;

      if(summary.Total <= 0)
         return true;

      // còn liquidity chưa sweep
      if(summary.Untouched > 0)
         score.Liquidity += 10;

      // cả BuySide và SellSide đều tồn tại
      if(summary.BuySide > 0 &&
         summary.SellSide > 0)
      {
         score.Liquidity += 5;
      }
   
      return true;
   }
};

#endif