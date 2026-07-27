#ifndef __CE_CONTEXT_MQH__
#define __CE_CONTEXT_MQH__

class CEContext
{
public:

   string Symbol;
   ENUM_TIMEFRAMES Timeframe;

   string Status;

public:

   CEContext()
   {
      Reset();
   }

   void Reset()
   {
      Symbol = "";
      Timeframe = PERIOD_CURRENT;

      Status = "UNKNOWN";
   }

   void UpdateChart()
   {
      Symbol = _Symbol;
      Timeframe = (ENUM_TIMEFRAMES)_Period;
   }

};

#endif