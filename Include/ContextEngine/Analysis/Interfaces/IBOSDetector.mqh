#ifndef __I_BOS_DETECTOR_MQH__
#define __I_BOS_DETECTOR_MQH__

#include "../../Domain/CEMarketStructureSeries.mqh"
#include "../../Domain/CEBOSSeries.mqh"

class IBOSDetector
{
public:

   virtual ~IBOSDetector(){}

   virtual int Detect(
      const CEMarketStructureSeries &structures,
      CEBOSSeries &bos)=0;
};

#endif