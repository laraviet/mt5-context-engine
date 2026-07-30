#ifndef __CE_ORDER_BLOCK_ANALYZER_FACTORY_MQH__
#define __CE_ORDER_BLOCK_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEOrderBlockAnalyzer.mqh"
#include "../Analysis/Detectors/CEOrderBlockDetector.mqh"

class CEOrderBlockAnalyzerFactory
{
public:

   static CEOrderBlockAnalyzer *Create()
   {
      return new CEOrderBlockAnalyzer(
         new CEOrderBlockDetector());
   }
};

#endif