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


int OnInit()
{
   CEDataProvider Provider;
   CECandle candles[];

   Context.UpdateChart();
   Context.Status = "READY";
   Dashboard.Create();
   Dashboard.Update(Context);
   
   if(Provider.GetCandles(
      _Symbol,
      _Period,
      5,
      candles))
   {
      for(int i = 0; i < ArraySize(candles); i++)
      {
         Print(
            i,
            "  ",
            TimeToString(candles[i].Time),
            "  O=",
            candles[i].Open,
            "  H=",
            candles[i].High,
            "  L=",
            candles[i].Low,
            "  C=",
            candles[i].Close);
      }
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