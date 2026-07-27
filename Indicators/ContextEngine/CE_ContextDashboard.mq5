#property strict
#property indicator_chart_window
#property indicator_plots 0
#property version "0.2.0"

#include <ContextEngine/UI/DashboardRenderer.mqh>
#include <ContextEngine/Core/CEContext.mqh>
#include <ContextEngine/Domain/CECandle.mqh>
#include <ContextEngine/Domain/CEPriceSeries.mqh>
#include <ContextEngine/Data/CEDataProvider.mqh>
#include <ContextEngine/Analysis/CESwingAnalyzer.mqh>
#include <ContextEngine/Domain/CEMarketStructurePoint.mqh>
#include <ContextEngine/Domain/CEMarketStructureSeries.mqh>
#include <ContextEngine/Analysis/CEMarketStructureDetector.mqh>
#include <ContextEngine/Analysis/CEBOSDetector.mqh>
#include <ContextEngine/Domain/CETrendSeries.mqh>
#include <ContextEngine/Analysis/CETrendDetector.mqh>
#include <ContextEngine/Core/CEAnalysisPipeline.mqh>
#include <ContextEngine/Core/CEAnalysisContext.mqh>
#include <ContextEngine/Infrastructure/CEAnalyzerRegistry.mqh>

CDashboardRenderer Dashboard;
CEContext Context;
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
   
   CEAnalysisPipeline pipeline;
   
   CEAnalyzerRegistry::Register(pipeline);

   Print(
      "Analyzer Count = ",
      pipeline.Count());
      
   CEAnalysisContext context;

   context.PriceSeries = series;   
   
   pipeline.Run(context);
   
   Print(
      "Swing Count = ",
      context.SwingSeries.Count());

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