#ifndef __CE_SWING_DETECTOR_MQH__
#define __CE_SWING_DETECTOR_MQH__

#include <ContextEngine/Domain/CEPriceSeries.mqh>
#include <ContextEngine/Analysis/CESwingPoint.mqh>

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
   
};

#endif