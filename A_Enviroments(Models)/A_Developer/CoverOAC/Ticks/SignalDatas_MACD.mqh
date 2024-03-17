//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_MACD.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_MACD
{
public:
          SignalDatas_MACD(void) {};
          ~SignalDatas_MACD(void) {};
          //-----------------------

          bool       IsMacd_Bulishff(string sy,ENUM_TIMEFRAMES f1, ENUM_TIMEFRAMES f2, int pf = 12, int ps = 26, int pss = 9, ENUM_APPLIED_PRICE ap = PRICE_CLOSE, int s = 0)
          {         return  iMACD(sy, f1, pf, ps, pss, ap, MODE_MAIN, s) > iMACD(sy, f2, pf, ps, pss, ap, MODE_SIGNAL, s) ;}


          //---------------------------------------------------------------------------------------------------------------------------------------------
          bool       IsMacd_NMax_PMin_Delta(ENUM_TIMEFRAMES f, int pf = 12, int ps = 26, int pss = 9, ENUM_APPLIED_PRICE ap = PRICE_CLOSE, int s = 0, double deltaMax = 0, double DeltaMin = 0)
          {         return IsMacd_Bulishff(_Symbol,f, f, 12, 26, 9, PRICE_WEIGHTED, 0) ? iMACD(_Symbol, f, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, s) < deltaMax : iMACD(_Symbol, f, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, s) > DeltaMin;};
          //---------------------------------------------------------------------------------------------------------------------------------------------
          bool       IsMacd_Bulish_H4;

          bool       IsMacd_DeltaOver(ENUM_TIMEFRAMES f, int s, double deltaMin, double DeltaMax) { return iMACD(_Symbol, f, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, s) < deltaMin ||  iMACD(_Symbol, f, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, s) > DeltaMax;};
          bool       IsMacd_DeltaIN(ENUM_TIMEFRAMES f, int s, double deltaMin, double DeltaMax) { return iMACD(_Symbol, f, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, s) > deltaMin &&  iMACD(_Symbol, f, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, s) < DeltaMax;};
          bool       IsMacd_Posetiver_Delta(ENUM_TIMEFRAMES f, double val, int s )
          {         return iMACD(_Symbol, f, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, s) > val; }
          bool       IsMACD_MAIN_UNDER_05_m1;
          bool       IsMACD_MAIN_ABOVE_05_m1;
          bool       IsMACD_MAIN_ABOVE_p05_m1;
          bool       IsMACD_MAIN_UNDER_n05_m1;
          bool       IsMACD_MAIN_ABOVE_p05_m5;
          bool       IsMACD_MAIN_UNDER_n05_m5;
          bool       IsMACD_MAIN_ABOVE_p30_m5;
          bool       IsMACD_MAIN_UNDER_n30_m5;
          //------------
          bool       IsMacd_CrossBulish(ENUM_TIMEFRAMES f, int s, double d, int p1, int p2, bool mode)
          {         if(mode)
                    {         return (iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_SIGNAL, s) < iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_MAIN, s))
                                     && (iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_SIGNAL, s + 1) > iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_MAIN, s + 1));//
                    }
                    return (iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_SIGNAL, s) < iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_MAIN, s))
                           && (iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_SIGNAL, s + 1) > iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_MAIN, s + 1))
                           && (iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_MAIN, s) < d)
                           ;//
          };
          //----------------------------
          bool       IsMacd_CrossBearish(ENUM_TIMEFRAMES f, int s, double d, int p1, int p2, bool mode)
          {         if(mode)
                    {         return (iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_SIGNAL, s) > iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_MAIN, s))
                                     && (iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_SIGNAL, s + 1) < iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_MAIN, s + 1));//
                    }
                    return (iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_SIGNAL, s) > iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_MAIN, s))
                           && (iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_SIGNAL, s + 1) < iMACD(_Symbol, f, p1, p2, 9, PRICE_CLOSE, MODE_MAIN, s + 1))
                           && (iMACD(_Symbol, f, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > d)
                           ;//
          };
          //----------------------------
          //--off--else { macd_ModeCross = eVoid;} //
          //
          bool       IsMacdBuy_Bulish_M5;
          bool       IsMacdSell_Bearish_M5;
          bool       IsMacdBuy_CrossBulish_M5;
          bool       IsMacdSell_CrossBearish_M5;

          //
          bool       IsMacdBuy_CrossBulish_M15;
          bool       IsMacdSell_CrossBearish_M15;

          bool       IsMacdBuy_DownSide_m1;
          bool       IsMacdSell_UpSide_m1;
          bool       MacdBuy__m5;
          bool       MacdSell__m5;
          //---
          bool       IsBulish_Forwarding(ENUM_TIMEFRAMES f1, ENUM_TIMEFRAMES f2, double c)
          {         return iMACD(_Symbol, f1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < iMACD(_Symbol, f1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)
                           && iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)
                           //&& iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < -c
                           ; //
          };
          //-------------------------------------------------------------
          bool       IsBulish_Forwarding_Correction(ENUM_TIMEFRAMES f1, ENUM_TIMEFRAMES f2, double c)
          {         return iMACD(_Symbol, f1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) > iMACD(_Symbol, f1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)
                           && iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)
                           //&& iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > c
                           ; //
          };
          //-------------------------------------------------------------
          bool       IsBearish_ForWarding(ENUM_TIMEFRAMES f1, ENUM_TIMEFRAMES f2, double c)
          {         return iMACD(_Symbol, f1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) > iMACD(_Symbol, f1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)
                           && iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) > iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)
                           //&& iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > c
                           ;//
          };
          //-------------------------------------------------------------
          bool       IsBearish_ForWarding_Correction(ENUM_TIMEFRAMES f1, ENUM_TIMEFRAMES f2, double c)
          {         return iMACD(_Symbol, f1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < iMACD(_Symbol, f1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)
                           && iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) > iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)
                           // && iMACD(_Symbol, f2, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < c
                           ;//
          };//
          //-------
          char IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(ENUM_TIMEFRAMES f1)//----&& IsMacd_CrossBulish(f1, 0,0.0, 12, 26, 0)//--&& IsMacd_CrossBearish(f1, 0,0.0, 12, 26, 0)
          {         double Macd_200SMa = 0;
                    double Macd_100EMa = 0;
                    double MACDVal[]; ArrayResize(MACDVal, 200);
                    for(int i = 0; i < 200; i++)
                    {         MACDVal[i] = iMACD(_Symbol, f1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i); //
                    }
                    Macd_200SMa = iMAOnArray(MACDVal, 200, 200, 0, MODE_SMA, 0);
                    Macd_100EMa = iMAOnArray(MACDVal, 200, 100, 0, MODE_EMA, 0);
                    if( Macd_100EMa > Macd_200SMa ) return +1;
                    if( Macd_100EMa < Macd_200SMa ) return -1;
                    return 0;
                    //
          }
          char IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1Cross(ENUM_TIMEFRAMES f1,int p)//----&& IsMacd_CrossBulish(f1, 0,0.0, 12, 26, 0)//--&& IsMacd_CrossBearish(f1, 0,0.0, 12, 26, 0)
          {         double Macd_200SMa = 0;
                    double Macd_100EMa = 0;
                    double Macd_200SMa_1 = 0;
                    double Macd_100EMa_1 = 0;
                    double MACDVal[]; ArrayResize(MACDVal, p);
                    for(int i = 0; i < p; i++)
                    {         MACDVal[i] = iMACD(_Symbol, f1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i); //
                    }
                    Macd_200SMa = iMAOnArray(MACDVal, p, p, 0, MODE_SMA, 0);
                    Macd_100EMa = iMAOnArray(MACDVal, p, p/2, 0, MODE_EMA, 0);
                    Macd_200SMa_1 = iMAOnArray(MACDVal, p, p, 0, MODE_SMA, 1);
                    Macd_100EMa_1 = iMAOnArray(MACDVal, p, p/2, 0, MODE_EMA, 1);
                    if( Macd_100EMa > Macd_200SMa && Macd_100EMa_1 < Macd_200SMa_1) return +1;
                    if( Macd_100EMa < Macd_200SMa && Macd_100EMa_1 > Macd_200SMa_1) return -1;
                    return 0;
                    //
          }
          //-------------------------------------------------------------
          //
          E_MACD_STATE GetMACD_State(ENUM_TIMEFRAMES Periods = PERIOD_M5)
          {         // DECIDE SIGNAL
                    //if(i == 0) continue;
                    for(int i = 0; i < 100; i++)
                    {         bool              Is_BullSide                     = 0;
                              bool              Is_Signal_Grater_Main__Selling  = iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i + 0) < iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i + 0);
                              bool              Is_Signal_Lower_Main__Buying    = iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i + 0) > iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i + 0);
                              bool              IsCrossMACD                     = 0;
                              bool              Is_Detected_CrossDown           = 0;
                              bool              Is_Detected_CrossUp             = 0;
                              E_MACD_STATE      eMACD_STATE                     = EVoide_MACD_STATE ;
                              bool              Is_CrossDown_Signal_Buying      = 0;
                              bool              Is_CrossUp_Signal_Selling       = 0;
                              if(Is_BullSide && Is_Signal_Grater_Main__Selling)
                              {         IsCrossMACD = (iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i + 1) > iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i + 1))
                                                      && (iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i + 0) < iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i + 0))
                                                      && iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i) > 0.6
                                                      ; //&& (DATAS[i - 1].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < DATAS[i - 1].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0));//perfect OK
                                        //bool IsCross1 = (DATAS[i - 1].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) > DATAS[i + 0].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0)) && (DATAS[i - 1].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < DATAS[i + 0].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0));
                                        Is_Detected_CrossUp    = Is_CrossUp_Signal_Selling   =   (IsCrossMACD);
                                        //eMACD_STATE = (Is_CrossUp_Signal_Selling) ? UP_OUT : EVoid_MACD.e_MACD_STATE ; //
                                        if(IsCrossMACD)  {eMACD_STATE = UP_OUT; return eMACD_STATE;} //
                              } //
                              if(!Is_BullSide && Is_Signal_Lower_Main__Buying)
                              {         IsCrossMACD =  (iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i + 1) < iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i + 1))
                                                       && (iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i + 0) > iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i + 0))
                                                       && iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i) < -0.6
                                                       ; //&& (DATAS[i - 1].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > DATAS[i - 1].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0));//perfect OK
                                        //bool IsCross1 = (DATAS[i - 1].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < DATAS[i + 0].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0)) && (DATAS[i - 1].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > DATAS[i + 0].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0));
                                        Is_Detected_CrossDown  =  Is_CrossDown_Signal_Buying =   (IsCrossMACD);
                                        //eMACD_STATE = (Is_CrossDown_Signal_Buying) ? DOWN_OUT : EVoid_MACD.e_MACD_STATE ; //
                                        if(IsCrossMACD)  {eMACD_STATE = DOWN_OUT; return eMACD_STATE;} //
                              }
                              if(Is_BullSide )//&& !Is_Signal_Grater_Main__Selling
                              {         IsCrossMACD = (iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i + 1) < iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i + 1))
                                                      && (iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i + 0) >  iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i + 0))
                                                      ; //&& (DATAS[i - 1].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > DATAS[i - 1].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0));;//perfect OK
                                        //bool IsCross1 = (DATAS[i - 1].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < DATAS[i + 0].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0)) && (DATAS[i + 1].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > DATAS[i + 0].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0));
                                        //eMACD_STATE = (IsCrossMACD) ? UP_IN : EVoid_MACD.e_MACD_STATE; ///...---bug reset wrong
                                        if(IsCrossMACD)  {eMACD_STATE = UP_IN; return eMACD_STATE;} //
                              } //
                              if(!Is_BullSide )//&& !Is_Signal_Lower_Main__Buying
                              {         IsCrossMACD = (iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i + 1) > iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i + 1))
                                                      && (iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i + 0) <  iMACD(_Symbol, Periods, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i + 0))
                                                      ; //&& (DATAS[i - 1].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < DATAS[i - 1].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0));;//perfect OK
                                        //bool IsCross1 = (DATAS[i - 1].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < DATAS[i + 0].iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0)) && (DATAS[i + 1].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < DATAS[i + 0].iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0));
                                        //eMACD_STATE = (IsCrossMACD) ? DOWN_IN : EVoid_MACD.e_MACD_STATE; //...---bug reset wrong
                                        if(IsCrossMACD)  {eMACD_STATE = DOWN_IN; return eMACD_STATE;} //
                              } //
                              //if(eMACD_STATE == EVoid_MACD.e_MACD_STATE) continue;
                    }//
                    return EVoide_MACD_STATE ;//
          } //
          //-------------------------------------------------------------
          E_MACD_STATE   e_MACD_STATE_M1;
          E_MACD_STATE   e_MACD_STATE_M5;
          E_MACD_STATE   e_MACD_STATE_M15;
          E_MACD_STATE   e_MACD_STATE_M30;
          E_MACD_STATE   e_MACD_STATE_H1;
          E_MACD_STATE   e_MACD_STATE_H4;
          E_MACD_STATE   e_MACD_STATE_D1;
          E_MACD_STATE   e_MACD_STATE_W1;
          E_MACD_STATE   e_MACD_STATE_MN1;
          //----------------------------------------------------
          void       Update()
          {         //===============================
                    IsMACD_MAIN_UNDER_05_m1    = iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < -0.5;
                    IsMACD_MAIN_ABOVE_05_m1    = iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > 0.5;
                    IsMACD_MAIN_ABOVE_p05_m1    = iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > 0.5;
                    IsMACD_MAIN_UNDER_n05_m1    = iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < -0.5;
                    IsMACD_MAIN_ABOVE_p05_m5    = iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > 0.5;
                    IsMACD_MAIN_UNDER_n05_m5    = iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < -0.5;
                    IsMACD_MAIN_ABOVE_p30_m5    = iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > 3.0;
                    IsMACD_MAIN_UNDER_n30_m5    = iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < -3.0;
                    //------------
                    //--off--else { macd_ModeCross = eVoid;} //
                    //
                    IsMacdBuy_Bulish_M5    = (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)); //
                    IsMacdSell_Bearish_M5  = (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) > iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0));
                    IsMacdBuy_CrossBulish_M5           = (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)) && (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < 0) && (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 1) > iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1));
                    IsMacdSell_CrossBearish_M5          = (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) > iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)) && (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > 0) && (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 1) < iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1));
                    //
                    IsMacdBuy_CrossBulish_M15           = (iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)) && (iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < 0) && (iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 1) > iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1));
                    IsMacdSell_CrossBearish_M15          = (iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) > iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)) && (iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > 0) && (iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 1) < iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1));
                    IsMacdBuy_DownSide_m1  = (iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)) && (iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < 0);
                    IsMacdSell_UpSide_m1 = (iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) > iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)) && (iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > 0);
                    MacdBuy__m5  = (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) < iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)) && (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < 0);
                    MacdSell__m5 = (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0) > iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0)) && (iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > 0);
                    //-------------------------------------------------------------
                    e_MACD_STATE_M1  = GetMACD_State(PERIOD_M1);
                    e_MACD_STATE_M5  = GetMACD_State(PERIOD_M5);
                    e_MACD_STATE_M15 = GetMACD_State(PERIOD_M15);
                    e_MACD_STATE_M30 = GetMACD_State(PERIOD_M30);
                    e_MACD_STATE_H1  = GetMACD_State(PERIOD_H1);
                    e_MACD_STATE_H4  = GetMACD_State(PERIOD_H4);
                    e_MACD_STATE_D1  = GetMACD_State(PERIOD_D1);
                    e_MACD_STATE_W1  = GetMACD_State(PERIOD_W1);
                    e_MACD_STATE_MN1 = GetMACD_State(PERIOD_MN1); //
          } //

};
//+------------------------------------------------------------------+
