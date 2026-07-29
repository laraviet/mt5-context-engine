#ifndef __CE_FVG_FILL_ANALYZER_MQH__
#define __CE_FVG_FILL_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CEFVGFillAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "FVG Fill Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_FVG_FILL;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_FVG_FILL;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      for(int i = 0; i < context.FVGSeries.Count(); i++)
      {
         CEFVGPoint point =
            context.FVGSeries.At(i);

         if(point.Filled)
            continue;

         point.Filled =
            IsFilled(
               point,
               context.CandleSeries);

         context.FVGSeries.Update(
            i,
            point);
      }

      return true;
   }

private:

   bool IsFilled(
      const CEFVGPoint &point,
      const CECandleSeries &candles) const
   {
      double mid =
         (point.UpperPrice +
          point.LowerPrice) * 0.5;
   
      for(int i = point.Index + 1;
          i < candles.Count();
          i++)
      {
         CECandle candle =
            candles.At(i);
   
         if(point.IsBullish())
         {
            if(candle.Low <= mid)
               return true;
         }
         else if(point.IsBearish())
         {
            if(candle.High >= mid)
               return true;
         }
      }
   
      return false;
   }
   
};

#endif