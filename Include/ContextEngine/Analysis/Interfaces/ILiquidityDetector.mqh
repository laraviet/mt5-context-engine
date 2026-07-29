#ifndef __I_LIQUIDITY_DETECTOR_MQH__
#define __I_LIQUIDITY_DETECTOR_MQH__

#include "../../Domain/CEBOSSeries.mqh"
#include "../../Domain/CELiquiditySeries.mqh"

class ILiquidityDetector
{
public:

   virtual ~ILiquidityDetector(){}

   virtual int Detect(
      const CEBOSSeries &bos,
      CELiquiditySeries &liquidity)=0;
};

#endif