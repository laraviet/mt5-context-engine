#ifndef __CE_CONTEXT_SUMMARY_MQH__
#define __CE_CONTEXT_SUMMARY_MQH__

#include "CEContextMarket.mqh"
#include "CEContextStatistics.mqh"
#include "CEContextScore.mqh"
#include "CEFVGSummary.mqh"
#include "CEMarketBias.mqh"

class CEContextSummary
{
public:

   CEContextMarket Market;

   CEContextStatistics Statistics;

   CEContextScore Score;
   
   CEFVGSummary FVG;
   
   CEMarketBias Bias;

   bool IsValid;

public:

   CEContextSummary()
   {
      Reset();
   }

   void Reset()
   {
      Market.Reset();

      Statistics.Reset();

      Score.Reset();
      
      FVG.Reset();
      
      Bias.Reset();

      IsValid = false;
   }
};

#endif