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
};

#endif