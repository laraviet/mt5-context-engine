#ifndef __CE_BOS_DETECTOR_MQH__
#define __CE_BOS_DETECTOR_MQH__

#include "../Interfaces/IBOSDetector.mqh"

class CEBOSDetector : public IBOSDetector
{
public:

   virtual int Detect(
      const CEMarketStructureSeries &structures,
      CEBOSSeries &bos)
   {
      bos.Clear();

      for(int i=1;i<structures.Count();i++)
      {
         CEMarketStructurePoint previous=
            structures.At(i-1);

         CEMarketStructurePoint current=
            structures.At(i);

         if(previous.StructureType==STRUCTURE_HL &&
            current.StructureType==STRUCTURE_HH)
         {
            CEBOSPoint point;

            point.Index=current.Index;

            point.Time=current.Time;

            point.Type=BOS_BULLISH;

            point.StructureIndex=i;

            point.BreakPrice=current.Price;

            bos.Add(point);
         }

         if(previous.StructureType==STRUCTURE_LH &&
            current.StructureType==STRUCTURE_LL)
         {
            CEBOSPoint point;

            point.Index=current.Index;

            point.Time=current.Time;

            point.Type=BOS_BEARISH;

            point.StructureIndex=i;

            point.BreakPrice=current.Price;

            bos.Add(point);
         }
      }

      return bos.Count();
   }
};

#endif