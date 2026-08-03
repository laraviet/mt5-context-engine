#ifndef __CE_TRADE_JOURNAL_MQH__
#define __CE_TRADE_JOURNAL_MQH__

#include "CETradeJournalEntry.mqh"

class CETradeJournal
{
private:

   CETradeJournalEntry m_entries[];

public:

   void Clear()
   {
      ArrayResize(
         m_entries,
         0);
   }

   int Count() const
   {
      return ArraySize(
         m_entries);
   }

   bool Empty() const
   {
      return Count() == 0;
   }

   bool Add(
      const CETradeJournalEntry &entry)
   {
      int index =
         ArraySize(
            m_entries);

      ArrayResize(
         m_entries,
         index + 1);

      m_entries[index] = entry;

      return true;
   }

   CETradeJournalEntry Last() const
   {
      if(Empty())
      {
         CETradeJournalEntry entry;

         return entry;
      }

      return
         m_entries[
            Count() - 1];
   }

   CETradeJournalEntry At(
      const int index) const
   {
      if(index < 0 ||
         index >= Count())
      {
         CETradeJournalEntry entry;

         return entry;
      }

      return
         m_entries[index];
   }
};

#endif