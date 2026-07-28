#ifndef __CE_CONTEXT_ENGINE_MQH__
#define __CE_CONTEXT_ENGINE_MQH__

#include "../Infrastructure/CEAnalyzerRegistry.mqh"

#include "../Data/CEDataProvider.mqh"

#include "../Core/CEAnalysisContext.mqh"
#include "../Core/CEAnalysisPipeline.mqh"

#include "../Domain/CEPriceSeries.mqh"
#include "../Domain/CECandle.mqh"

class CEContextEngine
{
private:

   CEDataProvider      m_provider;
   CEAnalysisContext   m_context;
   CEAnalysisPipeline  m_pipeline;

public:

   bool Initialize()
   {
      CEAnalyzerRegistry::Register(m_pipeline);

      return true;
   }

   bool Run()
   {
      if(!m_provider.GetPriceSeries(
            _Symbol,
            _Period,
            300,
            m_context.PriceSeries))
      {
         return false;
      }

      //-------------------------------------
      // Execute pipeline
      //-------------------------------------

      return m_pipeline.Run(m_context);
   }

   CEAnalysisContext Context()
   {
      return m_context;
   }
};

#endif