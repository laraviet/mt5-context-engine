#ifndef __CE_TRADE_ENTRY_MQH__
#define __CE_TRADE_ENTRY_MQH__

class CETradeEntry
{
public:

   bool Valid;

   double Price;

public:

   CETradeEntry()
   {
      Reset();
   }

   void Reset()
   {
      Valid = false;
      Price = 0.0;
   }
};

#endif