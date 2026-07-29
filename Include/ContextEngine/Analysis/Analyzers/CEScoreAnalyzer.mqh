#ifndef __CE_SCORE_ANALYZER_MQH__
#define __CE_SCORE_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CEScoreAnalyzer : public ICEAnalyzer
{
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
      return CE_PRIORITY_SCORE;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.Summary.Score.Reset();

      CalculateTrendScore(context);

      CalculateStructureScore(context);

      CalculateStatisticsScore(context);

      context.Summary.Score.Calculate();

      return true;
   }

private:

   const CEEngineConfig *m_config;

   void CalculateTrendScore(
      CEAnalysisContext &context)
   {
      switch(context.Summary.Market.Strength)
      {
         case TREND_STRENGTH_STRONG:
            context.Summary.Score.Trend = m_config.ScoreProfile.Trend.Strong;
            break;

         case TREND_STRENGTH_NORMAL:
            context.Summary.Score.Trend = m_config.ScoreProfile.Trend.Normal;
            break;

         case TREND_STRENGTH_WEAK:
            context.Summary.Score.Trend = m_config.ScoreProfile.Trend.Weak;
            break;

         default:
            context.Summary.Score.Trend = 0;
            break;
      }
   }

   void CalculateStructureScore(
      CEAnalysisContext &context)
   {
      int count =
         context.Summary.Statistics.StructureCount;

      if(count >= 20)
         context.Summary.Score.Structure = m_config.ScoreProfile.Structure.Strong;

      else if(count >= 10)
         context.Summary.Score.Structure = m_config.ScoreProfile.Structure.Normal;

      else
         context.Summary.Score.Structure = m_config.ScoreProfile.Structure.Weak;
   }

   void CalculateStatisticsScore(
      CEAnalysisContext &context)
   {
      int count =
         context.Summary.Statistics.SwingCount;

      if(count >= 20)
         context.Summary.Score.Momentum = m_config.ScoreProfile.Momentum.Strong;

      else if(count >= 10)
         context.Summary.Score.Momentum = m_config.ScoreProfile.Momentum.Normal;

      else
         context.Summary.Score.Momentum = m_config.ScoreProfile.Momentum.Weak;
   }
};

#endif