#ifndef __CE_ANALYSIS_CONTEXT_MQH__
#define __CE_ANALYSIS_CONTEXT_MQH__

#include "../Domain/CEPriceSeries.mqh"
#include "../Domain/CESwingSeries.mqh"
#include "../Domain/CEMarketStructureSeries.mqh"
#include "../Domain/CETrendSeries.mqh"
#include "CEContext.mqh"
#include "../Domain/CEContextSummary.mqh"
#include "../Domain/CEBOSSeries.mqh"
#include "../Domain/CEChochSeries.mqh"

class CEAnalysisContext : public CEContext
{
public:

   CEPriceSeries PriceSeries;

   CESwingSeries SwingSeries;

   CEMarketStructureSeries StructureSeries;

   CETrendSeries TrendSeries;
   
   CEContextSummary Summary;
   
   CEBOSSeries BOSSeries;
   
   CEChochSeries CHOCHSeries;

public:

   void Clear()
   {
      SwingSeries.Clear();

      StructureSeries.Clear();

      TrendSeries.Clear();
      
      Summary.Reset();
      
      BOSSeries.Clear();
      
      CHOCHSeries.Clear();
   }
};

#endif