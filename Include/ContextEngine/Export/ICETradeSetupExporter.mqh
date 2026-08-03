#ifndef __I_CE_TRADE_SETUP_EXPORTER_MQH__
#define __I_CE_TRADE_SETUP_EXPORTER_MQH__

#include "../Journal/CETradeJournalEntry.mqh"

class ICETradeSetupExporter
{
public:

   virtual ~ICETradeSetupExporter(){}

   virtual bool Export(
      const CETradeJournalEntry &entry)=0;
};

#endif