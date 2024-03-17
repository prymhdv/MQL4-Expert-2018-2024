//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
struct iSt_FLAGs_CandleBars_Movment_Basic
{         bool Is_Basic;
           E_TL_Movment          flag_4_E_Bar_TL_Movment;
           E_TL_Movment          flag_8_E_Bar_TL_Movment_0_5_10_15;
};
struct iSt_FLAGs_CandleBars_Movment_Complex
{         bool Is_Basic;
          

};
struct iSt_FLAGs_CandleBars_Movment_Super
{         bool Is_Basic;


};
struct iSt_FLAGs_CandleBars_Movment_Macro
{         bool Is_Basic;

};
struct iSt_FLAGs_CandleBars_Movment_Ultara
{         bool Is_Basic;

};
struct iSt_FLAGs_CandleBars_Movment
{         bool Is_Basic; 
//---
          iSt_FLAGs_CandleBars_Movment_Basic    Basic;
          iSt_FLAGs_CandleBars_Movment_Complex  Complex;
          iSt_FLAGs_CandleBars_Movment_Super    Super;
          iSt_FLAGs_CandleBars_Movment_Macro    Macro;
          iSt_FLAGs_CandleBars_Movment_Ultara   Ultara;
          //
};
//+------------------------------------------------------------------+
