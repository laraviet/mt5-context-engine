#ifndef __CE_HISTORY_CARD_BUILDER_MQH__
#define __CE_HISTORY_CARD_BUILDER_MQH__

#include "../../Journal/CETradeJournalEntry.mqh"
#include "CEHistoryCard.mqh"

class CEHistoryCardBuilder
{
public:

   static CEHistoryCard Build(
      const CETradeJournalEntry &entry)
   {
      CEHistoryCard card;

      card.Time =
         entry.Time;

      card.Symbol =
         entry.Symbol;

      card.Timeframe =
         entry.Timeframe;

      card.Decision =
         entry.Decision.Type;

      card.Score =
         entry.Decision.Confidence;

      card.Quality =
         entry.TradeSetup.Quality.Score;

      card.Ratio =
         entry.TradeSetup.RiskReward.Ratio;

      return card;
   }
};

#endif