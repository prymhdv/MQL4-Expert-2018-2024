//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
//=====================================================================
//---OnProgress
//---
//--
//-
#define         DebugMode       false
#define         OBJPREFIX       ""        ///"TP - "
#define         ioffX             false
#define         ionX              true
//#define         off              false
//#define         on               true
//==================================================================================
// Alert("Run: ",__LINE__," ",__FUNCSIG__," ");
// string FuncCom = __FUNCTION__,int LineCom = __LINE__  FuncCom+  __FUNCTION__,
// C_STATICSUN::DeleteAnaliseAllObjectName(0,0,1,
//////////////////////////////////
#define         ExpertName   "QUARTS-FXTradingMasters"
#define         Version      "0.06"
#define         Copyright    "Copyright © 2021, Pourya"
//--------------------------------------------------------
bool            Capitan_KeyBreakeErrorTest     = false; //changable//
#define         Capitan_ON_error_lastFuncRun     false
#define         Capitan_ResetLastErrorX          false

#define         Capitan_DeinitClass              false///caling every funcList
#define         Capitan_DeinitErrorCatching      false///Deinit Error Catching ///

#define         Capitan_SuperKeyAnaliseAllObject false
#define         Capitan_SuperKeyToolsConstructor false
#define         Capitan_KeyPlaytries             false
#define         Capitan_KeyPlayObjectsListTries  false
#define         Capitan_BIGERROOR                true
#define         Capitan_KeyAlertNotFound         false ///when Deleting///
#define         Capitan_KeyDoCandelBox           true
#define         Capitan_KeyDeleter               true//Run all deleting object
//#define Capitan_KeyBreakeTest 1//Run all deleting object
//4444444444444444444444444444444444444444444444444444444
#define         DoOnInit                1
#define         DoOnDeinit              1
#define         DoOnTimer               1///Sending ct_Order By timer
#define         DoOnChartEvent          1
#define         DoOnTick                1
#define         DoOnTrade               0
#define         DoTradeTransaction      0
#define         DoOnBookEvent           0

#define         DoOnTester              1
#define         DoOnTesterInit          1
#define         DoOnTesterDeinit        1
#define         DoOnTesterPass          1
//4444444444444444444444444444444444444444444444444444444
//Parameter//string_var//[in][out]  String. & with refrence call
//-------------------------------------------------------


//-------------------------------------------------------
#define         MAGICMA         20131111
#define         MAGICMAX        000001
#define         PipetUnit       0.00001
#define         PipUnit         0.0001
//==============================================================================
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+