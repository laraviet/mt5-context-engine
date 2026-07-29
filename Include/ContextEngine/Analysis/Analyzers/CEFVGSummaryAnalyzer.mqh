#ifndef __CE_FVG_SUMMARY_ANALYZER_MQH__
#define __CE_FVG_SUMMARY_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CEFVGSummaryAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "FVG Summary Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_FVG_SUMMARY;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_FVG_SUMMARY;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {

      context.Summary.FVG.Reset();

      double totalGap = 0.0;

      for(int i = 0; i < context.FVGSeries.Count(); i++)
      {
         CEFVGPoint point =
            context.FVGSeries.At(i);

         context.Summary.FVG.Total++;

         totalGap += point.Gap;

         if(point.Gap >
            context.Summary.FVG.LargestGap)
         {
            context.Summary.FVG.LargestGap =
               point.Gap;
         }

         if(point.Filled)
            context.Summary.FVG.Filled++;
         else
            context.Summary.FVG.Active++;
      }

      if(context.Summary.FVG.Total > 0)
      {
         context.Summary.FVG.AverageGap =
            totalGap /
            context.Summary.FVG.Total;

         context.Summary.FVG.FillRatio =
            (double)context.Summary.FVG.Filled /
            context.Summary.FVG.Total;
      }

      return true;
   }
};

#endif