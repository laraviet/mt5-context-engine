#ifndef __CE_TREND_SERIES_MQH__
#define __CE_TREND_SERIES_MQH__

#include "CETrendPoint.mqh"

class CETrendSeries
{
private:

   CETrendPoint m_points[];

public:

   // Constructor
   CETrendSeries()
   {
      Clear();
   }

   // Remove all points
   void Clear()
   {
      ArrayResize(m_points, 0);
   }

   // Number of points
   int Count() const
   {
      return ArraySize(m_points);
   }

   // Get point by index
   CETrendPoint At(const int index) const
   {
      return m_points[index];
   }

   // Add new point
   void Add(const CETrendPoint &point)
   {
      int size = ArraySize(m_points);

      ArrayResize(m_points, size + 1);

      m_points[size] = point;
   }
   
   bool IsEmpty() const
   {
      return Count() == 0;
   }
   
   CETrendPoint Last() const
   {
      return m_points[Count() - 1];
   }
   
};

#endif