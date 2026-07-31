#ifndef __CE_DASHBOARD_BUILDER_PIPELINE_MQH__
#define __CE_DASHBOARD_BUILDER_PIPELINE_MQH__

#include "IDashboardCardBuilder.mqh"

class CEDashboardBuilderPipeline
{
private:

   IDashboardCardBuilder *m_builders[];

public:

   CEDashboardBuilderPipeline()
   {
      ArrayResize(m_builders,0);
   }

   ~CEDashboardBuilderPipeline()
   {
      for(int i=0;i<ArraySize(m_builders);i++)
      {
         if(CheckPointer(m_builders[i])!=POINTER_INVALID)
         {
            delete m_builders[i];
            m_builders[i]=NULL;
         }
      }
   }

   bool Add(IDashboardCardBuilder *builder)
   {
      int n=ArraySize(m_builders);

      ArrayResize(m_builders,n+1);

      m_builders[n]=builder;

      return true;
   }

   bool Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard)
   {
      for(int i=0;i<ArraySize(m_builders);i++)
      {
         if(CheckPointer(m_builders[i])==POINTER_INVALID)
            continue;

         m_builders[i].Build(
            analysis,
            dashboard);
      }

      return true;
   }
};

#endif