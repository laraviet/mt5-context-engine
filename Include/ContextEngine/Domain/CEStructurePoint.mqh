#ifndef __CE_STRUCTURE_POINT_MQH__
#define __CE_STRUCTURE_POINT_MQH__

enum CEStructureType
{
   STRUCTURE_UNKNOWN = 0,

   STRUCTURE_HH,

   STRUCTURE_HL,

   STRUCTURE_LH,

   STRUCTURE_LL
};

class CEStructurePoint
{
public:

   CEStructureType Type;

   CESwingPoint Swing;

   CEStructurePoint()
   {
      Type = STRUCTURE_UNKNOWN;
   }
   
   string ToString() const
   {
      switch(Type)
      {
         case STRUCTURE_HH: return "HH";
         case STRUCTURE_HL: return "HL";
         case STRUCTURE_LH: return "LH";
         case STRUCTURE_LL: return "LL";
         default:           return "UNKNOWN";
      }
   }
};

#endif