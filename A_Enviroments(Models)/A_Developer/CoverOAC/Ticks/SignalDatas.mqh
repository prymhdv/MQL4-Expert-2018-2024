//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

//====================================================================================================================================
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_MACD.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_MovingAvrages.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_Stochastic.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_RVI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_RSI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_CCI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_Bollingrad_band.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_ADX.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_MFI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_OVB.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_WPR.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_ATR.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_AWS.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_Force.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_Ichmiko.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_SAR.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_AD.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_AliGator.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_STD.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_BWMFI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_TrendLineBoxFractal.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_STD.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_TL_0_50_50_100_HL.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_TL_500_HL.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_FE.mqh>

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_HL_50_100_150.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_STD_Channel.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_TrendLineHiLo.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas_TrendLineAuto.mqh>
//====================================================================================================================================
SignalDatas_MovingAvrages             _MovingAvrages;
SignalDatas_MACD                      _MACD;
SignalDatas_RSI                       _RSI;
SignalDatas_CCI                       _CCI;
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
SignalDatas_TrendLine                 _TrendLine;
SignalDatas_TrendLineAuto             _TrendLineAuto;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
