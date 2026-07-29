#define CE_MODULE_DASHBOARD "Dashboard"
#define CE_MODULE_SCORE     "ScoreEngine"
#define CE_MODULE_TREND     "TrendEngine"
#define CE_MODULE_ANALYZER  "Analyzer"
#define CE_MODULE_ENGINE    "Engine"

#define CE_STAGE_SWING        100
#define CE_STAGE_STRUCTURE    200
#define CE_STAGE_TREND        300
#define CE_STAGE_SMARTMONEY   400
#define CE_STAGE_CONFIRMATION 500
#define CE_STAGE_SUMMARY      900

enum CEAnalyzerPriority
{
   CE_PRIORITY_SWING     = 10,
   CE_PRIORITY_STRUCTURE = 20,
   CE_PRIORITY_TREND     = 30,
   CE_PRIORITY_BOS       = 40,
   CE_PRIORITY_CHOCH     = 50,
   CE_PRIORITY_FVG       = 60,
   CE_PRIORITY_SUMMARY   = 90
};