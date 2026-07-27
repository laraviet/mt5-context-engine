#ifndef __CE_SWING_DETECTOR_MQH__
#define __CE_SWING_DETECTOR_MQH__

#include <ContextEngine/Domain/CEPriceSeries.mqh>
#include <ContextEngine/Domain/CESwingPoint.mqh>
#include <ContextEngine/Domain/CESwingSeries.mqh>

class CESwingDetector
{
private:

   int m_strength;
   
   bool IsValidIndex(
      const CEPriceSeries &series,
      const int index) const
   {
      return index >= m_strength &&
             index < series.Count() - m_strength;
   }

public:

   CESwingDetector()
   {
      m_strength = 2;
   }

   void SetStrength(const int value)
   {
      m_strength = value;
   }

   int Strength() const
   {
      return m_strength;
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
   
};

#endif