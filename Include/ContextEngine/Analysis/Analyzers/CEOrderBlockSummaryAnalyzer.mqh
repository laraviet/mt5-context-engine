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
      context.Summary.OrderBlock.Reset();

      for(int i=0;i<context.OrderBlockSeries.Count();i++)
      {
         CEOrderBlockPoint point =
            context.OrderBlockSeries.At(i);

         context.Summary.OrderBlock.Total++;

         if(point.Type==ORDER_BLOCK_BULLISH)
            context.Summary.OrderBlock.Bullish++;

         if(point.Type==ORDER_BLOCK_BEARISH)
            context.Summary.OrderBlock.Bearish++;

         if(point.Mitigated)
            context.Summary.OrderBlock.Mitigated++;
         else
            context.Summary.OrderBlock.Active++;
      }

      return true;
   }
};

#endif