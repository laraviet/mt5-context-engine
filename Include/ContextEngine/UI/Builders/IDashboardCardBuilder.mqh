#ifndef __I_DASHBOARD_CARD_BUILDER_MQH__
#define __I_DASHBOARD_CARD_BUILDER_MQH__

#include "../../Core/CEAnalysisContext.mqh"
#include "../CEDashboardContext.mqh"

class IDashboardCardBuilder
{
public:

   virtual ~IDashboardCardBuilder(){}

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard)=0;
};

#endif