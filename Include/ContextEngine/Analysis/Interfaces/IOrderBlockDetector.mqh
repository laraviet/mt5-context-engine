#ifndef __I_ORDER_BLOCK_DETECTOR_MQH__
#define __I_ORDER_BLOCK_DETECTOR_MQH__

#include "../../Domain/CECandleSeries.mqh"
#include "../../Domain/CEBOSSeries.mqh"
#include "../../Domain/CEOrderBlockSeries.mqh"

class IOrderBlockDetector
{
public:

   virtual int Detect(
      const CECandleSeries &candles,
      const CEBOSSeries &bos,
      CEOrderBlockSeries &blocks)=0;

   virtual ~IOrderBlockDetector(){}
};

#endif