#ifndef __CE_FVG_CARD_BUILDER_MQH__
#define __CE_FVG_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CETheme.mqh"
#include "../CEDashboardSection.mqh"
#include "../CEDashboardCardFactory.mqh"

class CEFVGCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      const CEFVGSummary summary =
         analysis.Summary.FVG;

      CEDashboardSection section;

      section.Id    = "fvg";
      section.Title = "Fair Value Gap";

      section.Add(
         CEDashboardCardFactory::Item(
            "Total",
            IntegerToString(summary.Total)));

      section.Add(
         CEDashboardCardFactory::Item(
            "Active",
            IntegerToString(summary.Active())));

      section.Add(
         CEDashboardCardFactory::Item(
            "Filled",
            IntegerToString(summary.Filled())));

      string ratio =
         DoubleToString(
            summary.FillRatio * 100.0,
            1) + "%";

      section.Add(
         CEDashboardCardFactory::Item(
            "Fill Ratio",
            ratio));

      dashboard.AddSection(section);
   }
};

#endif