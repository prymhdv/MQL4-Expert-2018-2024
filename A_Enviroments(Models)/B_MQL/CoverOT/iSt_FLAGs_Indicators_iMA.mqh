//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
struct iSt_FLAGs_Indicators_iMA_Basic
{         bool Is_Basic;
          bool flag_2_Is_Basic_5_Above_3;

};
struct iSt_FLAGs_Indicators_iMA_Complex
{         bool Is_Basic;
          bool flag_2_Is_Complex_EMA_Close_Bulish;

};
struct iSt_FLAGs_Indicators_iMA_Super
{         bool Is_Basic;
          bool flag_2_IsSuper_ON_Buy__OFF_Sell_500_300;

};
struct iSt_FLAGs_Indicators_iMA_Macro
{         bool Is_Basic;

};
struct iSt_FLAGs_Indicators_iMA_Ultara
{         bool Is_Basic;

};

struct iSt_FLAGs_Indicators_iMA
{         bool Is_Basic;
//---
          iSt_FLAGs_Indicators_iMA_Basic    Basic;
          iSt_FLAGs_Indicators_iMA_Complex  Complex;
          iSt_FLAGs_Indicators_iMA_Super    Super;
          iSt_FLAGs_Indicators_iMA_Macro    Macro;
          iSt_FLAGs_Indicators_iMA_Ultara   Ultara;
          //
};
//+------------------------------------------------------------------+
