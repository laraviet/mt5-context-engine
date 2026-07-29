#ifndef __CE_SWING_CARD_BUILDER_MQH__
#define __CE_SWING_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CETheme.mqh"

class CESwingCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardCard card;

      card.Id = "SWING";

      card.Text =
         "Swing : " +
         IntegerToString(
            analysis.SwingSeries.Count());

      card.Color =
         m_theme.TextColor;

      dashboard.Add(card);
   }
};

#endif