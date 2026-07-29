#ifndef __CE_CANDLE_MQH__
#define __CE_CANDLE_MQH__

class CECandle
{
public:

   datetime Time;

   double Open;

   double High;

   double Low;

   double Close;

public:

   CECandle()
   {
      Reset();
   }

   void Reset()
   {
      Time = 0;

      Open = 0;

      High = 0;

      Low = 0;

      Close = 0;
   }
};

#endif