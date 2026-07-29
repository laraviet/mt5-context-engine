#ifndef __CE_CHOCH_SERIES_MQH__
#define __CE_CHOCH_SERIES_MQH__

#include "CEChochPoint.mqh"

class CEChochSeries
{
private:

   CEChochPoint m_items[];

public:

   CEChochSeries()
   {
      ArrayResize(m_items,0);
   }

   void Clear()
   {
      ArrayResize(m_items,0);
   }

   int Count() const
   {
      return ArraySize(m_items);
   }

   void Add(
      const CEChochPoint &point)
   {
      int size = ArraySize(m_items);

      ArrayResize(m_items,size+1);

      m_items[size]=point;
   }

   CEChochPoint At(
      const int index) const
   {
      return m_items[index];
   }
};

#endif