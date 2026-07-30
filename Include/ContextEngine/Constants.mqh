#define CE_MODULE_DASHBOARD "Dashboard"
#define CE_MODULE_SCORE     "ScoreEngine"
#define CE_MODULE_TREND     "TrendEngine"
#define CE_MODULE_ANALYZER  "Analyzer"
#define CE_MODULE_ENGINE    "Engine"

#define CE_STAGE_INITIALIZE      0

#define CE_STAGE_SWING         100
#define CE_STAGE_STRUCTURE     200

#define CE_STAGE_BOS           300
#define CE_STAGE_TREND         350
#define CE_STAGE_CHOCH         360

#define CE_STAGE_LIQUIDITY     370
#define CE_STAGE_FVG           380
#define CE_STAGE_FVG_FILL      390
#define CE_STAGE_ORDER_BLOCK   395

#define CE_STAGE_SMARTMONEY    400
#define CE_STAGE_CONFIRMATION  500

#define CE_STAGE_ORDER_BLOCK_SUMMARY   845
#define CE_STAGE_FVG_SUMMARY   850
#define CE_STAGE_SUMMARY       900
#define CE_STAGE_MARKET_BIAS   950
#define CE_STAGE_SCORE        1000

enum CEAnalyzerPriority
{
   CE_PRIORITY_DEFAULT   = 0,
   CE_PRIORITY_SWING     = 10,
   CE_PRIORITY_STRUCTURE = 20,
   CE_PRIORITY_TREND     = 30,
   CE_PRIORITY_BOS       = 40,
   CE_PRIORITY_LIQUIDITY = 35,
   CE_PRIORITY_CHOCH     = 50,   
   CE_PRIORITY_FVG       = 60,
   CE_PRIORITY_FVG_FILL  = 65,
   CE_PRIORITY_ORDER_BLOCK = 70,
   CE_PRIORITY_ORDER_BLOCK_SUMMARY = 84,
   CE_PRIORITY_FVG_SUMMARY  = 85,
   CE_PRIORITY_SUMMARY   = 90,
   CE_PRIORITY_SCORE     = 100
};