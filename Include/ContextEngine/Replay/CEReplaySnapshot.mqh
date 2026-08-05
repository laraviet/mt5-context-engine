#ifndef __CE_REPLAY_SNAPSHOT_MQH__
#define __CE_REPLAY_SNAPSHOT_MQH__

#include "../UI/CEDashboardContext.mqh"
#include "../Journal/CETradeJournalEntry.mqh"

class CEReplaySnapshot
{
public:

   datetime Time;

   string Symbol;

   ENUM_TIMEFRAMES Timeframe;

   CEDashboardContext Dashboard;

   CETradeJournalEntry Journal;

public:

   CEReplaySnapshot()
   {
      Reset();
   }

   void Reset()
   {
      Time = 0;

      Symbol = "";

      Timeframe = PERIOD_CURRENT;

      Dashboard.Clear();

      Journal.Reset();
   }
   
   bool Empty() const
   {
      return Time == 0;
   }
   
   bool Valid() const
   {
      return !Empty();
   }

};

#endif