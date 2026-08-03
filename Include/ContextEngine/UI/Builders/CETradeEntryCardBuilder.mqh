#ifndef __CE_TRADE_ENTRY_CARD_BUILDER_MQH__
#define __CE_TRADE_ENTRY_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CEDashboardContext.mqh"
#include "../CEDashboardSection.mqh"
#include "../CEDashboardCardFactory.mqh"

#include "../../Domain/CETradeEntrySource.mqh"

class CETradeEntryCardBuilder : public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardSection section;

      section.Id    = "trade_entry";
      section.Title = "Trade Entry";

      section.Add(
         CEDashboardCardFactory::Item(
            "Valid",
            analysis.TradeEntry.Valid ? "Yes" : "No"));

      section.Add(
         CEDashboardCardFactory::Item(
            "Price",
            DoubleToString(
               analysis.TradeEntry.Price,
               _Digits)));

      section.Add(
         CEDashboardCardFactory::Item(
            "Source",
            CETradeEntrySourceHelper::ToString(
               analysis.TradeEntry.Source)));

      dashboard.AddSection(section);
   }
};

#endif