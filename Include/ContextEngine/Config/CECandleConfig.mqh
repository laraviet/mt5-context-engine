#ifndef __CE_CANDLE_CONFIG_MQH__
#define __CE_CANDLE_CONFIG_MQH__

class CECandleConfig
{
public:

   int MaxBars;

public:

   CECandleConfig()
   {
      MaxBars = 500;
   }
};

#endif