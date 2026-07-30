#ifndef __I_ORDER_BLOCK_FILL_DETECTOR_MQH__
#define __I_ORDER_BLOCK_FILL_DETECTOR_MQH__

#include "../../Domain/CECandleSeries.mqh"
#include "../../Domain/CEOrderBlockSeries.mqh"

class IOrderBlockFillDetector
{
public:

   virtual void Detect(
      const CECandleSeries &candles,
      CEOrderBlockSeries &blocks)=0;

   virtual ~IOrderBlockFillDetector(){}
};

#endif