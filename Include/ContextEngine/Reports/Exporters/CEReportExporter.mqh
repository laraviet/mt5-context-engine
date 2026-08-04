#ifndef __CE_REPORT_EXPORTER_MQH__
#define __CE_REPORT_EXPORTER_MQH__

#include "../Formatters/CETextReportFormatter.mqh"
#include "../../Core/CELogger.mqh"
#include "../../Constants.mqh"

class CEReportExporter
{
private:

   CETextReportFormatter m_formatter;
   
   string BuildFileName(
      const string symbol,
      const ENUM_TIMEFRAMES timeframe) const
   {
      string tf =
         EnumToString(timeframe);
   
      StringReplace(
         tf,
         "PERIOD_",
         "");
   
      string timestamp =
         TimeToString(
            TimeCurrent(),
            TIME_DATE | TIME_MINUTES | TIME_SECONDS);
   
      StringReplace(timestamp,".","");
      StringReplace(timestamp,":","");
      StringReplace(timestamp," ","_");
   
      return StringFormat(
         "ContextReport_%s_%s_%s.txt",
         symbol,
         tf,
         timestamp);
   }

public:

   bool Export(
      const CEReport &report,
      const string symbol,
      const ENUM_TIMEFRAMES timeframe)
   {
      string fileName=BuildFileName(symbol,timeframe);
      
      string text =
         m_formatter.Format(report);

      int handle =
         FileOpen(
            fileName,
            FILE_WRITE |
            FILE_TXT);

      if(handle == INVALID_HANDLE)
      {
         CELogger::Error(
            CE_MODULE_EXPORT,
            "Cannot create report : " +
            fileName);

         return false;
      }

      FileWriteString(
         handle,
         text);

      FileClose(
         handle);

      CELogger::Info(
         CE_MODULE_EXPORT,
         StringFormat(
            "Report exported : %s",
            fileName));

      return true;
   }
};

#endif