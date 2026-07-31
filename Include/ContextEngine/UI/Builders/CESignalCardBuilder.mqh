#ifndef __CE_SIGNAL_CARD_BUILDER_MQH__
#define __CE_SIGNAL_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../../Domain/CEDecisionType.mqh"
#include "../../Domain/CETradeSignalType.mqh"

class CESignalCardBuilder : public IDashboardCardBuilder
{
private:

   string DecisionToString(
      const CEDecisionType type) const
   {
      switch(type)
      {
         case DECISION_BUY:
            return "BUY";

         case DECISION_SELL:
            return "SELL";

         case DECISION_WAIT:
            return "WAIT";

         default:
            return "-";
      }
   }

   string SignalToString(
      const CETradeSignalType type) const
   {
      switch(type)
      {
         case SIGNAL_BUY:
            return "BUY";

         case SIGNAL_SELL:
            return "SELL";

         default:
            return "-";
      }
   }

public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardSection section;

      section.Id    = "signal";
      section.Title = "Signal";

      section.Add(
         CEDashboardCardFactory::Item(
            "Decision",
            DecisionToString(
               analysis.Decision.Type)));

      section.Add(
         CEDashboardCardFactory::Item(
            "Signal",
            SignalToString(
               analysis.TradeSignal.Type)));

      section.Add(
         CEDashboardCardFactory::Item(
            "Confidence",
            IntegerToString(
               analysis.TradeSignal.Confidence)));

      dashboard.AddSection(section);
   }
};

#endif