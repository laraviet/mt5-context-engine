#ifndef __CE_DASHBOARD_SECTION_MQH__
#define __CE_DASHBOARD_SECTION_MQH__

#include "CEDashboardCard.mqh"

class CEDashboardSection
{
public:

   string Id;

   string Title;
   
   bool Expanded;

private:

   CEDashboardCard m_cards[];

public:

   CEDashboardSection()
   {
      Id="";
      Title="";
      Expanded = true;
   }

   void Clear()
   {
      ArrayResize(m_cards,0);
   }

   void Add(
      const CEDashboardCard &card)
   {
      int n=ArraySize(m_cards);

      ArrayResize(m_cards,n+1);

      m_cards[n]=card;
   }

   int Count() const
   {
      return ArraySize(m_cards);
   }

   CEDashboardCard At(
      const int index) const
   {
      return m_cards[index];
   }
};

#endif