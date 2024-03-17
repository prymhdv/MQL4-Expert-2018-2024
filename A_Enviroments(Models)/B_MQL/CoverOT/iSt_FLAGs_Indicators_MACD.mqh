//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
struct iSt_FLAGs_Indicators_MACD_Basic
{         bool Is_Basic;
          E_SM_Possition        flag_4_SM_Possition_Current ;
          bool flag_2_Is_Basic_CrossUp_Signal_;
          bool flag_2_Is_Basic_CrossDown_Signal_;
          //
};
struct iSt_FLAGs_Indicators_MACD_Complex
{         bool Is_Basic;

};
struct iSt_FLAGs_Indicators_MACD_Super
{         bool Is_Basic;


};
struct iSt_FLAGs_Indicators_MACD_Macro
{         bool Is_Basic;

};
struct iSt_FLAGs_Indicators_MACD_Ultara
{         bool Is_Basic;

};
struct iSt_FLAGs_Indicators_MACD
{         bool Is_Basic;
          //---
          iSt_FLAGs_Indicators_MACD_Basic    Basic;
          iSt_FLAGs_Indicators_MACD_Complex  Complex;
          iSt_FLAGs_Indicators_MACD_Super    Super;
          iSt_FLAGs_Indicators_MACD_Macro    Macro;
          iSt_FLAGs_Indicators_MACD_Ultara   Ultra;
          //
};
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
