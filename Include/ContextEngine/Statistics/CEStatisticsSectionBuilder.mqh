#ifndef __CE_STATISTICS_SECTION_BUILDER_MQH__
#define __CE_STATISTICS_SECTION_BUILDER_MQH__

#include "CETradeStatistics.mqh"
#include "CEStatisticsSection.mqh"

class CEStatisticsSectionBuilder
{
private:

   void AddCard(
      CEStatisticsSection &section,
      const string label,
      const string value)
   {
      CEStatisticsCard card;

      card.Label = label;
      card.Value = value;

      section.Add(card);
   }

public:

   void Build(
      const CETradeStatistics &statistics,
      CEStatisticsSection &section)
   {
      section.Clear();

      AddCard(
         section,
         "Trades",
         IntegerToString(
            statistics.TotalTrades));

      AddCard(
         section,
         "BUY",
         IntegerToString(
            statistics.BuyTrades));

      AddCard(
         section,
         "SELL",
         IntegerToString(
            statistics.SellTrades));

      AddCard(
         section,
         "WAIT",
         IntegerToString(
            statistics.WaitTrades));

      AddCard(
         section,
         "Avg Conf",
         DoubleToString(
            statistics.AverageConfidence,
            1));

      AddCard(
         section,
         "Avg Quality",
         DoubleToString(
            statistics.AverageQuality,
            1));

      AddCard(
         section,
         "Avg RR",
         DoubleToString(
            statistics.AverageRatio,
            2));
   }
};

#endif