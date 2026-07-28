#ifndef __I_MARKET_STRUCTURE_DETECTOR_MQH__
#define __I_MARKET_STRUCTURE_DETECTOR_MQH__

class CESwingSeries;
class CEMarketStructureSeries;

class IMarketStructureDetector
{
public:

   virtual ~IMarketStructureDetector() {}

   virtual int Detect(
      const CESwingSeries &swings,
      CEMarketStructureSeries &structures) = 0;
};

#endif