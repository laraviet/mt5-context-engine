#ifndef __CE_TRADE_QUALITY_MQH__
#define __CE_TRADE_QUALITY_MQH__

class CETradeQuality
{
public:

   bool Valid;

   int Score;

public:

   CETradeQuality()
   {
      Reset();
   }

   void Reset()
   {
      Valid = false;
      Score = 0;
   }
};

#endif