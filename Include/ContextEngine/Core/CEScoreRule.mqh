#ifndef __CE_SCORE_RULE_MQH__
#define __CE_SCORE_RULE_MQH__

class CEScoreRule
{
public:

   int Strong;

   int Normal;

   int Weak;

public:

   CEScoreRule()
   {
      Reset();
   }

   void Reset()
   {
      Strong = 0;
      Normal = 0;
      Weak   = 0;
   }

   void Set(
      const int strong,
      const int normal,
      const int weak)
   {
      Strong = strong;
      Normal = normal;
      Weak   = weak;
   }
};

#endif