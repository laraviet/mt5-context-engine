#ifndef __CE_BACKTEST_DASHBOARD_MQH__
#define __CE_BACKTEST_DASHBOARD_MQH__

class CEBacktestDashboard
{
public:

   bool Visible;

   bool Running;

   int RunCount;

   int TotalRuns;

   double Progress;

   double SuccessRate;

   double FailureRate;

   int ElapsedSeconds;

public:

   CEBacktestDashboard()
   {
      Reset();
   }

   void Reset()
   {
      Visible = false;

      Running = false;

      RunCount = 0;

      TotalRuns = 0;

      Progress = 0.0;

      SuccessRate = 0.0;

      FailureRate = 0.0;

      ElapsedSeconds = 0;
   }

};

#endif