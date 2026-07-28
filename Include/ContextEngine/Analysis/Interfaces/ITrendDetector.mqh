#ifndef __I_TREND_DETECTOR_MQH__
#define __I_TREND_DETECTOR_MQH__

#include "../../Domain/CEMarketStructureSeries.mqh"
#include "../../Domain/CETrendSeries.mqh"

class ITrendDetector
{
public:

   virtual ~ITrendDetector() {}

   virtual int Detect(
      const CEMarketStructureSeries &structures,
      CETrendSeries &trends) = 0;
};

#endif