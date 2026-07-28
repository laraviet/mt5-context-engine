#ifndef __CE_ANALYSIS_CONTEXT_MQH__
#define __CE_ANALYSIS_CONTEXT_MQH__

#include "../Domain/CEPriceSeries.mqh"
#include "../Domain/CESwingSeries.mqh"
#include "../Domain/CEMarketStructureSeries.mqh"
#include "../Domain/CETrendSeries.mqh"
#include "CEContext.mqh"

class CEAnalysisContext : public CEContext
{
public:

   CEPriceSeries PriceSeries;

   CESwingSeries SwingSeries;

   CEMarketStructureSeries StructureSeries;

   CETrendSeries TrendSeries;

public:

   void Clear()
   {
      SwingSeries.Clear();

      StructureSeries.Clear();

      TrendSeries.Clear();
   }
};

#endif