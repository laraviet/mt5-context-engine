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
#include "../Factories/CETrendStrengthAnalyzerFactory.mqh"
#include "../Factories/CETrendQualityAnalyzerFactory.mqh"
#include "../Analysis/Analyzers/CEContextSummaryAnalyzer.mqh"
#include "../Factories/CEContextSummaryAnalyzerFactory.mqh"
#include "../Factories/CEScoreAnalyzerFactory.mqh"
#include "../Factories/CEBOSAnalyzerFactory.mqh"
#include "../Factories/CEChochAnalyzerFactory.mqh"
#include "../Factories/CELiquidityAnalyzerFactory.mqh"
#include "../Factories/CELiquiditySummaryAnalyzerFactory.mqh"
#include "../Factories/CEFVGAnalyzerFactory.mqh"
#include "../Factories/CEFVGFillAnalyzerFactory.mqh"
#include "../Factories/CEFVGSummaryAnalyzerFactory.mqh"
#include "../Factories/CEContextInitializeAnalyzerFactory.mqh"
#include "../Factories/CEMarketBiasAnalyzerFactory.mqh"
#include "../Factories/CEOrderBlockAnalyzerFactory.mqh"
#include "../Factories/CEOrderBlockSummaryAnalyzerFactory.mqh"
#include "../Factories/CEOrderBlockFillAnalyzerFactory.mqh"
#include "../Factories/CEOrderBlockScoreAnalyzerFactory.mqh"

#include "../Analysis/Analyzers/CETrendScoreAnalyzer.mqh"
#include "../Analysis/Analyzers/CELiquidityScoreAnalyzer.mqh"
#include "../Analysis/Analyzers/CEFVGScoreAnalyzer.mqh"

#include "../Factories/CEDecisionAnalyzerFactory.mqh"

#include "../Factories/CETradeSignalAnalyzerFactory.mqh"

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
         CEContextInitializeAnalyzerFactory::Create());
         
      m_pipeline.Add(
         CESwingAnalyzerFactory::Create(config));

      m_pipeline.Add(
         CEStructureAnalyzerFactory::Create(config));
         
      m_pipeline.Add(
         CEBOSAnalyzerFactory::Create(config));
         
      m_pipeline.Add(
         CELiquidityAnalyzerFactory::Create(config));
         
      m_pipeline.Add(
         CELiquiditySummaryAnalyzerFactory::Create());
         
      m_pipeline.Add(
         CEFVGAnalyzerFactory::Create(config));
         
      m_pipeline.Add(
         CEFVGFillAnalyzerFactory::Create());               
         
      m_pipeline.Add(      
         CEOrderBlockAnalyzerFactory::Create());
         
      m_pipeline.Add(      
         CEOrderBlockFillAnalyzerFactory::Create());
      
      m_pipeline.Add(
         CEOrderBlockSummaryAnalyzerFactory::Create());
         
      m_pipeline.Add(
         CEOrderBlockScoreAnalyzerFactory::Create());
         
      m_pipeline.Add(
         CEFVGSummaryAnalyzerFactory::Create());
                  
      m_pipeline.Add(
         CEMarketBiasAnalyzerFactory::Create());   
         
      m_pipeline.Add(
         CEChochAnalyzerFactory::Create());

      m_pipeline.Add(
         CETrendAnalyzerFactory::Create(config));
         
      m_pipeline.Add(
         CETrendStrengthAnalyzerFactory::Create(config));
         
      m_pipeline.Add(
         CETrendQualityAnalyzerFactory::Create(config));         
         
      m_pipeline.Add(
         CEContextSummaryAnalyzerFactory::Create(config));
         
      m_pipeline.Add(
         new CETrendScoreAnalyzer());
         
      m_pipeline.Add(
         new CELiquidityScoreAnalyzer());
         
      m_pipeline.Add(
         new CEFVGScoreAnalyzer());
         
      m_pipeline.Add(
         CEScoreAnalyzerFactory::Create(config));    
         
      m_pipeline.Add(
         CEDecisionAnalyzerFactory::Create());
         
      m_pipeline.Add(
         CETradeSignalAnalyzerFactory::Create());           

      return true;
   }
   
};

#endif