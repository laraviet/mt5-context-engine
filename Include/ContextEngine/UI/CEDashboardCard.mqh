#ifndef __CE_DASHBOARD_CARD_MQH__
#define __CE_DASHBOARD_CARD_MQH__

enum CEDashboardCardType
{
   DASHBOARD_CARD_TITLE,
   DASHBOARD_CARD_ITEM,
   DASHBOARD_CARD_SEPARATOR,
   DASHBOARD_CARD_EMPTY
};

class CEDashboardCard
{
public:

   string Id;

   string Text;

   color Color;

   CEDashboardCardType Type;

public:

   CEDashboardCard()
   {
      Id    = "";
      Text  = "";
      Color = clrWhite;

      Type  = DASHBOARD_CARD_ITEM;
   }
};

#endif