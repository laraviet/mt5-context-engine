#ifndef __CE_DASHBOARD_CONTEXT_BUILDER_MQH__
#define __CE_DASHBOARD_CONTEXT_BUILDER_MQH__

#include "../Core/CEAnalysisContext.mqh"

#include "CEDashboardContext.mqh"
#include "Builders/CEDashboardBuilderPipeline.mqh"
#include "Builders/CEDashboardRegistry.mqh"

#include "History/CEHistorySectionBuilder.mqh"

#include "../Statistics/CETradeStatisticsBuilder.mqh"
#include "../Statistics/CEStatisticsSectionBuilder.mqh"

#include "Performance/CEPerformanceSectionBuilder.mqh"

#include "CEDashboardSettings.mqh"

class CEDashboardContextBuilder
{
private:

   CEDashboardBuilderPipeline      m_pipeline;

   CEHistorySectionBuilder         m_historyBuilder;

   CETradeStatisticsBuilder        m_statisticsBuilder;
   CEStatisticsSectionBuilder      m_statisticsSectionBuilder;

   CEPerformanceSectionBuilder     m_performanceSectionBuilder;

public:

   CEDashboardContextBuilder()
   {
      CEDashboardRegistry registry(
         m_pipeline);

      registry.Register();
   }

   void Build(
      const CEAnalysisContext      &context,
      CETradeJournalRepository     &repository,
      const CEDashboardSettings    &settings,
      CEDashboardContext           &dashboard)
   {
      dashboard.Clear();

      dashboard.Settings = settings;

      //-----------------------------------------
      // Dashboard
      //-----------------------------------------

      m_pipeline.Build(
         context,
         dashboard);

      //-----------------------------------------
      // History
      //-----------------------------------------

      m_historyBuilder.Build(
         repository,
         dashboard.History);

      //-----------------------------------------
      // Statistics
      //-----------------------------------------

      m_statisticsBuilder.Build(
         repository,
         dashboard.Statistics);

      m_statisticsSectionBuilder.Build(
         dashboard.Statistics,
         dashboard.StatisticsSection);

      //-----------------------------------------
      // Performance
      //-----------------------------------------

      m_performanceSectionBuilder.Build(
         dashboard.Statistics,
         dashboard.PerformanceSection);
      
   }

};

#endif