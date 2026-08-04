#ifndef __CE_TEXT_REPORT_FORMATTER_MQH__
#define __CE_TEXT_REPORT_FORMATTER_MQH__

#include "../CEReport.mqh"

class CETextReportFormatter
{
private:

   string FormatItem(
      const CEReportItem &item) const
   {
      switch(item.Type)
      {
         case REPORT_ITEM_TITLE:

            return item.Text +
                   "\n" +
                   "------------------------------";

         case REPORT_ITEM_SEPARATOR:

            return
               "------------------------------";

         case REPORT_ITEM_EMPTY:

            return "";

         case REPORT_ITEM_TEXT:

         default:

            return item.Text;
      }
   }

public:

   string Format(
      const CEReport &report) const
   {
      string result = "";

      for(int i = 0;
          i < report.Count();
          ++i)
      {
         result +=
            FormatItem(
               report.At(i));

         if(i < report.Count()-1)
            result += "\n";
      }

      return result;
   }
};

#endif