#ifndef __CE_TRADE_SETUP_CSV_EXPORTER_MQH__
#define __CE_TRADE_SETUP_CSV_EXPORTER_MQH__

#include "ICETradeSetupExporter.mqh"
#include "../Domain/CETradeFilterReason.mqh"
#include "CETradeSetupExportMapper.mqh"

class CETradeSetupCsvExporter :
   public ICETradeSetupExporter
{
private:

   string m_fileName;

private:

   bool FileExists() const
   {
      int handle = FileOpen(
         m_fileName,
         FILE_READ | FILE_CSV);

      if(handle == INVALID_HANDLE)
         return false;

      FileClose(handle);

      return true;
   }

   void WriteHeader(
      const int handle)
   {
      FileWrite(
         handle,
         "Time",
         "Symbol",
         "Timeframe",
         "Direction",
         "Entry",
         "StopLoss",
         "TakeProfit",
         "Risk",
         "Reward",
         "RR",
         "Quality",
         "Allowed",
         "Reason");
   }

public:

   CETradeSetupCsvExporter(
      const string fileName = "TradeSetup.csv")
   {
      m_fileName = fileName;
   }

   string FileName() const
   {
      return m_fileName;
   }

   virtual bool Export(
      const CEAnalysisContext &context) override
   {
      CETradeSetupExportRow row =
         CETradeSetupExportMapper::Map(context);
   
      bool exists = FileExists();
   
      int handle =
         FileOpen(
            m_fileName,
            FILE_WRITE |
            FILE_READ |
            FILE_CSV |
            FILE_SHARE_READ);
   
      if(handle == INVALID_HANDLE)
         return false;
   
      //--------------------------------------------------
      // Header
      //--------------------------------------------------
   
      if(!exists)
      {
         WriteHeader(handle);
      }
      else
      {
         FileSeek(handle,0,SEEK_END);
      }
   
      //--------------------------------------------------
      // Write Row
      //--------------------------------------------------
   
      FileWrite(
         handle,
   
         TimeToString(
            row.Time,
            TIME_DATE | TIME_SECONDS),
   
         row.Symbol,
   
         row.Timeframe,
   
         row.Direction,
   
         DoubleToString(
            row.Entry,
            _Digits),
   
         DoubleToString(
            row.StopLoss,
            _Digits),
   
         DoubleToString(
            row.TakeProfit,
            _Digits),
   
         DoubleToString(
            row.Risk,
            1),
   
         DoubleToString(
            row.Reward,
            1),
   
         DoubleToString(
            row.RR,
            2),
   
         IntegerToString(
            row.Quality),
   
         row.Allowed
            ? "YES"
            : "NO",
   
         row.Reason);
   
      FileClose(handle);
   
      return true;
   }
   
};

#endif