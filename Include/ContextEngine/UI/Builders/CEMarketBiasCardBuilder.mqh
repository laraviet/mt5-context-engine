#ifndef __CE_MARKET_BIAS_CARD_BUILDER_MQH__
#define __CE_MARKET_BIAS_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"
#include "../CEDashboardCardFactory.mqh"
#include "../CETheme.mqh"

class CEMarketBiasCardBuilder : public IDashboardCardBuilder
{
private:

   CETheme m_theme;
   
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
            "Bias : " +analysis.Summary.Bias.ToString(), 
            m_theme.TextColor));

      dashboard.Add(
         CEDashboardCardFactory::Separator());
   }
};

#endif