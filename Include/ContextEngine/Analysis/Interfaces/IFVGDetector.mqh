#ifndef __I_FVG_DETECTOR_MQH__
#define __I_FVG_DETECTOR_MQH__

#include "../../Domain/CECandleSeries.mqh"
#include "../../Domain/CEFVGSeries.mqh"

class IFVGDetector
{
public:

   virtual ~IFVGDetector(){}

   virtual int Detect(
      const CECandleSeries &candles,
      CEFVGSeries &series)=0;
};

#endif