#ifndef __CE_TREND_SCORE_ANALYZER_MQH__
#define __CE_TREND_SCORE_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CETrendScoreAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Trend Score Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE - 100;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.Summary.Score.Trend = 0;

      switch(context.Summary.Market.Trend)
      {
         case TREND_UP:
         case TREND_DOWN:

            context.Summary.Score.Trend += 20;
            break;

         default:

            break;
      }

      switch(context.Summary.Market.Strength)
      {
         case TREND_STRENGTH_WEAK:

            context.Summary.Score.Trend += 5;
            break;

         case TREND_STRENGTH_NORMAL:

            context.Summary.Score.Trend += 10;
            break;

         case TREND_STRENGTH_STRONG:

            context.Summary.Score.Trend += 15;
            break;

         default:

            break;
      }     
      
      return true;
   }
};

#endif