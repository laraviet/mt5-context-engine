#ifndef __CE_REPLAY_SESSION_MQH__
#define __CE_REPLAY_SESSION_MQH__

#include "CEReplayRepository.mqh"
#include "CEReplayCursor.mqh"
#include "CEReplayPlayer.mqh"

class CEReplaySession
{
private:

   CEReplayRepository m_repository;
   CEReplayCursor     m_cursor;
   CEReplayPlayer     m_player;

   bool m_active;

public:

   CEReplaySession()
      : m_player(m_repository, m_cursor)
   {
      m_active = false;
   }

   //-------------------------------------------------
   // Repository
   //-------------------------------------------------

   CEReplayRepository Repository() const
   {
      return m_repository;
   }

   //-------------------------------------------------
   // State
   //-------------------------------------------------

   bool Active() const
   {
      return m_active;
   }

   void Start()
   {
      m_active = true;
   
      if(m_cursor.Invalid())
         m_player.First();
   }

   void Stop()
   {
      m_active = false;
   }

   void Reset()
   {
      m_repository.Clear();

      m_player.Reset();

      m_active = false;
   }

   //-------------------------------------------------
   // Navigation
   //-------------------------------------------------

   bool First()
   {
      return m_player.First();
   }

   bool Last()
   {
      return m_player.Last();
   }

   bool Next()
   {
      return m_player.Next();
   }

   bool Previous()
   {
      return m_player.Previous();
   }

   //-------------------------------------------------
   // Query
   //-------------------------------------------------

   bool Current(
      CEReplaySnapshot &snapshot) const
   {
      if(!m_active)
      {
         snapshot.Reset();
         return false;
      }

      return m_player.Current(snapshot);
   }

   int CurrentIndex() const
   {
      return m_player.CurrentIndex();
   }

   bool HasReplay() const
   {
      return !m_repository.Empty();
   }

   bool CanNext() const
   {
      if(!m_active)
         return false;

      return
         m_repository.NextIndex(
            CurrentIndex()) >= 0;
   }

   bool CanPrevious() const
   {
      if(!m_active)
         return false;

      return
         m_repository.PreviousIndex(
            CurrentIndex()) >= 0;
   }
   
   int ReplayCount() const
   {
      return m_repository.Count();
   }
};

#endif