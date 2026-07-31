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
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      CEOrderBlockSummary summary =
         context.Summary.OrderBlock;

      CEContextScore score =
         context.Summary.Score;

      if(summary.ActiveBullish > 0)
         score.Structure += 10;

      if(summary.ActiveBearish > 0)
         score.Structure += 10;

      if(summary.FillRatio > 0.50)
         score.Structure += 5;

      context.Summary.Score = score;

      Print(
         "Order Block Score = ",
         score.Structure);

      return true;
   }
};

#endif