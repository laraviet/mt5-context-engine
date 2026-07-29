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
      
   int total = Engine.Context().FVGSeries.Count();

   int filled = 0;
   
   int active = 0;
   
   for(int i = 0; i < total; i++)
   {
      CEFVGPoint point =
         Engine.Context().FVGSeries.At(i);
   
      if(point.Filled)
         filled++;
      else
         active++;
   }
   
   Print("================================");
   
   Print("Total FVG   : ", total);
   
   Print("Filled FVG : ", filled);
   
   Print("Active FVG : ", active);
   
   Print("================================");
   
   for(int i = 0; i < Engine.Context().FVGSeries.Count(); i++)
   {
      CEFVGPoint point = Engine.Context().FVGSeries.At(i);
   
      if(!point.Filled)
      {
         Print(
            "ACTIVE : ",
            TimeToString(point.Time),
            " Gap=",
            DoubleToString(point.Gap, _Digits));
      }
   }
   
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