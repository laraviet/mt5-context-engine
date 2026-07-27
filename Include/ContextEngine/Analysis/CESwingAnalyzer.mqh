#ifndef __CE_SWING_ANALYZER_MQH__
#define __CE_SWING_ANALYZER_MQH__

#include "../Core/ICEAnalyzer.mqh"
#include "../Core/CEAnalysisContext.mqh"

#include <ContextEngine/Domain/CEPriceSeries.mqh>
#include <ContextEngine/Domain/CESwingPoint.mqh>
#include <ContextEngine/Domain/CESwingSeries.mqh>

class CESwingAnalyzer : public ICEAnalyzer
{
public:

   string Name() const override
   {
      return "Swing Analyzer";
   }

   int Priority() const override
   {
      return 100;
   }

   bool CESwingAnalyzer::Analyze(
      CEAnalysisContext &context) override
   {
      context.SwingSeries.Clear();
   
      for(int i = 0; i < context.PriceSeries.Count(); i++)
      {
         CECandle candle = context.PriceSeries.At(i);
   
         if(IsSwingHigh(context.PriceSeries, i))
         {
            CESwingPoint point;
   
            point.Index = i;
            point.Time  = candle.Time;
            point.Price = candle.High;
            point.Type  = SWING_HIGH;
   
            context.SwingSeries.Add(point);
         }
   
         if(IsSwingLow(context.PriceSeries, i))
         {
            CESwingPoint point;
   
            point.Index = i;
            point.Time  = candle.Time;
            point.Price = candle.Low;
            point.Type  = SWING_LOW;
   
            context.SwingSeries.Add(point);
         }
      }
   
      return true;
   }
   
   int Detect(
   const CEPriceSeries &series,
   CESwingSeries &swings)
   {
      swings.Clear();
   
      for(int i = 0; i < series.Count(); i++)
      {
         if(IsSwingHigh(series, i))
         {
            CESwingPoint point;
   
            point.Index = i;
            point.Time  = series.At(i).Time;
            point.Price = series.At(i).High;
            point.Type  = SWING_HIGH;

            swings.Add(point);
         }
   
         if(IsSwingLow(series, i))
         {
            CESwingPoint point;
   
            point.Index = i;
            point.Time  = series.At(i).Time;
            point.Price = series.At(i).Low;
            point.Type  = SWING_LOW;
   
            swings.Add(point);
         }
      }
   
      return swings.Count();
   }

private:

   int m_strength;
   
   bool IsValidIndex(
      const CEPriceSeries &series,
      const int index) const
   {
      return index >= m_strength &&
             index < series.Count() - m_strength;
   }

   bool IsSwingHigh(
      const CEPriceSeries &series,
      const int index) const
   {
      if(!IsValidIndex(series, index))
         return false;
   
      const CECandle current = series.At(index);
   
      for(int i = 1; i <= m_strength; i++)
      {
         if(series.At(index - i).High >= current.High)
            return false;
   
         if(series.At(index + i).High >= current.High)
            return false;
      }
   
      return true;
   }

   bool IsSwingLow(
      const CEPriceSeries &series,
      const int index) const
   {
      if(!IsValidIndex(series, index))
         return false;
   
      const CECandle current = series.At(index);
   
      for(int i = 1; i <= m_strength; i++)
      {
         if(series.At(index - i).Low <= current.Low)
            return false;
   
         if(series.At(index + i).Low <= current.Low)
            return false;
      }
   
      return true;
   }
   
};

#endif