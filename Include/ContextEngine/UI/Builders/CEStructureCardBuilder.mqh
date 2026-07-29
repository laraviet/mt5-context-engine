#ifndef __CE_STRUCTURE_CARD_BUILDER_MQH__
#define __CE_STRUCTURE_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CETheme.mqh"

class CEStructureCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardCard card;

      card.Id = "STRUCTURE";

      card.Text =
         "Structure : " +
         IntegerToString(
            analysis.StructureSeries.Count());

      card.Color =
         m_theme.TextColor;

      dashboard.Add(card);
   }
};

#endif