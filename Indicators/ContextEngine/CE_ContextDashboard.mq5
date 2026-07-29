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

#include <ContextEngine/Domain/CETrendSeries.mqh>
#include <ContextEngine/Domain/CELiquidityPoint.mqh>

CDashboardRenderer Dashboard;
CEContext Context;

int OnInit()
{   
   CEEngineConfig config;
   CEContextEngine Engine(config);
   
   Engine.Initialize();

   Engine.Run();
   
   CEDashboardContext dashboard;
   CEDashboardContextBuilder builder;
   
   builder.Build(
      Engine.Context(),
      dashboard);
      
   Print("==============================");

   Print("Total      : ", Engine.Context().Summary.FVG.Total);
   
   Print("Filled     : ", Engine.Context().Summary.FVG.Filled);
   
   Print("Active     : ", Engine.Context().Summary.FVG.Active);
   
   Print("LargestGap : ", Engine.Context().Summary.FVG.LargestGap);
   
   Print("AverageGap : ", Engine.Context().Summary.FVG.AverageGap);
   
   Print("FillRatio  : ", Engine.Context().Summary.FVG.FillRatio);
   
   Print("==============================");
   
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