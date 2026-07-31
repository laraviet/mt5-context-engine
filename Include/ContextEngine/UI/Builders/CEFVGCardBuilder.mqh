#ifndef __CE_FVG_CARD_BUILDER_MQH__
#define __CE_FVG_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CEDashboardContext.mqh"
#include "../CEDashboardCardFactory.mqh"
#include "../CEDashboardSection.mqh"

class CEFVGCardBuilder : public IDashboardCardBuilder
{
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
   
      section.Add(
         CEDashboardCardFactory::Item(
            "Fill Ratio",
            DoubleToString(
               summary.FillRatio * 100.0,
               1) + "%"));
   
      dashboard.AddSection(section);
   }
   
};

#endif