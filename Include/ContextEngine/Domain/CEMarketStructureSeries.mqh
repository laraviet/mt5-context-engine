#ifndef __CE_MARKET_STRUCTURE_SERIES_MQH__
#define __CE_MARKET_STRUCTURE_SERIES_MQH__

#include "CEMarketStructurePoint.mqh"

class CEMarketStructureSeries
{
private:

   CEMarketStructurePoint m_points[];

public:

   void Clear()
   {
      ArrayResize(m_points, 0);
   }

   int Count() const
   {
      return ArraySize(m_points);
   }

   CEMarketStructurePoint At(const int index) const
   {
      return m_points[index];
   }

   void Add(const CEMarketStructurePoint &point)
   {
      int size = ArraySize(m_points);

      ArrayResize(m_points, size + 1);

      m_points[size] = point;
   }
};

#endif