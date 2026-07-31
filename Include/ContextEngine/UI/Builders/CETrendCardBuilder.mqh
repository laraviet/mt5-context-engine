#ifndef __CE_TREND_CARD_BUILDER_MQH__
#define __CE_TREND_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CETheme.mqh"

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
   
      section.Add(
         CEDashboardCardFactory::Item(
            "Trend",
            TrendToString(analysis.Summary.Market.Trend)));
   
      section.Add(
         CEDashboardCardFactory::Item(
            "Strength",
            IntegerToString(analysis.Summary.Market.Strength)));
   
      section.Add(
         CEDashboardCardFactory::Item(
            "Structure",
            PhaseToString(analysis.Summary.Market.Phase)));
   
      dashboard.AddSection(section);
   }

private:
   CETheme m_theme;
   
   string TrendToString(
      const CETrendType trend) const
   {
      switch(trend)
      {
         case TREND_UP:
            return "Up";
   
         case TREND_DOWN:
            return "Down";
   
         case TREND_RANGE:
            return "Range";
   
         default:
            return "Unknown";
      }
   }
   
   string PhaseToString(
      const CEMarketPhase phase) const
   {
      switch(phase)
      {
         case MARKET_PHASE_MARKUP:
            return "Trend";
   
         case MARKET_PHASE_ACCUMULATION:
            return "Range";
   
         default:
            return "Unknown";
      }
   }

};
#endif