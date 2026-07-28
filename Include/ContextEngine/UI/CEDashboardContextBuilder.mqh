#ifndef __CE_DASHBOARD_CONTEXT_BUILDER_MQH__
#define __CE_DASHBOARD_CONTEXT_BUILDER_MQH__

#include "../Core/CEAnalysisContext.mqh"
#include "CEDashboardContext.mqh"
#include "CETheme.mqh"

class CEDashboardContextBuilder
{
private:
   CETheme m_theme;
   
public:

   void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard)
   {      
      
      CEDashboardCard card;
   
      //Title
      card.Id = "TITLE";
      card.Text = "Context Engine";
      card.Color = m_theme.TitleColor;
      
      dashboard.Add(card);
      
      //Version
      card.Id = "VERSION";
      card.Text = "0.2.0";
      card.Color = m_theme.TextColor;
      
      dashboard.Add(card);
      
      //Symbol
      card.Id = "SYMBOL";
      card.Text = analysis.Symbol;
      card.Color = m_theme.TextColor;
      
      dashboard.Add(card);
      
      //timeframe
      card.Id = "TIMEFRAME";
      card.Text = EnumToString(analysis.Timeframe);
      card.Color = m_theme.TextColor;
      
      dashboard.Add(card);
      
      //status
      card.Id = "STATUS";
      card.Text = analysis.Status;
      card.Color = m_theme.SuccessColor;
      
      dashboard.Add(card);
      
      //swing

      card.Id = "SWING";
      card.Text = IntegerToString(
         analysis.SwingSeries.Count());
      
      card.Color = m_theme.TextColor;
      
      dashboard.Add(card);
      
      //structure

      card.Id = "STRUCTURE";
      card.Text = IntegerToString(
         analysis.StructureSeries.Count());
      
      card.Color = m_theme.TextColor;
      
      dashboard.Add(card);
      
      //trend
      card.Id = "TREND";
      card.Text = IntegerToString(
         analysis.TrendSeries.Count());
      
      card.Color = m_theme.TextColor;
      
      dashboard.Add(card);
      
      Print(
         "Dashboard Cards = ",
         dashboard.Count());
   }
};

#endif