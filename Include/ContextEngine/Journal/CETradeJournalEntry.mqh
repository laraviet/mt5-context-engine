#ifndef __CE_TRADE_JOURNAL_ENTRY_MQH__
#define __CE_TRADE_JOURNAL_ENTRY_MQH__

#include "../Domain/CETradeSetup.mqh"
#include "../Domain/CEDecision.mqh"

class CETradeJournalEntry
{
public:

   datetime Time;

   string Symbol;

   ENUM_TIMEFRAMES Timeframe;

   CEDecision Decision;

   CETradeSetup TradeSetup;

public:

   CETradeJournalEntry()
   {
      Reset();
   }

   void Reset()
   {
      Time = 0;

      Symbol = "";

      Timeframe = PERIOD_CURRENT;

      Decision.Reset();

      TradeSetup.Reset();
   }
};

#endif