#ifndef __CE_SCORE_CARD_BUILDER_MQH__
#define __CE_SCORE_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CEDashboardCardFactory.mqh"

class CEScoreCardBuilder : public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEContextScore score =
         analysis.Summary.Score;

      dashboard.Add(
         CEDashboardCardFactory::Title(
            "Context Score"));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Trend",
            IntegerToString(score.Trend)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Structure",
            IntegerToString(score.Structure)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Liquidity",
            IntegerToString(score.Liquidity)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Momentum",
            IntegerToString(score.Momentum)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Volatility",
            IntegerToString(score.Volatility)));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Total",
            IntegerToString(score.Total)));

      dashboard.Add(
         CEDashboardCardFactory::Separator());
   }
};

#endif