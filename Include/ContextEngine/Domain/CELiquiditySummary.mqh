#ifndef __CE_LIQUIDITY_SUMMARY_MQH__
#define __CE_LIQUIDITY_SUMMARY_MQH__

class CELiquiditySummary
{
public:

   int Total;

   int BuySide;

   int SellSide;

   int Untouched;

public:

   CELiquiditySummary()
   {
      Reset();
   }

   void Reset()
   {
      Total      = 0;
      BuySide    = 0;
      SellSide   = 0;
      Untouched  = 0;
   }
};

#endif