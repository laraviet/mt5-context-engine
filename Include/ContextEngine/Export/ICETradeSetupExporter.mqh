#ifndef __I_CE_TRADE_SETUP_EXPORTER_MQH__
#define __I_CE_TRADE_SETUP_EXPORTER_MQH__

#include "../Core/CEAnalysisContext.mqh"

class ICETradeSetupExporter
{
public:

   virtual ~ICETradeSetupExporter(){}

   virtual bool Export(
      const CEAnalysisContext &context)=0;
};

#endif