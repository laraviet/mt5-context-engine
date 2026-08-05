#ifndef __CE_DASHBOARD_CONTROLLER_MQH__
#define __CE_DASHBOARD_CONTROLLER_MQH__

#include "CEDashboardContextBuilder.mqh"

#include "../Replay/CEReplaySession.mqh"
#include "../Replay/CEReplayRecorder.mqh"
#include "../Replay/CEReplaySnapshot.mqh"

#include "CEDashboardMode.mqh"

class CEDashboardController
{
private:

   CEDashboardContextBuilder m_builder;

   CEReplaySession           m_replay;
   CEReplayRecorder          m_recorder;
   
   CEDashboardMode m_mode;

public:

   CEDashboardController()
   {
      m_mode = DASHBOARD_MODE_REALTIME;
   }

   void Update(
      const CEAnalysisContext &context,
      CETradeJournalRepository &repository,
      const CEDashboardSettings &settings,
      CEDashboardContext &dashboard)
   {
      if(IsReplay())
      {
          CEReplaySnapshot snapshot;
      
          if(m_replay.Current(snapshot))
          {
               dashboard.Clear();
               dashboard = snapshot.Dashboard;
          }
      
          return;
      }

      //--------------------------------------
      // Build Dashboard
      //--------------------------------------

      m_builder.Build(
         context,
         repository,
         settings,
         dashboard);

      //--------------------------------------
      // Record Replay
      //--------------------------------------

      if(!dashboard.Empty())
      {
         CEReplaySnapshot snapshot;

         snapshot.Time      = TimeCurrent();
         snapshot.Symbol    = _Symbol;
         snapshot.Timeframe = (ENUM_TIMEFRAMES)_Period;

         snapshot.Dashboard = dashboard;
         snapshot.Journal   = repository.Last();

         m_recorder.Record(
            m_replay.Repository(),
            snapshot);

         CELogger::Info(
            CE_MODULE_REPLAY,
            "Replay snapshot recorded");
      }
   }

   // Replay control interface.
   // Used by Replay UI / Navigation only.
   CEReplaySession Replay() const
   {
      return m_replay;
   }
   
   void SetRealtime()
   {
      m_mode = DASHBOARD_MODE_REALTIME;
   
      m_replay.Stop();
   }
   
   void SetReplay()
   {
      m_mode = DASHBOARD_MODE_REPLAY;
   
      m_replay.Start();
   }
   
   CEDashboardMode Mode() const
   {
      return m_mode;
   }
   
   bool IsRealtime() const
   {
      return
         m_mode == DASHBOARD_MODE_REALTIME;
   }
   
   bool IsReplay() const
   {
      return
         m_mode == DASHBOARD_MODE_REPLAY;
   }
   
};

#endif