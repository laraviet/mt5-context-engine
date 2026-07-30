#ifndef __CE_DASHBOARD_CARD_FACTORY_MQH__
#define __CE_DASHBOARD_CARD_FACTORY_MQH__

#include "CEDashboardCard.mqh"

class CEDashboardCardFactory
{
public:

   static CEDashboardCard Title(
      const string title)
   {
      CEDashboardCard card;

      card.Id    = title;
      card.Text  = title;
      card.Color = clrGold;
      card.Type  = DASHBOARD_CARD_TITLE;

      return card;
   }

   static CEDashboardCard Item(
      const string id,
      const string value,
      const color clr = clrWhite)
   {
      CEDashboardCard card;

      card.Id    = id;
      card.Text  = value;
      card.Color = clr;
      card.Type  = DASHBOARD_CARD_ITEM;

      return card;
   }

   static CEDashboardCard Separator()
   {
      CEDashboardCard card;

      card.Id    = "__separator__";
      card.Text  = "";
      card.Color = clrDarkGray;
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