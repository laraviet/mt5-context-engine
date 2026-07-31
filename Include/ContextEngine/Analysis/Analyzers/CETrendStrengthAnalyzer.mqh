#ifndef __CE_TREND_STRENGTH_ANALYZER_MQH__
#define __CE_TREND_STRENGTH_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CETrendStrengthAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Trend Strength Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_TREND_SCORE;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      int confirmed = 0;

      CETrendType trend =
         context.Summary.Market.Trend;

      for(int i=0;i<context.BOSSeries.Count();i++)
      {
         CEBOSPoint bos =
            context.BOSSeries.At(i);

         if(!bos.IsConfirmed())
            continue;

         if(trend==TREND_UP &&
            bos.IsBullish())
         {
            confirmed++;
         }

         if(trend==TREND_DOWN &&
            bos.IsBearish())
         {
            confirmed++;
         }
      }

      int strength =
         confirmed * 25;

      if(strength>100)
         strength = 100;

      context.Summary.Market.Strength =
         strength;

      return true;
   }
};

#endif