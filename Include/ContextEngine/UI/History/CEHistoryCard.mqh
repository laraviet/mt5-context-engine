#ifndef __CE_HISTORY_CARD_MQH__
#define __CE_HISTORY_CARD_MQH__

#include "../../Domain/CEDecision.mqh"

class CEHistoryCard
{
public:

   datetime Time;

   string Symbol;

   ENUM_TIMEFRAMES Timeframe;

   CEDecisionType Decision;

   int Score;

   double Quality;

   double Ratio;

public:

   CEHistoryCard()
   {
      Reset();
   }

   void Reset()
   {
      Time = 0;

      Symbol = "";

      Timeframe = PERIOD_CURRENT;

      Decision = DECISION_WAIT;

      Score = 0;

      Quality = 0;

      Ratio = 0;
   }

   bool IsTrade() const
   {
      return
         Decision == DECISION_BUY
         ||
         Decision == DECISION_SELL;
   }

   string DecisionText() const
   {
      switch(Decision)
      {
         case DECISION_BUY:

            return "BUY";

         case DECISION_SELL:

            return "SELL";

         default:

            return "WAIT";
      }
   }
};

#endif