#ifndef __CE_REPLAY_TOOLBAR_MQH__
#define __CE_REPLAY_TOOLBAR_MQH__

class CEReplayToolbar
{
public:

   bool Visible;

   bool HasReplay;

   bool CanPrevious;

   bool CanNext;

   int CurrentIndex;

   int TotalCount;

public:

   CEReplayToolbar()
   {
      Reset();
   }

   void Reset()
   {
      Visible      = false;
      HasReplay    = false;
      CanPrevious  = false;
      CanNext      = false;

      CurrentIndex = 0;
      TotalCount   = 0;
   }

   bool Empty() const
   {
      return !Visible;
   }
};

#endif