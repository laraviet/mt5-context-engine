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
#include "CEMarketBiasCardBuilder.mqh"
#include "CEFVGCardBuilder.mqh"
#include "CEOrderBlockCardBuilder.mqh"

class CEDashboardRegistry
{
private:

   CEDashboardBuilderPipeline *m_pipeline;
   
public:

   CEDashboardRegistry(
      CEDashboardBuilderPipeline &pipeline)
   {
      m_pipeline = &pipeline;
   }

   bool Register()
   {
      m_pipeline.Add(new CETitleCardBuilder());

      m_pipeline.Add(new CEVersionCardBuilder());

      m_pipeline.Add(new CESymbolCardBuilder());

      m_pipeline.Add(new CETimeframeCardBuilder());

      m_pipeline.Add(new CEStatusCardBuilder());

      m_pipeline.Add(new CESwingCardBuilder());

      m_pipeline.Add(new CEStructureCardBuilder());

      m_pipeline.Add(new CETrendCardBuilder());
      
      m_pipeline.Add(new CEMarketBiasCardBuilder());
      
      m_pipeline.Add(new CEFVGCardBuilder());
      
      m_pipeline.Add(new CEOrderBlockCardBuilder());

      return true;
   }
};

#endif