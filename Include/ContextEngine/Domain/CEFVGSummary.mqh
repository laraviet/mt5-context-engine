#ifndef __CE_FVG_SUMMARY_MQH__
#define __CE_FVG_SUMMARY_MQH__

class CEFVGSummary
{
public:

   int Total;
   int Filled;
   int Active;

   double LargestGap;
   double AverageGap;
   double FillRatio;

public:

   void Reset()
   {
      Total = 0;
      Filled = 0;
      Active = 0;

      LargestGap = 0.0;
      AverageGap = 0.0;
      FillRatio = 0.0;
   }
};

#endif