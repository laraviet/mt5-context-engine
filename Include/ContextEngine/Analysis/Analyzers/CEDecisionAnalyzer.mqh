#ifndef __CE_DECISION_ANALYZER_MQH__
#define __CE_DECISION_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Constants.mqh"

class CEDecisionAnalyzer :
   public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Decision Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE_FINAL + 10;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.Decision.Reset();
      
      context.Decision.Type = DECISION_NONE;

      int score =
         context.Summary.Score.Total;

      CETrendType trend =
         context.Summary.Market.Trend;

      if(score >= 80)
      {
         if(trend == TREND_UP)
         {
            context.Decision.Type =
               DECISION_BUY;

            context.Decision.Confidence =
               score;

            context.Decision.Reason =
               "Trend Up + High Score";

            return true;
         }

         if(trend == TREND_DOWN)
         {
            context.Decision.Type =
               DECISION_SELL;

            context.Decision.Confidence =
               score;

            context.Decision.Reason =
               "Trend Down + High Score";

            return true;
         }
      }

      context.Decision.Type =
         DECISION_WAIT;

      context.Decision.Confidence =
         score;

      context.Decision.Reason =
         "No confirmation";

      return true;
   }
};

#endif