#ifndef __CE_LIQUIDITY_SERIES_MQH__
#define __CE_LIQUIDITY_SERIES_MQH__

#include "CELiquidityPoint.mqh"

class CELiquiditySeries
{
private:

   CELiquidityPoint m_items[];

public:

   CELiquiditySeries()
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

   void Add(const CELiquidityPoint &point)
   {
      int size = ArraySize(m_items);

      ArrayResize(m_items, size + 1);

      m_items[size] = point;
   }

   CELiquidityPoint At(const int index) const
   {
      return m_items[index];
   }
};

#endif