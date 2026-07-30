#ifndef __CE_LIQUIDITY_SUMMARY_ANALYZER_MQH__
#define __CE_LIQUIDITY_SUMMARY_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CELiquiditySummaryAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Liquidity Summary Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_LIQUIDITY_SUMMARY;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_LIQUIDITY_SUMMARY;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      CELiquiditySummary summary =
         context.Summary.Liquidity;

      summary.Reset();

      for(int i = 0;
          i < context.LiquiditySeries.Count();
          i++)
      {
         CELiquidityPoint point =
            context.LiquiditySeries.At(i);

         summary.Total++;

         if(point.IsBuySide())
            summary.BuySide++;

         if(point.IsSellSide())
            summary.SellSide++;

         if(!point.Swept)
            summary.Untouched++;
      }

      context.Summary.Liquidity = summary;
      
      return true;
   }
};

#endif