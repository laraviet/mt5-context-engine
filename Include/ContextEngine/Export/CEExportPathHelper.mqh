#ifndef __CE_EXPORT_PATH_HELPER_MQH__
#define __CE_EXPORT_PATH_HELPER_MQH__

class CEExportPathHelper
{
public:

   static string BaseFolder()
   {
      // Hiện tại chưa dùng thư mục con để đảm bảo
      // tương thích hoàn toàn với MQL5.
      return "";
   }

   static string TradeSetupFile()
   {
      return BaseFolder() + "TradeSetup.csv";
   }

   static string SnapshotFile()
   {
      return BaseFolder() + "Snapshot.csv";
   }

   static string StatisticsFile()
   {
      return BaseFolder() + "Statistics.csv";
   }

   static string LogFile()
   {
      return BaseFolder() + "ContextEngine.log";
   }
};

#endif