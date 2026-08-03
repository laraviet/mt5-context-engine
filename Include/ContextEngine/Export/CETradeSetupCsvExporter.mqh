#ifndef __CE_TRADE_SETUP_CSV_EXPORTER_MQH__
#define __CE_TRADE_SETUP_CSV_EXPORTER_MQH__

#include "ICETradeSetupExporter.mqh"
#include "../Domain/CETradeFilterReason.mqh"
#include "CETradeSetupExportMapper.mqh"
#include "CEExportPathHelper.mqh"
#include "CECsvFileHelper.mqh"
#include "CECsvWriter.mqh"
#include "../Core/CELogger.mqh"
#include "../Constants.mqh"
#include "../Journal/CETradeJournalEntry.mqh"

class CETradeSetupCsvExporter :
   public ICETradeSetupExporter
{
private:

   string m_fileName;   

public:

   CETradeSetupCsvExporter(
      const string fileName = "")
   {
      if(fileName == "")
         m_fileName =
            CEExportPathHelper::TradeSetupFile();
      else
         m_fileName = fileName;
   }

   string FileName() const
   {
      return m_fileName;
   }

   virtual bool Export(
      const CETradeJournalEntry &entry) override
   {      
      CETradeSetupExportRow row =
         CETradeSetupExportMapper::Map(entry);
   
      bool newFile = false;

      int handle =
         CECsvFileHelper::OpenAppend(m_fileName,newFile);
   
      if(handle == INVALID_HANDLE)
         return false;
         
      CECsvWriter writer(handle);
   
      //--------------------------------------------------
      // Header
      //--------------------------------------------------
   
      if(newFile)
      {
         if(!writer.WriteHeader())
         {
            CECsvFileHelper::Close(handle);
            CELogger::Error(
               CE_MODULE_EXPORT,
               "Cannot export TradeSetup.csv");
            return false;
         }
      }
      else
      {
         FileSeek(handle,0,SEEK_END);
      }
   
      //--------------------------------------------------
      // Write Row
      //--------------------------------------------------
   
      if(!writer.WriteRow(row))
      {
         CECsvFileHelper::Close(handle);
         CELogger::Error(
            CE_MODULE_EXPORT,
            "Cannot export TradeSetup.csv");
         return false;
      }
   
      CECsvFileHelper::Close(handle);
      
      CELogger::Info(
         CE_MODULE_EXPORT,
         "Trade setup exported : " +
         row.Symbol +
         " " +
         row.Direction);
   
      return true;
   }
   
};

#endif