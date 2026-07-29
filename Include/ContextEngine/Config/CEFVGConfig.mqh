#ifndef __CE_FVG_CONFIG_MQH__
#define __CE_FVG_CONFIG_MQH__

enum ENUM_FVG_FILL_MODE
{
    FVG_TOUCH_EDGE,

    FVG_TOUCH_MID,

    FVG_FULL_FILL
};

class CEFVGConfig
{
public:

   double MinGap;
   
   ENUM_FVG_FILL_MODE FillMode;

public:

   CEFVGConfig()
   {
      MinGap = 5 * _Point;
   }
};

#endif