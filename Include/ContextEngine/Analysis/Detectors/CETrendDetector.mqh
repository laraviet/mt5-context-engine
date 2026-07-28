#ifndef __CE_TREND_DETECTOR_MQH__
#define __CE_TREND_DETECTOR_MQH__

#include "../../Domain/CEMarketStructureSeries.mqh"
#include "../../Domain/CETrendSeries.mqh"
#include "../Interfaces/ITrendDetector.mqh"
#include "../../Domain/CETrendStrength.mqh"
#include "../../Config/CETrendConfig.mqh"

class CETrendDetector : public ITrendDetector
{
public:

   CETrendDetector()
   {
   }
   
   CETrendDetector(const CETrendConfig &config)
   {
      m_config = config;
   }

   int Detect(
      const CEMarketStructureSeries &structures,
      CETrendSeries &trends)
   {
      trends.Clear();
   
      for(int i = 0; i < structures.Count(); i++)
      {
         CEMarketStructurePoint structure = structures.At(i);
   
         CETrendPoint point;
   
         point.Index = structure.Index;
         point.Time  = structure.Time;
         point.TrendType =
            DetectTrend(
               structures,
               i);
         
         point.Strength =
            DetectStrength(
               structures,
               i,
               point.TrendType);
   
         trends.Add(point);
      }
   
      return trends.Count();
   }

private:

   CETrendConfig m_config;
   
   CETrendType DetectTrend(
      const CEMarketStructureSeries &structures,
      const int index) const
   {
      CEMarketStructurePoint current = structures.At(index);
   
      if(current.StructureType == STRUCTURE_HH)
      {
         for(int i = index - 1; i >= 0; i--)
         {
            CEMarketStructurePoint previous = structures.At(i);
   
            if(previous.StructureType == STRUCTURE_HL)
               return TREND_UP;
         }
      }
   
      if(current.StructureType == STRUCTURE_LL)
      {
         for(int i = index - 1; i >= 0; i--)
         {
            CEMarketStructurePoint previous = structures.At(i);
   
            if(previous.StructureType == STRUCTURE_LH)
               return TREND_DOWN;
         }
      }
   
      return TREND_UNKNOWN;
   }
   
   CETrendStrength DetectStrength(
      const CEMarketStructureSeries &structures,
      const int index,
      const CETrendType trend) const
   {
      switch(trend)
      {
         case TREND_UP:
            return DetectBullStrength(
               structures,
               index);
   
         case TREND_DOWN:
            return DetectBearStrength(
               structures,
               index);
   
         default:
            return TREND_STRENGTH_UNKNOWN;
      }
   }
   
   CETrendStrength DetectBullStrength(
      const CEMarketStructureSeries &structures,
      const int index) const
   {
      int count = 0;
   
      for(int i = index; i >= 0; i--)
      {
         CEStructureType type =
            structures.At(i).StructureType;
   
         if(type == STRUCTURE_HH ||
            type == STRUCTURE_HL)
         {
            count++;
         }
         else
         {
            break;
         }
      }
   
      if(count >= m_config.StrongThreshold)
         return TREND_STRENGTH_STRONG;
   
      if(count >= m_config.NormalThreshold)
         return TREND_STRENGTH_NORMAL;
   
      if(count >= m_config.WeakThreshold)
         return TREND_STRENGTH_WEAK;
   
      return TREND_STRENGTH_UNKNOWN;
   }
   
   CETrendStrength DetectBearStrength(
      const CEMarketStructureSeries &structures,
      const int index) const
   {
      int count = 0;
   
      for(int i = index; i >= 0; i--)
      {
         CEStructureType type =
            structures.At(i).StructureType;
   
         if(type == STRUCTURE_LL ||
            type == STRUCTURE_LH)
         {
            count++;
         }
         else
         {
            break;
         }
      }
   
      if(count >= m_config.StrongThreshold)
         return TREND_STRENGTH_STRONG;
   
      if(count >= m_config.NormalThreshold)
         return TREND_STRENGTH_NORMAL;
   
      if(count >= m_config.WeakThreshold)
         return TREND_STRENGTH_WEAK;
   
      return TREND_STRENGTH_UNKNOWN;
   }
   
   
};

#endif