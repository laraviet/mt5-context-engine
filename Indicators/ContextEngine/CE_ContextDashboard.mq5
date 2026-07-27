#property strict
#property indicator_chart_window
#property indicator_plots 0
#property version "0.2.0"

#include <ContextEngine/UI/DashboardRenderer.mqh>
#include <ContextEngine/Core/CEContext.mqh>
#include <ContextEngine/Domain/CECandle.mqh>
#include <ContextEngine/Domain/CEPriceSeries.mqh>
#include <ContextEngine/Data/CEDataProvider.mqh>
#include <ContextEngine/Analysis/CESwingDetector.mqh>

CDashboardRenderer Dashboard;
CEContext Context;
CESwingDetector SwingDetector;


int OnInit()
{
   CEDataProvider Provider;
   CECandle candles[];

   Context.UpdateChart();
   Context.Status = "READY";
   Dashboard.Create();
   Dashboard.Update(Context);
   
   Provider.GetCandles(
      _Symbol,
      _Period,
      20,
      candles);
      
   CEPriceSeries series;

   series.Set(candles);
   
   for(int i = 0; i < series.Count(); i++)
   {
      if(SwingDetector.IsSwingHigh(series, i))
         Print("Swing High: ", i);
   
      if(SwingDetector.IsSwingLow(series, i))
         Print("Swing Low: ", i);
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