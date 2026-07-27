#ifndef __CE_MARKET_STRUCTURE_MQH__
#define __CE_MARKET_STRUCTURE_MQH__

#include "../Domain/CEStructurePoint.mqh"

class CEMarketStructure
{
private:

   CEStructurePoint m_points[];
   double m_lastHigh;
   double m_lastLow;
   bool m_hasLastHigh;
   bool m_hasLastLow;
   
   void Reset()
   {
      ArrayResize(m_points, 0);
   
      m_lastHigh = EMPTY_VALUE;
      m_lastLow  = EMPTY_VALUE;
      m_hasLastHigh = false;
      m_hasLastLow = false;
   }
   
   CEStructureType ClassifyHigh(
      const CESwingPoint &swing)
   {
      if(!m_hasLastHigh)
      {
         m_lastHigh = swing.price;
         return STRUCTURE_UNKNOWN;
      }
   
      CEStructureType type =
         (swing.price > m_lastHigh)
            ? STRUCTURE_HH
            : STRUCTURE_LH;
   
      m_lastHigh = swing.price;
   
      return type;
   }
   
   CEStructureType ClassifyLow(
      const CESwingPoint &swing)
   {
      if(!m_hasLastLow)
      {
         m_lastLow = swing.price;
         return STRUCTURE_UNKNOWN;
      }
   
      CEStructureType type =
         (swing.price > m_lastLow)
            ? STRUCTURE_HL
            : STRUCTURE_LL;
   
      m_lastLow = swing.price;
   
      return type;
   }

public:   

   void Build(const CESwingPoint &swings[])
   {
      Reset();

      int count = ArraySize(swings);
   
      ArrayResize(m_points, count);
   
      for(int i = 0; i < count; i++)
      {
         m_points[i].Swing = swings[i];
   
         if(swings[i].type == SWING_HIGH)
            m_points[i].Type = ClassifyHigh(swings[i]);
         else
            m_points[i].Type = ClassifyLow(swings[i]);
      }
   }

   int Count() const
   {
      return ArraySize(m_points);
   }

   CEStructurePoint At(const int index) const
   {
      return m_points[index];
   }
};

#endif