#ifndef __CE_TRADE_SETUP_CARD_BUILDER_MQH__
#define __CE_TRADE_SETUP_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CEDashboardContext.mqh"
#include "../CEDashboardCardFactory.mqh"
#include "../CEDashboardSection.mqh"

class CETradeSetupCardBuilder : public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardSection section;
      CETradeSetup setup = analysis.TradeSetup;

      section.Id    = "trade_setup";
      section.Title = "Trade Setup";

      //--------------------------------------------------
      // Direction
      //--------------------------------------------------

      string direction = DirectionText(analysis.Decision.Type);

      section.Add(
         CEDashboardCardFactory::Item(
            "Direction",
            direction));

      //--------------------------------------------------
      // Entry
      //--------------------------------------------------

      if(analysis.TradeEntry.Valid)
      {
         section.Add(
            CEDashboardCardFactory::Item(
               "Entry",
               DoubleToString(
                  analysis.TradeEntry.Price,
                  _Digits)));
      }

      //--------------------------------------------------
      // Stop Loss
      //--------------------------------------------------

      if(analysis.StopLoss.Valid)
      {
         section.Add(
            CEDashboardCardFactory::Item(
               "Stop Loss",
               DoubleToString(
                  analysis.StopLoss.Price,
                  _Digits)));
      }

      //--------------------------------------------------
      // Take Profit
      //--------------------------------------------------

      if(analysis.TakeProfit.Valid)
      {
         section.Add(
            CEDashboardCardFactory::Item(
               "Take Profit",
               DoubleToString(
                  analysis.TakeProfit.Price,
                  _Digits)));
      }

      //--------------------------------------------------
      // Risk
      //--------------------------------------------------

      if(setup.RiskReward.Valid)
      {
         section.Add(
            CEDashboardCardFactory::Item(
               "Risk",
               DoubleToString(
                  setup.RiskReward.Risk / _Point,
                  1) + " pips"));
      }

      //--------------------------------------------------
      // Reward
      //--------------------------------------------------

      if(setup.RiskReward.Valid)
      {
         section.Add(
            CEDashboardCardFactory::Item(
               "Reward",
               DoubleToString(
                  setup.RiskReward.Reward / _Point,
                  1) + " pips"));
      }

      //--------------------------------------------------
      // RR
      //--------------------------------------------------

      if(setup.RiskReward.Valid)
      {
         section.Add(
            CEDashboardCardFactory::Item(
               "RR",
               DoubleToString(
                  setup.RiskReward.Ratio,
                  2)));
      }

      //--------------------------------------------------
      // Quality
      //--------------------------------------------------

      if(setup.Quality.Valid)
      {
         section.Add(
            CEDashboardCardFactory::Item(
               "Quality",
               IntegerToString(
                  setup.Quality.Score)));
      }

      //--------------------------------------------------
      // Allowed
      //--------------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Allowed",
            setup.Filter.Allowed
               ? "YES"
               : "NO"));

      //--------------------------------------------------
      // Reason
      //--------------------------------------------------

      if(!setup.Filter.Allowed)
      {
          section.Add(
              CEDashboardCardFactory::Item(
                  "Reason",
                  CETradeFilterReasonHelper::ToString(
                      setup.Filter.Reason)));
      }

      //--------------------------------------------------

      dashboard.AddSection(section);
   }
   
private:

   string DirectionText(
      const CEDecisionType type) const
   {
      switch(type)
      {
         case DECISION_BUY:
   
            return "BUY";
   
         case DECISION_SELL:
   
            return "SELL";
   
         default:
   
            return "UNKNOWN";
      }
   }

};

#endif