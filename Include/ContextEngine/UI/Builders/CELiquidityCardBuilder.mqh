#ifndef __CE_LIQUIDITY_CARD_BUILDER_MQH__
#define __CE_LIQUIDITY_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CEDashboardCardFactory.mqh"

class CELiquidityCardBuilder : public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      const CELiquiditySummary summary =
         analysis.Summary.Liquidity;

      dashboard.Add(
         CEDashboardCardFactory::Title(
            "Liquidity"));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Total",
            IntegerToString(summary.Total)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Buy Side",
            IntegerToString(summary.BuySide)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Sell Side",
            IntegerToString(summary.SellSide)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Untouched",
            IntegerToString(summary.Untouched)));

      dashboard.Add(
         CEDashboardCardFactory::Separator());
   }
};

#endif