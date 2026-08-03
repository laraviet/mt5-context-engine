#ifndef __CE_TRADE_JOURNAL_MAPPER_MQH__
#define __CE_TRADE_JOURNAL_MAPPER_MQH__

#include "../Core/CEAnalysisContext.mqh"
#include "CETradeJournalEntry.mqh"

class CETradeJournalMapper
{
public:

   static CETradeJournalEntry Map(
      const CEAnalysisContext &context)
   {
      CETradeJournalEntry entry;

      //---------------------------------
      // Basic
      //---------------------------------

      entry.Time =
         context.CandleSeries.At(0).Time;

      entry.Symbol =
         context.Symbol;

      entry.Timeframe =
         context.Timeframe;

      //---------------------------------
      // Decision
      //---------------------------------

      entry.Decision =
         context.Decision;

      //---------------------------------
      // Trade Setup
      //---------------------------------

      entry.TradeSetup =
         context.TradeSetup;

      return entry;
   }
};

#endif