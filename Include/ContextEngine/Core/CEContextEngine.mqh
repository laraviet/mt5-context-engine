#ifndef __CE_CONTEXT_ENGINE_MQH__
#define __CE_CONTEXT_ENGINE_MQH__

#include "../Infrastructure/CEAnalyzerRegistry.mqh"
#include "../Infrastructure/Loaders/CECandleLoader.mqh"

#include "../Data/CEDataProvider.mqh"

#include "../Core/CEAnalysisContext.mqh"
#include "../Core/CEAnalysisPipeline.mqh"

#include "../Domain/CECandle.mqh"
#include "../Constants.mqh"
#include "../Core/CELogger.mqh"
#include "../Config/CEEngineConfig.mqh"

class CEContextEngine
{
private:

   CEDataProvider      m_provider;
   CEAnalysisContext   m_context;
   CEAnalysisPipeline  m_pipeline;
   CEEngineConfig m_config;

public:

   CEContextEngine(
      const CEEngineConfig &config)
   {
      m_config = config;
   }

   bool Initialize()
   {
      CEAnalyzerRegistry registry(m_pipeline);
   
      registry.Register(m_config);            
   
      return true;
   }
   
   bool Load()
   {
      CELogger::Info(
         CE_MODULE_ENGINE,
         "Load");
         
      m_context.UpdateChart();
         
      CECandleLoader loader;

      return loader.Load(
         m_context.Symbol,
         m_context.Timeframe,
         m_config.Candle.MaxBars,
         m_context.CandleSeries);
   }
   
   bool Analyze()
   {
      CELogger::Info(
         CE_MODULE_ENGINE,
         "Analyze");
      return m_pipeline.Run(m_context);
   }

   bool Run()
   {
      if(!Load())
         return false;

      if(!Analyze())
         return false;
   
      return true;
   }

   CEAnalysisContext Context()
   {
      return m_context;
   }
};

#endif