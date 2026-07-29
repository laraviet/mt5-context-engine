#ifndef __CE_CANDLE_SERIES_MQH__
#define __CE_CANDLE_SERIES_MQH__

#include "CECandle.mqh"

class CECandleSeries
{
private:

   CECandle m_items[];

public:

   CECandleSeries()
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

   bool IsEmpty() const
   {
      return Count()==0;
   }

   void Add(
      const CECandle &candle)
   {
      int size=ArraySize(m_items);

      ArrayResize(m_items,size+1);

      m_items[size]=candle;
   }

   CECandle At(
      const int index) const
   {
      return m_items[index];
   }

   CECandle Last() const
   {
      if(IsEmpty())
         return CECandle();

      return m_items[Count()-1];
   }
};

#endif