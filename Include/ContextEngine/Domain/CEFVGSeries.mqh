#ifndef __CE_FVG_SERIES_MQH__
#define __CE_FVG_SERIES_MQH__

#include "CEFVGPoint.mqh"

class CEFVGSeries
{
private:

   CEFVGPoint m_items[];

public:

   CEFVGSeries()
   {
      ArrayResize(m_items, 0);
   }

   void Clear()
   {
      ArrayResize(m_items, 0);
   }

   int Count() const
   {
      return ArraySize(m_items);
   }

   void Add(const CEFVGPoint &point)
   {
      int size = ArraySize(m_items);

      ArrayResize(m_items, size + 1);

      m_items[size] = point;
   }

   CEFVGPoint At(const int index) const
   {
      return m_items[index];
   }
};

#endif