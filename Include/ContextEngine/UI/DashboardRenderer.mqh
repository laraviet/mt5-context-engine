//+------------------------------------------------------------------+
//| DashboardRenderer.mqh                                            |
//+------------------------------------------------------------------+
#ifndef __DASHBOARD_RENDERER_MQH__
#define __DASHBOARD_RENDERER_MQH__

#include <ContextEngine/Constants.mqh>
#include <ContextEngine/UI/CETheme.mqh>
#include <ContextEngine/Core/CELogger.mqh>
#include "CEDashboardContext.mqh";

class CDashboardRenderer
{
private:

   string m_prefix;
   int    m_x;
   int    m_y;
   int    m_lineHeight;
   CETheme m_theme;

   void CreateLabel(
      const string name,
      const string text,
      const int x,
      const int y,
      const color clr)
   {
      string obj = m_prefix + name;
   
      ResetLastError();
   
      if(ObjectFind(0, obj) < 0)
      {
         if(!ObjectCreate(0, obj, OBJ_LABEL, 0, 0, 0))
         {
            CELogger::Error(
               CE_MODULE_DASHBOARD,
               "Cannot create " + obj);
            return;
         }
   
         CELogger::Info(
            CE_MODULE_DASHBOARD,
            "Create " + obj);
   
         ObjectSetInteger(0, obj, OBJPROP_CORNER, CORNER_LEFT_UPPER);
         ObjectSetInteger(0, obj, OBJPROP_XDISTANCE, x);
         ObjectSetInteger(0, obj, OBJPROP_YDISTANCE, y);
         ObjectSetInteger(0, obj, OBJPROP_COLOR, clr);
         ObjectSetInteger(0, obj, OBJPROP_FONTSIZE, m_theme.FontSize);
         ObjectSetString(0, obj, OBJPROP_FONT, "Consolas");
      }
   
      ObjectSetString(0, obj, OBJPROP_TEXT, text);     
   }
   
   void DrawLine(const string name,
              const string text,
              const color clr = clrWhite)
   {
      CreateLabel(
         name,
         text,
         m_x,
         m_y,
         clr);
   
      m_y += m_lineHeight;
   }
   
   void DrawSeparator(const string id)
   {
      DrawLine(
         id,
         "------------------------------",
         clrDarkGray);
   }
   
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
   
      for(int i = 0;
          i < section.Count();
          i++)
      {
         RenderCard(
            section.At(i),
            i);
      }
   
      m_y += m_lineHeight;
   }              

public:

   CDashboardRenderer()
   {
      m_prefix="CE.";

      m_x = m_theme.PaddingLeft;
      m_y = m_theme.PaddingTop;
   
      m_lineHeight = m_theme.LineHeight;
   }
   
   void Begin()
   {
      m_y = m_theme.PaddingTop;
   }

   bool Create()
   {
      CELogger::Info(
         CE_MODULE_DASHBOARD,
         "Create");

      return true;
   }

   void Update(const CEDashboardContext  &context)
   {
      CELogger::Info(
         CE_MODULE_DASHBOARD,
         "Update");
   
      Begin();

      if(context.SectionCount()>0)
         RenderSections(context);
      else
         RenderCards(context);
      
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