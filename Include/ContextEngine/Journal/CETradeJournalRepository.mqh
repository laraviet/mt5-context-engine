#ifndef __CE_TRADE_JOURNAL_REPOSITORY_MQH__
#define __CE_TRADE_JOURNAL_REPOSITORY_MQH__

#include "CETradeJournal.mqh"

class CETradeJournalRepository
{
private:

   CETradeJournal m_journal;

public:

   void Clear()
   {
      m_journal.Clear();
   }

   int Count() const
   {
      return m_journal.Count();
   }

   bool Empty() const
   {
      return m_journal.Empty();
   }

   bool Add(
      const CETradeJournalEntry &entry)
   {
      return m_journal.Add(entry);
   }

   CETradeJournalEntry Last() const
   {
      return m_journal.Last();
   }

   CETradeJournalEntry At(
      const int index) const
   {
      return m_journal.At(index);
   }

   const CETradeJournal Journal() const
   {
      return m_journal;
   }
};

#endif