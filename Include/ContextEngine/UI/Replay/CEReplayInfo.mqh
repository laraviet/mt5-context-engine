#ifndef __CE_REPLAY_INFO_MQH__
#define __CE_REPLAY_INFO_MQH__

class CEReplayInfo
{
public:

   bool Valid;

   datetime Time;

   string Symbol;

   ENUM_TIMEFRAMES Timeframe;

   int CurrentIndex;

   int TotalCount;

public:

   CEReplayInfo()
   {
      Reset();
   }

   void Reset()
   {
      Valid = false;

      Time = 0;

      Symbol = "";

      Timeframe = PERIOD_CURRENT;

      CurrentIndex = 0;

      TotalCount = 0;
   }
};

#endif