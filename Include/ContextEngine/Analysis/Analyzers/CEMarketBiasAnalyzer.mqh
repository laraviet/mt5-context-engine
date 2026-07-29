#ifndef __CE_MARKET_BIAS_ANALYZER_MQH__
#define __CE_MARKET_BIAS_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CEMarketBiasAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Market Bias Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_MARKET_BIAS;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_DEFAULT;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.Summary.Bias.Reset();      

      switch(context.Summary.Market.Trend)
      {
         case TREND_UP:

            if(context.Summary.Market.Strength ==
               TREND_STRENGTH_STRONG)
            {
               context.Summary.Bias.Type =
                  MARKET_BIAS_BULLISH;
            }
            else
            {
               context.Summary.Bias.Type =
                  MARKET_BIAS_NEUTRAL;
            }

            break;

         case TREND_DOWN:

            if(context.Summary.Market.Strength ==
               TREND_STRENGTH_STRONG)
            {
               context.Summary.Bias.Type =
                  MARKET_BIAS_BEARISH;
            }
            else
            {
               context.Summary.Bias.Type =
                  MARKET_BIAS_NEUTRAL;
            }

            break;

         case TREND_RANGE:

            context.Summary.Bias.Type =
               MARKET_BIAS_NEUTRAL;

            break;

         default:

            context.Summary.Bias.Type =
               MARKET_BIAS_UNKNOWN;

            break;
      }

      return true;
   }
};

#endif