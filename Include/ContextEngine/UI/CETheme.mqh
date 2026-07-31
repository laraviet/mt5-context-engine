#ifndef __CE_THEME_MQH__
#define __CE_THEME_MQH__

class CETheme
{
public:

   color TitleColor;
   color TextColor;
   color SuccessColor;
   color WarningColor;
   color ErrorColor;
   color SectionColor;

   int FontSize;

   int PaddingLeft;
   int PaddingTop;
   int LineHeight;

public:

   CETheme()
   {
      Reset();
   }

   void Reset()
   {
      TitleColor   = clrDodgerBlue;
      TextColor    = clrBlack;
      SuccessColor = clrLimeGreen;
      WarningColor = clrOrange;
      ErrorColor   = clrTomato;
      SectionColor = clrDeepSkyBlue;

      FontSize     = 10;

      PaddingLeft  = 20;
      PaddingTop   = 20;
      LineHeight   = 20;
   }
};

#endif