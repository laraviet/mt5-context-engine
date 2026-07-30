#ifndef __CE_ORDER_BLOCK_SERIES_MQH__
#define __CE_ORDER_BLOCK_SERIES_MQH__

#include "CEOrderBlockPoint.mqh"

class CEOrderBlockSeries
{
private:

   CEOrderBlockPoint m_points[];

public:

   void Clear()
   {
      ArrayResize(m_points,0);
   }

   int Count() const
   {
      return ArraySize(m_points);
   }

   void Add(
      const CEOrderBlockPoint &point)
   {
      int index = Count();

      ArrayResize(
         m_points,
         index + 1);

      m_points[index] = point;
   }

   CEOrderBlockPoint At(
      const int index) const
   {
      return m_points[index];
   }
};

#endif