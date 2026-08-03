#ifndef __CE_CSV_WRITER_MQH__
#define __CE_CSV_WRITER_MQH__

class CECsvWriter
{
private:

   int m_handle;

public:

   CECsvWriter(
      const int handle)
   {
      m_handle = handle;
   }

   bool IsValid() const
   {
      return m_handle != INVALID_HANDLE;
   }

   bool WriteHeader()
   {
      if(!IsValid())
         return false;

      return FileWrite(
         m_handle,
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
         "Reason") > 0;

      return true;
   }

   bool WriteRow(
      const CETradeSetupExportRow &row)
   {
      if(!IsValid())
         return false;

      return FileWrite(
         m_handle,

         TimeToString(
            row.Time,
            TIME_DATE | TIME_SECONDS),

         row.Symbol,

         row.Timeframe,

         row.Direction,

         DoubleToString(row.Entry,_Digits),

         DoubleToString(row.StopLoss,_Digits),

         DoubleToString(row.TakeProfit,_Digits),

         DoubleToString(row.Risk,1),

         DoubleToString(row.Reward,1),

         DoubleToString(row.RR,2),

         IntegerToString(row.Quality),

         row.Allowed
            ? "YES"
            : "NO",

         row.Reason) > 0;

      return true;
   }
};

#endif