#ifndef __CE_DASHBOARD_CONTEXT_BUILDER_MQH__
#define __CE_DASHBOARD_CONTEXT_BUILDER_MQH__

#include "../Core/CEAnalysisContext.mqh"

#include "CEDashboardContext.mqh"
#include "CEDashboardSettings.mqh"

#include "Builders/CEDashboardBuilderPipeline.mqh"
#include "Builders/CEDashboardRegistry.mqh"

#include "History/CEHistorySectionBuilder.mqh"

#include "../Statistics/CETradeStatisticsBuilder.mqh"
#include "../Statistics/CEStatisticsSectionBuilder.mqh"

#include "Performance/CEPerformanceSectionBuilder.mqh"

#include "../Replay/CEReplaySession.mqh"
#include "../Replay/CEReplayRecorder.mqh"
#include "../Replay/CEReplaySnapshot.mqh"

class CEDashboardContextBuilder
{
private:

   CEDashboardBuilderPipeline      m_pipeline;

   CEHistorySectionBuilder         m_historyBuilder;

   CETradeStatisticsBuilder        m_statisticsBuilder;
   CEStatisticsSectionBuilder      m_statisticsSectionBuilder;

   CEPerformanceSectionBuilder     m_performanceSectionBuilder;

   //--------------------------------------
   // Replay
   //--------------------------------------

   CEReplaySession                 m_replay;
   CEReplayRecorder                m_replayRecorder;

public:

   CEDashboardContextBuilder()
   {
      CEDashboardRegistry registry(
         m_pipeline);

      registry.Register();
   }

   void Build(
      const CEAnalysisContext &context,
      CETradeJournalRepository &repository,
      const CEDashboardSettings &settings,
      CEDashboardContext &dashboard)
   {
      //--------------------------------------
      // Dashboard
      //--------------------------------------

      dashboard.Clear();

      dashboard.Settings = settings;

      m_pipeline.Build(
         context,
         dashboard);

      //--------------------------------------
      // History
      //--------------------------------------

      m_historyBuilder.Build(
         repository,
         dashboard.History);

      //--------------------------------------
      // Statistics
      //--------------------------------------

      m_statisticsBuilder.Build(
         repository,
         dashboard.Statistics);

      m_statisticsSectionBuilder.Build(
         dashboard.Statistics,
         dashboard.StatisticsSection);

      //--------------------------------------
      // Performance
      //--------------------------------------

      m_performanceSectionBuilder.Build(
         dashboard.Statistics,
         dashboard.PerformanceSection);

      //--------------------------------------
      // Replay Snapshot
      //--------------------------------------

      if(!dashboard.Empty())
      {
         CEReplaySnapshot snapshot;

         snapshot.Time      = TimeCurrent();
         snapshot.Symbol    = _Symbol;
         snapshot.Timeframe = (ENUM_TIMEFRAMES)_Period;

         snapshot.Dashboard = dashboard;
         snapshot.Journal   = repository.Last();

         m_replayRecorder.Record(
            m_replay.Repository(),
            snapshot);

         CELogger::Info(
            CE_MODULE_REPLAY,
            "Replay snapshot recorded");
      }
   }

   //--------------------------------------
   // Replay Access
   //--------------------------------------

   CEReplaySession Replay() const
   {
      return m_replay;
   }
};

#endif