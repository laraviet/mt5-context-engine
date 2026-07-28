#ifndef __CE_SWING_DETECTOR_MQH__
#define __CE_SWING_DETECTOR_MQH__

#include "../../Domain/CEPriceSeries.mqh"
#include "../../Domain/CESwingSeries.mqh"
#include "../Interfaces/ISwingDetector.mqh"
#include "../../Config/CESwingConfig.mqh"

class CESwingDetector : public ISwingDetector
{
private:

   CESwingConfig m_config;

public:

   CESwingDetector(const CESwingConfig &config)
   {
      m_config = config;
   }

   int Detect(
      const CEPriceSeries &series,
      CESwingSeries &swings)
   {
      swings.Clear();

      for(int i = 0; i < series.Count(); i++)
      {
         const CECandle candle = series.At(i);

         if(IsSwingHigh(series, i))
         {
            CESwingPoint point;

            point.Index = i;
            point.Time  = candle.Time;
            point.Price = candle.High;
            point.Type  = SWING_HIGH;

            swings.Add(point);
         }

         if(IsSwingLow(series, i))
         {
            CESwingPoint point;

            point.Index = i;
            point.Time  = candle.Time;
            point.Price = candle.Low;
            point.Type  = SWING_LOW;

            swings.Add(point);
         }
      }

      return swings.Count();
   }

private:

   bool IsValidIndex(
      const CEPriceSeries &series,
      const int index) const
   {
      return index >= m_config.Strength &&
             index < series.Count() - m_config.Strength;
   }

   bool IsSwingHigh(
      const CEPriceSeries &series,
      const int index) const
   {
      if(!IsValidIndex(series,index))
         return false;

      const CECandle current = series.At(index);

      for(int i=1;i<=m_config.Strength;i++)
      {
         if(series.At(index-i).High >= current.High)
            return false;

         if(series.At(index+i).High >= current.High)
            return false;
      }

      return true;
   }

   bool IsSwingLow(
      const CEPriceSeries &series,
      const int index) const
   {
      if(!IsValidIndex(series,index))
         return false;

      const CECandle current = series.At(index);

      for(int i=1;i<=m_config.Strength;i++)
      {
         if(series.At(index-i).Low <= current.Low)
            return false;

         if(series.At(index+i).Low <= current.Low)
            return false;
      }

      return true;
   }

};

#endif