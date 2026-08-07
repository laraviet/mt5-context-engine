#ifndef __CE_BACKTEST_DASHBOARD_BUILDER_MQH__
#define __CE_BACKTEST_DASHBOARD_BUILDER_MQH__

#include "CEBacktestReport.mqh"
#include "CEBacktestDashboard.mqh"

class CEBacktestDashboardBuilder
{
public:

   void Build(
      const CEBacktestReport &report,
      const bool running,
      CEBacktestDashboard &dashboard)
   {
      dashboard.Reset();

      dashboard.Visible = true;

      dashboard.Running = running;

      dashboard.RunCount = report.RunCount;

      dashboard.TotalRuns = report.TotalRuns;

      dashboard.Progress = report.Progress();

      dashboard.SuccessRate = report.SuccessRate();

      dashboard.FailureRate = report.FailureRate();

      dashboard.ElapsedSeconds = report.ElapsedSeconds();
   }

};

#endif