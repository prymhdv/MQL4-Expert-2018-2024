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
input double Max_Profite_Scalp = 2;
input double INP_Vtrade_Profit = 2;
//=====================================================================
/*input*/ int     BrokerDigits          = 0;                 // Nnumber of digits that the broker uses for this currency pair
/*input*/ int     Leverage              = 0;                 // Account Leverage in percentage
/*input*/ double  MarginForOneLot       = 0;                 // Margin required for 1 lot
//=====================================================================================================
string  VolatilitySettings              = "==== Volatility Settings ====";
bool    UseDynamicVolatilityLimit       = TRUE; // Calculate VolatilityLimit based on INT (spread * VolatilityMultiplier)
double  VolatilityMultiplier            = 125; // Dynamic value, only used if UseDynamicVolatilityLimit is set to TRUE
double  VolatilityLimit                 = 180; // Fix value, only used if UseDynamicVolatilityLimit is set to FALSE
bool    UseVolatilityPercentage         = TRUE; // If true, then price must break out more than a specific percentage
double  VolatilityPercentageLimit       = 0; // Percentage of how much iHigh-iLow difference must differ from VolatilityLimit. 0 is risky, 60 means a safe value
double  volatilitypercentage;
//=====================================================================================================
string  UseIndicatorSet                 = "=== Indicators: 1 = Moving Average, 2 = BollingerBand, 3 = Envelopes";
int     UseIndicatorSwitch              = 1; // Switch User indicators.
int     Indicatorperiod                 = 3; // Period in bars for indicators
double  BBDeviation                     = 2.0; // Deviation for the iBands indicator
double  EnvelopesDeviation              = 0.07; // Deviation for the iEnvelopes indicator
int     OrderExpireSeconds              = 3600; // Orders are deleted after so many seconds
//=====================================================================================================
string  Money_Management                = "==== Money Management ====";
bool    MoneyManagement                 = TRUE; // If TRUE then calculate lotsize automaticallay based on Risk, if False then use ManualLotsize below
double  MinLots                         = 0.01; // Minimum lot-size to trade with
double  MaxLots                         = 100.0;  // Maximum allowed lot-size to trade with
double  Risk                            = 2.0; // Risk setting in percentage, For 10.000 in Equity 10% Risk and 60 StopLoss lotsize = 16.66
double  ManualLotsize                   = 0.1; // Manual lotsize to trade with if MoneyManagement above is set to FALSE
double  MinMarginLevel                  = 100; // Lowest allowed Margin level for new positions to be opened.
//=====================================================================================================
string  Screen_Shooter                  = "==== Screen Shooter ====";
bool    TakeShots                       = FALSE; // Save screen shots on STOP orders?
int     DelayTicks                      = 1; // Delay so many ticks after new bar
int     ShotsPerBar                     = 1; // How many screen shots per bar
//=====================================================================================================
//--- Inputs
/*input*/ double Lots__          = 0.1;
/*input*/ double MaximumRisk__   = 0.02;
/*input*/ double DecreaseFactor__ = 3;
///////////////////////////////////
/*input*/ double TakeProfit__    = 50;
/*input*/ double TrailingStop__  = 30;
///////////////////////////////////
/*input*/ int    MovingPeriod__  = 12;
/*input*/ int    MovingShift__   = 6;
/*input*/ double MACDOpenLevel__ = 3;
/*input*/ double MACDCloseLevel__ = 2;
/*input*/ int    MATrendPeriod__ = 26;
//==============================================================================
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
