#ifndef __CE_REPLAY_RECORDER_MQH__
#define __CE_REPLAY_RECORDER_MQH__

#include "CEReplayRepository.mqh"

class CEReplayRecorder
{
public:

   //
   // Replay recorder.
   //
   // Converts runtime data into
   // replay snapshots.
   //

   void Record(
      CEReplayRepository &repository,
      const CEReplaySnapshot &snapshot)
   {
      if(!snapshot.Valid())
         return;

      repository.Add(snapshot);
   }

   void Record(
      CEReplayRepository &repository,
      const datetime time,
      const string symbol,
      const ENUM_TIMEFRAMES timeframe,
      const CEDashboardContext &dashboard,
      const CETradeJournalEntry &journal)
   {
      CEReplaySnapshot snapshot;
      
      if(snapshot.Dashboard.Empty())
         return;
         
      if(snapshot.Time == 0)
         return;
         
      if(snapshot.Symbol == "")
         return;
         
      if(snapshot.Timeframe <= PERIOD_CURRENT)
         return;

      snapshot.Time      = time;
      snapshot.Symbol    = symbol;
      snapshot.Timeframe = timeframe;
      snapshot.Dashboard = dashboard;
      snapshot.Journal   = journal;

      Record(
         repository,
         snapshot);
   }

   void Clear(
      CEReplayRepository &repository)
   {
      repository.Clear();
   }
};

#endif