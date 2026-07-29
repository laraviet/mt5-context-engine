#ifndef __CE_FVG_ANALYZER_FACTORY_MQH__
#define __CE_FVG_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEFVGAnalyzer.mqh"
#include "../Analysis/Detectors/CEFVGDetector.mqh"

class CEFVGAnalyzerFactory
{
public:

   static CEFVGAnalyzer *Create(
      const CEEngineConfig &config)
   {
      return new CEFVGAnalyzer(
         new CEFVGDetector());
   }
};

#endif