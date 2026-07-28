#property strict
#property indicator_chart_window
#property indicator_plots 0
#property version "0.2.0"

#include <ContextEngine/Core/CEContextEngine.mqh>
#include <ContextEngine/UI/DashboardRenderer.mqh>
#include <ContextEngine/UI/CEDashboardContext.mqh>
#include <ContextEngine/UI/CEDashboardContextBuilder.mqh>
#include <ContextEngine/Core/CEContext.mqh>
#include <ContextEngine/Config/CEEngineConfig.mqh>

CDashboardRenderer Dashboard;
CEContext Context;

int OnInit()
{   
   CEEngineConfig config;   
   config.Swing.Strength = 2;
   CEContextEngine Engine(config);
   
   Engine.Initialize();

   Engine.Run();
   
   CEDashboardContext dashboard;
   CEDashboardContextBuilder builder;
   
   builder.Build(
      Engine.Context(),
      dashboard);
   
   Dashboard.Update(dashboard);   

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