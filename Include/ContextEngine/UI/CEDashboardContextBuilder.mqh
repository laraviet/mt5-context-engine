#ifndef __CE_DASHBOARD_CONTEXT_BUILDER_MQH__
#define __CE_DASHBOARD_CONTEXT_BUILDER_MQH__

#include "../Core/CEAnalysisContext.mqh"
#include "CEDashboardContext.mqh"
#include "/Builders/CEDashboardBuilderPipeline.mqh"
#include "Builders/CEDashboardRegistry.mqh"

class CEDashboardContextBuilder
{
private:
   CEDashboardBuilderPipeline m_pipeline;
   
public:

   CEDashboardContextBuilder()
   {
      CEDashboardRegistry registry(m_pipeline);

      registry.Register();
   }

   void Build(const CEAnalysisContext &analysis, CEDashboardContext &dashboard)
   {      
      dashboard.Clear();
      m_pipeline.Build(analysis, dashboard);      
   }
};

#endif