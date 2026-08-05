#ifndef __CE_DASHBOARD_CONTROLLER_MQH__
#define __CE_DASHBOARD_CONTROLLER_MQH__

#include "../Core/CEAnalysisContext.mqh"

#include "CEDashboardContext.mqh"
#include "CEDashboardContextBuilder.mqh"
#include "CEDashboardMode.mqh"

#include "../Replay/CEReplaySession.mqh"
#include "../Replay/CEReplayRecorder.mqh"
#include "../Replay/CEReplaySnapshot.mqh"

class CEDashboardController
{
private:

   CEDashboardContextBuilder m_builder;

   CEReplaySession           m_replay;
   CEReplayRecorder          m_recorder;

   CEDashboardMode           m_mode;

public:

   CEDashboardController()
   {
      m_mode = DASHBOARD_MODE_REALTIME;
   }

   //==================================================
   // Dashboard Mode
   //==================================================

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

   //==================================================
   // Replay Navigation
   //==================================================

   bool FirstReplay()
   {
      if(!IsReplay())
         return false;

      return m_replay.First();
   }

   bool LastReplay()
   {
      if(!IsReplay())
         return false;

      return m_replay.Last();
   }

   bool NextReplay()
   {
      if(!IsReplay())
         return false;

      return m_replay.Next();
   }

   bool PreviousReplay()
   {
      if(!IsReplay())
         return false;

      return m_replay.Previous();
   }

   //==================================================
   // Replay State
   //==================================================

   bool HasReplay() const
   {
      return m_replay.HasReplay();
   }

   bool CanNext() const
   {
      return
         IsReplay() &&
         m_replay.CanNext();
   }

   bool CanPrevious() const
   {
      return
         IsReplay() &&
         m_replay.CanPrevious();
   }

   int ReplayIndex() const
   {
      return m_replay.CurrentIndex();
   }

   int ReplayCount() const
   {
      return m_replay.ReplayCount();
   }

   //==================================================
   // Update
   //==================================================

   void Update(
      const CEAnalysisContext      &context,
      CETradeJournalRepository     &repository,
      const CEDashboardSettings    &settings,
      CEDashboardContext           &dashboard)
   {
      if(IsReplay())
      {
         CEReplaySnapshot snapshot;

         if(!m_replay.Current(snapshot))
            return;

         dashboard.Clear();
         dashboard = snapshot.Dashboard;
         
         dashboard.ReplayInfo.Valid = true;

         dashboard.ReplayInfo.Time =
            snapshot.Time;
         
         dashboard.ReplayInfo.Symbol =
            snapshot.Symbol;
         
         dashboard.ReplayInfo.Timeframe =
            snapshot.Timeframe;
         
         dashboard.ReplayInfo.CurrentIndex =
            ReplayIndex();
         
         dashboard.ReplayInfo.TotalCount =
            ReplayCount();
      }
      else
      {
         m_builder.Build(
            context,
            repository,
            settings,
            dashboard);

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

      //--------------------------------------------
      // Replay Toolbar
      //--------------------------------------------

      dashboard.ReplayToolbar.Reset();

      dashboard.ReplayToolbar.Visible =
         IsReplay();

      dashboard.ReplayToolbar.HasReplay =
         HasReplay();

      dashboard.ReplayToolbar.CanPrevious =
         CanPrevious();

      dashboard.ReplayToolbar.CanNext =
         CanNext();

      dashboard.ReplayToolbar.CurrentIndex =
         ReplayIndex();

      dashboard.ReplayToolbar.TotalCount =
         ReplayCount();
   }

};

#endif