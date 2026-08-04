#ifndef __CE_DASHBOARD_LAYOUT_MQH__
#define __CE_DASHBOARD_LAYOUT_MQH__

#include <ContextEngine/UI/CETheme.mqh>

class CEDashboardLayout
{
private:

   int m_x;

   int m_y;

   int m_lineHeight;

public:

   CEDashboardLayout()
   {
      CETheme theme;

      m_x =
         theme.PaddingLeft;

      m_y =
         theme.PaddingTop;

      m_lineHeight =
         theme.LineHeight;
   }

   void Reset()
   {
      CETheme theme;

      m_x =
         theme.PaddingLeft;

      m_y =
         theme.PaddingTop;
   }

   void NextLine()
   {
      AddLines();
   }

   int X() const
   {
      return m_x;
   }

   int Y() const
   {
      return m_y;
   }

   int LineHeight() const
   {
      return m_lineHeight;
   }
   
   void AddLines(const int count = 1)
   {
      m_y += (m_lineHeight * count);
   }
   
   void SetY(const int y)
   {
      m_y = y;
   }
   
};

#endif