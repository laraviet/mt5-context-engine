#ifndef __CE_ORDER_BLOCK_CARD_BUILDER_MQH__
#define __CE_ORDER_BLOCK_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CEDashboardCardFactory.mqh"

class CEOrderBlockCardBuilder : public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      const CEOrderBlockSummary summary =
         analysis.Summary.OrderBlock;

      dashboard.Add(
         CEDashboardCardFactory::Title(
            "Order Block"));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Total",
            IntegerToString(summary.Total)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Bullish",
            IntegerToString(summary.Bullish)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Bearish",
            IntegerToString(summary.Bearish)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Active",
            IntegerToString(summary.Active)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Mitigated",
            IntegerToString(summary.Mitigated)));

      dashboard.Add(
         CEDashboardCardFactory::Separator());
   }
};

#endif