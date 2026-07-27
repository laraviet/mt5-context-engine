#ifndef __CE_ANALYSIS_PIPELINE_MQH__
#define __CE_ANALYSIS_PIPELINE_MQH__

#include "ICEAnalyzer.mqh"

class CEAnalysisPipeline
{
private:

   ICEAnalyzer *m_analyzers[];

public:

   void Clear()
   {
      ArrayResize(m_analyzers, 0);
   }

   int Count() const
   {
      return ArraySize(m_analyzers);
   }

   void Add(ICEAnalyzer *analyzer)
   {
      int size = ArraySize(m_analyzers);

      ArrayResize(m_analyzers, size + 1);

      m_analyzers[size] = analyzer;
   }
};

#endif