#ifndef __CE_ORDER_BLOCK_SUMMARY_ANALYZER_MQH__
#define __CE_ORDER_BLOCK_SUMMARY_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CEOrderBlockSummaryAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Order Block Summary Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_ORDER_BLOCK_SUMMARY;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_ORDER_BLOCK_SUMMARY;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      CEOrderBlockSummary summary =
         context.Summary.OrderBlock;

      summary.Reset();

      for(int i = 0;
          i < context.OrderBlockSeries.Count();
          i++)
      {
         CEOrderBlockPoint point =
            context.OrderBlockSeries.At(i);

         summary.Total++;

         if(point.IsBullish())
         {
            summary.Bullish++;

            if(point.IsActive())
               summary.ActiveBullish++;
            else
               summary.FilledBullish++;
         }

         if(point.IsBearish())
         {
            summary.Bearish++;

            if(point.IsActive())
               summary.ActiveBearish++;
            else
               summary.FilledBearish++;
         }
      }

      if(summary.Total > 0)
      {
         summary.FillRatio =
            (double)summary.Filled() /
            (double)summary.Total;
      }
      
      context.Summary.OrderBlock = summary;

      return true;
   }
};

#endif