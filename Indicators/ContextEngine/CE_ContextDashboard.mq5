#property strict
#property indicator_chart_window
#property indicator_plots 0
#property version "0.2.0"

#include <ContextEngine/UI/DashboardRenderer.mqh>
#include <ContextEngine/Core/CEContext.mqh>
#include <ContextEngine/Domain/CECandle.mqh>
#include <ContextEngine/Data/CEDataProvider.mqh>

CDashboardRenderer Dashboard;
CEContext Context;
CEDataProvider Provider;
CECandle Candle;

int OnInit()
{
   Context.UpdateChart();
   Context.Status = "READY";
   Dashboard.Create();
   Dashboard.Update(Context);
   
   if(Provider.GetLatestCandle(Candle))
   {
      Print("Open  : ", Candle.Open);
      Print("High  : ", Candle.High);
      Print("Low   : ", Candle.Low);
      Print("Close : ", Candle.Close);
   }
   else
   {
      Print("CopyRates failed.");
   }

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