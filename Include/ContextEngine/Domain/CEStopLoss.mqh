#ifndef __CE_STOP_LOSS_MQH__
#define __CE_STOP_LOSS_MQH__

#include "CEStopLossSource.mqh"

class CEStopLoss
{
public:

   bool Valid;

   double Price;

   CEStopLossSource Source;

public:

   CEStopLoss()
   {
      Reset();
   }

   void Reset()
   {
      Valid = false;

      Price = 0.0;

      Source = STOP_LOSS_UNKNOWN;
   }
};

#endif