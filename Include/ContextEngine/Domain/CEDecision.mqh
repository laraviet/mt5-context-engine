#ifndef __CE_DECISION_MQH__
#define __CE_DECISION_MQH__

#include "CEDecisionType.mqh"

class CEDecision
{
public:

   CEDecisionType Type;

   int Confidence;

   string Reason;

public:

   CEDecision()
   {
      Reset();
   }

   void Reset()
   {
      Type = DECISION_NONE;
      Confidence = 0;
      Reason = "";
   }
   
   bool IsBuy() const
   {
      return Type == DECISION_BUY;
   }
   
   bool IsSell() const
   {
      return Type == DECISION_SELL;
   }
   
   bool IsWait() const
   {
      return Type == DECISION_WAIT;
   }
   
   bool IsUnknown() const
   {
      return Type == DECISION_NONE;
   }
   
   bool IsTrade() const
   {
      return
         Type == DECISION_BUY ||
         Type == DECISION_SELL;
   }

};

#endif