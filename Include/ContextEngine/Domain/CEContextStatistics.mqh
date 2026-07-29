#ifndef __CE_CONTEXT_STATISTICS_MQH__
#define __CE_CONTEXT_STATISTICS_MQH__

class CEContextStatistics
{
public:

   int SwingCount;

   int StructureCount;

   int TrendCount;

public:

   CEContextStatistics()
   {
      Reset();
   }

   void Reset()
   {
      SwingCount = 0;

      StructureCount = 0;

      TrendCount = 0;
   }
};

#endif