#ifndef __CE_DASHBOARD_CONTEXT_MQH__
#define __CE_DASHBOARD_CONTEXT_MQH__

#include "CEDashboardCard.mqh"
#include "CEDashboardSection.mqh"
#include "History/CEHistorySection.mqh"
#include "../Statistics/CETradeStatistics.mqh"
#include "../Statistics/CEStatisticsSection.mqh"
#include "Performance/CEPerformanceSection.mqh"

class CEDashboardContext
{
private:

   CEDashboardCard m_cards[];

   CEDashboardSection m_sections[];      

public:

   CEHistorySection History;
   CETradeStatistics Statistics;
   CEStatisticsSection StatisticsSection;
   CEPerformanceSection PerformanceSection;

   void Clear()
   {
      ArrayResize(m_cards,0);

      ArrayResize(m_sections,0);
      
      Statistics.Reset();
      
      StatisticsSection.Clear();
      
      PerformanceSection.Clear();
   }

   //-------------------------
   // Legacy API
   //-------------------------

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

   //-------------------------
   // Section API
   //-------------------------

   void AddSection(
      const CEDashboardSection &section)
   {
      int n=ArraySize(m_sections);

      ArrayResize(m_sections,n+1);

      m_sections[n]=section;
   }

   int SectionCount() const
   {
      return ArraySize(m_sections);
   }

   CEDashboardSection SectionAt(
      const int index) const
   {
      return m_sections[index];
   }
};

#endif