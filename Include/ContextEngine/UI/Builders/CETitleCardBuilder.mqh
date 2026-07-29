#ifndef __CE_TITLE_CARD_BUILDER_MQH__
#define __CE_TITLE_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CETheme.mqh"

class CETitleCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard)
   {
      CEDashboardCard card;

      card.Id="TITLE";
      card.Text="Context Engine";
      card.Color=m_theme.TitleColor;

      dashboard.Add(card);
   }
};

#endif