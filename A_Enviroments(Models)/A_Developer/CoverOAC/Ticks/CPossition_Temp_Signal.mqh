//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\StC_Data.mqh>
struct STradeInfo
{         ENUM_TIMEFRAMES  fSelected_Current;// = 0;
          int              Number;
          int           C_High2Risk_Buy, C_HighRisk_Buy, C_MediumRisk_Buy, C_LowRisk_Buy, C_Low2Risk_Buy;
          int           C_High2Risk_Sell, C_HighRisk_Sell, C_MediumRisk_Sell, C_LowRisk_Sell, C_Low2Risk_Sell;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CPossition_Temp_Signal
{
public:
          CPossition_Temp_Signal(void)
          {         Lots           = 0.1;
                    MaximumRisk    = 0.015;
                    DecreaseFactor = 3; //
                    Factor         = 0.1;
                    InitialBALANCE = AccountBalance(); //
                    //
          };
          ~CPossition_Temp_Signal(void) {};
          //---------------------------------------
          double     TotalProfitCurrent;
          double     InitialBALANCE;// = AccountBalance();
          double     MaximumProfit;
          //---------------------------------------
          StC_Data   Data;
          //-------------------------------------------------------------
          SignalDatas_MovingAvrages             _MovingAvrages;
          SignalDatas_MACD                      _MACD;
          SignalDatas_RSI                       _RSI;
          SignalDatas_Stochastic                _Stochastic;
          SignalDatas_RVI                       _RVI;
          SignalDatas_Bollingrad_band           _Bollingrad_band;
          SignalDatas_ADX                       _ADX;
          SignalDatas_MFI                       _MFI;
          SignalDatas_OVB                       _OVB;
          SignalDatas_ATR                       _ATR;
          SignalDatas_Force                     _Force;
          SignalDatas_WPR                       _WPR;
          SignalDatas_SAR                       _SAR;  //----cooller
          SignalDatas_Ichmiko                   _Ichmiko;
          SignalDatas_AD                        _AD;
          SignalDatas_AliGator                  _AliGator;
          SignalDatas_STD                       _STD;
          SignalDatas_BWMFI                     _BWMFI;
          SignalDatas_TrendLineBoxFractal       _TrendLineBoxFractal;
          SignalDatas_TL_0_50_50_100_HL         _TL_0_50_50_100_HL;
          SignalDatas_TL_500_HL                 _TL_500_HL;
          SignalDatas_FE                        _FE_50, _FE_100, _FE_200;;
          SignalDatas_HL_50_100_150             _HL_50_100_150;
          SignalDatas_STD_Channel               _STD_Channel;
          //----------------------------
          //--- Inputs
          double Lots           ;//= 0.1;
          double MaximumRisk    ;//= 0.02;
          double DecreaseFactor ;//= 3;
          double     Factor;
          //int CMD; //OP_BUY,

          double     SL1Target;
          double     TP1Target;
          double     TP2Target;
          double     TP3Target;

          int        PipDistanceFromEntryToNow;
          int        PipDistanceFromEntryToTP1;
          int        PipDistanceFromEntryToTP2;
          int        PipDistanceFromEntryToTP3;
          int        PipDistanceFromEntryToSL1; //EntryPrice - Ask\Bid
          int        PipMinimumDistanceFromEntryToSL1;

          E_Risk_Signal CheackSignal_Entry(ENUM_TIMEFRAMES &f, int &slpip, int &tppip);
          E_Risk_Signal CheackSignal_Exit();
          //---------------------------------
          double  LotsOptimized_BySLPip(int &SLpips, double MaxRiskPercent );
          double  LotsOptimized_ByMargine(double MaxRiskPercent);

          STradeInfo  TradeInfo;
          void SLTpPipOptimized(double VolumeLot, int &SLPip, int &TpPip)
          {         double fdegree = AccountBalance() / VolumeLot / AccountFreeMargin();
                    //---------
                    SLPip = (int)(SLPip * fdegree / 10);
                    TpPip = (int)(TpPip * fdegree / 10);
                    //---------
                    return;//
          }
          //---------------------------------

          //+------------------------------------------------------------------+ more Slpip less lot :less Slpip more lot
          //|                        Calc Lot Size                             |1
          //+------------------------------------------------------------------+
          int CalcSLPip(bool IsDynamicSLPip, double argEquityPercent, double argLotSize, int argFixedSLPip)
          {         int SLPip;
                    if(IsDynamicSLPip && argLotSize > 0)
                    {         double RiskAmount = AccountEquity() * (argEquityPercent / 100);
                              double TickValue = MarketInfo(Symbol(), MODE_TICKVALUE);
                              if(Point == 0.001 || Point == 0.00001) TickValue *= 10;
                              ///----------------------------------------
                              //double RiskPerSLPip = (RiskAmount / argStopLoss);
                              //argLotSize =  RiskPerSLPip / TickValue; //
                              ///----------------------------------------
                              double RiskPerSLPip = argLotSize * TickValue;
                              SLPip = (int)( RiskAmount / RiskPerSLPip);
                              //-----------------------------------------
                              //double factorial  = argLotSize * RiskAmount * TickValue;
                              RiskPerSLPip = ((argLotSize) * TickValue) ;
                              SLPip = (int)(  MathAbs(( RiskAmount) / (RiskPerSLPip)))  ;
                              //SLPip =  !_RSI.Is_RSI_BulishPeriodsShift(PERIOD_M1, 5, 7, PRICE_CLOSE, 0, 0) ? (MathAbs(iMA(_Symbol, PERIOD_M15,20,0,MODE_EMA,PRICE_CLOSE,0) - Ask) * 100)*20 : (MathAbs(iMA(_Symbol, PERIOD_M5,20,0,MODE_EMA,PRICE_CLOSE,0) - Ask) * 100)*20;
                              //-----------------------------------------((MathAbs(iSAR(_Symbol, PERIOD_M30, 0.01, 0.2,0) - Ask) * 100)< SLPip)
                              //-----------------------------------------(MathAbs(iMA(_Symbol, PERIOD_M15,20,0,MODE_EMA,PRICE_CLOSE,0) - Ask) * 100)
                    }
                    else {SLPip = argFixedSLPip;}
                    return(SLPip); //
          }
          //+------------------------------------------------------------------+
          //|                        Calc Lot Size                             |1
          //+------------------------------------------------------------------+
          double CalcLotSize(bool IsDynamicLotSize, double argEquityPercent, double argStopLoss, double argFixedLotSize)
          {         double LotSize;
                    if(IsDynamicLotSize && argStopLoss > 0)
                    {         double RiskAmount = AccountEquity() * (argEquityPercent);
                              double TickValue = MarketInfo(Symbol(), MODE_TICKVALUE);
                              if(Point == 0.001 || Point == 0.00001) TickValue *= 10;
                              double RiskPerSLPip = (RiskAmount / argStopLoss);
                              LotSize =  RiskPerSLPip / TickValue; //---tick value for xauusd is one
                    }
                    else {LotSize = argFixedLotSize;}
                    return(VerifyLotSize(LotSize)); //
          }
          //+------------------------------------------------------------------+\\\auto correction
          //|                       Verify Lot Size                            |2
          //+------------------------------------------------------------------+
          double VerifyLotSize(double argLotSize)
          {         if(argLotSize < MarketInfo(Symbol(), MODE_MINLOT))      { argLotSize = MarketInfo(Symbol(), MODE_MINLOT); }
                    else if(argLotSize > MarketInfo(Symbol(), MODE_MAXLOT)) { argLotSize = MarketInfo(Symbol(), MODE_MAXLOT); }
                    if(MarketInfo(Symbol(), MODE_LOTSTEP) == 0.1)           { argLotSize = NormalizeDouble(argLotSize, 1); }
                    else                                                    { argLotSize = NormalizeDouble(argLotSize, 2);}
                    return(argLotSize);//
          }
          //
};
//+------------------------------------------------------------------+
//| Calculate optimal lot size                                       |
//+------------------------------------------------------------------+MaximumRisk
double CPossition_Temp_Signal::LotsOptimized_ByMargine(double MaxRiskPercent)
{         double lot = 0;
          int    orders = HistoryTotal();   // history orders total
          int    losses = 0;                // number of losses orders without a break
          //--- select lot size
          lot = NormalizeDouble(AccountFreeMargin() * MaxRiskPercent / 1000.0, 2);
          //--- calcuulate number of losses orders without a break
          if(DecreaseFactor > 0)
          {         for(int i = orders - 1; i >= 0; i--)
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY) == false) { Print("Error in history!"); break; }
                              if(OrderSymbol() != Symbol() || OrderType() > OP_SELL)    continue;
                              //---
                              if(OrderProfit() > 0) break;
                              if(OrderProfit() < 0) losses++; }
                    if(losses > 1) lot = NormalizeDouble(lot - lot * losses / DecreaseFactor, 2);//
          }
          //--- return lot size
          if(lot < 0.01) lot = 0.01;
          return(lot);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CPossition_Temp_Signal::LotsOptimized_BySLPip(int &SLpips, double MaxRiskPercent )
{         //-------------------------------------------------------------------------------
          return CalcLotSize(1, MaxRiskPercent, SLpips, 0.01) ;
          //Print("---for one lot you need sl pip amount by 0.02 risk:  ", (string)SLpips); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

// && Data._MovingAvrages.IsBulish__Forwarding_20__200_300_m1  Data._MovingAvrages.IsBulish__Forwarding_20__200_300_m1
// && Data._MovingAvrages.IsMA_14_200Bulish_20bar_m5
// && Data._MovingAvrages.IsMA500_PriceUnderLevel1300
// && Data._RSI.Is_RSI_7_14_40_Bearish_m5                              && Data._RSI.Is_RSI_7_14_40_Bulish_m5

// && Data._Stochastic.Stoch_Bulish_M5                                 && Data._Stochastic.IsStochBuy_Cross_m5
// && Data.PowerMACD_STATE < 0                                         && Data.PowerMACD_STATE > 0
// && Data._MACD.IsBulish_ForwardingCorrection__m1_m5     && Data._MACD.IsBearish_BackWarding__m1_m5
//
//--bad efect all --- !Data._Stochastic.Stoch_Bulish_M5&& !Data._RSI.IsRSI_14_40_Bulish_h1
//&& Data._MovingAvrages.IsMA_14_200Bulish_20bar_m5
//&& !Data._ATR.IsATR_Factor_Under
//&& !Data._WPR.IsWPR_200_MA14_Bulish_m1
//&& Data._Stochastic.IsStochBuy_Cross_m5
//&& Data._MovingAvrages.IsMA_14_200Bulish_20bar_m5
//&& Data._OVB.IsOVB_Bulish_M5
//&& Data._ATR.IsATR_Factor_Under;
//&& Data._RSI.Is_RSI_7_14_40_Bearish_m5
//&& Data._Stochastic.IsStochSell_Cross_m5
//&& !Data._MovingAvrages.IsMA_14_200Bulish_20bar_m5
//&& Data._RSI.Is_RSI_7_14_40_Bearish_m5
//Data._Stochastic.Stoch_Bulish_H1
//&& Data._RSI.Is_RSI_7_14_40_Bearish_m5
//&& Data._RSI.IsRSI_14_40_Bearish_CrossPoint_m5
//&& Data._Stochastic.Stoch_Bulish_H1
//&& Data._MovingAvrages.IsMA_Bulish_20_30_m15
//&& !Data._MovingAvrages.IsMA_Bulish_20_30_m1
//&& Data._ATR.IsATR_Factor_Under
//&& Data._AliGator.IsAliGator_Bulish_m15
//Data._WPR.IsWPR_200_Upper_n20_Bulish_m1
//&& Data._RSI.Is_RSI_7_14_40_Bulish_m5
//&& !Data._Stochastic.Stoch_Bulish_M5
//!Data._AliGator.IsAliGator_Bulish_m15
//!Data._AliGator.IsAliGator_Bulish_m15
//&& (
//&& !Data._Stochastic.Stoch_Bulish_M30
//&& Data._RSI.Is_RSI_7_14_40_Bulish_m5
//Data.PowerMACD_STATE > 0
//&& (Data._MACD.e_MACD_STATE_M5 == UP_OUT || Data._MACD.e_MACD_STATE_M5 == DOWN_IN)

//--------------------------------------------------------------------
//&& Data._MovingAvrages.IsMA_bulishPeriodsFrames(PERIOD_M15, 20, MODE_EMA, 0, PERIOD_M15, 20, MODE_EMA, 3)
//&& Data._MovingAvrages.IsMA_bulishPeriodsFramesCross(PERIOD_M5, 20, MODE_EMA, 0, PERIOD_M5, 30, MODE_EMA, 0);
//&& Data._MovingAvrages.IsBulish__Correction(PERIOD_M1,20,30,200,300);
//
//&& Data._WPR.Is_WPR_Bulish(PERIOD_M5, 7, 14, 200);
//&& Data._WPR.Is_WPR_BulishDelta(PERIOD_M1, 200, -30 )&& !Data._WPR.Is_WPR_BulishDelta(PERIOD_M1, 200, -70 )
//
//&& Data._RSI.Is_RSI_BearishP3(PERIOD_M5, 7, 14, 40, 50)     Data._RSI.Is_RSI_BulishP3(PERIOD_M5, 7, 14, 40, 50);
//&& Data._RSI.Is_RSI_INDelta(PERIOD_M1, 14, 30, 20 )
//&& Data._RSI.Is_RSI_BulishShift(PERIOD_M1,0,2)
//
//&& Data._MACD.IsBulish_Forwarding(PERIOD_M5, PERIOD_M30, 2.0)
//&&(Data._MACD.GetMACD_State(PERIOD_M5) == DOWN_OUT || Data._MACD.GetMACD_State(PERIOD_M5) == UP_IN)
//
//&& Data._Stochastic.Stoch_Bulish(PERIOD_M1)
//&& Stoch_BulishDelta(ENUM_TIMEFRAMES f, int delta)
//
//&& Data._SAR.IsSar_Cross_Bulish(PERIOD_M5, 0.01, 0.2, 0, 1)
//&& Data._SAR.IsSar_Bulish(PERIOD_M1, 0.01, 0.2, 0);              //&& Data._SAR.IsSar_Bearish(PERIOD_M1, 0.01, 0.2, 0);;
//+------------------------------------------------------------------+Data._MACD.IsBulish_Forwarding___m15_m30  //0
//|                                                                  | Data._RSI.Is_RSI_7_14_40_Bulish_m5   //0
//+------------------------------------------------------------------+
E_Risk_Signal CPossition_Temp_Signal::CheackSignal_Entry(ENUM_TIMEFRAMES &f, int &slpip, int &tppip)
{         //
          double BuyPower = 0; double SellPower = 0;
          if(0)return eVoid_Risk_Signal;
          //--------------------------------------------------------------------------------------------------------------
          bool IsNonRisk_Buy, IsLow2Risk_Buy, IsLowRisk_Buy, IsMediumRisk_Buy, IsHighRisk_Buy, IsHigh2Risk_Buy;
          bool IsNonRisk_Sell, IsLow2Risk_Sell, IsLowRisk_Sell, IsMediumRisk_Sell, IsHighRisk_Sell, IsHigh2Risk_Sell;
          IsNonRisk_Buy = IsLow2Risk_Buy = IsLowRisk_Buy = IsMediumRisk_Buy = IsHighRisk_Buy = IsHigh2Risk_Buy = 0;
          IsNonRisk_Sell = IsLow2Risk_Sell = IsLowRisk_Sell = IsMediumRisk_Sell = IsHighRisk_Sell = IsHigh2Risk_Sell = 0;
          //--------------------------------------------------------------------------------------------------------------Data.PowerMACD_STATE < 0
          //if(Data.PowerMACD_STATE < 0)                                                                                  {         BuyPower += 30;}
          //if(Data._MACD.GetMACD_State(PERIOD_M1) == DOWN_OUT || Data._MACD.GetMACD_State(PERIOD_M1) == UP_IN)           {         BuyPower += 10;}
          //if(Data._MACD.GetMACD_State(PERIOD_M5) == DOWN_OUT || Data._MACD.GetMACD_State(PERIOD_M5) == UP_IN)           {         BuyPower += 10;}
          //if(Data._MACD.GetMACD_State(PERIOD_M15) == DOWN_OUT || Data._MACD.GetMACD_State(PERIOD_M15) == UP_IN)         {         BuyPower += 10;}
          //if(Data._MovingAvrages.IsMA_bulishPeriodsFrames(PERIOD_M1, 30, MODE_EMA, 0, PERIOD_M1, 200, MODE_EMA, 3))                  {         BuyPower += 10;}
          //if(Data._RSI.Is_RSI_INDelta(PERIOD_M1, 14, 30, 20 ))                                                          {         BuyPower += 10;}
          //if(Data._RSI.Is_RSI_BulishShift(PERIOD_M5, 14, 0, 2))                                                         {         BuyPower += 10;}
          //if(Data._RSI.Is_RSI_BulishShift(PERIOD_M5, 28, 0, 2))                                                         {         BuyPower += 10;};
          //if(Data._SAR.IsSar_Bulish(PERIOD_M1, 0.01, 0.2, 0))                                                           {         BuyPower += 10;}
          //if(Data._SAR.IsSar_Bulish(PERIOD_D1, 0.01, 0.2, 0))                                                           {         BuyPower += 10;}
          //if(!Data._STD_Channel.IsPrice_Cross_lower161)                                                                 {         BuyPower += 10;}
          //if(Data._WPR.Is_WPR_BulishDelta(PERIOD_M1, 200, -30 ))                                                        {         BuyPower += 10;}
          //-------------------------------------------------------------------------------------------------------------------//--some stable BuyPower > 30
          //if(Data.PowerMACD_STATE > 0)                                                                                  {         SellPower += 30;}
          //if(Data._MACD.GetMACD_State(PERIOD_M1) == UP_OUT || Data._MACD.GetMACD_State(PERIOD_M1) == DOWN_IN)           {         SellPower += 10;}
          //if(Data._MACD.GetMACD_State(PERIOD_M5) == UP_OUT || Data._MACD.GetMACD_State(PERIOD_M5) == DOWN_IN)           {         SellPower += 10;}
          //if(Data._MACD.GetMACD_State(PERIOD_M15) == UP_OUT || Data._MACD.GetMACD_State(PERIOD_M15) == DOWN_IN)         {         SellPower += 10;}
          //if(Data._MovingAvrages.IsBulish__Correction(PERIOD_M5, 20, 30, 200, 300))                                     {         SellPower += 10;}
          //if(Data._MovingAvrages.IsBearish__Forwarding(PERIOD_M1, 20, 30, 200, 300))                                    {         SellPower += 10;}
          //if(!Data._Stochastic.Stoch_Bulish(PERIOD_M1, 0))                                                              {         SellPower += 20;}
          //if(!Data._Stochastic.Stoch_BulishDelta(PERIOD_M1, 70))                                                        {         SellPower += 5;}
          //if(!Data._RSI.Is_RSI_BulishShift(PERIOD_M1, 14, 0, 2))                                                        {         SellPower += 7;}
          //if(Data._MACD.IsBearish_ForWarding(PERIOD_M1, PERIOD_M5, 1.0))                                                {         SellPower += 20;}
          //if(!Data._OVB.IsOVB_Bulish(PERIOD_M5, 0, 7))                                                                  {         SellPower += 5;}
          //if(Data._SAR.IsSar_Bearish(PERIOD_M1, 0.01, 0.2, 0))                                                          {         SellPower += 10;}
          //if(Data._SAR.IsSar_Bearish(PERIOD_D1, 0.01, 0.2, 0))                                                          {         SellPower += 10;}
          //if(!Data._STD_Channel.IsPrice_Cross_upper161)                                                                 {         SellPower += 10;}
          //if(!Data._WPR.Is_WPR_BulishDelta(PERIOD_M1, 200, -70 ))                                                       {         SellPower += 10;}
          //--------------------------------------------------------------------------------------------------------------SellPower > 30
          if(IsNonRisk_Sell)                                                                  {  IsNonRisk_Sell     = 1;}
          else if(Data.IsHowRiskTradel(f, slpip, tppip)       == eLow2_Risk_Signal_Sell)      {  IsLow2Risk_Sell    = 1;}
          else if(Data.IsHowRiskTradel(f, slpip, tppip)       == eLow_Risk_Signal_Sell)       {  IsLowRisk_Sell     = 1;}
          else if(Data.IsHowRiskTradel(f, slpip, tppip)       == eMedium_Risk_Signal_Sell)    {  IsMediumRisk_Sell  = 1;}
          else if(Data.IsHowRiskTradel(f, slpip, tppip)       == eHigh_Risk_Signal_Sell)      {  IsHighRisk_Sell    = 1;}
          else if(Data.IsHowRiskTradel(f, slpip, tppip)       == eHigh2_Risk_Signal_Sell)     {  IsHigh2Risk_Sell   = 1;}
          else if(IsNonRisk_Buy)                                                              {  IsNonRisk_Buy      = 1;}
          else if(Data.IsHowRiskTradel(f, slpip, tppip)       == eLow2_Risk_Signal_Buy)       {  IsLow2Risk_Buy     = 1;}
          else if(Data.IsHowRiskTradel(f, slpip, tppip)       == eLow_Risk_Signal_Buy)        {  IsLowRisk_Buy      = 1;}
          else if(Data.IsHowRiskTradel(f, slpip, tppip)       == eMedium_Risk_Signal_Buy)     {  IsMediumRisk_Buy   = 1;}
          else if(Data.IsHowRiskTradel(f, slpip, tppip)       == eHigh_Risk_Signal_Buy)       {  IsHighRisk_Buy     = 1;}
          else if(Data.IsHowRiskTradel(f, slpip, tppip)       == eHigh2_Risk_Signal_Buy)      {  IsHigh2Risk_Buy    = 1;}
          //--------------------------------------------------------------------------------------------------------------
          if(IsNonRisk_Sell)                { Print(" ", "eNon_Risk_Signal", " " );               return eNon_Risk_Signal;         }
          else if(IsLow2Risk_Sell)          { Print(" ", "eLow2_Risk_Signal_Sell", " " );         return eLow2_Risk_Signal_Sell;   }
          else if(IsLowRisk_Sell)           { Print(" ", "eLow_Risk_Signal_Sell", " " );          return eLow_Risk_Signal_Sell;    }
          else if(IsMediumRisk_Sell)        { Print(" ", "eMedium_Risk_Signal_Sell", " " );       return eMedium_Risk_Signal_Sell; }
          else if(IsHighRisk_Sell)          { Print(" ", "eHigh_Risk_Signal_Sell", " " );         return eHigh_Risk_Signal_Sell;   }
          else if(IsHigh2Risk_Sell)         { Print(" ", "eHigh2_Risk_Signal_Sell", " " );        return eHigh2_Risk_Signal_Sell;  }
          else if(IsNonRisk_Buy)            { Print(" ", "eNon_Risk_Signal", " " );               return eNon_Risk_Signal;         }
          else if(IsLow2Risk_Buy)           { Print(" ", "eLow2_Risk_Signal_Buy", " " );          return eLow2_Risk_Signal_Buy;    }
          else if(IsLowRisk_Buy)            { Print(" ", "eLow_Risk_Signal_Buy", " " );           return eLow_Risk_Signal_Buy;     }
          else if(IsMediumRisk_Buy)         { Print(" ", "eMedium_Risk_Signal_Buy", " " );        return eMedium_Risk_Signal_Buy;  }
          else if(IsHighRisk_Buy)           { Print(" ", "eHigh_Risk_Signal_Buy", " " );          return eHigh_Risk_Signal_Buy;    }
          else if(IsHigh2Risk_Buy)          { Print(" ", "eHigh2_Risk_Signal_Buy", " " );         return eHigh2_Risk_Signal_Buy;   }
          //--------------------------------------------------------------------------------------------------------------
          return eVoid_Risk_Signal;//
          //--------------------------------------------------------------------------------------------------------------
          //IsNonRisk        = 0;
          //IsLow2Risk       = 0;
          //IsLowRisk        = 0;
          //IsMediumRisk     = 0;
          //IsHighRisk       = 0;
          //IsHigh2Risk      = 0;
          //IsNonRisk        = 0;
          //IsLow2Risk       = 0;
          //IsLowRisk        = 0;
          //IsMediumRisk     = 0;
          //IsHighRisk       = 0;
          //IsHigh2Risk      = 0;
          //-------------------------------------------------------------------------------------------------------------------
          //if(IsNonRisk           && Data._SAR.IsSar_Cross_Bulish(PERIOD_M1, 0.005, 0.2, 0, 1)) {  return eNon_Risk_Signal;    }
          //else if(IsLow2Risk     && Data._SAR.IsSar_Cross_Bulish(PERIOD_M1, 0.005, 0.2, 0, 1)) {  return eLow2_Risk_Signal;   }
          //else if(IsLowRisk      && Data._SAR.IsSar_Cross_Bulish(PERIOD_M1, 0.005, 0.2, 0, 1)) {  return eLow_Risk_Signal;    }
          //else if(IsMediumRisk   && Data._SAR.IsSar_Cross_Bulish(PERIOD_M1, 0.005, 0.2, 0, 1)) {  return eMedium_Risk_Signal; }
          //else if(IsHighRisk     && Data._SAR.IsSar_Cross_Bulish(PERIOD_M1, 0.005, 0.2, 0, 1)) {  return eHigh_Risk_Signal;   }
          //else if(IsHigh2Risk    && Data._SAR.IsSar_Cross_Bulish(PERIOD_M1, 0.005, 0.2, 0, 1)) {  return eHigh2_Risk_Signal;  }
          //-------------------------------------------------------------------------------------------------------------------
          //if(IsNonRisk          && Data._SAR.IsSar_Cross_Bearish(PERIOD_M1, 0.005, 0.2, 0, 1))    { return eNon_Risk_Signal;    }
          //else if(IsLow2Risk    && Data._SAR.IsSar_Cross_Bearish(PERIOD_M1, 0.005, 0.2, 0, 1))    { return eLow2_Risk_Signal;   }
          //else if(IsLowRisk     && Data._SAR.IsSar_Cross_Bearish(PERIOD_M1, 0.005, 0.2, 0, 1))    { return eLow_Risk_Signal;    }
          //else if(IsMediumRisk  && Data._SAR.IsSar_Cross_Bearish(PERIOD_M1, 0.005, 0.2, 0, 1))    { return eMedium_Risk_Signal; }
          //else if(IsHighRisk    && Data._SAR.IsSar_Cross_Bearish(PERIOD_M1, 0.005, 0.2, 0, 1))    { return eHigh_Risk_Signal;   }
          //else if(IsHigh2Risk   && Data._SAR.IsSar_Cross_Bearish(PERIOD_M1, 0.005, 0.2, 0, 1))    { return eHigh2_Risk_Signal;  }
          //-------------------------------------------------------------------------------------------------------------------
          //--------------------------------------------------------------------------------------------------------------
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
E_Risk_Signal CPossition_Temp_Signal::CheackSignal_Exit()
{         //
          bool IsNonRisk_Sell, IsLow2Risk_Sell, IsLowRisk_Sell, IsMediumRisk_Sell, IsHighRisk_Sell, IsHigh2Risk_Sell;
          bool IsNonRisk_Buy, IsLow2Risk_Buy, IsLowRisk_Buy, IsMediumRisk_Buy, IsHighRisk_Buy, IsHigh2Risk_Buy;
          //--------------------------------------------------------------------------------------------------------------
          IsNonRisk_Sell             =  _SAR.IsSar_Cross_Bearish(PERIOD_H4, 0.01, 0.2, 0, 1);;
          IsLow2Risk_Sell            =  _SAR.IsSar_Cross_Bearish(PERIOD_H1, 0.01, 0.2, 0, 1);;
          IsLowRisk_Sell             =  _SAR.IsSar_Cross_Bearish(PERIOD_M30, 0.01, 0.2, 0, 1);;
          IsMediumRisk_Sell          =  _SAR.IsSar_Cross_Bearish(PERIOD_M15, 0.01, 0.2, 0, 1);;
          IsHighRisk_Sell            =  _SAR.IsSar_Cross_Bearish(PERIOD_M5, 0.01, 0.2, 0, 1);;
          IsHigh2Risk_Sell           =  _SAR.IsSar_Cross_Bearish(PERIOD_M1, 0.01, 0.2, 0, 1);;
          //--------------------------------------------------------------------------------------------------------------
          IsNonRisk_Buy             =  _SAR.IsSar_Cross_Bulish(PERIOD_H4, 0.01, 0.2, 0, 1);
          IsLow2Risk_Buy            =  _SAR.IsSar_Cross_Bulish(PERIOD_H1, 0.01, 0.2, 0, 1);;
          IsLowRisk_Buy             =  _SAR.IsSar_Cross_Bulish(PERIOD_M30, 0.01, 0.2, 0, 1);;
          IsMediumRisk_Buy          =  _SAR.IsSar_Cross_Bulish(PERIOD_M15, 0.01, 0.2, 0, 1);;
          IsHighRisk_Buy            =  _SAR.IsSar_Cross_Bulish(PERIOD_M5, 0.01, 0.2, 0, 1);;
          IsHigh2Risk_Buy           =  _SAR.IsSar_Cross_Bulish(PERIOD_M1, 0.01, 0.2, 0, 1);;
          //--------------------------------------------------------------------------------------------------------------
          IsNonRisk_Sell = IsLow2Risk_Sell = IsLowRisk_Sell = IsMediumRisk_Sell = IsHighRisk_Sell = IsHigh2Risk_Sell = 0;
          IsNonRisk_Buy = IsLow2Risk_Buy = IsLowRisk_Buy = IsMediumRisk_Buy = IsHighRisk_Buy = IsHigh2Risk_Buy = 0;
          //--------------------------------------------------------------------------------------------------------------
          if(IsNonRisk_Sell)                    { return eNon_Risk_Signal;              }
          else if(IsLow2Risk_Sell)              { return eLow2_Risk_Signal_Sell;        }
          else if(IsLowRisk_Sell)               { return eLow_Risk_Signal_Sell;         }
          else if(IsMediumRisk_Sell)            { return eMedium_Risk_Signal_Sell;      }
          else if(IsHighRisk_Sell)              { return eHigh_Risk_Signal_Sell;        }
          else if(IsHigh2Risk_Sell)             { return eHigh2_Risk_Signal_Sell;       }
          else if(IsNonRisk_Buy)                { return eNon_Risk_Signal;              }
          else if(IsLow2Risk_Buy)               { return eLow2_Risk_Signal_Buy;         }
          else if(IsLowRisk_Buy)                { return eLow_Risk_Signal_Buy;          }
          else if(IsMediumRisk_Buy)             { return eMedium_Risk_Signal_Buy;       }
          else if(IsHighRisk_Buy)               { return eHigh_Risk_Signal_Buy;         }
          else if(IsHigh2Risk_Buy)              { return eHigh2_Risk_Signal_Buy;        }
          //--------------------------------------------------------------------------------------------------------------
          return eVoid_Risk_Signal;//
          //--------------------------
}
//+------------------------------------------------------------------+
