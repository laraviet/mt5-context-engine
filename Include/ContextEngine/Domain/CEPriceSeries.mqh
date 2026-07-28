#include "CECandle.mqh"

class CEPriceSeries
{
private:

   CECandle m_candles[];

public:

   void Set(const CECandle &candles[])
   {
      int count = ArraySize(candles);
   
      ArrayResize(m_candles, count);
   
      for(int i=0;i<count;i++)
         m_candles[i] = candles[i];
   }

   int Count() const
   {
      return ArraySize(m_candles);
   }   

   const CECandle At(int index) const
   {
      return m_candles[index];
   }

   const CECandle Latest() const
   {
      return m_candles[Count()-1];
   }
};