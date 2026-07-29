#ifndef __CE_SYMBOL_CARD_BUILDER_MQH__
#define __CE_SYMBOL_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CETheme.mqh"

class CESymbolCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardCard card;

      card.Id    = "SYMBOL";
      card.Text  = "Symbol : " + analysis.Symbol;
      card.Color = m_theme.TextColor;

      dashboard.Add(card);
   }
};

#endif