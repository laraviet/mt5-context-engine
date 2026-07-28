#ifndef __CE_TREND_CONFIG_MQH__
#define __CE_TREND_CONFIG_MQH__

class CETrendConfig
{
public:

   int WeakThreshold;
   int NormalThreshold;
   int StrongThreshold;

   CETrendConfig()
   {
      WeakThreshold   = 2;
      NormalThreshold = 4;
      StrongThreshold = 6;
   }
};

#endif