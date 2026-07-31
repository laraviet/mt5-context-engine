#ifndef __CE_SCORE_ANALYZER_MQH__
#define __CE_SCORE_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"
#include "../Scoring/CEScoreCalculator.mqh"

class CEScoreAnalyzer : public ICEAnalyzer
{
private:

   CEScoreCalculator m_calculator;
   
public:

   virtual string Name() const override
   {
      return "Score Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE_FINAL;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      m_calculator.Calculate(context);

      Print("========== Context Score ==========");
      Print("Trend      : ", context.Summary.Score.Trend);
      Print("Structure  : ", context.Summary.Score.Structure);
      Print("Liquidity  : ", context.Summary.Score.Liquidity);
      Print("Momentum   : ", context.Summary.Score.Momentum);
      Print("Volatility : ", context.Summary.Score.Volatility);
      Print("-----------------------------------");
      Print("TOTAL      : ", context.Summary.Score.Total);

      return true;
   }
};

#endif