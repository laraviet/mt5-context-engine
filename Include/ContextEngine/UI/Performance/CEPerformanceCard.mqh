#ifndef __CE_PERFORMANCE_CARD_MQH__
#define __CE_PERFORMANCE_CARD_MQH__

class CEPerformanceCard
{
public:

   string Label;

   string Value;

public:

   CEPerformanceCard()
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