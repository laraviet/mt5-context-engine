#ifndef __CE_LIQUIDITY_POINT_MQH__
#define __CE_LIQUIDITY_POINT_MQH__

#include "CELiquidityType.mqh"

class CELiquidityPoint
{
public:

   int Index;

   datetime Time;

   CELiquidityType Type;

   int SwingIndex;

   int BOSIndex;

   double Price;

   bool Swept;

   bool SweepOnly;

public:

   CELiquidityPoint()
   {
      Reset();
   }

   void Reset()
   {
      Index = -1;

      Time = 0;

      Type = LIQUIDITY_UNKNOWN;

      SwingIndex = -1;

      BOSIndex = -1;

      Price = 0;

      Swept = false;

      SweepOnly = false;
   }

   bool IsBuySide() const
   {
      return Type == LIQUIDITY_BUY_SIDE;
   }

   bool IsSellSide() const
   {
      return Type == LIQUIDITY_SELL_SIDE;
   }

   bool IsSweepOnly() const
   {
      return SweepOnly;
   }

   bool IsConfirmedSweep() const
   {
      return Swept && !SweepOnly;
   }
};

#endif