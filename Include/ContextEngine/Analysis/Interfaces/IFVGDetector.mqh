#ifndef __I_FVG_DETECTOR_MQH__
#define __I_FVG_DETECTOR_MQH__

#include "../../Domain/CEFVGSeries.mqh"

class IFVGDetector
{
public:

   virtual ~IFVGDetector(){}

   virtual int Detect(
      CEFVGSeries &series)=0;
};

#endif