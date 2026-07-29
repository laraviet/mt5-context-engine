#ifndef __CE_CONTEXT_SUMMARY_ANALYZER_MQH__
#define __CE_CONTEXT_SUMMARY_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CEContextSummaryAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Context Summary Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SUMMARY;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SUMMARY;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.Summary.Reset();

      context.Summary.Statistics.SwingCount =
         context.SwingSeries.Count();

      context.Summary.Statistics.StructureCount =
         context.StructureSeries.Count();

      context.Summary.Statistics.TrendCount =
         context.TrendSeries.Count();

      if(context.TrendSeries.Count() > 0)
      {
         CETrendPoint trend =
            context.TrendSeries.At(
               context.TrendSeries.Count() - 1);

         context.Summary.Market.Trend =
            trend.TrendType;

         context.Summary.Market.Strength =
            trend.Strength;
            
         switch(trend.TrendType)
         {
            case TREND_UP:
            case TREND_DOWN:
               context.Summary.Market.Phase =
                  MARKET_PHASE_TREND;
               break;
         
            case TREND_RANGE:
               context.Summary.Market.Phase =
                  MARKET_PHASE_RANGE;
               break;
         
            default:
               context.Summary.Market.Phase =
                  MARKET_PHASE_UNKNOWN;
               break;
         }
      }

      context.Summary.Score.Calculate();
      context.Summary.IsValid = true;

      return true;
   }
};

#endif