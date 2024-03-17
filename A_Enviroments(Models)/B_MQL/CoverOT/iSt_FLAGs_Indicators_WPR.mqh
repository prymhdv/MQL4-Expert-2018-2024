//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
struct iSt_FLAGs_Indicators_WPR_Basic
{         bool Is_Basic;
          bool flag_2_Is_Basic__Bulish_MovingAvrage_iWPR_200;


};
struct iSt_FLAGs_Indicators_WPR_Complex
{         bool Is_Basic;
          bool flag_2_Is_Complex__WPR_Buy_Support ;
          bool flag_2_Is_Complex__WPR_Sell_Support ;

};
struct iSt_FLAGs_Indicators_WPR_Super
{         bool Is_Basic;


};
struct iSt_FLAGs_Indicators_WPR_Macro
{         bool Is_Basic;

};
struct iSt_FLAGs_Indicators_WPR_Ultara
{         bool Is_Basic;

};
struct iSt_FLAGs_Indicators_WPR
{         bool Is_Basic;
//---
          iSt_FLAGs_Indicators_WPR_Basic   Basic;
          iSt_FLAGs_Indicators_WPR_Complex Complex;
          iSt_FLAGs_Indicators_WPR_Super   Super;
          iSt_FLAGs_Indicators_WPR_Macro   Macro;
          iSt_FLAGs_Indicators_WPR_Ultara  Ultra;
          //
};
//+------------------------------------------------------------------+
