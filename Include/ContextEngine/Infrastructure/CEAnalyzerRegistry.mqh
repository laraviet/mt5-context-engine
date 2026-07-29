#ifndef __CE_ANALYZER_REGISTRY_MQH__
#define __CE_ANALYZER_REGISTRY_MQH__

#include "../Core/CEAnalysisPipeline.mqh"
#include "../Analysis/Analyzers/CESwingAnalyzer.mqh"
#include "../Analysis/Analyzers/CEStructureAnalyzer.mqh"
#include "../Analysis/Detectors/CEMarketStructureDetector.mqh"
#include "../Analysis/Analyzers/CETrendAnalyzer.mqh"
#include "CEDetectorRegistry.mqh"
#include "../Factories/CESwingAnalyzerFactory.mqh"
#include "../Factories/CEStructureAnalyzerFactory.mqh"
#include "../Factories/CETrendAnalyzerFactory.mqh"
#include "../Analysis/Analyzers/CEContextSummaryAnalyzer.mqh"
#include "../Factories/CEContextSummaryAnalyzerFactory.mqh"
#include "../Factories/CEScoreAnalyzerFactory.mqh"
#include "../Factories/CEBOSAnalyzerFactory.mqh"
#include "../Factories/CEChochAnalyzerFactory.mqh"

class CEAnalyzerRegistry
{
private:

   CEAnalysisPipeline *m_pipeline;
   
public:

   CEAnalyzerRegistry(CEAnalysisPipeline &pipeline)
   {
      m_pipeline = &pipeline;
   }
   
    bool Register(const CEEngineConfig &config)
   {
      m_pipeline.Add(
         CESwingAnalyzerFactory::Create(config));

      m_pipeline.Add(
         CEStructureAnalyzerFactory::Create(config));

      m_pipeline.Add(
         CETrendAnalyzerFactory::Create(config));
         
      m_pipeline.Add(
         CEContextSummaryAnalyzerFactory::Create(config));
         
      m_pipeline.Add(
         CEScoreAnalyzerFactory::Create(config));
         
      m_pipeline.Add(
         CEBOSAnalyzerFactory::Create(config));
         
      m_pipeline.Add(
         CEChochAnalyzerFactory::Create());

      return true;
   }
   
};

#endif