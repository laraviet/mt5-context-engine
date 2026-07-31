#ifndef __CE_MARKET_BIAS_CARD_BUILDER_MQH__
#define __CE_MARKET_BIAS_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CEDashboardContext.mqh"
#include "../CEDashboardSection.mqh"
#include "../CEDashboardCardFactory.mqh"

#include "../../Domain/CETrendTypeHelper.mqh"
#include "../../Domain/CEMarketPhase.mqh"

class CEMarketBiasCardBuilder : public IDashboardCardBuilder
{
private:

   string BiasToString(
      const CETrendType trend) const
   {
      switch(trend)
      {
         case TREND_UP:
            return "Bullish";

         case TREND_DOWN:
            return "Bearish";

         case TREND_RANGE:
            return "Neutral";

         default:
            return "Unknown";
      }
   }

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardSection section;

      section.Id    = "market_bias";
      section.Title = "Market Bias";

      //--------------------------------------
      // Bias
      //--------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Bias",
            BiasToString(
               analysis.Summary.Market.Trend)));

      //--------------------------------------
      // Trend
      //--------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Trend",
            CETrendTypeHelper::ToString(
               analysis.Summary.Market.Trend)));

      //--------------------------------------
      // Market Phase
      //--------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Phase",
            CEMarketPhaseHelper::ToString(
               analysis.Summary.Market.Phase)));

      //--------------------------------------
      // Strength
      //--------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Strength",
            IntegerToString(
               analysis.Summary.Market.Strength)));

      dashboard.AddSection(section);
   }
};

#endif