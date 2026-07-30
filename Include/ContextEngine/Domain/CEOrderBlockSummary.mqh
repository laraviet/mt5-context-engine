#ifndef __CE_ORDER_BLOCK_SUMMARY_MQH__
#define __CE_ORDER_BLOCK_SUMMARY_MQH__

class CEOrderBlockSummary
{
public:

   int Total;

   int Bullish;

   int Bearish;

   int Active;

   int Mitigated;

public:

   void Reset()
   {
      Total      = 0;
      Bullish    = 0;
      Bearish    = 0;
      Active     = 0;
      Mitigated  = 0;
   }
};

#endif