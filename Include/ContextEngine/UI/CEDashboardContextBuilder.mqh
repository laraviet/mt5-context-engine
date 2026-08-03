#ifndef __CE_DASHBOARD_CONTEXT_BUILDER_MQH__
#define __CE_DASHBOARD_CONTEXT_BUILDER_MQH__

#include "../Core/CEAnalysisContext.mqh"
#include "CEDashboardContext.mqh"
#include "/Builders/CEDashboardBuilderPipeline.mqh"
#include "Builders/CEDashboardRegistry.mqh"
#include "History/CEHistorySectionBuilder.mqh"

class CEDashboardContextBuilder
{
private:
   CEDashboardBuilderPipeline m_pipeline;   
   CEHistorySectionBuilder m_historyBuilder;
   
public:

   CEDashboardContextBuilder()
   {
      CEDashboardRegistry registry(m_pipeline);

      registry.Register();
   }

   void Build(const CEAnalysisContext &context, CETradeJournalRepository &repository, CEDashboardContext &dashboard)
   {      
      dashboard.Clear();
      m_pipeline.Build(context, dashboard);   
      m_historyBuilder.Build(repository,dashboard.History); 
   }
};

#endif