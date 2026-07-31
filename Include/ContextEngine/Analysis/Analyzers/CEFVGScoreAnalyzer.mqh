#ifndef __CE_FVG_SCORE_ANALYZER_MQH__
#define __CE_FVG_SCORE_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CEFVGScoreAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "FVG Score Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE - 80;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      CEContextScore score =
         context.Summary.Score;

      CEFVGSummary summary =
         context.Summary.FVG;

      //------------------------------------------------
      // Active FVG
      //------------------------------------------------

      score.Structure +=
         summary.ActiveBullish * 5;

      score.Structure +=
         summary.ActiveBearish * 5;

      //------------------------------------------------
      // Filled FVG
      //------------------------------------------------

      score.Structure +=
         summary.FilledBullish * 2;

      score.Structure +=
         summary.FilledBearish * 2;

      //------------------------------------------------
      // Clamp
      //------------------------------------------------

      if(score.Structure > 30)
         score.Structure = 30;

      context.Summary.Score = score;

      Print("===== FVG Score =====");
      Print("Bullish Active : ", summary.ActiveBullish);
      Print("Bearish Active : ", summary.ActiveBearish);
      Print("Bullish Filled : ", summary.FilledBullish);
      Print("Bearish Filled : ", summary.FilledBearish);
      Print("Structure Score: ", score.Structure);

      return true;
   }
};

#endif