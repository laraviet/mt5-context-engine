#ifndef __CE_LIQUIDITY_CARD_BUILDER_MQH__
#define __CE_LIQUIDITY_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CEDashboardContext.mqh"
#include "../CEDashboardCardFactory.mqh"
#include "../CEDashboardSection.mqh"

class CELiquidityCardBuilder : public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      const CELiquiditySummary summary =
         analysis.Summary.Liquidity;

      CEDashboardSection section;

      section.Id    = "liquidity";
      section.Title = "Liquidity";

      section.Add(
         CEDashboardCardFactory::Item(
            "Total",
            IntegerToString(summary.Total)));

      section.Add(
         CEDashboardCardFactory::Item(
            "Buy Side",
            IntegerToString(summary.BuySide)));

      section.Add(
         CEDashboardCardFactory::Item(
            "Sell Side",
            IntegerToString(summary.SellSide)));

      section.Add(
         CEDashboardCardFactory::Item(
            "Untouched",
            IntegerToString(summary.Untouched)));

      dashboard.AddSection(section);
   }
};

#endif