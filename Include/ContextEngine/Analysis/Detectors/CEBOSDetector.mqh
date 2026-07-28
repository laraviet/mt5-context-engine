#ifndef __CE_BOS_DETECTOR_MQH__
#define __CE_BOS_DETECTOR_MQH__

#include "CEMarketStructureDetector.mqh"
#include "../Domain/CEBOSPoint.mqh"

class CEBOSDetector
{
private:

   CEBOSPoint m_points[];

public:

   void Detect(const CEMarketStructureDetector &structure)
   {
      ArrayResize(m_points, 0);
   }

   int Count() const
   {
      return ArraySize(m_points);
   }

   CEBOSPoint At(int index) const
   {
      return m_points[index];
   }
};

#endif