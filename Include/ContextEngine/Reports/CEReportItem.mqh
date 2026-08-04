#ifndef __CE_REPORT_ITEM_MQH__
#define __CE_REPORT_ITEM_MQH__

enum CEReportItemType
{
   REPORT_ITEM_TEXT = 0,

   REPORT_ITEM_TITLE,

   REPORT_ITEM_SEPARATOR,

   REPORT_ITEM_EMPTY
};

class CEReportItem
{
public:

   CEReportItemType Type;

   string Text;

public:

   CEReportItem()
   {
      Reset();
   }

   void Reset()
   {
      Type = REPORT_ITEM_TEXT;

      Text = "";
   }

   bool IsEmpty() const
   {
      return Text == "";
   }
};

#endif