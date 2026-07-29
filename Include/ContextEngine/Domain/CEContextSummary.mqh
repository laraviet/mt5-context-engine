#ifndef __CE_CONTEXT_SUMMARY_MQH__
#define __CE_CONTEXT_SUMMARY_MQH__

#include "CETrendPoint.mqh"

class CEContextSummary
{
public:

   CETrendType Trend;

   CETrendStrength Strength;

   int SwingCount;

   int StructureCount;

   int TrendCount;

   bool IsValid;

public:

   CEContextSummary()
   {
      Reset();
   }

   void Reset()
   {
      Trend = TREND_UNKNOWN;

      Strength = TREND_STRENGTH_UNKNOWN;

      SwingCount = 0;

      StructureCount = 0;

      TrendCount = 0;

      IsValid = false;
   }
};

#endif