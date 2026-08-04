#ifndef __CE_STATISTICS_SECTION_MQH__
#define __CE_STATISTICS_SECTION_MQH__

#include "CEStatisticsCard.mqh"

class CEStatisticsSection
{
private:

   CEStatisticsCard m_cards[];

public:

   void Clear()
   {
      ArrayResize(
         m_cards,
         0);
   }

   bool Empty() const
   {
      return ArraySize(
         m_cards) == 0;
   }

   int Count() const
   {
      return ArraySize(
         m_cards);
   }

   bool Add(
      const CEStatisticsCard &card)
   {
      int index =
         Count();

      ArrayResize(
         m_cards,
         index + 1);

      m_cards[index] =
         card;

      return true;
   }

   CEStatisticsCard At(
      const int index) const
   {
      if(index < 0 ||
         index >= Count())
      {
         CEStatisticsCard card;

         return card;
      }

      return
         m_cards[index];
   }
};

#endif