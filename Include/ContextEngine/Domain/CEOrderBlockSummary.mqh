#ifndef __CE_ORDER_BLOCK_SUMMARY_MQH__
#define __CE_ORDER_BLOCK_SUMMARY_MQH__

class CEOrderBlockSummary
{
public:

   int Total;

   int Bullish;
   int Bearish;

   int ActiveBullish;
   int ActiveBearish;

   int FilledBullish;
   int FilledBearish;

   double FillRatio;

public:

   CEOrderBlockSummary()
   {
      Reset();
   }

   void Reset()
   {
      Total = 0;

      Bullish = 0;
      Bearish = 0;

      ActiveBullish = 0;
      ActiveBearish = 0;

      FilledBullish = 0;
      FilledBearish = 0;

      FillRatio = 0.0;
   }

   int Active() const
   {
      return
         ActiveBullish +
         ActiveBearish;
   }

   int Filled() const
   {
      return
         FilledBullish +
         FilledBearish;
   }
};

#endif