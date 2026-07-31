#ifndef __CE_CONTEXT_SUMMARY_ANALYZER_MQH__
#define __CE_CONTEXT_SUMMARY_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"
#include "../../Domain/CEMarketPhase.mqh"

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
                     
      }

      return true;
   }
};

#endif