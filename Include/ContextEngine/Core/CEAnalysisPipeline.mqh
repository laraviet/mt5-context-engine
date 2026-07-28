#ifndef __CE_ANALYSIS_PIPELINE_MQH__
#define __CE_ANALYSIS_PIPELINE_MQH__

#include "ICEAnalyzer.mqh"
#include "../Constants.mqh"
#include "../Core/CELogger.mqh"

class CEAnalysisPipeline
{
private:

   ICEAnalyzer *m_analyzers[];

public:

   CEAnalysisPipeline()
   {
      ArrayResize(m_analyzers,0);
   }

   int Count() const
   {
      return ArraySize(m_analyzers);
   }

   bool Add(ICEAnalyzer *analyzer)
   {
      int n=ArraySize(m_analyzers);
   
      ArrayResize(m_analyzers,n+1);
   
      m_analyzers[n]=analyzer;
   
      return true;
   }
   
   bool Run(CEAnalysisContext &context)
   {
      for(int i=0;i<ArraySize(m_analyzers);i++)
      {
         if(CheckPointer(m_analyzers[i])==POINTER_INVALID)
            continue;
            
         CELogger::Info(
            CE_MODULE_ANALYZER,
            "Run " + m_analyzers[i].Name());
   
         m_analyzers[i].Analyze(context);
      }
   
      return true;
   }
   
   ~CEAnalysisPipeline()
   {
      for(int i=0;i<ArraySize(m_analyzers);i++)
      {
         if(CheckPointer(m_analyzers[i])!=POINTER_INVALID)
            delete m_analyzers[i];
      }
   }
   
};

#endif