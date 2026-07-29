#ifndef __CE_TIMEFRAME_CARD_BUILDER_MQH__
#define __CE_TIMEFRAME_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CETheme.mqh"

class CETimeframeCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardCard card;

      card.Id = "TIMEFRAME";
      card.Text =
         "TF : " +
         EnumToString(analysis.Timeframe);

      card.Color = m_theme.TextColor;

      dashboard.Add(card);
   }
};

#endif