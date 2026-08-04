#ifndef __CE_REPORT_BUILDER_MQH__
#define __CE_REPORT_BUILDER_MQH__

#include "../Core/CEAnalysisContext.mqh"
#include "../Statistics/CETradeStatistics.mqh"
#include "CEReport.mqh"

class CEReportBuilder
{
private:

   void AddTitle(
      CEReport &report,
      const string text)
   {
      CEReportItem item;

      item.Type = REPORT_ITEM_TITLE;
      item.Text = text;

      report.Add(item);
   }

   void AddText(
      CEReport &report,
      const string text)
   {
      CEReportItem item;

      item.Type = REPORT_ITEM_TEXT;
      item.Text = text;

      report.Add(item);
   }

   void AddSeparator(
      CEReport &report)
   {
      CEReportItem item;

      item.Type = REPORT_ITEM_SEPARATOR;

      report.Add(item);
   }

   void AddEmpty(
      CEReport &report)
   {
      CEReportItem item;

      item.Type = REPORT_ITEM_EMPTY;

      report.Add(item);
   }

public:

   void Build(
      const CEAnalysisContext &context,
      const CETradeStatistics &statistics,
      CEReport &report)
   {
      report.Clear();

      //---------------------------------
      // Header
      //---------------------------------

      AddTitle(
         report,
         "Context Engine Analysis Report");

      AddEmpty(report);

      //---------------------------------
      // Decision
      //---------------------------------

      AddTitle(
         report,
         "Decision");

      AddText(
         report,
         "Type : " +
         EnumToString(
            context.Decision.Type));

      AddText(
         report,
         "Confidence : " +
         DoubleToString(
            context.Decision.Confidence,
            1));

      AddText(
         report,
         "Reason : " +
         context.Decision.Reason);

      AddEmpty(report);

      //---------------------------------
      // Statistics
      //---------------------------------

      AddTitle(
         report,
         "Statistics");

      AddText(
         report,
         "Trades : " +
         IntegerToString(
            statistics.TotalTrades));

      AddText(
         report,
         "BUY : " +
         IntegerToString(
            statistics.BuyTrades));

      AddText(
         report,
         "SELL : " +
         IntegerToString(
            statistics.SellTrades));

      AddText(
         report,
         "WAIT : " +
         IntegerToString(
            statistics.WaitTrades));

      AddEmpty(report);

      //---------------------------------
      // Performance
      //---------------------------------

      AddTitle(
         report,
         "Performance");

      AddText(
         report,
         "Execution Rate : " +
         DoubleToString(
            statistics.ExecutionRate(),
            1) + "%");

      AddText(
         report,
         "Average Confidence : " +
         DoubleToString(
            statistics.AverageConfidence,
            1));

      AddText(
         report,
         "Average Quality : " +
         DoubleToString(
            statistics.AverageQuality,
            1));

      AddText(
         report,
         "Average RR : " +
         DoubleToString(
            statistics.AverageRatio,
            2));
            
      AddEmpty(report);

      AddTitle(
         report,
         "End Of Report");
         }
};

#endif