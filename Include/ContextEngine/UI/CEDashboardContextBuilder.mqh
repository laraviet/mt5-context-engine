#ifndef __CE_DASHBOARD_CONTEXT_BUILDER_MQH__
#define __CE_DASHBOARD_CONTEXT_BUILDER_MQH__

#include "../Core/CEAnalysisContext.mqh"
#include "CEDashboardContext.mqh"

class CEDashboardContextBuilder
{
public:

   void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard)
   {
      dashboard.Title   = "Context Engine";
      dashboard.Version = "0.2.0";

      dashboard.Symbol    = analysis.Symbol;
      dashboard.Timeframe = EnumToString(analysis.Timeframe);
      dashboard.Status    = analysis.Status;

      dashboard.SwingCount     = analysis.SwingSeries.Count();
      dashboard.StructureCount = analysis.StructureSeries.Count();
      dashboard.TrendCount     = analysis.TrendSeries.Count();

      dashboard.TrendText = "UNKNOWN";
   }
};

#endif