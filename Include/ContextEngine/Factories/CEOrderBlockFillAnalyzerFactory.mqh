#ifndef __CE_ORDER_BLOCK_FILL_ANALYZER_FACTORY_MQH__
#define __CE_ORDER_BLOCK_FILL_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEOrderBlockFillAnalyzer.mqh"
#include "../Analysis/Detectors/CEOrderBlockFillDetector.mqh"

class CEOrderBlockFillAnalyzerFactory
{
public:

   static CEOrderBlockFillAnalyzer *Create()
   {
      return new CEOrderBlockFillAnalyzer(
         new CEOrderBlockFillDetector());
   }
};

#endif