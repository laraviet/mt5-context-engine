#ifndef __CE_MARKET_BIAS_CARD_BUILDER_MQH__
#define __CE_MARKET_BIAS_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CEDashboardCardFactory.mqh"

class CEMarketBiasCardBuilder : public IDashboardCardBuilder
{
   
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      dashboard.Add(
         CEDashboardCardFactory::Title(
            "Market Bias"));

      dashboard.Add(
         CEDashboardCardFactory::Item(
            "Bias",
            analysis.Summary.Bias.ToString()));

      dashboard.Add(
         CEDashboardCardFactory::Separator());
   }
};

#endif