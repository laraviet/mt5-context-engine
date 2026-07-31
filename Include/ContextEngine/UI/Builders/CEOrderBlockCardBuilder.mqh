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
      CEOrderBlockSummary summary =
         analysis.Summary.OrderBlock;

      dashboard.Add(
         CEDashboardCardFactory::Title(
            "Order Block"));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Bullish Active",
            IntegerToString(
               summary.ActiveBullish)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Bearish Active",
            IntegerToString(
               summary.ActiveBearish)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Bullish Filled",
            IntegerToString(
               summary.FilledBullish)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Bearish Filled",
            IntegerToString(
               summary.FilledBearish)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Fill Ratio",
            DoubleToString(
               summary.FillRatio * 100.0,
               1) + "%"));

      dashboard.Add(
         CEDashboardCardFactory::Separator());
   }
};

#endif