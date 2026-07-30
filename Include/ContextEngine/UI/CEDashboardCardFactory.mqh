#ifndef __CE_DASHBOARD_CARD_FACTORY_MQH__
#define __CE_DASHBOARD_CARD_FACTORY_MQH__

#include "CEDashboardCard.mqh"
#include "CETheme.mqh"

class CEDashboardCardFactory
{
public:

   static CEDashboardCard Title(
      const string title)
   {
      CEDashboardCard card;
      CETheme m_theme;

      card.Id    = title;
      card.Text  = title;
      card.Color = m_theme.TitleColor;
      card.Type  = DASHBOARD_CARD_TITLE;

      return card;
   }

   static CEDashboardCard Item(
      const string id,
      const string value)
   {
      CEDashboardCard card;
      CETheme m_theme;

      card.Id    = id;
      card.Text  = id + " : " + value;
      card.Color = m_theme.TextColor;
      card.Type  = DASHBOARD_CARD_ITEM;

      return card;
   }

   static CEDashboardCard Separator()
   {
      CEDashboardCard card;
      CETheme m_theme;

      card.Id    = "__separator__";
      card.Text  = "------------------------";
      card.Color = m_theme.TextColor;
      card.Type  = DASHBOARD_CARD_SEPARATOR;

      return card;
   }

   static CEDashboardCard Empty()
   {
      CEDashboardCard card;

      card.Id    = "__empty__";
      card.Text  = "";
      card.Color = clrWhite;
      card.Type  = DASHBOARD_CARD_EMPTY;

      return card;
   }
};

#endif