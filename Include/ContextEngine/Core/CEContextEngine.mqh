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

#include "../Analysis/Validators/CEContextValidator.mqh"

#include "../Export/CETradeSetupCsvExporter.mqh"

#include "../Journal/CETradeJournalRepository.mqh"
#include "../Journal/CETradeJournalMapper.mqh"

class CEContextEngine
{
private:

   CEDataProvider      m_provider;
   CEAnalysisContext   m_context;
   CEAnalysisPipeline  m_pipeline;
   CEEngineConfig m_config;
   CEContextValidator m_validator;
   CETradeSetupCsvExporter *m_exporter;
   CETradeJournalRepository m_journal;

public:

   CEContextEngine(
      const CEEngineConfig &config)
   {
      m_config = config;
      m_exporter = NULL;
   }

   bool Initialize()
   {
      CEAnalyzerRegistry registry(m_pipeline);
   
      registry.Register(m_config);        
      
      if(m_config.Export.Enabled)
      {
         m_exporter =
            new CETradeSetupCsvExporter(
               m_config.Export.FileName);
      }    
   
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
         
      if(!m_validator.Validate(m_context))
         return false;
         
      if(!UpdateJournal())
         return false;
         
      if(!Export())
         return false;
   
      return true;
   }
   
   bool Export()
   {
      if(m_exporter==NULL)
         return true;
   
      return m_exporter.Export(m_journal.Last());
   }

   CEAnalysisContext Context() const
   {
      return m_context;
   }
   
   CETradeJournalRepository Journal() const
   {
      return m_journal;
   }
   
   bool UpdateJournal()
   {
      CETradeJournalEntry entry =
         CETradeJournalMapper::Map(
            m_context);
   
      return
         m_journal.Add(entry);
   }
   
   ~CEContextEngine()
   {
      if(m_exporter!=NULL)
      {
         delete m_exporter;
   
         m_exporter = NULL;
      }
   }      
   
};

#endif