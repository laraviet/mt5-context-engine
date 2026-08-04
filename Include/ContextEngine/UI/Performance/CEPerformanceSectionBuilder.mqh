#ifndef __CE_PERFORMANCE_SECTION_BUILDER_MQH__
#define __CE_PERFORMANCE_SECTION_BUILDER_MQH__

#include "../../Statistics/CETradeStatistics.mqh"
#include "CEPerformanceSection.mqh"

class CEPerformanceSectionBuilder
{
private:

   void AddCard(
      CEPerformanceSection &section,
      const string label,
      const string value)
   {
      CEPerformanceCard card;

      card.Label = label;
      card.Value = value;

      section.Add(card);
   }

public:

   void Build(
      const CETradeStatistics &statistics,
      CEPerformanceSection &section)
   {
      section.Clear();

      //=========================
      // Execution Rate
      //=========================

      AddCard(
         section,
         "Execution Rate",
         statistics.HasTrades()
            ? DoubleToString(
                 statistics.ExecutionRate(),
                 1) + "%"
            : "--");

      //=========================
      // Average Confidence
      //=========================

      AddCard(
         section,
         "Average Confidence",
         statistics.HasTrades()
            ? DoubleToString(
                 statistics.AverageConfidence,
                 1)
            : "--");

      //=========================
      // Average Quality
      //=========================

      AddCard(
         section,
         "Average Quality",
         statistics.HasTrades()
            ? DoubleToString(
                 statistics.AverageQuality,
                 1)
            : "--");

      //=========================
      // Average RR
      //=========================

      AddCard(
         section,
         "Average RR",
         statistics.HasExecutedTrades()
            ? DoubleToString(
                 statistics.AverageRatio,
                 2)
            : "--");
   }
};

#endif