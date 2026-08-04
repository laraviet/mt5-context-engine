#ifndef __CE_DASHBOARD_LABEL_RENDERER_MQH__
#define __CE_DASHBOARD_LABEL_RENDERER_MQH__

#include <ContextEngine/UI/CETheme.mqh>
#include <ContextEngine/Core/CELogger.mqh>
#include <ContextEngine/Constants.mqh>

class CEDashboardLabelRenderer
{
private:

   string m_prefix;

   CETheme m_theme;

public:

   CEDashboardLabelRenderer(
      const string prefix = "CE.")
   {
      m_prefix = prefix;
   }

   void Draw(
      const string name,
      const string text,
      const int x,
      const int y,
      const color clr)
   {
      string obj =
         m_prefix + name;

      if(ObjectFind(0, obj) < 0)
      {
         if(!ObjectCreate(
               0,
               obj,
               OBJ_LABEL,
               0,
               0,
               0))
         {
            CELogger::Error(
               CE_MODULE_DASHBOARD,
               "Cannot create " + obj);

            return;
         }

         ObjectSetInteger(
            0,
            obj,
            OBJPROP_CORNER,
            CORNER_LEFT_UPPER);

         ObjectSetInteger(
            0,
            obj,
            OBJPROP_FONTSIZE,
            m_theme.FontSize);

         ObjectSetString(
            0,
            obj,
            OBJPROP_FONT,
            "Consolas");
      }

      ObjectSetInteger(
         0,
         obj,
         OBJPROP_XDISTANCE,
         x);

      ObjectSetInteger(
         0,
         obj,
         OBJPROP_YDISTANCE,
         y);

      ObjectSetInteger(
         0,
         obj,
         OBJPROP_COLOR,
         clr);

      ObjectSetString(
         0,
         obj,
         OBJPROP_TEXT,
         text);
   }
};

#endif