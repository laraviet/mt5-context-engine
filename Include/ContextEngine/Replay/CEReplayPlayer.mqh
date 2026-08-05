#ifndef __CE_REPLAY_PLAYER_MQH__
#define __CE_REPLAY_PLAYER_MQH__

#include "CEReplayRepository.mqh"
#include "CEReplayCursor.mqh"

class CEReplayPlayer
{
private:

   CEReplayRepository *m_repository;
   CEReplayCursor     *m_cursor;

public:

   CEReplayPlayer(
      CEReplayRepository &repository,
      CEReplayCursor &cursor)      
   {
      m_repository = &repository;
      m_cursor = &cursor;
   }

   CEReplaySnapshot Current() const
   {
      if(m_cursor.Invalid())
      {
         CEReplaySnapshot empty;
         return empty;
      }

      return m_repository.At(
         m_cursor.Index());
   }
   
   bool HasCurrent() const
   {
      return
         m_cursor.Valid();
   }
   
   int CurrentIndex() const
   {
      return
         m_cursor.Index();
   }
   
   bool First()
   {
      int index = m_repository.FirstIndex();
   
      if(index < 0)
      {
         return false;
      }
   
      m_cursor.Set(index);
   
      return true;
   }
   
   bool Last()
   {
      int index = m_repository.LastIndex();
   
      if(index < 0)
      {
         return false;
      }
   
      m_cursor.Set(index);
   
      return true;
   }
   
   bool Next()
   {
      if(m_cursor.Invalid())
         return false;
   
      int index =
         m_repository.NextIndex(
            m_cursor.Index());
   
      if(index < 0)
         return false;
   
      m_cursor.Set(index);
   
      return true;
   }
   
   bool Previous()
   {
      if(m_cursor.Invalid())
         return false;
   
      int index =
         m_repository.PreviousIndex(
            m_cursor.Index());
   
      if(index < 0)
         return false;
   
      m_cursor.Set(index);
   
      return true;
   }
   
   void Reset()
   {
      m_cursor.Reset();
   }

};

#endif