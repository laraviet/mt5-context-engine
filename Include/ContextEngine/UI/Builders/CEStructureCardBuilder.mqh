#ifndef __CE_STRUCTURE_CARD_BUILDER_MQH__
#define __CE_STRUCTURE_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CETheme.mqh"
#include "../CEDashboardSection.mqh"
#include "../CEDashboardCardFactory.mqh"

class CEStructureCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardSection section;

      section.Id    = "structure";
      section.Title = "Structure";

      section.Add(
         CEDashboardCardFactory::Item(
            "Count",
            IntegerToString(
               analysis.StructureSeries.Count())));

      dashboard.AddSection(section);
   }
};

#endif