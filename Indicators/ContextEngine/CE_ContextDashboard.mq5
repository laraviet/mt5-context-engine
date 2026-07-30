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
   CEAnalysisContext context = Engine.Context();
   int mitigated=0;

   for(int i=0;
       i<context.OrderBlockSeries.Count();
       i++)
   {
      if(context.OrderBlockSeries.At(i).Mitigated)
         mitigated++;
   }
   
   Print("Mitigated OB = ",mitigated);
   
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