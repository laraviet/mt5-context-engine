#ifndef __CE_TREND_CARD_BUILDER_MQH__
#define __CE_TREND_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CEDashboardContext.mqh"
#include "../CEDashboardSection.mqh"
#include "../CEDashboardCardFactory.mqh"

#include "../../Domain/CETrendTypeHelper.mqh"

class CETrendCardBuilder : public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardSection section;

      section.Id    = "trend";
      section.Title = "Trend";

      //------------------------------------------
      // Trend Direction
      //------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Direction",
            CETrendTypeHelper::ToString(
               analysis.Summary.Market.Trend)));

      //------------------------------------------
      // Trend Strength
      //------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Strength",
            IntegerToString(
               analysis.Summary.Market.Strength)));

      //------------------------------------------
      // Trend Points
      //------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Trend Points",
            IntegerToString(
               analysis.TrendSeries.Count())));

      //------------------------------------------
      // Latest Trend
      //------------------------------------------

      string latest = "-";

      if(analysis.TrendSeries.Count() > 0)
      {
         latest =
            CETrendTypeHelper::ToString(
               analysis.TrendSeries.At(
                  analysis.TrendSeries.Count()-1).TrendType);
      }

      section.Add(
         CEDashboardCardFactory::Item(
            "Latest",
            latest));

      dashboard.AddSection(section);
   }
};

#endif