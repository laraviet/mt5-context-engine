//+------------------------------------------------------------------+
//| DashboardRenderer.mqh                                            |
//+------------------------------------------------------------------+
#ifndef __DASHBOARD_RENDERER_MQH__
#define __DASHBOARD_RENDERER_MQH__

#include <ContextEngine/Constants.mqh>
#include <ContextEngine/UI/CETheme.mqh>
#include <ContextEngine/Core/CELogger.mqh>
#include "CEDashboardContext.mqh";
#include "../Statistics/CEStatisticsSection.mqh"
#include "Performance/CEPerformanceSection.mqh"
#include "Layout/CEDashboardLayout.mqh"
#include "Renderers/CEDashboardLabelRenderer.mqh"

class CDashboardRenderer
{
protected:

   //------------------------------
   // Low-level Drawing
   //------------------------------
   
   void DrawLine(const string name,
              const string text,
              const color clr = clrWhite)
   {
      m_labelRenderer.Draw(
         name,
         text,
         m_layout.X(),
         m_layout.Y(),
         clr);
      
      m_layout.NextLine();
   }
   
   void DrawSeparator(const string id)
   {
      DrawLine(
         id,
         "------------------------------",
         clrDarkGray);
   }
   
   void RenderCard(
      const CEDashboardCard &card,
      const int index)
   {
      switch(card.Type)
      {
         case DASHBOARD_CARD_TITLE:
   
            DrawLine(
               card.Id,
               card.Text,
               card.Color);
   
            break;
   
         case DASHBOARD_CARD_SEPARATOR:
   
            DrawLine(
               card.Id,
               "--------------------------------",
               card.Color);
   
            break;
   
         case DASHBOARD_CARD_EMPTY:
   
            DrawLine(
               card.Id,
               "");
   
            break;
   
         case DASHBOARD_CARD_ITEM:
   
         default:
   
            DrawLine(
               card.Id,
               card.Text,
               card.Color);
   
            break;
      }
   }

private:

   string m_prefix;
   CEDashboardLayout m_layout;
   CEDashboardLabelRenderer m_labelRenderer;
   CETheme m_theme;            

   //------------------------------
   // Card Rendering
   //------------------------------

   void RenderCards(
      const CEDashboardContext &context)
   {
      for(int i = 0; i < context.Count(); i++)
      {
         CEDashboardCard card =
            context.At(i);
   
         RenderCard(card,i);
      }
   }      
   
   //------------------------------
   // Section Rendering
   //------------------------------

   void RenderSections(const CEDashboardContext &context)
   {
      for(int i=0;
          i<context.SectionCount();
          i++)
      {
         RenderSection(
            context.SectionAt(i));
      }
   }
   
   void RenderSection(const CEDashboardSection &section)
   {
      DrawLine(
         section.Id + "_title",
         section.Title,
         m_theme.SectionColor);
   
      DrawSeparator(
         section.Id + "_separator");
   
      if(section.Expanded)
      {
         for(int i = 0;
             i < section.Count();
             i++)
         {
            RenderCard(
               section.At(i),
               i);
         }
      }
   
      m_layout.NextLine();
   }
   
   void RenderHistory(
      const CEHistorySection &history)
   {
      DrawLine(
         "history_title",
         "History",
         m_theme.SectionColor);
   
      DrawSeparator(
         "history_separator");
   
      if(history.Empty())
      {
         DrawLine(
            "history_empty",
            "No history");
   
         m_layout.NextLine();
   
         return;
      }
   
      for(int i = 0;
          i < history.Count();
          ++i)
      {
         RenderHistoryCard(
            history.At(i),
            i);
      }
   
      m_layout.NextLine();
   }
   
   void RenderHistoryCard(
      const CEHistoryCard &card,
      const int index)
   {
      string text;
   
      text =
         card.DecisionText();
   
      text += " ";
   
      text += "C:";
      text += IntegerToString(card.Score);
   
      text += " ";
   
      text += "Q:";
      text += DoubleToString(card.Quality,0);
   
      text += " ";
   
      text += "RR:";
      text += DoubleToString(card.Ratio,1);
   
      DrawLine(
         "history_" + IntegerToString(index),
         text,
         clrWhite);
   }
   
   void RenderStatisticsSection(
      const CEStatisticsSection &section)
   {
      DrawLine(
         "statistics_title",
         "Statistics",
         m_theme.SectionColor);
   
      DrawSeparator(
         "statistics_separator");
   
      if(section.Empty())
      {
         DrawLine(
            "statistics_empty",
            "No statistics");
   
         m_layout.NextLine();
   
         return;
      }
   
      for(int i = 0;
          i < section.Count();
          ++i)
      {
         RenderStatisticsCard(
            section.At(i),
            i);
      }
   
      m_layout.NextLine();
   }
   
   void RenderStatisticsCard(
      const CEStatisticsCard &card,
      const int index)
   {
      string text;
   
      text =
         StringFormat(
            "%-14s : %s",
            card.Label,
            card.Value);
   
      DrawLine(
         "statistics_" + IntegerToString(index),
         text,
         m_theme.TextColor);
   }
   
   void RenderPerformanceCard(
      const CEPerformanceCard &card,
      const int index)
   {
      string text =
         StringFormat(
            "%-20s : %s",
            card.Label,
            card.Value);
   
      DrawLine(
         "performance_" + IntegerToString(index),
         text,
         m_theme.TextColor);
   }
   
   void RenderPerformanceSection(
      const CEPerformanceSection &section)
   {
      DrawLine(
         "performance_title",
         "Performance",
         m_theme.SectionColor);
   
      DrawSeparator(
         "performance_separator");
   
      if(section.Empty())
      {
         DrawLine(
            "performance_empty",
            "No performance data");
   
         m_layout.NextLine();
   
         return;
      }
   
      for(int i = 0;
          i < section.Count();
          ++i)
      {
         RenderPerformanceCard(
            section.At(i),
            i);
      }
   
      m_layout.NextLine();
   }

public:

   CDashboardRenderer()
   {
      m_prefix="CE.";
   }
   
   void Begin()
   {
      m_layout.Reset();
   }

   bool Create()
   {
      CELogger::Info(
         CE_MODULE_DASHBOARD,
         "Create");

      return true;
   }

   void Update(
      const CEDashboardContext &context)
   {
      CELogger::Info(
         CE_MODULE_DASHBOARD,
         "Update");
   
      Begin();
   
      if(context.SectionCount() > 0)
         RenderSections(context);
      else
         RenderCards(context);
   
      if(context.Settings.ShowPerformance)
      {
         RenderPerformanceSection(
            context.PerformanceSection);
      }
   
      if(context.Settings.ShowStatistics)
      {
         RenderStatisticsSection(
            context.StatisticsSection);
      }
   
      if(context.Settings.ShowHistory)
      {
         RenderHistory(
            context.History);
      }
   
      ChartRedraw();
   }

   void Destroy()
   {
      ObjectsDeleteAll(0, m_prefix);

      CELogger::Info(
         CE_MODULE_DASHBOARD,
         "Destroy");
   }
};

#endif