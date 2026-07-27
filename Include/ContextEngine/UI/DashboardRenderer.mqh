//+------------------------------------------------------------------+
//| DashboardRenderer.mqh                                            |
//+------------------------------------------------------------------+
#ifndef __DASHBOARD_RENDERER_MQH__
#define __DASHBOARD_RENDERER_MQH__

#include <ContextEngine/UI/CETheme.mqh>

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
            Print("[CE] Create failed: ", obj,
                  " Error=", GetLastError());
            return;
         }
   
         Print("[CE] Created ", obj);
   
         ObjectSetInteger(0, obj, OBJPROP_CORNER, CORNER_LEFT_UPPER);
         ObjectSetInteger(0, obj, OBJPROP_XDISTANCE, x);
         ObjectSetInteger(0, obj, OBJPROP_YDISTANCE, y);
         ObjectSetInteger(0, obj, OBJPROP_COLOR, clr);
         ObjectSetInteger(0, obj, OBJPROP_FONTSIZE, m_theme.FontSize);
         ObjectSetString(0, obj, OBJPROP_FONT, "Consolas");
      }
   
      ObjectSetString(0, obj, OBJPROP_TEXT, text);
   
      Print("[CE] Update ", obj,
            " -> ", text);
      
      Print("-----------------------------");
      Print("Name    : ", obj);
      Print("X       : ", ObjectGetInteger(0, obj, OBJPROP_XDISTANCE));
      Print("Y       : ", ObjectGetInteger(0, obj, OBJPROP_YDISTANCE));
      Print("Text    : ", ObjectGetString(0, obj, OBJPROP_TEXT));
      Print("-----------------------------");
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
      Print("[CE] Dashboard Create");

      return true;
   }

   void Update()
   {
      Print("[CE] Dashboard Update");
   
      Begin();
   
      DrawLine(
         "Title",
         "Context Engine",
         m_theme.TitleColor);
   
      DrawLine(
         "Version",
         "Version : 0.2.0",
          m_theme.TextColor);
      
      DrawLine(
         "Symbol",
         "Symbol : " + _Symbol,
          m_theme.TextColor);
      
      DrawLine(
         "TF",
         "TF : " + EnumToString(_Period),
          m_theme.TextColor);
         
      DrawLine(
         "Status",
         "Status : READY",
          m_theme.SuccessColor);
   
      ChartRedraw();
   }

   void Destroy()
   {
      ObjectsDeleteAll(0, m_prefix);

      Print("[CE] Dashboard Destroy");
   }
};

#endif