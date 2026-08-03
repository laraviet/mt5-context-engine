#ifndef __CE_HISTORY_SECTION_BUILDER_MQH__
#define __CE_HISTORY_SECTION_BUILDER_MQH__

#include "../../Journal/CETradeJournalRepository.mqh"
#include "CEHistorySection.mqh"
#include "CEHistoryCardBuilder.mqh"

#define CE_HISTORY_MAX_ITEMS 5

class CEHistorySectionBuilder
{
public:

   void Build(
      CETradeJournalRepository &repository,
      CEHistorySection &section)
   {
      section.Clear();

      int total =
         repository.Count();

      if(total <= 0)
         return;

      int start =
         MathMax(
            0,
            total - CE_HISTORY_MAX_ITEMS);

      for(int i = start;
          i < total;
          ++i)
      {
         CETradeJournalEntry entry =
            repository.At(i);

         section.Add(
            CEHistoryCardBuilder::Build(
               entry));
      }
   }
};

#endif