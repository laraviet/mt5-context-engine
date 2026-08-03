#ifndef __CE_HISTORY_SECTION_MQH__
#define __CE_HISTORY_SECTION_MQH__

#include "CEHistoryCard.mqh"

class CEHistorySection
{
private:

   CEHistoryCard m_cards[];

public:

   void Clear()
   {
      ArrayResize(
         m_cards,
         0);
   }

   bool Empty() const
   {
      return
         ArraySize(m_cards) == 0;
   }

   int Count() const
   {
      return
         ArraySize(m_cards);
   }

   bool Add(
      const CEHistoryCard &card)
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

   CEHistoryCard At(
      const int index) const
   {
      if(index < 0 ||
         index >= Count())
      {
         CEHistoryCard card;

         return card;
      }

      return
         m_cards[index];
   }
};

#endif