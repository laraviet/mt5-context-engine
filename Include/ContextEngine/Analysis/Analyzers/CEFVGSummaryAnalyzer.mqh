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
      CEFVGSummary summary;

      summary.Reset();

      double totalGap = 0.0;

      for(int i = 0;
          i < context.FVGSeries.Count();
          i++)
      {
         CEFVGPoint point =
            context.FVGSeries.At(i);

         summary.Total++;

         //------------------------------------------------
         // Direction
         //------------------------------------------------

         if(point.IsBullish())
            summary.Bullish++;

         if(point.IsBearish())
            summary.Bearish++;

         //------------------------------------------------
         // Filled / Active
         //------------------------------------------------

         if(point.Filled)
         {
            if(point.IsBullish())
               summary.FilledBullish++;

            if(point.IsBearish())
               summary.FilledBearish++;
         }
         else
         {
            if(point.IsBullish())
               summary.ActiveBullish++;

            if(point.IsBearish())
               summary.ActiveBearish++;
         }

         //------------------------------------------------
         // Gap statistics
         //------------------------------------------------

         totalGap += point.Gap;

         if(point.Gap > summary.LargestGap)
            summary.LargestGap = point.Gap;
      }

      //------------------------------------------------
      // Statistics
      //------------------------------------------------

      if(summary.Total > 0)
      {
         summary.AverageGap =
            totalGap / summary.Total;

         summary.FillRatio =
            (double)summary.Filled() /
            summary.Total;
      }

      context.Summary.FVG =
         summary;

      //------------------------------------------------
      // Debug
      //------------------------------------------------

      Print("===== FVG Summary =====");

      Print("Total            = ", summary.Total);
      Print("Bullish          = ", summary.Bullish);
      Print("Bearish          = ", summary.Bearish);

      Print("Bullish Active   = ", summary.ActiveBullish);
      Print("Bearish Active   = ", summary.ActiveBearish);

      Print("Bullish Filled   = ", summary.FilledBullish);
      Print("Bearish Filled   = ", summary.FilledBearish);

      Print("Largest Gap      = ", summary.LargestGap);
      Print("Average Gap      = ", summary.AverageGap);

      Print("Fill Ratio       = ",
            DoubleToString(summary.FillRatio * 100.0,1),
            "%");

      return true;
   }
};

#endif