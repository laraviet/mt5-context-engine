#ifndef __CE_DASHBOARD_SETTINGS_MQH__
#define __CE_DASHBOARD_SETTINGS_MQH__

class CEDashboardSettings
{
public:

   bool ShowMarket;

   bool ShowSummary;

   bool ShowDecision;

   bool ShowPerformance;

   bool ShowStatistics;

   bool ShowHistory;

public:

   CEDashboardSettings()
   {
      Reset();
   }

   void Reset()
   {
      ShowMarket = true;

      ShowSummary = true;

      ShowDecision = true;

      ShowPerformance = true;

      ShowStatistics = true;

      ShowHistory = true;
   }

   void ShowAll()
   {
      ShowMarket = true;

      ShowSummary = true;

      ShowDecision = true;

      ShowPerformance = true;

      ShowStatistics = true;

      ShowHistory = true;
   }

   void HideAll()
   {
      ShowMarket = false;

      ShowSummary = false;

      ShowDecision = false;

      ShowPerformance = false;

      ShowStatistics = false;

      ShowHistory = false;
   }
   
   bool IsDefault() const
   {
      return
         ShowMarket &&
         ShowSummary &&
         ShowDecision &&
         ShowPerformance &&
         ShowStatistics &&
         ShowHistory;
   }
   
   void ShowTradingOnly()
   {
      HideAll();
   
      ShowDecision = true;
   
      ShowPerformance = true;
   }
   
   void ShowAnalysisOnly()
   {
      HideAll();
   
      ShowMarket = true;
   
      ShowSummary = true;
   
      ShowStatistics = true;
   }
   
};

#endif