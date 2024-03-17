//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum E_Risk_Signal
{         eVoid_Risk_Signal,
          eHigh2_Risk_Signal_Buy, eHigh_Risk_Signal_Buy, eMedium_Risk_Signal_Buy, eLow_Risk_Signal_Buy, eLow2_Risk_Signal_Buy,
          eHigh2_Risk_Signal_Sell, eHigh_Risk_Signal_Sell, eMedium_Risk_Signal_Sell, eLow_Risk_Signal_Sell, eLow2_Risk_Signal_Sell,
          eNon_Risk_Signal };
//====================================================================================================================================
class CPossition_Temp_Signal;
enum E_ModeCross
{         eVoid, eBulish, eBearish };
#define MAGICMA_1  20131111
struct StC_Data
{         //-------------------------------------------------------------
          bool       isBuySignal, isBuySignalExit;
          bool       isSellSignal, isSellSignalExit;
          double     Factor;
          int PipSl ;
          int PipTP1 ;
          int PipTP2 ;
          int PipTP3 ;
          int PipTPx ;
          bool       Is_PipTPxPipS;//
          double     SL_SAR_Price;
          int PowerMACD_STATE ;
          //-------------------------------------------------------------
  

          void       StC_Data()
          {        
                    Is_PipTPxPipS = false;//
          }
          void      ~StC_Data() {}
          void       MACD_STATE_POWER();
          //+------------------------------------------------------------------+GetFrame(f, 0)
          //|                                                                  |MathRand()%2
          //+------------------------------------------------------------------+
          int        ModeTrade01(const ENUM_TIMEFRAMES f)
          {         //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    if(0)
                    {         if(ct_Drive.TDD.ct_Signals.TICC.Final_TREE_BUY_Condition_Signal)  return +1;
                              if(ct_Drive.TDD.ct_Signals.TICC.Final_TREE_SELL_Condition_Signal)  return -1;
                              return 0;//
                    }
                    if(0)
                    {         if(Ticker.IsStructuresBuy && _MACD.IsMacd_Bulishff( _Symbol, f, f, 12, 26, 9, PRICE_WEIGHTED, 0))  return +1;
                              if(Ticker.IsStructuresSell && !_MACD.IsMacd_Bulishff( _Symbol, f, f, 12, 26, 9, PRICE_WEIGHTED, 0))  return -1;
                              return 0;//
                    }
                    if(1)
                    {         if(0)
                              {         //fast
                                        if(Ticker.ModeStrategieChange == 1)
                                        {         if( _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return +1;
                                                  if( !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return -1; //
                                                  return 0;//
                                        }
                                        else if(Ticker.ModeStrategieChange == 2)
                                        {         if( _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return -1;
                                                  if( !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return +1;//
                                                  return 0;//
                                        }//
                                        else if(Ticker.ModeStrategieChange == 0)
                                        {         if( _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return +1;
                                                  if( !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return -1;//
                                                  return 0;//
                                        }//
                              }
                              if(1)
                              {         //slow
                                        if(Ticker.ModeStrategieChange == 1)
                                        {         if( _Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && !_Stochastic.Stoch_BulishDelta(_Symbol, f, 40, 5) && !_RSI.Is_RSI_BulishDelta(_Symbol,PERIOD_M1, 14, 30, 0 ) && _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return +1;
                                                  if( !_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && _Stochastic.Stoch_BulishDelta(_Symbol, f, 60, 5) && _RSI.Is_RSI_BulishDelta(_Symbol,PERIOD_M1, 14, 80, 0 ) && !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return -1; //
                                                  if( _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0) && _Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && !_MACD.IsMacd_Posetiver_Delta(f, -1, 0) && _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0) && _SAR.IsSar_BulishDiff(f, 0.01, 0.2, 0, 3)) return -1;
                                                  if( !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0) && !_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && _MACD.IsMacd_Posetiver_Delta(f, +1, 0) && !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0) && _SAR.IsSar_BulishDiff(f, 0.01, 0.2, 0, 3)) return +1; //
                                                  return 0;//
                                        }
                                        else if(Ticker.ModeStrategieChange == 2)
                                        {         if( _Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && !_Stochastic.Stoch_BulishDelta(_Symbol, f, 40, 5) && !_RSI.Is_RSI_BulishDelta(_Symbol,PERIOD_M1, 14, 30, 0 ) && _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return -1;
                                                  if( !_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && _Stochastic.Stoch_BulishDelta(_Symbol, f, 60, 5) && _RSI.Is_RSI_BulishDelta(_Symbol,PERIOD_M1, 14, 80, 0 ) && !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return +1; //.
                                                  if( _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0) && _Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && !_MACD.IsMacd_Posetiver_Delta(f, -1, 0) && _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0) && _SAR.IsSar_BulishDiff(f, 0.01, 0.2, 0, 3)) return +1;
                                                  if( !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0) && !_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && _MACD.IsMacd_Posetiver_Delta(f, +1, 0) && !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0) && _SAR.IsSar_BulishDiff(f, 0.01, 0.2, 0, 3)) return -1; //
                                                  return 0;//
                                        }//
                                        else if(Ticker.ModeStrategieChange == 0)
                                        {         if( _Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && !_Stochastic.Stoch_BulishDelta(_Symbol, f, 40, 5) && !_RSI.Is_RSI_BulishDelta(_Symbol,PERIOD_M1, 14, 30, 0 ) && _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return +1;
                                                  if( !_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && _Stochastic.Stoch_BulishDelta(_Symbol, f, 60, 5) && _RSI.Is_RSI_BulishDelta(_Symbol,PERIOD_M1, 14, 80, 0 ) && !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return -1; //
                                                  if( _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0) && _Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && !_MACD.IsMacd_Posetiver_Delta(f, -1, 0) && _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0) && _SAR.IsSar_BulishDiff(f, 0.01, 0.2, 0, 3)) return -1;
                                                  if( !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0) && !_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && _MACD.IsMacd_Posetiver_Delta(f, +1, 0) && !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0) && _SAR.IsSar_BulishDiff(f, 0.01, 0.2, 0, 3)) return +1; //
                                                  return 0;//
                                        } //
                              }
                              //if(_MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(PERIOD_M5) == +1  && !_RSI.Is_RSI_BulishDelta(PERIOD_M1, 14, 30, 0 ) && _RSI.Is_RSI_BulishDelta(PERIOD_M1, 14, 20, 0 ) && _Stochastic.Stoch_Bulish(_Symbol,f, 1, 8))  return +1;
                              //if(_MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(PERIOD_M5) == -1  && _RSI.Is_RSI_BulishDelta(PERIOD_M1, 14, 70, 0 ) && !_RSI.Is_RSI_BulishDelta(PERIOD_M1, 14, 80, 0 ) && !_Stochastic.Stoch_Bulish(_Symbol,f, 1, 8))  return -1;
                              //if(_WPR.IsWPR100EMa_200SMa_200_Buyp1Selln1(PERIOD_M1, 20) == +1 && _Stochastic.Stoch_Bulish(_Symbol,f, 1, 8) && !_Stochastic.Stoch_BulishDelta(_Symbol,f, 50, 5)&& !_RSI.Is_RSI_BulishDelta(PERIOD_M1, 14, 30, 0 )) return +1;
                              //if(_WPR.IsWPR100EMa_200SMa_200_Buyp1Selln1(PERIOD_M1, 20) == -1 && !_Stochastic.Stoch_Bulish(_Symbol,f, 1, 8) && _Stochastic.Stoch_BulishDelta(_Symbol,f, 50, 5)&& _RSI.Is_RSI_BulishDelta(PERIOD_M1, 14, 80, 0 )) return -1;
                              if( _Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && !_Stochastic.Stoch_BulishDelta(_Symbol, f, 40, 5) && !_RSI.Is_RSI_BulishDelta(_Symbol,PERIOD_M1, 14, 30, 0 ) && _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return +1;
                              if( !_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) && _Stochastic.Stoch_BulishDelta(_Symbol, f, 60, 5) && _RSI.Is_RSI_BulishDelta(_Symbol,PERIOD_M1, 14, 80, 0 ) && !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0)) return -1;
                              //if(_MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1Cross(PERIOD_M1,20) == +1&& _Stochastic.Stoch_Bulish(_Symbol,f, 1, 8))return +1;
                              //if(_MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1Cross(PERIOD_M1,20) == -1&& !_Stochastic.Stoch_Bulish(_Symbol,f, 1, 8))return -1;
                              return 0;//
                    }
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    //-------------------------------------------
                    /*PROTECTION*/
                    if(0)
                    {         if(!_SAR.IsSar_BulishDiff(PERIOD_H4, 0.01, 0.2, 0, 20)) return 0;
                              if(!_SAR.IsSar_BulishDiff(PERIOD_H1, 0.01, 0.2, 0, 15)) return 0;
                              if(!_SAR.IsSar_BulishDiff(PERIOD_M30, 0.01, 0.2, 0, 8)) return 0;
                              if(!_SAR.IsSar_BulishDiff(PERIOD_M5, 0.01, 0.2, 0, 3)) return 0;
                              if(!_SAR.IsSar_BulishDiff(PERIOD_M1, 0.01, 0.2, 0, 1)) return 0;//
                    }
                    //_Ichmiko.Update(f);
                    //_FE_100.Update(f);
                    //_STD_Channel.Update(f);
                    //-------------------------------------------
                    if(1)
                    {         if(1)
                              {         if(_MACD.IsBulish_Forwarding(f, GetFrame(f, 1), 3))
                                        {         if(_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) &&  !_MACD.IsMacd_Posetiver_Delta(f, 0, -2) && _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0) && _MACD.IsMacd_Bulishff(_Symbol, f, f, 12, 26, 9, PRICE_WEIGHTED, 0))
                                                  {         if(_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0) && _OVB.IsOVB_Bulish(f, 0, 8))
                                                            {         Ticker.Possition_Temp_Signal.MaximumRisk    = 0.03;      return +1; }
                                                            else
                                                            {         Ticker.Possition_Temp_Signal.MaximumRisk    = 0.01;      return -1; } //
                                                  }
                                                  //
                                        }
                                        if(_MACD.IsBulish_Forwarding_Correction(f, GetFrame(f, 1), 3))
                                        {         if(!_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) &&  _MACD.IsMacd_Posetiver_Delta(f, 0, 2) &&  _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0) && !_MACD.IsMacd_Bulishff(_Symbol, f, f, 12, 26, 9, PRICE_WEIGHTED, 0))
                                                  {         if(_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0) && !_OVB.IsOVB_Bulish(f, 0, 8))
                                                            {         Ticker.Possition_Temp_Signal.MaximumRisk    = 0.01;      return +1; }
                                                            else
                                                            {         Ticker.Possition_Temp_Signal.MaximumRisk    = 0.03;      return -1; } //
                                                  }
                                                  //
                                        }
                                        //
                                        if(_MACD.IsBearish_ForWarding(f, GetFrame(f, 1), 3))
                                        {         if(!_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) &&  _MACD.IsMacd_Posetiver_Delta(f, 0, 2) && !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0) && !_MACD.IsMacd_Bulishff(_Symbol, f, f, 12, 26, 9, PRICE_WEIGHTED, 0))
                                                  {         if(_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0) && !_OVB.IsOVB_Bulish(f, 0, 8))
                                                            {         Ticker.Possition_Temp_Signal.MaximumRisk    = 0.03;      return -1; }
                                                            else
                                                            {         Ticker.Possition_Temp_Signal.MaximumRisk    = 0.01;      return +1; } //
                                                  }
                                                  //
                                        }
                                        if(_MACD.IsBearish_ForWarding_Correction(f, GetFrame(f, 1), 3))
                                        {         if(_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8) &&  !_MACD.IsMacd_Posetiver_Delta(f, 0, -2) && !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 4, 7, PRICE_CLOSE, 0, 0) && _MACD.IsMacd_Bulishff(_Symbol, f, f, 12, 26, 9, PRICE_WEIGHTED, 0))
                                                  {         if(_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0) && _OVB.IsOVB_Bulish(f, 0, 8))
                                                            {         Ticker.Possition_Temp_Signal.MaximumRisk    = 0.03;      return -1; }
                                                            else
                                                            {         Ticker.Possition_Temp_Signal.MaximumRisk    = 0.01;      return +1; } //
                                                  }
                                                  //
                                        }
                                        //---------------------------------------------------------------
                                        return 0;
                                        //
                              }
                              if(1)
                              {         //-----------------------------------------------------------------------------------------------------------------------------#1 signal priority frist to change
                                        bool IsMACDBuy = 1
                                                         &&  !_MACD.IsMacd_Posetiver_Delta(f, 0, 0)
                                                         //&&  _MACD.IsMacd_NMax_PMin_Delta(f, 0, -2.0, +2.0)
                                                         //
                                                         //&& _MACD.IsMacd_Bulishff(_Symbol,f,f,12,26,9,PRICE_WEIGHTED, 0)
                                                         && _MACD.IsMacd_Bulishff(_Symbol, f, f, 12, 26, 9, PRICE_WEIGHTED, 0)
                                                         //&& _MACD._MACD.IsMacd_Bulishff(_Symbol,f,f,12,26,9,PRICE_WEIGHTED, 0)
                                                         //&& (_MACD.GetMACD_State(f) == DOWN_IN  || _MACD.GetMACD_State(f) == UP_OUT)// ----------------more lag
                                                         //
                                                         //&& _MACD.IsBulish_Forwarding(f, GetFrame(f, 1), 3)
                                                         //&&_MACD.IsMacd_CrossBulish(f, 0, -1, 12, 26)
                                                         //&& _MACD.IsMacd_DeltaIN(f, 0, -4.0, +4.0)
                                                         ;
                                        bool IsMACDSell = 1
                                                          &&  _MACD.IsMacd_Posetiver_Delta(f, 0, 0)
                                                          //&&  _MACD.IsMacd_NMax_PMin_Delta(f, 0, -2.0, +2.0)
                                                          //
                                                          //&& !_MACD.IsMacd_Bulishff(_Symbol,f,f,12,26,9,PRICE_WEIGHTED, 0)
                                                          && !_MACD.IsMacd_Bulishff(_Symbol, f, f, 12, 26, 9, PRICE_WEIGHTED, 0)
                                                          //&&   !_MACD._MACD.IsMacd_Bulishff(_Symbol,f,f,12,26,9,PRICE_WEIGHTED, 0)
                                                          //&& (_MACD.GetMACD_State(f) == UP_IN  || _MACD.GetMACD_State(f) == DOWN_OUT)// ----------------more lag
                                                          //
                                                          //&& _MACD.IsBearish_ForWarding(f, GetFrame(f, 1), 3)
                                                          //&& _MACD.IsMacd_CrossBearish(f, 0, 3, 10, 20)
                                                          //&& _MACD.IsMacd_DeltaIN(f, 0, -4.0, +4.0)
                                                          ;
                                        //-----------------------------------------------------------------------------------------------------------------------------
                                        bool IsSARBuy = 1
                                                        //_SAR.IsSar_BulishDiff(f, 0.01, 0.2, 0, 4)
                                                        //&& _SAR.IsSar_BulishDiff(GetFrame(f, 1), 0.01, 0.2, 0, 6)
                                                        //&& _SAR.IsSar_BulishDiff(GetFrame(GetFrame(f, 1), 1), 0.01, 0.2, 0, 8)
                                                        //&& _SAR.IsSar_BulishDiff(GetFrame(GetFrame(GetFrame(f, 1), 1), 1), 0.01, 0.2, 0, 10)
                                                        //&& _SAR.Sar_Direction(f, 0.01, 0.2, 0) == +1
                                                        && _SAR.Sar_Direction_MA_(f, 0.01, 0.2, 0, 5) == +1
                                                        ;
                                        bool IsSARSell = 1
                                                         //_SAR.IsSar_BulishDiff(f, 0.01, 0.2, 0, 4)
                                                         //&& _SAR.IsSar_BulishDiff(GetFrame(f, 1), 0.01, 0.2, 0, 6)
                                                         //&& _SAR.IsSar_BulishDiff(GetFrame(GetFrame(f, 1), 1), 0.01, 0.2, 0, 8)
                                                         //&& _SAR.IsSar_BulishDiff(GetFrame(GetFrame(GetFrame(f, 1), 1), 1), 0.01, 0.2, 0, 10)
                                                         //
                                                         //&& _SAR.Sar_Direction(f, 0.01, 0.2, 0) == -1
                                                         && _SAR.Sar_Direction_MA_(f, 0.01, 0.2, 0, 5) == -1
                                                         ;
                                        //-----------------------------------------------------------------------------------------------------------------------------
                                        bool IsStochasticBuy = 1
                                                               //&& !_Stochastic.Stoch_BulishDelta(_Symbol,f, 50)
                                                               //&& _Stochastic.Stoch_INDelta(f, 0, 20, 3)
                                                               //
                                                               && _Stochastic.Stoch_Bulish(_Symbol, f, 1, 8)
                                                               //&&  _Stochastic.Stoch_Bulish(_Symbol,GetFrame(f, 1), 1)
                                                               //--senarios
                                                               //&&  _Stochastic.Stoch_BulishDelta(_Symbol,f, 50,12)
                                                               //&& _Stochastic.Stoch_BulishDelta(_Symbol,f, 80, 100, 3)
                                                               //&& _Stochastic.Stoch_BulishDelta(_Symbol,f, 50, 79, 0)
                                                               ;
                                        bool IsStochasticSell = 1
                                                                //&& _Stochastic.Stoch_BulishDelta(_Symbol,f, 50)
                                                                //&& _Stochastic.Stoch_INDelta(f, 80, 100, 3)
                                                                //
                                                                && !_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8)
                                                                //&& _Stochastic.Stoch_Bulish(_Symbol,GetFrame(f, 0), 1)
                                                                //--senarios
                                                                //&& !_Stochastic.Stoch_BulishDelta(_Symbol,f, 50,12)
                                                                //&& _Stochastic.Stoch_BulishDelta(_Symbol,f, 0, 20, 3)
                                                                //&& _Stochastic.Stoch_BulishDelta(_Symbol,f, 21, 50, 0)
                                                                ;
                                        //-----------------------------------------------------------------------------------------------------------------------------
                                        bool IsMaBuy = 1
                                                       &&  _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0)
                                                       //&&  _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 14, MODE_EMA, 0, f, 16, MODE_EMA, 0)
                                                       //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 30, MODE_EMA, 0, f, 31, MODE_EMA, 0)
                                                       //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 80, MODE_EMA, 0, f, 81, MODE_EMA, 0)
                                                       //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 200, MODE_EMA, 0, f, 205, MODE_EMA, 0)
                                                       //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 200, MODE_EMA, 0, f, 300, MODE_EMA, 0)
                                                       //
                                                       //&& _MovingAvrages.IsMA_BulishCrossPoint(f, 14, 16, 0, MODE_EMA)
                                                       //
                                                       //&& _MovingAvrages.IsMA_BulishPrice(f, 12, MODE_EMA, 0)
                                                       //
                                                       //&& _MovingAvrages.IsMA_Expaning1_Nearing0(f, 350, MODE_EMA, 0, f, 500, MODE_EMA, 0)
                                                       //
                                                       //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 350, MODE_EMA, 0, f, 500, MODE_EMA, 0)
                                                       //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 200, MODE_EMA, 0, f, 300, MODE_EMA, 0)
                                                       //
                                                       //&& _MovingAvrages.IsBulish__Forwarding(f, 10, 20, 100, 200)
                                                       //&& _MovingAvrages.IsBulish__Forwarding(f, 100, 200, 500, 700)
                                                       //&& _MovingAvrages.IsBulish__Forwarding(f, 20, 30, 200, 300)
                                                       //&& MD > 0
                                                       ;
                                        bool IsMaSell = 1
                                                        && !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0)
                                                        //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 14, MODE_EMA, 0, f, 16, MODE_EMA, 0)
                                                        //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 30, MODE_EMA, 0, f, 31, MODE_EMA, 0)
                                                        //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 80, MODE_EMA, 0, f, 81, MODE_EMA, 0)
                                                        //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 200, MODE_EMA, 0, f, 205, MODE_EMA, 0)
                                                        //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 200, MODE_EMA, 0, f, 300, MODE_EMA, 0)
                                                        //
                                                        //&& _MovingAvrages.IsMA_BearishCrossPointt(f, 14, 16, 0, MODE_EMA)
                                                        //&& _MovingAvrages.IsMA_BearishCrossPointt(f, 3, 8, 0, MODE_EMA)
                                                        //
                                                        //&& ! _MovingAvrages.IsMA_BulishPrice(f, 26, MODE_EMA, 0)
                                                        //
                                                        //&& _MovingAvrages.IsMA_Expaning1_Nearing0(f, 350, MODE_EMA, 0, f, 500, MODE_EMA, 0)
                                                        //
                                                        //&& _MovingAvrages.IsBearish__Forwarding(GetFrame(f, 1), 10, 20, 100, 200)
                                                        //&& _MovingAvrages.IsBearish__Forwarding(f, 10, 20, 100, 200)
                                                        //&& _MovingAvrages.IsBearish__Forwarding(f, 100, 200, 500, 700)
                                                        //&& MD < 0
                                                        ;
                                        //-----------------------------------------------------------------------------------------------------------------------------
                                        bool IsRSIBuy = 1
                                                        && _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 10, 14, PRICE_CLOSE, 0, 0)
                                                        //&&  _RSI.Is_RSI_BulishDelta(f, 14, 50, 0 )//--goodlock
                                                        //&& ! _RSI.Is_RSI_BulishDelta(f, 14, 30, 0 )//--acrossSide
                                                        ;
                                        bool IsRSISell = 1
                                                         && !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 10, 14, PRICE_CLOSE, 0, 0)
                                                         //&&  !_RSI.Is_RSI_BulishDelta(f, 14, 50, 0 )//--goodlock
                                                         //&&  _RSI.Is_RSI_BulishDelta(f, 14, 70, 0 )//--acrossSide
                                                         ;
                                        //-----------------------------------------------------------------------------------------------------------------------------
                                        bool IsOVBBuy = 1
                                                        && _OVB.IsOVB_Bulish(f, 0, 8)
                                                        ;
                                        bool IsOVBSell = 1
                                                         && !_OVB.IsOVB_Bulish(f, 0, 8)
                                                         ;
                                        //-----------------------------------------------------------------------------------------------------------------------------
                                        bool IsMFIBuy = 1
                                                        && _MFI.IsMFI_BulishPS(f, 8, 0, 1)
                                                        ;
                                        bool IsMFISell = 1
                                                         && ! _MFI.IsMFI_BulishPS(f, 8, 0, 1)
                                                         ;
                                        //==============================================================================================================================
                                        if(1)
                                        {         if(1)
                                                  {         if(1
                                                                                && (IsMACDBuy)
                                                                                && (!IsSARBuy)
                                                                                && (IsStochasticBuy)
                                                                                //&& (IsMaBuy)
                                                                                //&& (IsMFIBuy)
                                                                                && (IsRSIBuy)
                                                                                //&& IsOVBBuy
                                                                                //
                                                              ) {         return  +1; }
                                                            //----------------------------
                                                            if(1
                                                                                && (!IsMACDSell)
                                                                                && (IsSARSell)
                                                                                && (IsStochasticSell)
                                                                                //&& (IsMaSell)
                                                                                //&& (IsMFISell)
                                                                                && (IsRSISell)
                                                                                //&& IsOVBSell
                                                              ) {         return  -1;} //
                                                            //----------------------------
                                                            return 0;//
                                                  }//
                                        }//
                                        //==============================================================================================================================
                                        //==============================================================================================================================
                              }
                              //-----------------------------------------------------------------------------------------------------------------------------
                    }
                    //-------------------------------------------
                    return 0;//
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+ +159:400$
          int        ModeTrade02(ENUM_TIMEFRAMES f)
          {         return false;
                    if(1)
                    {         //-----------------------------------------------------------------------------------------------------------------------------#1 signal priority frist to change
                              bool IsMACDBuy = 1
                                               &&  !_MACD.IsMacd_Posetiver_Delta(f, 0, 0)
                                               //&&  _MACD.IsMacd_NMax_PMin_Delta(f, 0, -2.0, +2.0)
                                               //
                                               //&& _MACD.IsMacd_Bulishff(_Symbol,f,f,12,26,9,PRICE_WEIGHTED, 0)
                                               && _MACD.IsMacd_Bulishff(_Symbol, f, f, 12, 26, 9, PRICE_WEIGHTED, 0)
                                               //&& _MACD._MACD.IsMacd_Bulishff(_Symbol,f,f,12,26,9,PRICE_WEIGHTED, 0)
                                               //&& (_MACD.GetMACD_State(f) == DOWN_IN  || _MACD.GetMACD_State(f) == UP_OUT)// ----------------more lag
                                               //
                                               //&& _MACD.IsBulish_Forwarding(f, GetFrame(f, 1), 3)
                                               //&& _MACD.IsMacd_CrossBulish(f, 0, 3, 10, 20)
                                               ;
                              bool IsMACDSell = 1
                                                &&  _MACD.IsMacd_Posetiver_Delta(f, 0, 0)
                                                //&&  _MACD.IsMacd_NMax_PMin_Delta(f, 0, -2.0, +2.0)
                                                //
                                                //&& !_MACD.IsMacd_Bulishff(_Symbol,f,f,12,26,9,PRICE_WEIGHTED, 0)
                                                && !_MACD.IsMacd_Bulishff(_Symbol, f, f, 12, 26, 9, PRICE_WEIGHTED, 0)
                                                //&&   !_MACD._MACD.IsMacd_Bulishff(_Symbol,f,f,12,26,9,PRICE_WEIGHTED, 0)
                                                //&& (_MACD.GetMACD_State(f) == UP_IN  || _MACD.GetMACD_State(f) == DOWN_OUT)// ----------------more lag
                                                //
                                                //&& _MACD.IsBearish_ForWarding(f, GetFrame(f, 1), 3)
                                                //&& _MACD.IsMacd_CrossBearish(f, 0, 3, 10, 20)
                                                ;
                              //-----------------------------------------------------------------------------------------------------------------------------
                              bool IsSARBuy = 1
                                              //_SAR.IsSar_BulishDiff(f, 0.01, 0.2, 0, 4)
                                              //&& _SAR.IsSar_BulishDiff(GetFrame(f, 1), 0.01, 0.2, 0, 6)
                                              //&& _SAR.IsSar_BulishDiff(GetFrame(GetFrame(f, 1), 1), 0.01, 0.2, 0, 8)
                                              //&& _SAR.IsSar_BulishDiff(GetFrame(GetFrame(GetFrame(f, 1), 1), 1), 0.01, 0.2, 0, 10)
                                              //&& _SAR.Sar_Direction(f, 0.01, 0.2, 0) == +1
                                              && _SAR.Sar_Direction_MA_(f, 0.01, 0.2, 0, 5) == +1
                                              ;
                              bool IsSARSell = 1
                                               //_SAR.IsSar_BulishDiff(f, 0.01, 0.2, 0, 4)
                                               //&& _SAR.IsSar_BulishDiff(GetFrame(f, 1), 0.01, 0.2, 0, 6)
                                               //&& _SAR.IsSar_BulishDiff(GetFrame(GetFrame(f, 1), 1), 0.01, 0.2, 0, 8)
                                               //&& _SAR.IsSar_BulishDiff(GetFrame(GetFrame(GetFrame(f, 1), 1), 1), 0.01, 0.2, 0, 10)
                                               //
                                               //&& _SAR.Sar_Direction(f, 0.01, 0.2, 0) == -1
                                               && _SAR.Sar_Direction_MA_(f, 0.01, 0.2, 0, 5) == -1
                                               ;
                              //-----------------------------------------------------------------------------------------------------------------------------
                              bool IsStochasticBuy = 1
                                                     //!_Stochastic.Stoch_BulishDelta(_Symbol,f, 30)
                                                     //&& _Stochastic.Stoch_INDelta(f, 0, 20, 3)
                                                     //
                                                     && _Stochastic.Stoch_Bulish(_Symbol, f, 1, 8)
                                                     //&&  _Stochastic.Stoch_Bulish(_Symbol,GetFrame(f, 1), 1)
                                                     //--senarios
                                                     //&&  _Stochastic.Stoch_BulishDelta(_Symbol,f, 50,12)
                                                     //&& _Stochastic.Stoch_BulishDelta(_Symbol,f, 80, 100, 3)
                                                     //&& _Stochastic.Stoch_BulishDelta(_Symbol,f, 50, 79, 0)
                                                     ;
                              bool IsStochasticSell = 1
                                                      //_Stochastic.Stoch_BulishDelta(_Symbol,f, 70)
                                                      //&& _Stochastic.Stoch_INDelta(f, 80, 100, 3)
                                                      //
                                                      && !_Stochastic.Stoch_Bulish(_Symbol, f, 1, 8)
                                                      //&& _Stochastic.Stoch_Bulish(_Symbol,GetFrame(f, 0), 1)
                                                      //--senarios
                                                      //&& !_Stochastic.Stoch_BulishDelta(_Symbol,f, 50,12)
                                                      //&& _Stochastic.Stoch_BulishDelta(_Symbol,f, 0, 20, 3)
                                                      //&& _Stochastic.Stoch_BulishDelta(_Symbol,f, 21, 50, 0)
                                                      ;
                              //-----------------------------------------------------------------------------------------------------------------------------
                              bool IsMaBuy = 1
                                             &&  _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0)
                                             //&&  _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 14, MODE_EMA, 0, f, 16, MODE_EMA, 0)
                                             //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 30, MODE_EMA, 0, f, 31, MODE_EMA, 0)
                                             //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 80, MODE_EMA, 0, f, 81, MODE_EMA, 0)
                                             //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 200, MODE_EMA, 0, f, 205, MODE_EMA, 0)
                                             //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 200, MODE_EMA, 0, f, 300, MODE_EMA, 0)
                                             //
                                             //&& _MovingAvrages.IsMA_BulishCrossPoint(f, 14, 16, 0, MODE_EMA)
                                             //
                                             //&& _MovingAvrages.IsMA_BulishPrice(f, 12, MODE_EMA, 0)
                                             //
                                             //&& _MovingAvrages.IsMA_Expaning1_Nearing0(f, 350, MODE_EMA, 0, f, 500, MODE_EMA, 0)
                                             //
                                             //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 350, MODE_EMA, 0, f, 500, MODE_EMA, 0)
                                             //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 200, MODE_EMA, 0, f, 300, MODE_EMA, 0)
                                             //
                                             //&& _MovingAvrages.IsBulish__Forwarding(f, 10, 20, 100, 200)
                                             //&& _MovingAvrages.IsBulish__Forwarding(f, 100, 200, 500, 700)
                                             //&& _MovingAvrages.IsBulish__Forwarding(f, 20, 30, 200, 300)
                                             //&& MD > 0
                                             ;
                              bool IsMaSell = 1
                                              && !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0)
                                              //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 14, MODE_EMA, 0, f, 16, MODE_EMA, 0)
                                              //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 30, MODE_EMA, 0, f, 31, MODE_EMA, 0)
                                              //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 80, MODE_EMA, 0, f, 81, MODE_EMA, 0)
                                              //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 200, MODE_EMA, 0, f, 205, MODE_EMA, 0)
                                              //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 200, MODE_EMA, 0, f, 300, MODE_EMA, 0)
                                              //
                                              //&& _MovingAvrages.IsMA_BearishCrossPointt(f, 14, 16, 0, MODE_EMA)
                                              //&& _MovingAvrages.IsMA_BearishCrossPointt(f, 3, 8, 0, MODE_EMA)
                                              //
                                              //&& ! _MovingAvrages.IsMA_BulishPrice(f, 26, MODE_EMA, 0)
                                              //
                                              //&& _MovingAvrages.IsMA_Expaning1_Nearing0(f, 350, MODE_EMA, 0, f, 500, MODE_EMA, 0)
                                              //
                                              //&& _MovingAvrages.IsBearish__Forwarding(GetFrame(f, 1), 10, 20, 100, 200)
                                              //&& _MovingAvrages.IsBearish__Forwarding(f, 10, 20, 100, 200)
                                              //&& _MovingAvrages.IsBearish__Forwarding(f, 100, 200, 500, 700)
                                              //&& MD < 0
                                              ;
                              //-----------------------------------------------------------------------------------------------------------------------------
                              bool IsRSIBuy = 1
                                              && _RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 10, 14, PRICE_LOW, 0, 0)
                                              //&&  _RSI.Is_RSI_BulishDelta(_Symbol,f, 14, 50, 0 )//--goodlock
                                              //&& ! _RSI.Is_RSI_BulishDelta(_Symbol,f, 14, 30, 0 )//--acrossSide
                                              ;
                              bool IsRSISell = 1
                                               && !_RSI.Is_RSI_BulishPeriodsShift(_Symbol,f, 10, 14, PRICE_HIGH, 0, 0)
                                               //&&  !_RSI.Is_RSI_BulishDelta(_Symbol,f, 14, 50, 0 )//--goodlock
                                               //&&  _RSI.Is_RSI_BulishDelta(_Symbol,f, 14, 70, 0 )//--acrossSide
                                               ;
                              //-----------------------------------------------------------------------------------------------------------------------------
                              bool IsOVBBuy = 1
                                              && _OVB.IsOVB_Bulish(f, 0, 8)
                                              ;
                              bool IsOVBSell = 1
                                               && !_OVB.IsOVB_Bulish(f, 0, 8)
                                               ;
                              //-----------------------------------------------------------------------------------------------------------------------------
                              bool IsMFIBuy = 1
                                              && _MFI.IsMFI_BulishPS(f, 8, 0, 1)
                                              ;
                              bool IsMFISell = 1
                                               && ! _MFI.IsMFI_BulishPS(f, 8, 0, 1)
                                               ;
                              //==============================================================================================================================
                              if(1)
                              {         if(1
                                                            && (IsMACDBuy)
                                                            && (!IsSARBuy)
                                                            && (IsStochasticBuy)
                                                            //&& (IsMaBuy)
                                                            //&& (IsMFIBuy)
                                                            && (IsRSIBuy)
                                                            //&& IsOVBBuy
                                                            //
                                          )
                                        {         return +1; }
                                        else if(1
                                                            && (IsMACDSell)
                                                            && (!IsSARSell)
                                                            && (IsStochasticSell)
                                                            //&& (IsMaSell)
                                                            //&& IsMFISell)
                                                            && (IsRSISell)
                                                            //&& IsOVBSell
                                               )
                                        {         return -1;} //
                                        return 0;//
                              } //
                    }
                    return 0;//
          }
          //------------------------------------------------------------------ +!_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,PERIOD_H4, 5, MODE_EMA, 0, PERIOD_H4, 10, MODE_EMA, 0) && _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,PERIOD_H4, 20, MODE_EMA, 0, PERIOD_H4, 30, MODE_EMA, 0) && !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,PERIOD_H4, 200, MODE_EMA, 0, PERIOD_H4, 300, MODE_EMA, 0) && !_MACD.IsMacd_Bulish(PERIOD_H4, 0)
          //|                                                                  |&& _MovingAvrages.IsMA_Expaning1_Nearing0(PERIOD_H4, 10, MODE_EMA, 0, PERIOD_H4, 20, MODE_EMA, 0)
          //+------------------------------------------------------------------+_MovingAvrages.IsMA_BearishCrossPointt(PERIOD_H4 20, 30, 1, MODE_EMA)
          //+------------------------------------------------------------------+ _MovingAvrages.IsMA_BulishCrossPoint(PERIOD_D1, 20, 30, 1, MODE_EMA) && _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,PERIOD_D1, 200, MODE_EMA, 0, PERIOD_D1, 300, MODE_EMA, 0) &&  _Stochastic.IsStoch_CrossBulish(_Symbol,PERIOD_D1, 1)
          //|                                                                  |_MACD.IsMacd_CrossBearish(PERIOD_H1, 0, +10)                                                            {90win}{9:1}{+5$}
          //+------------------------------------------------------------------+_MACD.IsMacd_CrossBearish(PERIOD_H1, 0, +15)&& !_Stochastic.Stoch_Bulishff(PERIOD_H1, PERIOD_H4)        {89win}{8:1}{+34$}
          //+------------------------------------------------------------------+
          //|                                                                  |!_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,PERIOD_H1, 20, MODE_EMA, 0, PERIOD_H1, 30, MODE_EMA, 0) && _MACD.IsMacd_CrossBearish(PERIOD_H1, 0, +10) && !_Stochastic.Stoch_Bulishff(PERIOD_H1, PERIOD_H4) {xwin}{x:x}{-50x$} --not trade
          //+------------------------------------------------------------------+!_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,PERIOD_H1, 20, MODE_EMA, 0, PERIOD_H1, 30, MODE_EMA, 0) && _MACD.IsMacd_CrossBearish(PERIOD_H1, 0, +10) && !_Stochastic.Stoch_Bulishff(PERIOD_H1, PERIOD_H4) {xwin}{x:x}{-50x$}
          E_Risk_Signal IsHowRiskTradel(ENUM_TIMEFRAMES & f, int &slpip, int &tppip)
          {         //return false;//
                    bool isHL_SLTP      = 1;
                    bool IsShort_Frame  = 1;
                    bool IsMedium_Frame = 1;
                    bool IsLong_Frame   = 1;
                    //------------------------------------------------------------------------------------------------
                    int  PipSlOUT = 0;          int PipTpOUT = 0;               bool IsPrint = 1;   char mode = 2;
                    //if(f == PERIOD_M1)return eNon_Risk_Signal ;
                    //------------------------------------------------------------------------------------------------
                    if(IsShort_Frame)
                    {         if(1 &&  ModeTrade01(f = PERIOD_M1) == -1/*sell signal*/)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );  } return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Sell ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " );}  return eLow_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " );}  return eHigh_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " );}  return eHigh2_Risk_Signal_Sell;} //
                              } //
                              //if(ModeTrade01(f = PERIOD_M1) == 0/*non signal*/)         {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f,mode, 0, 0, 2.0, 1.0,PipSlOUT,PipTpOUT); return eNon_Risk_Signal;} //
                              if(1 && ModeTrade01(f = PERIOD_M1) == +1/*buy signal*/)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );}  return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Buy ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " ); } return eLow_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " );}  return eHigh_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " );}  return eHigh2_Risk_Signal_Buy;} //
                              } //
                              //------------------------------------------------------------------------------------------------
                              if(ModeTrade01(f = PERIOD_M5) == -1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " ); } return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Sell ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " );}  return eLow_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " ); } return eHigh_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " ); } return eHigh2_Risk_Signal_Sell;} //
                              } //
                              //if(ModeTrade01(f = PERIOD_M5) == 0)         {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f,mode, 0, 2.0, 1.0,PipSlOUT,PipTpOUT); return eNon_Risk_Signal;} //
                              if(ModeTrade01(f = PERIOD_M5) == +1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );}  return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " ); } return eLow2_Risk_Signal_Buy ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " ); } return eLow_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " );}  return eHigh_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " );}  return eHigh2_Risk_Signal_Buy; } //
                              } //
                              //------------------------------------------------------------------------------------------------
                              if(ModeTrade01(f = PERIOD_M15) == -1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " ); } return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Sell ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " );}  return eLow_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " ); } return eMedium_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " ); } return eHigh_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " );}  return eHigh2_Risk_Signal_Sell;} //
                              } //
                              //if(ModeTrade01(f = PERIOD_M15) == 0)         {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f,mode, 0, 1, 2.0, 1.0,PipSlOUT,PipTpOUT);  return eNon_Risk_Signal;} //
                              if(ModeTrade01(f = PERIOD_M15) == +1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " ); } return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Buy ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " ); } return eLow_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " ); } return eHigh_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " ); } return eHigh2_Risk_Signal_Buy; } //
                              } //
                              //
                    }
                    //
                    if(IsMedium_Frame)
                    {         if(ModeTrade01(f = PERIOD_M30) == -1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " ); } return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " ); } return eLow2_Risk_Signal_Sell ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " ); } return eLow_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " );}  return eHigh_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " );}  return eHigh2_Risk_Signal_Sell; } //
                              } //
                              //if(ModeTrade01(f = PERIOD_M30) == 0)         {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f,mode, 0, 0, 1.5, 0.5); return eNon_Risk_Signal;} //
                              if(ModeTrade01(f = PERIOD_M30) == +1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );}  return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Buy ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " ); } return eLow_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " ); } return eMedium_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " );}  return eHigh_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " );}  return eHigh2_Risk_Signal_Buy;} //
                              } //
                              //
                              if(ModeTrade01(f = PERIOD_H1) == -1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " ); } return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " ); } return eLow2_Risk_Signal_Sell ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " );}  return eLow_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " );}  return eHigh_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " ); } return eHigh2_Risk_Signal_Sell;} //
                              } //
                              //if(ModeTrade01(f = PERIOD_H1) == 0)         {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f,mode, 0, 0, 1.5, 0.5);  return eNon_Risk_Signal;} //
                              if(ModeTrade01(f = PERIOD_H1) == +1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " ); } return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Buy ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " );}  return eLow_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " ); } return eHigh_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " );}  return eHigh2_Risk_Signal_Buy;} //
                              } //
                              //
                              if(ModeTrade01(f = PERIOD_H4) == -1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );}  return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Sell ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " ); } return eLow_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " );}  return eHigh_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " ); } return eHigh2_Risk_Signal_Sell;} //
                              } //
                              //if(ModeTrade01(f = PERIOD_H4) == 0)         {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f,mode, 0, 0, 1.5, 0.5);  return eNon_Risk_Signal;} //
                              if(ModeTrade01(f = PERIOD_H4) == +1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );}  return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " ); } return eLow2_Risk_Signal_Buy ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " );}  return eLow_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Sell", " " );}  return eHigh_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Buy", " " );}  return eHigh2_Risk_Signal_Buy;}
                                        //
                              } //
                              //
                    }//
                    //
                    if(IsLong_Frame)
                    {         if(ModeTrade01(f = PERIOD_D1) == -1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );}  return eNon_Risk_Signal ;  }
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Sell ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " );}  return eLow_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " ); } return eMedium_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Buy", " " ); } return eHigh_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Sell", " " ); } return eHigh2_Risk_Signal_Sell; } //
                              }
                              //if(ModeTrade01(f = PERIOD_D1) == 0)         {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f,mode, 0, 0, 1.5, 0.5);   return eNon_Risk_Signal;} //
                              if(ModeTrade01(f = PERIOD_D1) == +1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );}  return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Buy ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " ); } return eLow_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Buy", " " );}  return eHigh_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Sell", " " );}  return eHigh2_Risk_Signal_Buy; }
                                        //
                              } //
                              //
                              if(ModeTrade01(f = PERIOD_W1) == -1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );}  return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Sell ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " );}  return eLow_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Buy", " " ); } return eHigh_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Sell", " " );}  return eHigh2_Risk_Signal_Sell; } //
                              }
                              //if(ModeTrade01(f = PERIOD_W1) == 0)         {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f,mode, 0, 0, 1.5, 0.5);  return eNon_Risk_Signal;} //
                              if(ModeTrade01(f = PERIOD_W1) == +1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );}  return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " ); } return eLow2_Risk_Signal_Buy ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " );}  return eLow_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Buy", " " ); } return eHigh_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Sell", " " );}  return eHigh2_Risk_Signal_Buy; } //
                              }
                              //
                              if(ModeTrade01(f = PERIOD_MN1) == -1)
                              {         //if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " ); } return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Sell ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " ); } return eLow_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " ); } return eMedium_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Buy", " " ); } return eHigh_Risk_Signal_Sell;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, -1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Sell", " " ); } return eHigh2_Risk_Signal_Sell; } //
                              }
                              //if(ModeTrade01(f = PERIOD_MN1) == 0)         {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f,mode, 0, 0, 1.5, 0.5);  return eNon_Risk_Signal;} //
                              if(ModeTrade01(f = PERIOD_MN1) == +1)
                              {         if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -10)       { if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );}  return eNon_Risk_Signal ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow2_Risk_Signal_Sell", " " );}  return eLow2_Risk_Signal_Buy ;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == -1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eLow_Risk_Signal_Buy", " " ); } return eLow_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == 0)         { if(IsPrint) {Print(" ", EnumToString(f), " ", "eMedium_Risk_Signal_Sell", " " );}  return eMedium_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +1)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh_Risk_Signal_Buy", " " );}  return eHigh_Risk_Signal_Buy;}
                                        if(Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip) == +2)        { if(IsPrint) {Print(" ", EnumToString(f), " ", "eHigh2_Risk_Signal_Sell", " " ); } return eHigh2_Risk_Signal_Buy; } //
                              }
                              //
                    }//
                    if(IsPrint) {Print(" ", EnumToString(f), " ", "eNon_Risk_Signal", " " );}
                    return eNon_Risk_Signal ;
                    //------------------------------------------------------------------------------------------------
                    if(0)
                    {         if(ModeTrade02(f = PERIOD_M1))               {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip);  } //
                              if(ModeTrade02(f = PERIOD_M5))               {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip);  } //
                              if(ModeTrade02(f = PERIOD_M15))              {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 1.5, 0.5, slpip, tppip);  } //
                    }
                    //
                    if(false)
                    {         if(ModeTrade02(f = PERIOD_M30))              {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 2.5, 0.5, slpip, tppip); return true;} //
                              if(ModeTrade02(f = PERIOD_H1))               {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 2.5, 0.5, slpip, tppip); return true;} //
                              if(ModeTrade02(f = PERIOD_H4))               {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 2.5, 0.5, slpip, tppip); return true;} //
                    }//
                    //
                    if(false)
                    {         if(ModeTrade02(f = PERIOD_D1))               {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 3.5, 0.5, slpip, tppip); return true;} //
                              if(ModeTrade02(f = PERIOD_W1))               {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 3.5, 0.5, slpip, tppip); return true;} //
                              if(ModeTrade02(f = PERIOD_MN1))              {   Confirmt_SLTP_AND_RiskTrade(isHL_SLTP, f, mode, +1, 3.5, 0.5, slpip, tppip); return true;} //
                    }
                    //------------------------------------------------------------------------------------------------
                    return false;//
          }
          void       Set_TPSLX_Default(ENUM_TIMEFRAMES  fSelected, int &slx, int &tpx)
          {         slx = 0;
                    tpx = 0;//
                    //fSelected_Current = PERIOD_M3;
                    if(fSelected == PERIOD_MN1)
                    {         slx = 5000;
                              tpx = 2500;//
                              //fSelected_Current = fSelected; //
                    }
                    if(fSelected == PERIOD_W1)
                    {         slx = 4000;
                              tpx = 2000;//
                              //fSelected_Current = fSelected; //
                    }
                    if(fSelected == PERIOD_D1)
                    {         slx = 3000;
                              tpx = 1500;//
                              //fSelected_Current = fSelected; //
                    }
                    if(fSelected == PERIOD_H4)
                    {         slx = 2000;
                              tpx = 1000;//
                              //fSelected_Current = fSelected; //
                    }
                    if(fSelected == PERIOD_H1)
                    {         slx = 1500;
                              tpx = 750;//
                              //fSelected_Current = fSelected; //
                    }
                    if(fSelected == PERIOD_M30)
                    {         slx = 1000;
                              tpx = 500;//
                              //fSelected_Current = fSelected; //
                    }
                    if(fSelected == PERIOD_M15)
                    {         slx = 800;
                              tpx = 400;//
                              //fSelected_Current = fSelected; //
                    }
                    if(fSelected == PERIOD_M5)
                    {         slx = 600;
                              tpx = 300;//
                              //fSelected_Current = fSelected; //
                    }//
                    if(fSelected == PERIOD_M1)
                    {         slx = 400;
                              tpx = 300;//
                              //fSelected_Current = fSelected; //
                    }//
                    return;//
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          char       Confirmt_SLTP_AND_RiskTrade(bool b, ENUM_TIMEFRAMES PeriodsIN, char Mode, char isBuyp1_Selln1, double FactorTpIN/* = 2.0*/, double FactorSlIN/* = 2.0*/, int &slpip, int &tppip )
          {         //realase -2 to +2 keys
                    //RR Channange
                    Is_PipTPxPipS = b;
                    if(!b)return -10;
                    //PeriodsIN = GetFrame(PeriodsIN, 1);
                    double FactorTp = FactorTpIN;//2.0;//double FactorTp = 2.5;best(win Sort 50:Long 53)
                    double FactorSl = FactorSlIN;
                    //----------------------------------
                    if(Mode == 1)//fail
                    {         if(isBuyp1_Selln1 == +1)
                              {         ENUM_TIMEFRAMES Periods = PeriodsIN;// PERIOD_M1;
                                        int lengh = 100 - 80; //100
                                        int         ilow_0_50            = iLowest(_Symbol, Periods, MODE_LOW, lengh, 0);
                                        int         ihigh_0_50           = iHighest(_Symbol, Periods, MODE_HIGH, lengh, 0);
                                        double      Lowest_0_50          = iLow(_Symbol, Periods, ilow_0_50 );
                                        double      Highest_0_50         = iHigh(_Symbol, Periods, ihigh_0_50);
                                        bool        IsBulishlengh        = ilow_0_50 > ihigh_0_50;
                                        //
                                        int         ilow_50_100_B          = iLowest(_Symbol, Periods, MODE_LOW, lengh, lengh);
                                        int         ihigh_50_100_B         = iHighest(_Symbol, Periods, MODE_HIGH, lengh, lengh);
                                        double      Lowest_50_100_B        = iLow(_Symbol, Periods, ilow_50_100_B );
                                        double      Highest_50_100_B       = iHigh(_Symbol, Periods, ihigh_50_100_B);
                                        bool        IsBulishlengh_B        = ilow_0_50 > ihigh_0_50;
                                        //
                                        //-------
                                        double RangeSLLow = MathAbs(Lowest_0_50 - Lowest_50_100_B); RangeSLLow = NormalizeDouble(RangeSLLow, _Digits);
                                        PipSl = (int)(RangeSLLow * 100);// Print("RangeSLLow:", RangeSLLow, "  PipSl:", PipSl);//---just xauusd
                                        PipTPx = (int)(PipSl * FactorTp);
                                        //-------------------------------------------------------------------
                                        //-------------------------------------------------------------------
                              }
                              if(isBuyp1_Selln1 == -1)
                              {         ENUM_TIMEFRAMES Periods =  PeriodsIN;//PERIOD_M1;
                                        int lengh = 100 - 80;
                                        int         ilow_0_50            = iLowest(_Symbol, Periods, MODE_LOW, lengh, 0);
                                        int         ihigh_0_50           = iHighest(_Symbol, Periods, MODE_HIGH, lengh, 0);
                                        double      Lowest_0_50          = iLow(_Symbol, Periods, ilow_0_50 );
                                        double      Highest_0_50         = iHigh(_Symbol, Periods, ihigh_0_50);
                                        bool        IsBulishlengh        = ilow_0_50 > ihigh_0_50;
                                        //
                                        int         ilow_50_100_B          = iLowest(_Symbol, Periods, MODE_LOW, lengh, lengh);
                                        int         ihigh_50_100_B         = iHighest(_Symbol, Periods, MODE_HIGH, lengh, lengh);
                                        double      Lowest_50_100_B        = iLow(_Symbol, Periods, ilow_50_100_B );
                                        double      Highest_50_100_B       = iHigh(_Symbol, Periods, ihigh_50_100_B);
                                        bool        IsBulishlengh_B        = ilow_0_50 > ihigh_0_50;
                                        //-------
                                        double RangeSLHigh = MathAbs(Highest_0_50 - Highest_50_100_B); RangeSLHigh = NormalizeDouble(RangeSLHigh, _Digits);
                                        PipSl = (int)(RangeSLHigh * 100);// Print("RangeSLHigh:", RangeSLHigh, "  PipSl:", PipSl);//---just xauusd
                                        //
                                        PipTPx = (int)(PipSl * FactorTp);
                                        //-------------------------------------------------------------------
                                        //-------------------------------------------------------------------
                              }//
                    }
                    if(Mode == 2)//bether
                    {         //--------------------
                              SL_SAR_Price = iSAR(_Symbol, PeriodsIN, 0.01, 0.2, 0);//GetFrame(PeriodsIN, 1)
                              double Diff_Sar = SL_SAR_Price > iClose(_Symbol, PeriodsIN, 0) ? MathAbs(SL_SAR_Price - iHigh(_Symbol, PeriodsIN, 0)) : MathAbs(SL_SAR_Price - iLow(_Symbol, PeriodsIN, 0));
                              int Diff_Sar_Pip = (int)(Diff_Sar * 100); //
                              //----------------------
                              PipSl =  (int)(Diff_Sar_Pip * FactorSl);
                              PipTPx = (int)(Diff_Sar_Pip * FactorTp);
                              //----------------------
                    }
                    //risks
                    {         //-------------------------------------------------------------------
                              if(PeriodsIN == PERIOD_M1)
                              {         double slHigh = 2;  double slLow = 1.0; double tpHigh = 2;  double tplow = 1.5;   slpip = PipSl; tppip = PipTPx;
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-2" ); return -2;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-1" ); return -1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___0" );  return 0;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+1" ); return +1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+2" ); return +2;} //
                                        Set_TPSLX_Default(PeriodsIN, slpip, tppip); return 0; //
                              }
                              if(PeriodsIN == PERIOD_M5)
                              {         double slHigh = 2.5;  double slLow = 1.5; double tpHigh = 2.5;  double tplow = 2.0;   slpip = PipSl; tppip = PipTPx;
                                        if( (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-2" ); return -2;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-1" ); return -1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___0" );  return 0;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+1" ); return +1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+2" ); return +2;} //
                                        Set_TPSLX_Default(PeriodsIN, slpip, tppip);  return 0; ////
                              }
                              if(PeriodsIN == PERIOD_M15)
                              {         double slHigh = 3;  double slLow = 2.0; double tpHigh = 3;  double tplow = 2.5;   slpip = PipSl; tppip = PipTPx;
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-2" ); return -2;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-1" ); return -1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___0" );  return 0;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+1" ); return +1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+2" ); return +2;} //
                                        Set_TPSLX_Default(PeriodsIN, slpip, tppip);  return 0; ////
                              }
                              if(PeriodsIN == PERIOD_M30)
                              {         double slHigh = 3.5;  double slLow = 2.5; double tpHigh = 3.5;  double tplow = 3.0;   slpip = PipSl; tppip = PipTPx;
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-2" ); return -2;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-1" ); return -1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___0" );  return 0;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+1" ); return +1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+2" ); return +2;} //
                                        Set_TPSLX_Default(PeriodsIN, slpip, tppip); return 0; // //
                              }
                              if(PeriodsIN == PERIOD_H1)
                              {         double slHigh = 4;  double slLow = 3.0; double tpHigh = 4;  double tplow = 3.5;   slpip = PipSl; tppip = PipTPx;
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-2" ); return -2;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-1" ); return -1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___0" ); return 0;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+1" ); return +1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+2" ); return +2;} //
                                        Set_TPSLX_Default(PeriodsIN, slpip, tppip); return 0; // //
                              }
                              if(PeriodsIN == PERIOD_H4)
                              {         double slHigh = 4.5;  double slLow = 3.5; double tpHigh = 4.5;  double tplow = 4.0;   slpip = PipSl; tppip = PipTPx;
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-2" ); return -2;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-1" ); return -1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___0" );  return 0;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+1" ); return +1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+2" ); return +2;} //
                                        Set_TPSLX_Default(PeriodsIN, slpip, tppip);  return 0; ////
                              }
                              if(PeriodsIN == PERIOD_D1)
                              {         double slHigh = 5;  double slLow = 4.0; double tpHigh = 5;  double tplow = 4.5;   slpip = PipSl; tppip = PipTPx;
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-2" ); return -2;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-1" ); return -1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___0" ); return 0;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+1" ); return +1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+2" ); return +2;} //
                                        Set_TPSLX_Default(PeriodsIN, slpip, tppip); return 0; // //
                              }
                              if(PeriodsIN == PERIOD_W1)
                              {         double slHigh = 5.5;  double slLow = 4.5; double tpHigh = 5.5;  double tplow = 5.0;   slpip = PipSl; tppip = PipTPx;
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-2" ); return -2;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-1" ); return -1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___0" );  return 0;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+1" ); return +1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+2" ); return +2;} //
                                        Set_TPSLX_Default(PeriodsIN, slpip, tppip); return 0; // //
                              }
                              if(PeriodsIN == PERIOD_MN1)
                              {         double slHigh = 6;  double slLow = 5.0; double tpHigh = 6;  double tplow = 5.5;   slpip = PipSl; tppip = PipTPx;
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-2" ); return -2;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___-1" ); return -1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___0" );  return 0;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+1" ); return +1;}
                                        if( (PipSl < (int)(400 * slHigh)) && (PipSl > (int)(350 * slLow)) && ( PipTPx < (int)(400 * tpHigh)) &&  (PipTPx > (int)(350 * tplow))) {Print("___", EnumToString(PeriodsIN), "___+2" ); return +2;} //
                                        Set_TPSLX_Default(PeriodsIN, slpip, tppip); return 0; // //
                              }
                              //
                    } //
                    return -10; //
          } //
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          void       UpdateVaribles(double f)
          {         isBuySignal  = false;
                    isSellSignal = false;
                    Factor = f;//0.1;
                    //--------------------------------------
                    if(1)
                    {         isSellSignal        = false;
                              isBuySignal         = false;
                              isBuySignalExit     = false;
                              isSellSignalExit    = false;
                              //---------------------------Ticker.Data.UpdateVaribles.isBuySignal  isSellSignal
                              CalcSignals();
                              //---------------------------
                              
                              return;//
                    } //
          };
          void       CalcSignals()
          {         //-------------------------------------------------------------
                    if(0)
                    {         // ct_Drive.TDD.ct_Conductor.DC_data.Indicators._CZZ_Periods.Update();
                              int shift2 = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._CZZ_Periods._CZZ_12_5_3_M5_._CZZ_Point[2]._Shift;
                              int shift3 = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._CZZ_Periods._CZZ_12_5_3_M5_._CZZ_Point[3]._Shift;
                              double price2 = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._CZZ_Periods._CZZ_12_5_3_M5_._CZZ_Point[2]._Price;;
                              double price3 = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._CZZ_Periods._CZZ_12_5_3_M5_._CZZ_Point[3]._Price;;
                              double    p1 =  price2 > price3 ? iHigh(_Symbol, PERIOD_M5, shift2) : iLow(_Symbol, PERIOD_M5, shift2);
                              datetime  t1 =   iTime(_Symbol, PERIOD_M5, shift2) ;
                              double    p2 =  price2 > price3 ? iLow(_Symbol, PERIOD_M5, shift3) : iHigh(_Symbol, PERIOD_M5, shift3);
                              datetime  t2 =  iTime(_Symbol, PERIOD_M5, shift3)  ;
                              ObjectDelete(0, "FF.Zigzag" ); //
                              ObjectCreate(0, "FF.Zigzag", OBJ_FIBO, 0, t2, p2, t1, p1); //ihigh - 50
                              ObjectSetInteger(0, "FF.Zigzag", OBJPROP_COLOR, clrYellowGreen);
                              ObjectSetInteger(0, "FF.Zigzag", OBJPROP_LEVELCOLOR, clrYellowGreen);
                              ObjectSetInteger(0, "FF.Zigzag", OBJPROP_WIDTH, 1);
                              ObjectSetInteger(0, "FF.Zigzag", OBJPROP_RAY_RIGHT, false);//OBJPROP_LEVELCOLOR
                    }
                    //=============================================================
                    _MovingAvrages.Update();
                    _MACD.Update();
                    _RSI.Update();
                    _Stochastic.Update();
                    _ADX.Update();
                    _MFI.Update();
                    _OVB.Update();
                    _ATR.Update();
                    _Force.Update();
                    _WPR.Update();
                    _SAR.Update();
                    //_Ichmiko.Update();
                    _AD.Update();
                    _AliGator.Update();
                    _STD.Update();
                    _BWMFI.Update();
                    //--------------------
                    //_TrendLineBoxFractal.Update();
                    //_TL_0_50_50_100_HL.Update();
                    //_TL_500_HL.Update();
                    //_FE_500.Update();
                    //_FE_100.Update();
                    //_HL_50_100_150.Update();
                    //_STD_Channel.Update();
                    //=============================================================
                    //=============================================================price_field [in]  Price field parameter. Can be one of this values: 0 - Low/High or 1 - Close/Close.
                    //-------------------------------------------------------------drowdown 18.44 cool not more trade
                    isBuySignal  = /*_WPR.wprBuy_Cross  && */ _WPR.wprBulishBuy   && /* _MovingAvrages.MABuy20_30  && */ _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, PERIOD_M1, 200, MODE_EMA, 0, PERIOD_M1, 300, MODE_EMA, 0)   && _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, PERIOD_M1, 10, MODE_EMA, 0, PERIOD_M1, 30, MODE_EMA, 0)   &&  _MACD.IsMacd_CrossBulish(PERIOD_M1, 0, -3, 12, 26, 0)   && _Stochastic.IsStoch_CrossBulish(_Symbol, PERIOD_M1, 1)  && _MFI.IsMFI_Buy_Array_m1Bulish_14_28; //mfi period m5
                    isSellSignal = /*_WPR.wprSell_Cross && */ _WPR.wprBearishSell && /* _MovingAvrages.MASell20_30 && */ !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, PERIOD_M1, 200, MODE_EMA, 0, PERIOD_M1, 300, MODE_EMA, 0)  && !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, PERIOD_M1, 10, MODE_EMA, 0, PERIOD_M1, 30, MODE_EMA, 0) &&   _MACD.IsMacd_CrossBearish(PERIOD_M1, 0, +3, 12, 26, 0)  && _Stochastic.IsStoch_CrossBearish(_Symbol, PERIOD_M1, 1)  && _MFI.IsMFI_Sell_Array_m1Bearish_14_28; //
                    ////-------------------------------------------------------------
                    //------------------------------------------------------------
                    //ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Update();//more lag
                    //------------------------------------------------------------
                    //auto boxing
                    //if(Detect_NewBar._M1.CBT__HalfMinute.Is_NewBar)//most laged
                    //ct_Drive.TDD.ct_Conductor.AutoBoxing(PERIOD_MN1, 100); //
                    //ct_Drive.TDD.ct_Conductor.AutoBoxing(PERIOD_W1, 100); //
                    //ct_Drive.TDD.ct_Conductor.AutoBoxing(PERIOD_D1, 100); //
                    //ct_Drive.TDD.ct_Conductor.AutoBoxing(PERIOD_H4, 100); //
                    //ct_Drive.TDD.ct_Conductor.AutoBoxing(PERIOD_H1, 100); //
                    //ct_Drive.TDD.ct_Conductor.AutoBoxing(PERIOD_M30, 100); //
                    //ct_Drive.TDD.ct_Conductor.AutoBoxing(PERIOD_M15, 100); //
                    //ct_Drive.TDD.ct_Conductor.AutoBoxing(PERIOD_M5, 100); //
                    //ct_Drive.TDD.ct_Conductor.AutoBoxing(PERIOD_M1, 100); //
                    //------------------------------------------------------------
                    MACD_STATE_POWER();
                    /******************************************************
                    make slover scalper one minute little trade 10 per days
                    *******************************************************/
                    {         //---two are work well --
                              /****************************************************
                              make faster scalper one minute more trade 10 per day
                              ****************************************************/
                              //------------------------------------------------------------------
                              if(1)//Demo00 more trade 5 day--not work
                              {         isSellSignal        = false;
                                        isBuySignal         = false;
                                        isBuySignalExit     = false;
                                        isSellSignalExit    = false;
                                        //---------------------------
                                        if(1
                                                            //----------------------------
                                                            //&& IsBulish_Forwarding___m1_m15
                                                            //&& IsBulish_Forwarding__m1_m5
                                                            //&& IsBulish__Forwarding_20__200_300_m1//--lesstrade good keep mony
                                                            //----------------------------
                                                            //&& (_MACD.e_MACD_STATE_H4 == UP_IN || _MACD.e_MACD_STATE_H4 == DOWN_OUT)
                                                            //&& (_MACD.e_MACD_STATE_H1 == UP_OUT || _MACD.e_MACD_STATE_H1 == DOWN_IN)
                                                            //&& (_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                            //&& (_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                            //---
                                                            //&& macd_ModeCross_m15_ == eBulish//--------?---bad effect
                                                            //&& macd_ModeCross_m1_ == eBulish
                                                            //&& IsMacd_Bulish_H4
                                                            //
                                                            //&& !IsMACD_MAIN_ABOVE_p5_m1
                                                            //&& (IsMACD_MAIN_ABOVE_p5_m5 || IsMACD_MAIN_UNDER_n5_m5)
                                                            && _MACD.IsMACD_MAIN_UNDER_n30_m5
                                                            //----------------------------
                                                            //&& IsRSI_14_Bulish_m1
                                                            //&& IsRSI_14_Bulish_m5//---cool effect 200$--side efect 4:2 winloss
                                                            //&& IsRSI_14_Bulish_m15
                                                            //&& IsRSI_14_Bulish_m30
                                                            //&& IsRSI_14_Bulish_H1
                                                            //&& IsRSI_14_Bulish_H4
                                                            //
                                                            //&& IsRSI_14_14b_Bearish_7b_AND_7b_Bulish_0b_m1_u
                                                            //
                                                            //&& IsRSI_14_Under30_m1
                                                            //&& IsRSI_14_Under30_m5
                                                            //
                                                            //&& IsRSI_14_40_Bulish_m1
                                                            //&& IsRSI_14_40_Bulish_h1
                                                            //
                                                            //&& IsRSI_14_40_Bulish_CrossPoint_m1
                                                            //
                                                            && _RSI.IsRSI_Cross_Bulish(_Symbol,PERIOD_M5, 7, 14, 0)
                                                            //---------------------------
                                                            //&& IsAliGator_Bulish_m1//--bad efect
                                                            //----------------------------
                                                            //&& !IsMA_Bulish_13_5_m1  //--|where macro trend bearish get buy not pick up
                                                            //&& IsMA_Bulish_20_30_m1//--|
                                                            //&& IsMA_Bulish_20_30_m5
                                                            //&& IsMA_BulishCrossPoint_3_5_m1
                                                            //&& IsMA_BulishCrossPoint_3_14_m1
                                                            //&& IsMA_BulishCrossPoint_8_13_m1
                                                            //&& IsMA_BulishCrossPoint_13_20_m1
                                                            //&& IsMA_BulishCrossPoint_20_30_m1
                                                            //&& IsMA_Bulish_13_5__PRICE_UNDER13_m1
                                                            //---------------------------
                                                            //&& Stoch_ModeCross_m1_ != eBulish //--decrese win factor--inverse incrise win factor
                                                            //&& Stoch_ModeCross_m5_ ==  eBulish
                                                            //&& Stoch_ModeCross_m15_ ==  eBulish//--------?---bad effect
                                                            //---------------------------
                                                            //&& IsOVB_Bulish_M1//--less trade bad efect
                                                            //&& IsOVB_Bulish_M1
                                                            //&& IsOVB_Bulish_M30
                                                            //&& IsOVB_Bulish_H4
                                                            //---------------------------
                                                            //&& IsMFI_Bulish_14_0_14_m1
                                                            //---------------------------
                                                            //&& IsAWSBulish_m1_3_14
                                                            //---------------------------
                                                            //&& IsATR_Above_0_5_m1//---make 25% win
                                                            //---------------------------
                                                            //&&  isBulish_500HL
                                                            //&&  isBulish_100HL              //--inverse incrise win factor
                                                            //&& isBulish_50_0HL
                                                            //&& !isBulish_100_50HL
                                                            //&& !isBulish_150_100HL
                                                            //&& IsPriceUnder_061_Bulish_100HL
                                                            //---------------------------
                                                            //&& !IsMA500_PriceUpperLevel1300//--TARGET
                                                            //&& !IsMA500_PriceUnderLevel1300//--START
                                                            //---------------------------
                                                            //&& IsSTD_14_20_Bulish_M1
                                                            //---------------------------
                                          )                                                                                 {isBuySignal   = true;   }
                                        else if(0
                                                            //&& IsBulish_ForwardingCorrection___m1_m15
                                                            //&& IsBulish_ForwardingCorrection__m1_m5
                                                            //&& IsBulish__Correction_20__200_300_m1
                                                            //---------------------------
                                                            //&& (_MACD.e_MACD_STATE_H4 == DOWN_IN || _MACD.e_MACD_STATE_H4 == UP_OUT)
                                                            //&& (_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            //&& (_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                            //---------------------------
                                                            //&& IsPriceAbove_161_Bulish_100HL
                                                            //---------------------------
                                                            //&&  !IsMA_Bulish_20_30_m1
                                                            //&& IsMA_BearishCrossPoint_3_5_m1
                                                            //IsMA_BearishCrossPoint_3_14_m1
                                                            //&& IsMA_BearishCrossPoint_13_20_m1
                                                            //IsMA_BearishCrossPoint_20_30_m1
                                                            //------------------------------
                                                            //!IsRSI_14_40_Bulish_m5
                                                            //IsRSI_14_40_Bearish_CrossPoint_m1
                                                            //------------------------------
                                               )                                                                          {isBuySignalExit   = 1;  }
                                        else if(1
                                                            //----------------------------
                                                            //&& IsBearish_BackWarding___m1_m15
                                                            //&& IsBearish_BackWarding__m1_m5
                                                            //&& IsBearish__Forwarding_20__200_300_m1 //--lesstrade good keep mony
                                                            //----------------------------
                                                            //&& (_MACD.e_MACD_STATE_H4 == DOWN_IN || _MACD.e_MACD_STATE_H4 == UP_OUT)
                                                            //&& (_MACD.e_MACD_STATE_H1 == DOWN_OUT || _MACD.e_MACD_STATE_H1 == UP_IN)
                                                            //&& (_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                            //&& (_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M1 == UP_OUT)
                                                            //---
                                                            //&& macd_ModeCross_m15_ == eBearish//--------?---
                                                            //&& macd_ModeCross_m1_ == eBearish
                                                            //&& !IsMacd_Bulish_H4
                                                            //
                                                            //&& IsMACD_MAIN_UNDER_n5_m1
                                                            //&& (IsMACD_MAIN_ABOVE_p5_m5 || IsMACD_MAIN_UNDER_n5_m5)
                                                            && _MACD.IsMACD_MAIN_ABOVE_p30_m5
                                                            //----------------------------
                                                            //&& !IsRSI_14_Bulish_m1
                                                            //&& !IsRSI_14_Bulish_m5//---cool effect 200$--side efect 4:2 winloss
                                                            //&& !IsRSI_14_Bulish_m15
                                                            //&& !IsRSI_14_Bulish_m30
                                                            //&& !IsRSI_14_Bulish_H1
                                                            //&& !IsRSI_14_Bulish_H4
                                                            //
                                                            //&& IsRSI_14_14b_Bulish_7b_AND_7b_Bearish_0b_m1_n
                                                            //
                                                            //&& IsRSI_14_Upper30_m1
                                                            //&& IsRSI_14_Upper30_m5
                                                            //
                                                            //&& !IsRSI_14_40_Bulish_m1
                                                            //&& !IsRSI_14_40_Bulish_h1
                                                            //
                                                            //&& IsRSI_14_40_Bearish_CrossPoint_m1
                                                            //
                                                            && _RSI.IsRSI_Cross_Bearish(_Symbol,PERIOD_M5, 7, 14, 0)
                                                            //----------------------------
                                                            //&& !IsAliGator_Bulish_m1//--bad efect
                                                            //----------------------------
                                                            //&&  IsMA_Bulish_13_5_m1  //--|where macro trend bulish get buy not pick up
                                                            //&&  !IsMA_Bulish_20_30_m1//--|
                                                            //&& IsMA_Bulish_20_30_m5
                                                            //&& IsMA_BearishCrossPoint_3_5_m1
                                                            //&& IsMA_BearishCrossPoint_3_14_m1
                                                            //&& IsMA_BearishCrossPoint_8_13_m1
                                                            //&& IsMA_BearishCrossPoint_13_20_m1
                                                            //&& IsMA_BearishCrossPoint_20_30_m1
                                                            //&& IsMA_Bearish_13_5__PRICE_ABOVE13_m1
                                                            //---------------------------
                                                            //&&  Stoch_ModeCross_m1_ !=  eBearish  //--decrese win factor--inverse incrise win factor
                                                            //&& Stoch_ModeCross_m5_ ==  eBearish
                                                            //&& Stoch_ModeCross_m15_ ==  eBearish//--------?---bad effect
                                                            //---------------------------
                                                            //&& !IsOVB_Bulish_M1//--less trade bad efect
                                                            //&& !IsOVB_Bulish_M1
                                                            //&& !IsOVB_Bulish_M30
                                                            //&& !IsOVB_Bulish_H4
                                                            //---------------------------
                                                            //&& !IsMFI_Bulish_14_0_14_m1
                                                            //---------------------------
                                                            //&& !IsAWSBulish_m1_3_14
                                                            //---------------------------
                                                            //&& IsATR_Above_0_5_m1//---make 25% win
                                                            //---------------------------
                                                            //&&  !isBulish_500HL
                                                            //&&  !isBulish_100HL  //--inverse incrise win factor
                                                            //&& !isBulish_50_0HL
                                                            //&& isBulish_100_50HL
                                                            //&& isBulish_150_100HL
                                                            //&& IsPriceUnder_061_Bearish_100HL
                                                            //---------------------------
                                                            //&& !IsMA500_PriceUpperLevel1300//START
                                                            //&& !IsMA500_PriceUnderLevel1300//TARGET
                                                            //---------------------------
                                                            //---------------------------
                                                            //&& IsSTD_14_20_Bulish_M1
                                                            //---------------------------
                                               )                                                                                 {isSellSignal  = true;   }
                                        else if(0
                                                            //&& IsBearish_BackWardingCorrection___m1_m15
                                                            //&& IsBearish_BackWardingCorrection__m1_m5
                                                            //&& IsBearish__Correction_20__200_300_m1
                                                            //---------------------------
                                                            //&& (_MACD.e_MACD_STATE_H4 == UP_IN || _MACD.e_MACD_STATE_H4 == DOWN_OUT)
                                                            //&& (_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            //&& (_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                            //---------------------------
                                                            //&& IsPriceUnder_161_Bearish_100HL
                                                            //---------------------------
                                                            //&& !IsMA_Bulish_20_30_m1
                                                            //&& IsMA_BulishCrossPoint_3_5_m1
                                                            //IsMA_BulishCrossPoint_3_14_m1
                                                            //&& IsMA_BulishCrossPoint_13_20_m1
                                                            //IsMA_BulishCrossPoint_20_30_m1
                                                            //------------------------------
                                                            //IsRSI_14_40_Bulish_m5
                                                            //IsRSI_14_40_Bulish_CrossPoint_m1
                                                            //------------------------------
                                               )                                                                          {isSellSignalExit  = 1;  }
                                        //
                              }//
                    }
                    //--------------------------------------------------------------------------------------
                    //============================================================================================================================
                    //---------------------------------------------------------------
                    //--efects
                    //IsBulish_Forwarding___m1_m15 IsBearish_BackWarding___m1_m15 | good trader
                    //IsPriceFallowTrend                   |     medium
                    //MacdBuy__m5         MacdSell__m5     |     bad trader
                    //IsMA_Bulish_13_5_m1       IsMA_Bearish_13_5_m1       |     bad trader
                    //IsMASell20_30__     IsMABuy20_30__       |     bad trader
                    //MABuy200_300__    MASell200_300__    |
                    //isBulish_100HL    !isBulish_100HL    |     not efected
                    //IsOVB_Bearish_M1  IsOVB_Bulish_M1    |     good trader      ->solo nit good trader
                    //IsATR_Under_1_5   IsATR_Under_1_5    |     not trade violation   atr not efected
                    //MFI_Bulish_14_0_1_m5    mfiSellBearish__   |     bad trader
                    //StochBuy__        StochSell__        |     bad trader->WrongSide   Bad trader->DirectSide
                    //---------------------------------------------------------------
          };//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void StC_Data::MACD_STATE_POWER()
{         if(1)
          {         PowerMACD_STATE = 0;
                    if(_MACD.e_MACD_STATE_MN1 == DOWN_IN || _MACD.e_MACD_STATE_MN1 == UP_OUT)
                    {         PowerMACD_STATE += 9;
                              if(_MACD.e_MACD_STATE_W1 == DOWN_IN || _MACD.e_MACD_STATE_W1 == UP_OUT)
                              {         PowerMACD_STATE += 8;
                                        if(_MACD.e_MACD_STATE_D1 == DOWN_IN || _MACD.e_MACD_STATE_D1 == UP_OUT)
                                        {         PowerMACD_STATE += 7;
                                                  if(_MACD.e_MACD_STATE_H4 == DOWN_IN || _MACD.e_MACD_STATE_H4 == UP_OUT)
                                                  {         PowerMACD_STATE += 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  }
                                                  else if(_MACD.e_MACD_STATE_H4 == UP_IN || _MACD.e_MACD_STATE_H4 == DOWN_OUT)
                                                  {         PowerMACD_STATE -= 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  } //
                                        }
                                        else if(_MACD.e_MACD_STATE_D1 == UP_IN || _MACD.e_MACD_STATE_D1 == DOWN_OUT)
                                        {         PowerMACD_STATE -= 7;
                                                  if(_MACD.e_MACD_STATE_H4 == DOWN_IN || _MACD.e_MACD_STATE_H4 == UP_OUT)
                                                  {         PowerMACD_STATE += 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  }
                                                  else if(_MACD.e_MACD_STATE_H4 == UP_IN || _MACD.e_MACD_STATE_H4 == DOWN_OUT)
                                                  {         PowerMACD_STATE -= 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  } //
                                        } //
                              }
                              else if(_MACD.e_MACD_STATE_MN1 == UP_IN || _MACD.e_MACD_STATE_MN1 == DOWN_OUT)
                              {         PowerMACD_STATE -= 8;
                                        if(_MACD.e_MACD_STATE_D1 == DOWN_IN || _MACD.e_MACD_STATE_D1 == UP_OUT)
                                        {         PowerMACD_STATE += 7;
                                                  if(_MACD.e_MACD_STATE_H4 == DOWN_IN || _MACD.e_MACD_STATE_H4 == UP_OUT)
                                                  {         PowerMACD_STATE += 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  }
                                                  else if(_MACD.e_MACD_STATE_H4 == UP_IN || _MACD.e_MACD_STATE_H4 == DOWN_OUT)
                                                  {         PowerMACD_STATE -= 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  } //
                                        }
                                        else if(_MACD.e_MACD_STATE_D1 == UP_IN || _MACD.e_MACD_STATE_D1 == DOWN_OUT)
                                        {         PowerMACD_STATE -= 7;
                                                  if(_MACD.e_MACD_STATE_H4 == DOWN_IN || _MACD.e_MACD_STATE_H4 == UP_OUT)
                                                  {         PowerMACD_STATE += 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  }
                                                  else if(_MACD.e_MACD_STATE_H4 == UP_IN || _MACD.e_MACD_STATE_H4 == DOWN_OUT)
                                                  {         PowerMACD_STATE -= 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  } //
                                        } //
                              } //
                    }
                    else if(_MACD.e_MACD_STATE_MN1 == UP_IN || _MACD.e_MACD_STATE_MN1 == DOWN_OUT)
                    {         PowerMACD_STATE -= 9;
                              if(_MACD.e_MACD_STATE_W1 == DOWN_IN || _MACD.e_MACD_STATE_W1 == UP_OUT)
                              {         PowerMACD_STATE += 8;
                                        if(_MACD.e_MACD_STATE_D1 == DOWN_IN || _MACD.e_MACD_STATE_D1 == UP_OUT)
                                        {         PowerMACD_STATE += 7;
                                                  if(_MACD.e_MACD_STATE_H4 == DOWN_IN || _MACD.e_MACD_STATE_H4 == UP_OUT)
                                                  {         PowerMACD_STATE += 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  }
                                                  else if(_MACD.e_MACD_STATE_H4 == UP_IN || _MACD.e_MACD_STATE_H4 == DOWN_OUT)
                                                  {         PowerMACD_STATE -= 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  } //
                                        }
                                        else if(_MACD.e_MACD_STATE_D1 == UP_IN || _MACD.e_MACD_STATE_D1 == DOWN_OUT)
                                        {         PowerMACD_STATE -= 7;
                                                  if(_MACD.e_MACD_STATE_H4 == DOWN_IN || _MACD.e_MACD_STATE_H4 == UP_OUT)
                                                  {         PowerMACD_STATE += 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  }
                                                  else if(_MACD.e_MACD_STATE_H4 == UP_IN || _MACD.e_MACD_STATE_H4 == DOWN_OUT)
                                                  {         PowerMACD_STATE -= 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  } //
                                        } //
                              }
                              else if(_MACD.e_MACD_STATE_MN1 == UP_IN || _MACD.e_MACD_STATE_MN1 == DOWN_OUT)
                              {         PowerMACD_STATE -= 8;
                                        if(_MACD.e_MACD_STATE_D1 == DOWN_IN || _MACD.e_MACD_STATE_D1 == UP_OUT)
                                        {         PowerMACD_STATE += 7;
                                                  if(_MACD.e_MACD_STATE_H4 == DOWN_IN || _MACD.e_MACD_STATE_H4 == UP_OUT)
                                                  {         PowerMACD_STATE += 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  }
                                                  else if(_MACD.e_MACD_STATE_H4 == UP_IN || _MACD.e_MACD_STATE_H4 == DOWN_OUT)
                                                  {         PowerMACD_STATE -= 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  } //
                                        }
                                        else if(_MACD.e_MACD_STATE_D1 == UP_IN || _MACD.e_MACD_STATE_D1 == DOWN_OUT)
                                        {         PowerMACD_STATE -= 7;
                                                  if(_MACD.e_MACD_STATE_H4 == DOWN_IN || _MACD.e_MACD_STATE_H4 == UP_OUT)
                                                  {         PowerMACD_STATE += 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  }
                                                  else if(_MACD.e_MACD_STATE_H4 == UP_IN || _MACD.e_MACD_STATE_H4 == DOWN_OUT)
                                                  {         PowerMACD_STATE -= 6;
                                                            if(_MACD.e_MACD_STATE_H1 == DOWN_IN || _MACD.e_MACD_STATE_H1 == UP_OUT)
                                                            {         PowerMACD_STATE += 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            }
                                                            else if(_MACD.e_MACD_STATE_H1 == UP_IN || _MACD.e_MACD_STATE_H1 == DOWN_OUT)
                                                            {         PowerMACD_STATE -= 5;
                                                                      if(_MACD.e_MACD_STATE_M30 == DOWN_IN || _MACD.e_MACD_STATE_M30 == UP_OUT)
                                                                      {         PowerMACD_STATE += 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      }
                                                                      else if(_MACD.e_MACD_STATE_M30 == UP_IN || _MACD.e_MACD_STATE_M30 == DOWN_OUT)
                                                                      {         PowerMACD_STATE -= 4;
                                                                                if(_MACD.e_MACD_STATE_M15 == DOWN_IN || _MACD.e_MACD_STATE_M15 == UP_OUT)
                                                                                {         PowerMACD_STATE += 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                }
                                                                                else if(_MACD.e_MACD_STATE_M15 == UP_IN || _MACD.e_MACD_STATE_M15 == DOWN_OUT)
                                                                                {         PowerMACD_STATE -= 3;
                                                                                          if(_MACD.e_MACD_STATE_M5 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                          {         PowerMACD_STATE += 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          }
                                                                                          else if(_MACD.e_MACD_STATE_M5 == UP_IN || _MACD.e_MACD_STATE_M5 == DOWN_OUT)
                                                                                          {         PowerMACD_STATE -= 2;
                                                                                                    if(_MACD.e_MACD_STATE_M1 == DOWN_IN || _MACD.e_MACD_STATE_M5 == UP_OUT)
                                                                                                    {         PowerMACD_STATE += 1;}
                                                                                                    else if(_MACD.e_MACD_STATE_M1 == UP_IN || _MACD.e_MACD_STATE_M1 == DOWN_OUT)
                                                                                                    {         PowerMACD_STATE -= 1;} //
                                                                                          } //
                                                                                } //
                                                                      } //
                                                            } //
                                                  } //
                                        } //
                              }
                              //
                    }
                    //
                    //if(PowerMACD_STATE < 0)
                    //{         if(_RSI.IsRSI_14_40_Bulish_m1 && Stoch_Bulish_M1)    isBuySignal            = true; }
                    //else
                    //{         if(!_RSI.IsRSI_14_40_Bulish_m1 && !Stoch_Bulish_M1)    isSellSignal            = true; } //
          } //
}
//+------------------------------------------------------------------+
