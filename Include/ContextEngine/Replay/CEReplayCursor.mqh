#ifndef __CE_REPLAY_CURSOR_MQH__
#define __CE_REPLAY_CURSOR_MQH__

class CEReplayCursor
{
private:

   int m_index;

public:

   CEReplayCursor()
   {
      Reset();
   }

   void Reset()
   {
      m_index = -1;
   }

   int Index() const
   {
      return m_index;
   }

   void Set(
      const int index)
   {
      m_index = index;
   }

   bool Valid() const
   {
      return
         m_index >= 0;
   }
   
   bool Invalid() const
   {
      return !Valid();
   }
   
};

#endif