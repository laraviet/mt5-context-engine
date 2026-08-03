#ifndef __CE_TAKE_PROFIT_MQH__
#define __CE_TAKE_PROFIT_MQH__

#include "CETakeProfitSource.mqh"

class CETakeProfit
{
public:

   bool Valid;

   double Price;

   CETakeProfitSource Source;

public:

   CETakeProfit()
   {
      Reset();
   }

   void Reset()
   {
      Valid=false;

      Price=0.0;

      Source=
         TAKE_PROFIT_UNKNOWN;
   }
};

#endif