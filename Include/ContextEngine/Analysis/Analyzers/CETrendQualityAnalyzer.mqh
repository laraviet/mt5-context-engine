#ifndef __CE_TREND_QUALITY_ANALYZER_MQH__
#define __CE_TREND_QUALITY_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"
#include "../../Core/CEAnalysisContext.mqh"
#include "../../Constants.mqh"

class CETrendQualityAnalyzer : public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Trend Quality Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_TREND_QUALITY;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      CETrendType trend =
         context.Summary.Market.Trend;

      int total = 0;
      int aligned = 0;

      for(int i=context.BOSSeries.Count()-1;
          i>=0 && total<5;
          i--)
      {
         CEBOSPoint bos =
            context.BOSSeries.At(i);

         if(!bos.IsConfirmed())
            continue;

         total++;

         if(trend==TREND_UP &&
            bos.IsBullish())
            aligned++;

         if(trend==TREND_DOWN &&
            bos.IsBearish())
            aligned++;
      }

      int quality = 0;

      if(total>0)
         quality =
            (aligned*100)/total;

      context.Summary.Market.Quality =
         quality;

      return true;
   }
};

#endif