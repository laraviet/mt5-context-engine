#ifndef __CE_SYMBOL_CARD_BUILDER_MQH__
#define __CE_SYMBOL_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CEDashboardSection.mqh"
#include "../CEDashboardCardFactory.mqh"

class CESymbolCardBuilder : public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardSection section;

      section.Id    = "symbol";
      section.Title = "Symbol";

      section.Add(
         CEDashboardCardFactory::Item(
            "Symbol",
            analysis.Symbol));

      section.Add(
         CEDashboardCardFactory::Item(
            "Timeframe",
            EnumToString(
               analysis.Timeframe)));

      dashboard.AddSection(section);
   }
};

#endif