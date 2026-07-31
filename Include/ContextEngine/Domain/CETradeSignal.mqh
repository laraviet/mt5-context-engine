#ifndef __CE_TRADE_SIGNAL_MQH__
#define __CE_TRADE_SIGNAL_MQH__

#include "CETradeSignalType.mqh"

class CETradeSignal
{
public:

   CETradeSignalType Type;

   int Confidence;

public:

   CETradeSignal()
   {
      Reset();
   }

   void Reset()
   {
      Type = SIGNAL_NONE;
      Confidence = 0;
   }

   bool IsValid() const
   {
      return Type != SIGNAL_NONE;
   }
};

#endif