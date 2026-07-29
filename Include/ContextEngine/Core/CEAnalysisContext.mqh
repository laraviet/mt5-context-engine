#ifndef __CE_ANALYSIS_CONTEXT_MQH__
#define __CE_ANALYSIS_CONTEXT_MQH__

#include "../Domain/CEPriceSeries.mqh"
#include "../Domain/CESwingSeries.mqh"
#include "../Domain/CEMarketStructureSeries.mqh"
#include "../Domain/CETrendSeries.mqh"
#include "CEContext.mqh"
#include "../Domain/CEContextSummary.mqh"

class CEAnalysisContext : public CEContext
{
public:

   CEPriceSeries PriceSeries;

   CESwingSeries SwingSeries;

   CEMarketStructureSeries StructureSeries;

   CETrendSeries TrendSeries;
   
   CEContextSummary Summary;

public:

   void Clear()
   {
      SwingSeries.Clear();

      StructureSeries.Clear();

      TrendSeries.Clear();
      
      Summary.Reset();
   }
};

#endif