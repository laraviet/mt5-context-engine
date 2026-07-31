#ifndef __CE_ORDER_BLOCK_CARD_BUILDER_MQH__
#define __CE_ORDER_BLOCK_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CETheme.mqh"
#include "../CEDashboardSection.mqh"
#include "../CEDashboardCardFactory.mqh"

class CEOrderBlockCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      const CEOrderBlockSummary summary =
         analysis.Summary.OrderBlock;

      CEDashboardSection section;

      section.Id    = "order_block";
      section.Title = "Order Block";

      section.Add(
         CEDashboardCardFactory::Item(
            "Total",
            IntegerToString(summary.Total)));

      section.Add(
         CEDashboardCardFactory::Item(
            "Bullish",
            IntegerToString(summary.Bullish)));

      section.Add(
         CEDashboardCardFactory::Item(
            "Bearish",
            IntegerToString(summary.Bearish)));

      section.Add(
         CEDashboardCardFactory::Item(
            "Active",
            IntegerToString(summary.Active())));

      section.Add(
         CEDashboardCardFactory::Item(
            "Mitigated",
            IntegerToString(summary.Filled())));

      dashboard.AddSection(section);
   }
};

#endif