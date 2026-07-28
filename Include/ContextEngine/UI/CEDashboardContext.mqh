#ifndef __CE_DASHBOARD_CONTEXT_MQH__
#define __CE_DASHBOARD_CONTEXT_MQH__

class CEDashboardContext
{
public:

   string Title;
   string Version;

   string Symbol;
   string Timeframe;
   string Status;

   int SwingCount;
   int StructureCount;
   int TrendCount;

   string TrendText;
};

#endif