#ifndef __CE_TRADE_ENTRY_MQH__
#define __CE_TRADE_ENTRY_MQH__

#include "CETradeEntrySource.mqh"

class CETradeEntry
{
public:

   bool Valid;

   double Price;
   
   CETradeEntrySource Source;

public:

   CETradeEntry()
   {
      Reset();
   }

   void Reset()
   {
      Valid = false;
      Price = 0.0;
      Source = ENTRY_SOURCE_UNKNOWN;
   }
};

#endif