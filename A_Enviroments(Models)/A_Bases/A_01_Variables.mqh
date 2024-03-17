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
string          LastCreatedObjectNameS[];// = "None";
string          LastDeletedObjectNameS[];// = "None";
static int      SafeObjectTotalByDeiniter = ObjectsTotal();
//ENUM_TIMEFRAMES FristChart = ChartPeriod(0);
//=================
//bool KeyModify = false,
bool    Vg_IsBasic_UNINITED       = false;
bool    Vg_IsBasic_INITED         = false;
//bool    Sup(bool Key = false);             //no #import declaration Capitan.mqh         19        9
bool    Sup(bool Key = false) {return Key;}
//=================
bool KeyAlert           = 0;
int  RunCallFunction    = 0;//
//=================
bool    ShowOrdHistory = true; //ShowOrderHistory
//==================================================================================
////////////variable controling/////////////
//long            Tick_volume_[2];
//int             Spread_[2];
//double          LastOpen_    = Open[1];
//double          LastClose_   = Close[1];
//double          LastLow_     = Low[1];
//double          LastHigh_    = High[1];
//ulong           LastVolume_  = Volume[1]; // Real Volume
//datetime        LastTime_    = Time[1];
//long            LastTick_volume_ = Tick_volume_[1]; // Tick Volume
//int             LastSpread_  = Spread_[1];
//==============================================================================
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+