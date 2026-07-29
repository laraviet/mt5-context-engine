#ifndef __CE_CHOCH_ANALYZER_FACTORY_MQH__
#define __CE_CHOCH_ANALYZER_FACTORY_MQH__

#include "../Analysis/Analyzers/CEChochAnalyzer.mqh"
#include "../Analysis/Detectors/CEChochDetector.mqh"

class CEChochAnalyzerFactory
{
public:

   static CEChochAnalyzer *Create()
   {
      return new CEChochAnalyzer(
         new CEChochDetector());
   }
};

#endif