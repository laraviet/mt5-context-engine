#ifndef __CE_FVG_CARD_BUILDER_MQH__
#define __CE_FVG_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CEDashboardCardFactory.mqh"

class CEFVGCardBuilder : public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEFVGSummary summary =
         analysis.Summary.FVG;

      dashboard.Add(
         CEDashboardCardFactory::Title(
            "Fair Value Gap"));

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
            IntegerToString(summary.Active())));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Filled",
            IntegerToString(summary.Filled())));

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