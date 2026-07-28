#ifndef __I_SWING_DETECTOR_MQH__
#define __I_SWING_DETECTOR_MQH__

#include "../../Domain/CEPriceSeries.mqh"
#include "../../Domain/CESwingSeries.mqh"

class ISwingDetector
{
public:

   virtual ~ISwingDetector() {}

   virtual int Detect(
      const CEPriceSeries &series,
      CESwingSeries &swings) = 0;
};

#endif