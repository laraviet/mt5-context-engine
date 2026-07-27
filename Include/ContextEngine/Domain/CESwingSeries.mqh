#ifndef __CE_SWING_SERIES_MQH__
#define __CE_SWING_SERIES_MQH__

#include "CESwingPoint.mqh"

class CESwingSeries
{
private:

   CESwingPoint m_swings[];

public:

   void Clear()
   {
      ArrayResize(m_swings, 0);
   }

   int Count() const
   {
      return ArraySize(m_swings);
   }

   CESwingPoint At(const int index) const
   {
      return m_swings[index];
   }

   void Add(const CESwingPoint &point)
   {
      int size = ArraySize(m_swings);

      ArrayResize(m_swings, size + 1);

      m_swings[size] = point;
   }
};

#endif