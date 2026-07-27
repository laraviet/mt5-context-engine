#ifndef __CE_CANDLE_MQH__
#define __CE_CANDLE_MQH__

struct CECandle
{
   datetime Time;

   double Open;
   double High;
   double Low;
   double Close;

   long TickVolume;
   long RealVolume;

   int Spread;
};

#endif