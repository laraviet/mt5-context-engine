#ifndef __CE_DASHBOARD_CARD_MQH__
#define __CE_DASHBOARD_CARD_MQH__

class CEDashboardCard
{
public:

   string Id;

   string Text;

   color Color;

public:

   CEDashboardCard()
   {
      Id = "";
      Text = "";
      Color = clrWhite;
   }
};

#endif