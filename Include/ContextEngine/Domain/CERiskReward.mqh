#ifndef __CE_RISK_REWARD_MQH__
#define __CE_RISK_REWARD_MQH__

class CERiskReward
{
public:

   bool Valid;

   double Risk;

   double Reward;

   double Ratio;

public:

   CERiskReward()
   {
      Reset();
   }

   void Reset()
   {
      Valid = false;
      Risk = 0.0;
      Reward = 0.0;
      Ratio = 0.0;
   }
};

#endif