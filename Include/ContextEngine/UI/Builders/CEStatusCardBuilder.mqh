#ifndef __CE_STATUS_CARD_BUILDER_MQH__
#define __CE_STATUS_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CETheme.mqh"

class CEStatusCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardCard card;

      card.Id = "STATUS";
      card.Text =
         "Status : " +
         analysis.Status;

      card.Color =
         m_theme.SuccessColor;

      dashboard.Add(card);
   }
};

#endif