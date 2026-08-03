#ifndef __CE_TRADE_FILTER_CARD_BUILDER_MQH__
#define __CE_TRADE_FILTER_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CEDashboardCardFactory.mqh"
#include "../CEDashboardSection.mqh"

class CETradeFilterCardBuilder :
   public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardSection section;

      section.Id    = "trade_filter";
      section.Title = "Trade Filter";

      //------------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Allowed",
            analysis.TradeFilter.Allowed
               ? "YES"
               : "NO"));

      //------------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Reason",
            CETradeFilterReasonHelper::ToString(
               analysis.TradeFilter.Reason)));

      //------------------------------------------------

      if(analysis.TradeQuality.Valid)
      {
         section.Add(
            CEDashboardCardFactory::Item(
               "Quality",
               IntegerToString(
                  analysis.TradeQuality.Score)));
      }

      //------------------------------------------------

      if(analysis.TradeSetup.RiskReward.Valid)
      {
         section.Add(
            CEDashboardCardFactory::Item(
               "RR",
               DoubleToString(
                  analysis.TradeSetup.RiskReward.Ratio,
                  2)));
      }

      //------------------------------------------------

      dashboard.AddSection(section);
   }
};

#endif