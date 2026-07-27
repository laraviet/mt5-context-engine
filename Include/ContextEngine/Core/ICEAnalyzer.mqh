#ifndef __ICE_ANALYZER_MQH__
#define __ICE_ANALYZER_MQH__

class CEAnalysisContext;

class ICEAnalyzer
{
public:

   virtual ~ICEAnalyzer() {}

   virtual bool Analyze(
      CEAnalysisContext &context) = 0;

   virtual string Name() const = 0;
};

#endif