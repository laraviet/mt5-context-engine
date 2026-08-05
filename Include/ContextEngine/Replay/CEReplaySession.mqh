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

   CEReplayRepository Repository() const
   {
      return m_repository;
   }

   void Reset()
   {
      m_repository.Clear();
      m_player.Reset();
   }
   
   void Start()
   {
      m_active = true;
   
      m_player.First();
   }
   
   void Stop()
   {
      m_active = false;
   
      m_player.Reset();
   }
   
   bool Active() const
   {
      return m_active;
   }
   
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
   
};

#endif