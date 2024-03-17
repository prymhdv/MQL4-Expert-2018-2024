//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iEt_ENUMs_.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iSt_FLAGs_ChartAnalise_Channel.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iSt_FLAGs_Indicators_MACD.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iSt_FLAGs_Indicators_iMA.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iSt_FLAGs_Indicators_WPR.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iSt_FLAGs_CandleBars_Movment.mqh>
//---------------------------------------------------------------------------------------
struct iSt_FLAGs_Basic
{         bool          Is_Basic;
          BoolWight     Is_Basic_BoolWight; };
struct iSt_FLAGs_Complex
{         bool Is_Basic;
          BoolWight     Is_Basic_BoolWight;

};
struct iSt_FLAGs_Super
{         bool Is_Basic;
          BoolWight     Is_Basic_BoolWight;

};
struct iSt_FLAGs_Macro
{         bool Is_Basic;
          BoolWight     Is_Basic_BoolWight;


};
struct iSt_FLAGs_Ultara
{         bool Is_Basic;
          BoolWight     Is_Basic_BoolWight;

};
//-----------------------------------------------------------------------------------------
struct St_FLAGs
{
          //-----------------------------------------------------------------
          //-----------------------------------------------------------------
          iSt_FLAGs_CandleBars_Movment          CandleBars_Movment;
          iSt_FLAGs_ChartAnalise_Channel        ChartAnalise_Channel;
          iSt_FLAGs_Indicators_MACD             Indicators_MACD;
          iSt_FLAGs_Indicators_iMA              Indicators_iMA;
          iSt_FLAGs_Indicators_WPR              Indicators_WPR;
          //------------------------
          iSt_FLAGs_Basic               Basic;//---FLAGs_Basic
          iSt_FLAGs_Complex             Complex;
          iSt_FLAGs_Super               Super;
          iSt_FLAGs_Macro               Macro;
          iSt_FLAGs_Ultara              Ultara;
          //------------------------
          //---------------------------------------------------------------------------
          struct innerSt_FLAGs_Channel
          {         void innerSt_FLAGs_Channel() {};
                    int innerSt_FLAGs_Channel_int;
                    // Data.FLAGs.iSt_FLAGs_Channel innerSt_FLAGs_Channel  ; //--wrong
                    //--innerSt_FLAGs_Channel  innerSt_FLAGs_Channel_int  ; //--detected
                    //---innerSt_FLAGs_Channel.innerSt_FLAGs_Channel_int=0  //--work
                    //--muts beforte declared to detect

          };
          //---------------------------------------------------------------------------
};
//+------------------------------------------------------------------+
