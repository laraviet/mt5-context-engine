#ifndef __I_CHOCH_DETECTOR_MQH__
#define __I_CHOCH_DETECTOR_MQH__

#include "../../Domain/CEBOSSeries.mqh"
#include "../../Domain/CEChochSeries.mqh"

class IChochDetector
{
public:

   virtual ~IChochDetector(){}

   virtual int Detect(
      const CESwingSeries &swings,
      const CEBOSSeries &bos,
      CEChochSeries &choch)=0;
};

#endif