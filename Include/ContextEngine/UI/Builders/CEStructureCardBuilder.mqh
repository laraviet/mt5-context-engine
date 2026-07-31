#ifndef __CE_STRUCTURE_CARD_BUILDER_MQH__
#define __CE_STRUCTURE_CARD_BUILDER_MQH__

#include "IDashboardCardBuilder.mqh"

#include "../CEDashboardContext.mqh"
#include "../CEDashboardSection.mqh"
#include "../CEDashboardCardFactory.mqh"

class CEStructureCardBuilder : public IDashboardCardBuilder
{
public:

   virtual void Build(
      const CEAnalysisContext &analysis,
      CEDashboardContext &dashboard) override
   {
      CEDashboardSection section;

      section.Id    = "structure";
      section.Title = "Structure";

      //------------------------------------------------
      // Swing Structure
      //------------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "Structures",
            IntegerToString(
               analysis.StructureSeries.Count())));

      //------------------------------------------------
      // BOS
      //------------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "BOS",
            IntegerToString(
               analysis.BOSSeries.Count())));

      //------------------------------------------------
      // CHOCH
      //------------------------------------------------

      section.Add(
         CEDashboardCardFactory::Item(
            "CHOCH",
            IntegerToString(
               analysis.CHOCHSeries.Count())));

      //------------------------------------------------
      // Latest BOS
      //------------------------------------------------

      string lastBos = "-";

      if(analysis.BOSSeries.Count() > 0)
      {
         CEBOSPoint bos =
            analysis.BOSSeries.At(
               analysis.BOSSeries.Count() - 1);

         if(bos.IsBullish())
            lastBos = "Bullish";

         else
         if(bos.IsBearish())
            lastBos = "Bearish";
      }

      section.Add(
         CEDashboardCardFactory::Item(
            "Latest BOS",
            lastBos));

      //------------------------------------------------
      // Latest CHOCH
      //------------------------------------------------

      string lastChoch = "-";

      if(analysis.CHOCHSeries.Count() > 0)
      {
         CEChochPoint choch =
            analysis.CHOCHSeries.At(
               analysis.CHOCHSeries.Count() - 1);

         switch(choch.Type)
         {
            case CHOCH_BULLISH:
               lastChoch = "Bullish";
               break;

            case CHOCH_BEARISH:
               lastChoch = "Bearish";
               break;

            default:
               lastChoch = "-";
               break;
         }
      }

      section.Add(
         CEDashboardCardFactory::Item(
            "Latest CHOCH",
            lastChoch));

      dashboard.AddSection(section);
   }
};

#endif