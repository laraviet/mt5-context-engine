#ifndef __CE_DASHBOARD_CONTEXT_MQH__
#define __CE_DASHBOARD_CONTEXT_MQH__

#include "CEDashboardCard.mqh"

class CEDashboardContext
{
private:

   CEDashboardCard m_cards[];

public:

   void Clear()
   {
      ArrayResize(m_cards,0);
   }

   void Add(const CEDashboardCard &card)
   {
      int n = ArraySize(m_cards);

      ArrayResize(m_cards,n+1);

      m_cards[n]=card;
   }

   int Count() const
   {
      return ArraySize(m_cards);
   }

   CEDashboardCard At(const int index) const
   {
      return m_cards[index];
   }
};

#endif