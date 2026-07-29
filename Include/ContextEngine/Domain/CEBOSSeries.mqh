#ifndef __CE_BOS_SERIES_MQH__
#define __CE_BOS_SERIES_MQH__

#include "CEBOSPoint.mqh"

class CEBOSSeries
{
private:

   CEBOSPoint m_items[];

public:

   CEBOSSeries()
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

   void Add(const CEBOSPoint &point)
   {
      int size=ArraySize(m_items);

      ArrayResize(m_items,size+1);

      m_items[size]=point;
   }

   CEBOSPoint At(const int index) const
   {
      return m_items[index];
   }
};

#endif