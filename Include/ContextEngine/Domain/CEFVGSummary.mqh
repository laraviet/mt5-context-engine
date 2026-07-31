#ifndef __CE_FVG_SUMMARY_MQH__
#define __CE_FVG_SUMMARY_MQH__

class CEFVGSummary
{
public:

   int Total;

   int Bullish;
   int Bearish;

   int ActiveBullish;
   int ActiveBearish;

   int FilledBullish;
   int FilledBearish;

   double LargestGap;
   double AverageGap;
   double FillRatio;

public:

   CEFVGSummary()
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

      LargestGap = 0.0;
      AverageGap = 0.0;
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