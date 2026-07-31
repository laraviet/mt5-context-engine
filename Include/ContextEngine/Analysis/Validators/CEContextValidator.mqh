#ifndef __CE_CONTEXT_VALIDATOR_MQH__
#define __CE_CONTEXT_VALIDATOR_MQH__

#include "../../Core/CEAnalysisContext.mqh"
#include "../../Core/CELogger.mqh"
#include "../../Constants.mqh"

class CEContextValidator
{
private:

   bool ValidateTrend(
      const CEAnalysisContext &context)
   {
      if(context.TrendSeries.Count()==0)
      {
         CELogger::Warn(
            CE_MODULE_ANALYZER,
            "[Validator] TrendSeries is empty.");

         return false;
      }

      return true;
   }

   bool ValidateSwing(
      const CEAnalysisContext &context)
   {
      if(context.SwingSeries.Count()==0)
      {
         CELogger::Warn(
            CE_MODULE_ANALYZER,
            "[Validator] SwingSeries is empty.");

         return false;
      }

      return true;
   }

   bool ValidateScore(
      const CEAnalysisContext &context)
   {
      if(context.Summary.Score.Total<0 ||
         context.Summary.Score.Total>100)
      {
         CELogger::Error(
            CE_MODULE_ANALYZER,
            "[Validator] Invalid Context Score.");

         return false;
      }

      return true;
   }

public:

   bool Validate(
      const CEAnalysisContext &context)
   {
      CELogger::Info(
         CE_MODULE_ANALYZER,
         "========== Context Validation ==========");

      bool ok = true;

      ok &= ValidateSwing(context);

      ok &= ValidateTrend(context);

      ok &= ValidateScore(context);

      if(ok)
      {
         CELogger::Info(
            CE_MODULE_ANALYZER,
            "[Validator] PASSED");
      }
      else
      {
         CELogger::Warn(
            CE_MODULE_ANALYZER,
            "[Validator] FAILED");
      }

      return ok;
   }
};

#endif