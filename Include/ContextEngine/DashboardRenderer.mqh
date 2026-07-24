//+------------------------------------------------------------------+
//| DashboardRenderer.mqh                                            |
//+------------------------------------------------------------------+
#ifndef __DASHBOARD_RENDERER_MQH__
#define __DASHBOARD_RENDERER_MQH__

class CDashboardRenderer
{
private:

   string m_prefix;

   void CreateLabel(
      const string name,
      const string text,
      const int x,
      const int y,
      const color clr)
   {
      string obj = m_prefix + name;

      if(ObjectFind(0, obj) < 0)
      {
         ObjectCreate(0, obj, OBJ_LABEL, 0, 0, 0);

         ObjectSetInteger(0, obj, OBJPROP_CORNER, CORNER_LEFT_UPPER);
         ObjectSetInteger(0, obj, OBJPROP_XDISTANCE, x);
         ObjectSetInteger(0, obj, OBJPROP_YDISTANCE, y);
         ObjectSetInteger(0, obj, OBJPROP_COLOR, clr);
         ObjectSetInteger(0, obj, OBJPROP_FONTSIZE, 10);

         ObjectSetString(0, obj, OBJPROP_FONT, "Consolas");
      }

      ObjectSetString(0, obj, OBJPROP_TEXT, text);
   }

public:

   CDashboardRenderer()
   {
      m_prefix = "CE.";
   }

   bool Create()
   {
      Print("[CE] Dashboard Create");

      return true;
   }

   void Update()
   {
      CreateLabel("Title",
                  "Context Engine",
                  20,
                  20,
                  clrDodgerBlue);

      CreateLabel("Version",
                  "Version : 0.2.0",
                  20,
                  40,
                  clrWhite);

      CreateLabel("Symbol",
                  "Symbol : " + _Symbol,
                  20,
                  60,
                  clrWhite);

      CreateLabel("TF",
                  "TF : " + EnumToString(_Period),
                  20,
                  80,
                  clrWhite);

      CreateLabel("Status",
                  "Status : READY",
                  20,
                  100,
                  clrLime);

      ChartRedraw();
   }

   void Destroy()
   {
      ObjectsDeleteAll(0, m_prefix);

      Print("[CE] Dashboard Destroy");
   }
};

#endif