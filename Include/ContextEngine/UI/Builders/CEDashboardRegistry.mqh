#ifndef __CE_DASHBOARD_REGISTRY_MQH__
#define __CE_DASHBOARD_REGISTRY_MQH__

#include "CEDashboardBuilderPipeline.mqh"

#include "CETitleCardBuilder.mqh"
#include "CEVersionCardBuilder.mqh"
#include "CESymbolCardBuilder.mqh"
#include "CETimeframeCardBuilder.mqh"
#include "CEStatusCardBuilder.mqh"

#include "CESwingCardBuilder.mqh"
#include "CEStructureCardBuilder.mqh"
#include "CETrendCardBuilder.mqh"
#include "CELiquidityCardBuilder.mqh"
#include "CEFVGCardBuilder.mqh"
#include "CEOrderBlockCardBuilder.mqh"
#include "CEMarketBiasCardBuilder.mqh"
#include "CEScoreCardBuilder.mqh"
#include "CESignalCardBuilder.mqh"

class CEDashboardRegistry
{
private:

   CEDashboardBuilderPipeline *m_pipeline;

private:

   void RegisterHeader()
   {
      m_pipeline.Add(new CETitleCardBuilder());
      m_pipeline.Add(new CEVersionCardBuilder());
      m_pipeline.Add(new CESymbolCardBuilder());
      m_pipeline.Add(new CETimeframeCardBuilder());
      m_pipeline.Add(new CEStatusCardBuilder());
   }

   void RegisterAnalysis()
   {
      m_pipeline.Add(new CESwingCardBuilder());
      m_pipeline.Add(new CEStructureCardBuilder());
      m_pipeline.Add(new CETrendCardBuilder());

      m_pipeline.Add(new CELiquidityCardBuilder());
      m_pipeline.Add(new CEFVGCardBuilder());
      m_pipeline.Add(new CEOrderBlockCardBuilder());

      m_pipeline.Add(new CEMarketBiasCardBuilder());
      m_pipeline.Add(new CEScoreCardBuilder());
      m_pipeline.Add(new CESignalCardBuilder());
   }

public:

   CEDashboardRegistry(
      CEDashboardBuilderPipeline &pipeline)
   {
      m_pipeline = &pipeline;
   }

   bool Register()
   {
      RegisterHeader();
      RegisterAnalysis();

      return true;
   }
};

#endif