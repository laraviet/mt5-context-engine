#ifndef __CE_REPLAY_REPOSITORY_MQH__
#define __CE_REPLAY_REPOSITORY_MQH__

#include "CEReplaySnapshot.mqh"

class CEReplayRepository
{
private:

   CEReplaySnapshot m_items[];

public:

   //----------------------------------
   // Basic
   //----------------------------------

   void Clear()
   {
      ArrayResize(m_items,0);
   }

   int Count() const
   {
      return ArraySize(m_items);
   }

   bool Empty() const
   {
      return Count()==0;
   }
   
   bool HasSnapshots() const
   {
      return !Empty();
   }
   
   //----------------------------------
   // Access
   //----------------------------------

   CEReplaySnapshot At(
      const int index) const
   {
      CEReplaySnapshot empty;

      if(index<0 || index>=Count())
         return empty;

      return m_items[index];
   }
   
   CEReplaySnapshot First() const
   {
      if(Empty())
      {
         CEReplaySnapshot empty;
         return empty;
      }
   
      return At(0);
   }

   CEReplaySnapshot Last() const
   {
      if(Empty())
      {
         CEReplaySnapshot empty;
         return empty;
      }

      return At(Count()-1);
   }
   
   //----------------------------------
   // Validation
   //----------------------------------

   bool IsValidIndex(
      const int index) const
   {
      return
         index>=0 &&
         index<Count();
   }
   
   //----------------------------------
   // Modification
   //----------------------------------

   bool Add(
      const CEReplaySnapshot &snapshot)
   {
      int index = Count();

      ArrayResize(
         m_items,
         index+1);

      m_items[index]=snapshot;

      return true;
   }   
   
   
   int FirstIndex() const
   {
      if(Empty())
         return -1;
   
      return 0;
   }
   
   int LastIndex() const
   {
      if(Empty())
         return -1;
   
      return Count() - 1;
   }
   
   int NextIndex(
   const int index) const
   {
      if(!IsValidIndex(index))
         return -1;
   
      if(index >= LastIndex())
         return -1;
   
      return index + 1;
   }
   
   int PreviousIndex(
   const int index) const
   {
      if(!IsValidIndex(index))
         return -1;
   
      if(index <= FirstIndex())
         return -1;
   
      return index - 1;
   }

};

#endif