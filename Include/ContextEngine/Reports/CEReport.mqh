#ifndef __CE_REPORT_MQH__
#define __CE_REPORT_MQH__

#include "CEReportItem.mqh"

class CEReport
{
private:

   CEReportItem m_items[];

public:

   void Clear()
   {
      ArrayResize(
         m_items,
         0);
   }

   bool Empty() const
   {
      return ArraySize(
         m_items) == 0;
   }

   int Count() const
   {
      return ArraySize(
         m_items);
   }

   bool Add(
      const CEReportItem &item)
   {
      int index =
         Count();

      ArrayResize(
         m_items,
         index + 1);

      m_items[index] =
         item;

      return true;
   }

   CEReportItem At(
      const int index) const
   {
      if(index < 0 ||
         index >= Count())
      {
         CEReportItem item;

         return item;
      }

      return
         m_items[index];
   }
};

#endif