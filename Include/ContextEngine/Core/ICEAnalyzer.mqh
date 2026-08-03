#ifndef __ICE_ANALYZER_MQH__
#define __ICE_ANALYZER_MQH__

#include "CEAnalysisContext.mqh"

class ICEAnalyzer
{
public:

   virtual ~ICEAnalyzer() {}

   virtual string Name() const = 0;

   virtual int Priority() const = 0;
   
   virtual int Stage() const = 0;

   virtual bool Analyze(
      CEAnalysisContext &context) = 0;
};

#endif