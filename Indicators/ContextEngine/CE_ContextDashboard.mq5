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
#include <ContextEngine/Domain/CEMarketStructurePoint.mqh>
#include <ContextEngine/Domain/CEMarketStructureSeries.mqh>
#include <ContextEngine/Analysis/CEMarketStructureDetector.mqh>
#include <ContextEngine/Analysis/CEBOSDetector.mqh>
#include <ContextEngine/Domain/CETrendSeries.mqh>
#include <ContextEngine/Analysis/CETrendDetector.mqh>

CDashboardRenderer Dashboard;
CEContext Context;
CESwingDetector SwingDetector;
CEMarketStructureDetector StructureDetector;
CEBOSDetector BOSDetector;
CETrendDetector TrendDetector;


int OnInit()
{
   CEDataProvider provider;

   CECandle candles[];
   
   provider.GetCandles(
         _Symbol,
         _Period,
         50,
         candles);
   
   CEPriceSeries series;
   series.Set(candles);
   
   CESwingDetector detector;
   
   CESwingSeries swings;
   
   int count = detector.Detect(
                  series,
                  swings);
   
   CEMarketStructureSeries structures;

   StructureDetector.Detect(
      swings,
      structures);
   
   BOSDetector.Detect(StructureDetector);
   
   CETrendSeries trends;

   TrendDetector.Detect(
      structures,
      trends);
   
   for(int i = 0; i < trends.Count(); i++)
   {
      CETrendPoint trend = trends.At(i);
   
      Print(
         trend.Index,
         " ",
         EnumToString(trend.TrendType));
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