#ifndef __CE_STATISTICS_CARD_MQH__
#define __CE_STATISTICS_CARD_MQH__

class CEStatisticsCard
{
public:

   string Label;

   string Value;

public:

   CEStatisticsCard()
   {
      Reset();
   }

   void Reset()
   {
      Label = "";
      Value = "";
   }

   bool IsEmpty() const
   {
      return Label == "";
   }
};

#endif