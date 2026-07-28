#property strict
#property indicator_chart_window
#property indicator_plots 0
#property version "0.2.0"

#include <ContextEngine/Core/CEContextEngine.mqh>
#include <ContextEngine/UI/DashboardRenderer.mqh>

CEContextEngine Engine;
CDashboardRenderer Dashboard;

int OnInit()
{
   Engine.Initialize();

   Engine.Run();

   return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason)
{
   Dashboard.Destroy();
}

int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   return(rates_total);
}