#ifndef __CE_STATUS_CARD_BUILDER_MQH__
#define __CE_STATUS_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CEDashboardContext.mqh"
#include "../CEDashboardSection.mqh"
#include "../CEDashboardCardFactory.mqh"

#include "../../Domain/CEMarketPhase.mqh"
#include "../../Domain/CETrendTypeHelper.mqh"

class CEStatusCardBuilder : public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardSection section;

      section.Id    = "status";
      section.Title = "Status";

      //------------------------------------------
      // Market Phase
      //------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Market Phase",
            CEMarketPhaseHelper::ToString(
               analysis.Summary.Market.Phase)));

      //------------------------------------------
      // Trend
      //------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Trend",
            CETrendTypeHelper::ToString(
               analysis.Summary.Market.Trend)));

      //------------------------------------------
      // Strength
      //------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Strength",
            IntegerToString(
               analysis.Summary.Market.Strength)));

      dashboard.AddSection(section);
   }
};

#endif