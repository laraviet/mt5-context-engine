#ifndef __CE_VERSION_CARD_BUILDER_MQH__
#define __CE_VERSION_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CETheme.mqh"

class CEVersionCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardCard card;

      card.Id    = "VERSION";
      card.Text  = "Version : 0.2.0";
      card.Color = m_theme.TextColor;

      dashboard.Add(card);
   }
};

#endif