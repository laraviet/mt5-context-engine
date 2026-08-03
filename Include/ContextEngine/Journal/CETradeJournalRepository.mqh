#ifndef __CE_TRADE_JOURNAL_REPOSITORY_MQH__
#define __CE_TRADE_JOURNAL_REPOSITORY_MQH__

#include "CETradeJournal.mqh"

class CETradeJournalRepository
{
private:

   CETradeJournal m_journal;
   
   bool IsValidTrade(
      const CETradeJournalEntry &entry) const
   {
      return
         entry.Decision.IsTrade();
   }
   
   CETradeJournalEntry FindLastByDecision(
      const CEDecisionType type) const
   {
      for(int i = Count() - 1; i >= 0; --i)
      {
         CETradeJournalEntry entry =
            m_journal.At(i);
   
         if(entry.Decision.Type == type)
            return entry;
      }
   
      CETradeJournalEntry empty;
   
      return empty;
   }
   
   CETradeJournalEntry FindLastTradeInternal() const
   {
      for(int i = Count() - 1; i >= 0; --i)
      {
         CETradeJournalEntry entry =
            m_journal.At(i);
   
         if(IsValidTrade(entry))
            return entry;
      }
   
      CETradeJournalEntry empty;
   
      return empty;
   }

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
   
   CETradeJournalEntry FindLastBuy() const
   {
      return FindLastByDecision(DECISION_BUY);
   }
   
   CETradeJournalEntry FindLastSell() const
   {
      return FindLastByDecision(DECISION_SELL);
   }
   
   bool FindByDecision(
      const CEDecisionType type,
      CETradeJournalEntry &entry) const
   {
      entry.Reset();
   
      for(int i = Count() - 1; i >= 0; --i)
      {
         CETradeJournalEntry current =
            m_journal.At(i);
   
         if(current.Decision.Type == type)
         {
            entry = current;
   
            return true;
         }
      }
   
      return false;
   }
   
   bool FindBySymbol(
      const string symbol,
      CETradeJournalEntry &entry) const
   {
      entry.Reset();
   
      for(int i = Count() - 1; i >= 0; --i)
      {
         CETradeJournalEntry current =
            m_journal.At(i);
   
         if(current.Symbol == symbol)
         {
            entry = current;
   
            return true;
         }
      }
   
      return false;
   }
   
   bool HasTrades() const
   {
      return
         FindLastTradeInternal().Decision.IsTrade();
   }
   
   int TradeCount() const
   {
      int count = 0;
   
      for(int i = 0; i < Count(); ++i)
      {
         if(m_journal.At(i).Decision.IsTrade())
            ++count;
      }
   
      return count;
   }
   
   CETradeJournalEntry LastTrade() const
   {
      return FindLastTradeInternal();
   }
   
   bool Exists() const
   {
      return
         !Empty();
   }

};

#endif