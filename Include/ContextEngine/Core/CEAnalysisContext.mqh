#ifndef __CE_ANALYSIS_CONTEXT_MQH__
#define __CE_ANALYSIS_CONTEXT_MQH__

#include "../Domain/CESwingSeries.mqh"
#include "../Domain/CEMarketStructureSeries.mqh"
#include "../Domain/CETrendSeries.mqh"
#include "CEContext.mqh"
#include "../Domain/CEContextSummary.mqh"
#include "../Domain/CEBOSSeries.mqh"
#include "../Domain/CEChochSeries.mqh"
#include "../Domain/CELiquiditySeries.mqh"
#include "../Domain/CEFVGSeries.mqh"
#include "../Domain/CECandleSeries.mqh"
#include "../Domain/CEOrderBlockSeries.mqh"
#include "../Domain/CEDecision.mqh"
#include "../Domain/CETradeSignal.mqh"

#include "../Domain/CETradeEntry.mqh"
#include "../Domain/CEStopLoss.mqh"
#include "../Domain/CETakeProfit.mqh"
#include "../Domain/CETradeSetup.mqh"

class CEAnalysisContext : public CEContext
{
public:

   CESwingSeries SwingSeries;

   CEMarketStructureSeries StructureSeries;

   CETrendSeries TrendSeries;
   
   CEContextSummary Summary;
   
   CEBOSSeries BOSSeries;
   
   CEChochSeries CHOCHSeries;
   
   CELiquiditySeries LiquiditySeries;
   
   CEFVGSeries FVGSeries;
   
   CECandleSeries CandleSeries;
   
   CEOrderBlockSeries OrderBlockSeries;
   
   CEDecision Decision;
   
   CETradeSignal TradeSignal;
   
   CETradeEntry TradeEntry;
   
   CEStopLoss StopLoss;
   
   CETakeProfit TakeProfit;
   
   CETradeSetup TradeSetup;

public:

   void Clear()
   {
      ClearAll();
   }
   
   void ClearAnalysis()
   {
      SwingSeries.Clear();

      StructureSeries.Clear();

      TrendSeries.Clear();

      BOSSeries.Clear();

      CHOCHSeries.Clear();

      LiquiditySeries.Clear();

      FVGSeries.Clear();

      Summary.Reset();
      
      OrderBlockSeries.Clear();
      
      Decision.Reset();
      
      TradeSignal.Reset();
      
      TradeEntry.Reset();
      
      StopLoss.Reset();
      
      TakeProfit.Reset();
      
      TradeSetup.Reset();
   }

   void ClearInput()
   {

      CandleSeries.Clear();
   }

   void ClearAll()
   {
      ClearAnalysis();

      ClearInput();
   }
   
};

#endif