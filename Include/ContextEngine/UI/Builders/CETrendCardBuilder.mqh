#ifndef __CE_TREND_CARD_BUILDER_MQH__
#define __CE_TREND_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CETheme.mqh"

class CETrendCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardCard card;

      card.Id = "TREND";

      card.Text =
         "Trend : " +
         IntegerToString(
            analysis.TrendSeries.Count());

      card.Color =
         m_theme.TextColor;

      dashboard.Add(card);
   }
};

#endif