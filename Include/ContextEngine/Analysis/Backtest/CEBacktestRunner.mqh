#ifndef __CE_BACKTEST_RUNNER_MQH__
#define __CE_BACKTEST_RUNNER_MQH__

#include "../../Core/CEContextEngine.mqh"
#include "CEBacktestReport.mqh"

class CEBacktestRunner
{
private:

   CEContextEngine *m_engine;

   bool m_running;

   CEBacktestReport m_report;

public:

   CEBacktestRunner()
   {
      m_engine = NULL;

      Reset();
   }

   void Initialize(
      CEContextEngine &engine)
   {
      m_engine = &engine;
   }

   bool Ready() const
   {
      return
         m_engine != NULL;
   }

   void Start()
   {
      m_running = true;
   
      m_report.Reset();
   
      m_report.Start();
   }

   void Stop()
   {
      m_running = false;

      m_report.Finish();
   }

   void Reset()
   {
      m_running = false;

      m_report.Reset();
   }

   bool Running() const
   {
      return
         m_running;
   }

   void SetTotalRuns(
      const int totalRuns)
   {
      m_report.TotalRuns =
         MathMax(0, totalRuns);
   }

   bool Run()
   {
      if(!Ready())
         return false;

      if(!Running())
         return false;

      bool result =
         m_engine.Run();

      m_report.Update(
         result);

      return result;
   }

   CEBacktestReport Report() const
   {
      return
         m_report;
   }

};

#endif