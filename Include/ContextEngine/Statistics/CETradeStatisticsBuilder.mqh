#ifndef __CE_TRADE_STATISTICS_BUILDER_MQH__
#define __CE_TRADE_STATISTICS_BUILDER_MQH__

#include "CETradeStatistics.mqh"
#include "../Journal/CETradeJournalRepository.mqh"
#include "../Core/CELogger.mqh"
#include "../Constants.mqh"

class CETradeStatisticsBuilder
{
public:

   void Build(
      CETradeJournalRepository &repository,
      CETradeStatistics &statistics)
   {
      statistics.Reset();
   
      int total =
         repository.TradeCount();
   
      statistics.TotalTrades =
         total;
         
      double confidenceSum = 0.0;

      double qualitySum = 0.0;
      
      double ratioSum = 0.0;
      
      int ratioCount = 0;
   
      for(int i = 0;
          i < total;
          ++i)
      {
         CETradeJournalEntry entry =
            repository.At(i);
   
         switch(entry.Decision.Type)
         {
            case DECISION_BUY:
   
               statistics.BuyTrades++;
   
               break;
   
            case DECISION_SELL:
   
               statistics.SellTrades++;
   
               break;
   
            case DECISION_WAIT:
   
            default:
   
               statistics.WaitTrades++;
   
               break;
         }
         
         confidenceSum +=
            entry.Decision.Confidence;
         
         qualitySum +=
            entry.TradeSetup.Quality.Score;
            
         if(entry.Decision.Type == DECISION_BUY ||
            entry.Decision.Type == DECISION_SELL)
         {
            ratioSum +=
               entry.TradeSetup.RiskReward.Ratio;
         
            ratioCount++;
         }   
      }
      
      if(total > 0)
      {
         statistics.AverageConfidence =
            confidenceSum / total;
      
         statistics.AverageQuality =
            qualitySum / total;
      }
      
      if(ratioCount > 0)
      {
         statistics.AverageRatio =
            ratioSum / ratioCount;
      }

      if(!statistics.IsValid())
      {
         CELogger::Error(
            CE_MODULE_STATISTICS,
            "Trade statistics validation failed.");
      }
      
   }
};

#endif