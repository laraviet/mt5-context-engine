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
   
   bool FindLastByDecisionInternal(
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
   
   CETradeJournalEntry FindLastBuy() const
   {
      CETradeJournalEntry entry;
   
      FindLastByDecisionInternal(
         DECISION_BUY,
         entry);
   
      return entry;
   }
   
   CETradeJournalEntry FindLastSell() const
   {
      CETradeJournalEntry entry;
   
      FindLastByDecisionInternal(
         DECISION_SELL,
         entry);
   
      return entry;
   }
   
   bool FindByDecision(
      const CEDecisionType type,
      CETradeJournalEntry &entry) const
   {
      return FindLastByDecisionInternal(
         type,
         entry);
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

};

#endif