#ifndef __CE_TRADE_ENTRY_ANALYZER_MQH__
#define __CE_TRADE_ENTRY_ANALYZER_MQH__

#include "../../Core/ICEAnalyzer.mqh"

class CETradeEntryAnalyzer :
   public ICEAnalyzer
{
public:

   virtual string Name() const override
   {
      return "Trade Entry Analyzer";
   }

   virtual int Stage() const override
   {
      return CE_STAGE_SCORE;
   }

   virtual int Priority() const override
   {
      return CE_PRIORITY_SCORE_FINAL + 30;
   }

   virtual bool Analyze(
      CEAnalysisContext &context) override
   {
      context.TradeEntry.Reset();

      return true;
   }
};

#endif