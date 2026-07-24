//+------------------------------------------------------------------+
//| Context Engine                                                   |
//| Dashboard Renderer                                               |
//| Version : 1.00                                                   |
//+------------------------------------------------------------------+

#ifndef __CE_DASHBOARD_RENDERER_MQH__
#define __CE_DASHBOARD_RENDERER_MQH__

class CDashboardRenderer
{
private:

   string m_name;

   int m_corner;
   int m_x;
   int m_y;
   
   color m_color;
   
   int m_fontSize;
   
   string m_font;

public:

   // Constructor
   CDashboardRenderer(void);

   // Destructor
   ~CDashboardRenderer(void);

   // Public Methods
   bool Create(void);
   void Update(const string text);
   void Destroy(void);
};

//------------------------------------------------------------------
// Constructor
//------------------------------------------------------------------

CDashboardRenderer::CDashboardRenderer(void)
{
   m_name="CE_Dashboard";

   m_corner=CORNER_LEFT_UPPER;

   m_x=10;

   m_y=20;

   m_color=clrLime;

   m_fontSize=10;

   m_font="Consolas";
}

//------------------------------------------------------------------
// Destructor
//------------------------------------------------------------------

CDashboardRenderer::~CDashboardRenderer(void)
{
}

//------------------------------------------------------------------
// Create Dashboard
//------------------------------------------------------------------

bool CDashboardRenderer::Create(void)
{
   if(ObjectFind(0,m_name)>=0)
   ObjectDelete(0,m_name);

   if(!ObjectCreate(0,m_name,OBJ_LABEL,0,0,0))
      return(false);
   
   ObjectSetInteger(0,m_name,OBJPROP_CORNER,m_corner);
   
   ObjectSetInteger(0,m_name,OBJPROP_XDISTANCE,m_x);
   
   ObjectSetInteger(0,m_name,OBJPROP_YDISTANCE,m_y);
   
   ObjectSetInteger(0,m_name,OBJPROP_COLOR,m_color);
   
   ObjectSetInteger(0,m_name,OBJPROP_FONTSIZE,m_fontSize);
   
   ObjectSetString(0,m_name,OBJPROP_FONT,m_font);
   
   return(true);
}

//------------------------------------------------------------------
// Update Dashboard
//------------------------------------------------------------------

void CDashboardRenderer::Update(const string text)
{
   ObjectSetString(
      0,
      m_name,
      OBJPROP_TEXT,
      text
      );
}

//------------------------------------------------------------------
// Destroy Dashboard
//------------------------------------------------------------------

void CDashboardRenderer::Destroy(void)
{
   ObjectDelete(0,m_name);
}

#endif