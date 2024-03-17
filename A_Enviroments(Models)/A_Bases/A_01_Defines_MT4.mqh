//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

//=====================================================================================================

//===================================
//PostMessageW(main, WM_COMMAND, MT4_WMCMD_ALL_HISTORY, 0);
//===================================
#define MT4_WMCMD_AUTOSCROLL      33017
#define MT4_WMCMD_BARS            33018
#define MT4_WMCMD_CANDLES         33019
/* 33020       unknown */
#define MT4_WMCMD_GRID            33021
#define MT4_WMCMD_LINE            33022
#define MT4_WMCMD_SHIFT           33023
#define MT4_WMCMD_VOLUMES         33024
#define MT4_WMCMD_ZOOM_IN         33025
#define MT4_WMCMD_ZOOM_OUT        33026
/* 33027-33047 unknown */
#define MT4_WMCMD_EXPERT_INPUTS   33048 /* Open expert Inputs dialog */
/* 33049       unknown */
#define MT4_WMCMD_REMOVE_EXPERT   33050 /* Remove expert advisor from chart */
/* 33051-33053 unknown */
#define MT4_WMCMD_SAVE_AS_PICTURE 33054
#define MT4_WMCMD_3_MONTHS        33057
#define MT4_WMCMD_ALL_HISTORY     33058
#define MT4_WMCMD_LAST_MONTH      33063
#define MT4_WMCMD_SAVE_Statement  33064
/* 33055-33133 unknown */
#define MT4_WMCMD_PERIOD_D1       33134
/* 33135       unknown */
//#define MT4_WMCMD_PERIOD_H1       33135
#define MT4_WMCMD_PERIOD_H4       33136
#define MT4_WMCMD_PERIOD_M1       33137
#define MT4_WMCMD_PERIOD_M5       33138
#define MT4_WMCMD_PERIOD_M15      33139
#define MT4_WMCMD_PERIOD_M30      33140
#define MT4_WMCMD_PERIOD_W1       33141
/* 33142-33156 unknown */
#define MT4_WMCMD_PROPERTIES      33157 /* Chart Properties (F8) */
/* 33158-33176 apparently unused */
#define MT4_WMCMD_PERIOD_SEPARATE 33177 /* Show/hide period separators */
/* 33178-33196 unknown */
#define MT4_WMCMD_MOVE_RIGHT      33197 /* Move right (right/down arrow) */
#define MT4_WMCMD_MOVE_LEFT       33198 /* Move left (left/up arrow) */
/* 33199-33219 unknown */
#define MT4_WMCMD_SAVE_TEMPLATE   33220 /* Save template... */
/* 33221-33229 unknown */
#define MT4_WMCMD_33230           33230 /* Arrow Down */
#define MT4_WMCMD_33231           33231 /* Arrow Up */
#define MT4_WMCMD_33232           33232 /* icons-ticks */
#define MT4_WMCMD_MOUSE_CROSS     33233 /* crosshair */
#define MT4_WMCMD_MOUSE_CURSOR    33234 /* the cursor */
#define MT4_WMCMD_33235           33235 /* Box-cyclical Line */
#define MT4_WMCMD_33236           33236 /* equidistant channel */
#define MT4_WMCMD_33237           33237 /* Fibonacci lines */
#define MT4_WMCMD_33238           33238 /* Box-Fibonacci-arc */
#define MT4_WMCMD_33239           33239 /* Box-Fibonacci-fan */
#define MT4_WMCMD_33240           33240 /* Box Channels, Fibonacci */
#define MT4_WMCMD_33241           33241 /* Box-Gann-grid Hanna */
#define MT4_WMCMD_33242           33242 /* Box-Gann-line Hanna */
#define MT4_WMCMD_33243           33243 /* Box-Gann-fan Hanna */
#define MT4_WMCMD_HLINE           33244 /* horizontal line */
/* 33245       unknown */
#define MT4_WMCMD_33246           33246 /* Box Andrews pitchfork */
#define MT4_WMCMD_33247           33247 /* Box-shape-rectangle */
#define MT4_WMCMD_33248           33248 /* Box-channels-linear regression */
/* 33249-33250 apparently unused */
#define MT4_WMCMD_33251           33251 /* Box-icons-stop */
/* 33252       unknown */
#define MT4_WMCMD_33253           33253 /* text */
#define MT4_WMCMD_33254           33254 /* Box-icons-bad */
#define MT4_WMCMD_33255           33255 /* Box-icons-well */
#define MT4_WMCMD_33256           33256 /* Box-Fibonacci-time-zone */
#define MT4_WMCMD_TRENDLINE       33257 /* trend line *////cool
#define MT4_WMCMD_33258           33258 /* Box-Line-trend line for the corner */
#define MT4_WMCMD_33259           33259 /* Box-figure-triangle */
#define MT4_WMCMD_VLINE           33260 /* Vertical Line */
#define MT4_WMCMD_LABEL           33261 /* text label */
/* 33262-33323 unknown */
#define MT4_WMCMD_UPDATE_DATA     33324 /* This doesn't cause experts start() to run */
//#define MT4_WMCMD_UPDATE_DATA     35419/// = Open Indicators List (same as CTRL+I)
/* 33325-33333 unknown */
#define MT4_WMCMD_PERIOD_MN1      33334 /* timeframe MN */
/* 33335-34299 unknown */
//============================================================================================================================
#define MT4_WMCMD_IND_C_34300           34300 /* 34300-34699 custom indicators in alphabetical order */  //00c WebColors_216.mq4>>34300
#define MT4_WMCMD_IND_CMTF_MacD_34328   34328 /* Indicators-zigzag *///indicators\A-MACDS\#MTF_MacD-2 line.ex4' [2] 
#define MT4_WMCMD_IND_CZig_34329        34329 /* Indicators-zigzag *///indicators\A-MACDS\#MTF_MacD-2 line.ex4' [2]  
#define MT4_WMCMD_IND_C01_34300         34300 /* frist custom indicators (300)*/
#define MT4_WMCMD_IND_CZig_34398        34398 /* PivotRange custom indicators (398)*/
#define MT4_WMCMD_IND_CZig_34399        34399 /* Pivot custom indicators (399)*/
#define MT4_WMCMD_IND_CZig_34400        34400 /* Last custom indicators (400)*/
#define MT4_WMCMD_IND_CZig_34401        34401 /* Last custom indicators (401) free*/
#define MT4_WMCMD_IND_CZig_34500        34500 /* Last custom indicators (500)*/
#define MT4_WMCMD_IND_CZig_34647        34647 /* Last custom indicators (647)*/
#define MT4_WMCMD_IND_CZig_34699        34699 /* Last custom indicators (699)*/
//---------------------------------------------------------------------
#define MT4_WMCMD_IND_ACCU_34700        34700 /* Indicators-accelerator oscillator */
#define MT4_WMCMD_IND_ACCU_34701        34701 /* Indicators-accumulation/distribution */
#define MT4_WMCMD_IND_Gator_34702       34702 /* Indicators-alligator */
#define MT4_WMCMD_IND_ADNX_34703        34703 /* indicators-average directional movement index */
#define MT4_WMCMD_IND_ATR_34704         34704 /* indicators-average true range */
#define MT4_WMCMD_IND_AO_34705          34705 /* Indicators-awesome oscillator */
#define MT4_WMCMD_IND_BoP_34706         34706 /* Indicators-bears power */
#define MT4_WMCMD_IND_BB_34707          34707 /* indicator-bollinger bands */
#define MT4_WMCMD_IND_BeP_34708         34708 /* Indicators-bulls power */
#define MT4_WMCMD_IND_CCI_34709         34709 /* Indicators-commodity channel index */
#define MT4_WMCMD_IND_DEMARK_34710      34710 /* Indicators-demarker */
#define MT4_WMCMD_IND_ENV_34711         34711 /* Indicators-envelopes */
#define MT4_WMCMD_IND_FI_34712          34712 /* Indicators-force index */
#define MT4_WMCMD_IND_F_34713           34713 /* Indicators-fractals */
#define MT4_WMCMD_IND_GO_34714          34714 /* Indicators-gator oscillator */
#define MT4_WMCMD_IND_IKH_34715         34715 /* Indicators-ichimoku kinko hyo */
#define MT4_WMCMD_IND_MACD_34716        34716 /* Indicators-macd */
#define MT4_WMCMD_IND_MFI_34717         34717 /* indicators-market facilitation index */
#define MT4_WMCMD_IND_MM_34718          34718 /* Indicators-momentum */
#define MT4_WMCMD_IND_MFI_34719         34719 /* indicators-money flow index */
#define MT4_WMCMD_IND_MA_34720          34720 /* indicators-moving averages */
#define MT4_WMCMD_IND_MAO_34721         34721 /* Indicators-moving average of oscillator */
#define MT4_WMCMD_IND_BV_34722          34722 /* Indicators-on balance volume */
#define MT4_WMCMD_IND_PS_34723          34723 /* Indicators-parabolic sar */
#define MT4_WMCMD_IND_RSI_34724         34724 /* indicators-relative strength index */
#define MT4_WMCMD_IND_RVI_34725         34725 /* indicators-relative vigor index */
#define MT4_WMCMD_IND_SD_34726          34726 /* Indicators-standard deviation */
#define MT4_WMCMD_IND_STO_34727         34727 /* Indicators-stochastic oscillator */
#define MT4_WMCMD_IND_VOLUM_34728       34728 /* Indicators-william's percent range *//* Indicators-volumes */
#define MT4_WMCMD_IND_WR_34729          34729 /* Indicators-william's percent range */
//============================================================================================================================
/* 34730-34799 unknown */
#define MT4_WMCMD_LOAD_TEMPLATE   34800 /* 34800-34899 load template in alphabetical order */
#define MT4_WMCMD_REMOVE_TEMPLATE 34900 /* 34900-34998 Remove Template in alph. order (conf. dialog) */
#define MT4_WMCMD_KILL_TEMPLATES  34999 /* remove *.tpl (confirmation dialog) */
/* 35000-35399 unknown */
#define MT4_WMCMD_PERIOD_H1       35400 /* timeframe H1 */
#define MT4_WMCMD_OBJECTS_LIST    35402 /* open objects list window */
#define MT4_WMCMD_SymbolSets_open 35428 /* open openinng symbolsets window */
#define MT4_WMCMD_Login_Win_open  35429 /* open Login window */
#define MT4_WMCMD_Test_35430      35430 /* open ---- window */
#define MT4_WMCMD_Test_35431      35431 /* open ---- window */
#define MT4_WMCMD_CustomPeriodWIN 35432 /* open ---- window */
#define MT4_WMCMD_Test_35433      35433 /* open ---- window */
#define MT4_WMCMD_Test_35434      35434 /* open ---- window */
#define MT4_WMCMD_LogsFolder      35435 /* open --LogsFolder-- window */
#define MT4_WMCMD_Test_35436      35436 /* open ---- window */
#define MT4_WMCMD_Test_35437      35437 /* open ---- window */
#define MT4_WMCMD_Test_35438      35438 /* open ---- window */
#define MT4_WMCMD_Test_35439      35439 /* open ---- window */1
#define MT4_WMCMD_Test_35440      35440 /* open ---- window */
//==============================================================================
#define MT4_WMCMD_35450           35450/* ==================== */
#define MT4_WMCMD_35451           35451 /* ==================== */
#define MT4_WMCMD_35452           35452 /* ==================== */
#define MT4_WMCMD_35453           35453 /* ==================== */
#define MT4_WMCMD_ORDER_BUYLIMIT  35454 /* order buy limit */
#define MT4_WMCMD_ORDER_BUYSTOP   35455 /* order buy stop */
#define MT4_WMCMD_ORDER_SELLLIMIT 35456 /* order sell limit *////no efect
#define MT4_WMCMD_ORDER_SELLSTOP  35457 /* order sell stop */
#define MT4_WMCMD_ORDER_MARKET    35458 /* new order (F9)-Panel */
#define MT4_WMCMD_35459           35459 /* ==================== */
//=============================================================
#define MT4_WMCMD_35460           35460 /* ============== */
#define MT4_WMCMD_35461           35461 /* ============== */
#define MT4_WMCMD_35462           35462 /* ============== */
#define MT4_WMCMD_35463           35463 /* left price tag */
#define MT4_WMCMD_35464           35464 /* right price tag */
#define MT4_WMCMD_35465           35465 /* Change Profile */
#define MT4_WMCMD_35466           35466 /* tester\logs folder */
#define MT4_WMCMD_35467           35467 /* ============== */
#define MT4_WMCMD_35468           35468 /* ============== */
#define MT4_WMCMD_35469           35469 /* ============== */
#define MT4_WMCMD_35470           35470 /* ============== */
//================================================================
#define MT4_WMCMD_35511           35511 /* Graphic template-download template */
/* 35512-37011 unknown */
/* 37012-40000 not inspected */
#define MT4_WMCMD_57602           57602 /* close the current chart */
#define MT4_WMCMD_57603           57603 /* Save as (ascii/csv) *////save data
#define MT4_WMCMD_57604           57604 /* Save as (ascii/csv) - apparently same */
#define MT4_WMCMD_PRINT_DIALOG    57607 /* Open Print... Dialog */
#define MT4_WMCMD_PRINT_DIRECT    57608 /* Print immediately */
#define MT4_WMCMD_PRINT_PREVIEW   57609 /* Open Print Preview dialog */
/* 57610-59675 unknown (re-checked up to 58011) */
/* 59675-...   not inspected */
//==============================================================================
#define MT4_WMCMD_Test            354560 /* open ---- window */
//==============================================================================

//==============================================================================
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+