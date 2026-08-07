#ifndef __CE_BACKTEST_REPORT_MQH__
#define __CE_BACKTEST_REPORT_MQH__

class CEBacktestReport
{
public:

   int RunCount;

   int SuccessCount;

   int FailedCount;

   int TotalRuns;

   datetime StartTime;

   datetime FinishTime;

public:

   CEBacktestReport()
   {
      Reset();
   }

   void Reset()
   {
      RunCount = 0;

      SuccessCount = 0;

      FailedCount = 0;

      TotalRuns = 0;

      StartTime = 0;

      FinishTime = 0;
   }

   void Start()
   {
      StartTime = TimeCurrent();

      FinishTime = 0;
   }

   void Finish()
   {
      FinishTime = TimeCurrent();
   }

   void Update(
      const bool success)
   {
      ++RunCount;

      if(success)
         ++SuccessCount;
      else
         ++FailedCount;
   }

   bool Empty() const
   {
      return
         RunCount == 0;
   }

   bool Finished() const
   {
      if(TotalRuns <= 0)
         return false;

      return
         RunCount >= TotalRuns;
   }

   double Progress() const
   {
      if(TotalRuns <= 0)
         return 0.0;

      return
         (double)RunCount /
         (double)TotalRuns;
   }

   double SuccessRate() const
   {
      if(RunCount == 0)
         return 0.0;

      return
         (double)SuccessCount /
         (double)RunCount;
   }

   double FailureRate() const
   {
      if(RunCount == 0)
         return 0.0;

      return
         (double)FailedCount /
         (double)RunCount;
   }

   bool HasSuccess() const
   {
      return
         SuccessCount > 0;
   }

   bool HasFailures() const
   {
      return
         FailedCount > 0;
   }

   int ElapsedSeconds() const
   {
      if(StartTime == 0)
         return 0;

      datetime endTime =
         FinishTime;

      if(endTime == 0)
         endTime = TimeCurrent();

      return
         (int)(endTime - StartTime);
   }

};

#endif