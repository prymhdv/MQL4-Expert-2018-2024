//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
struct iSt_FLAGs_ChartAnalise_Channel_Basic
{         bool Is_Basic;
          bool                  flag_2_Is_InsideChannel;
          bool                  flag_2_Is_Bullish;
          E_Place_Thirden       flag_3_Place_Thirden;
          E_Direction           flag_3_Direction;
          E_MCDB0IT_Type        flag_3_MCDB0IT;
          bool                  flag_2_Is_Over_Up_Buy;
          bool                  flag_2_Is_Over_Down_Sell;
          bool                  flag_2_Is_Range_Accepted_Buy_long;
          bool                  flag_2_Is_Under_Middle;
          E_Wave_Type           flag_2_Is_Wave5_WTB__Current;
          E_Wave_Type           flag_8_Is_Complx_Wave5_WTA__Current;
          E_IOSMCDB0_Type       flag_3_IOSMCDB0;
          //---
          bool                  flag_2_Is_Basic__Trend_Keep_TL_2_4_TL_1_3___Keep_Up;
          bool                  flag_2_Is_Basic__Trend_Keep_TL_2_4_TL_1_3__Keep_Down;
          //---
          bool                  flag_2_Is_Basic__W4_Under_W2;
          bool                  flag_2_Is_Basic__W5_Above_W3;
          bool                  flag_2_Is_Basic__Before_Wave_Passed;
          bool                  flag_2_Is_Basic__Is_Range_Accepted_Buy_long      ;// = false;
          bool                  flag_2_Is_Basic__Is_Under_Middle                 ;// = false;

};
struct iSt_FLAGs_ChartAnalise_Channel_Complex
{         bool                  Is_Complex;
          bool                  flag_2_Is_Complex__Maximum_Correction_Under_Correction_50;
          bool                  flag_2_Is_Complex__Allow;
          //---
          double                dbl_Complex_Range_Channel_half_thirs_Up;
          double                dbl_Complex_Traget_Up_middle_channel_Price;
          //
          double                dbl_Complex_Range_Channel_half_thirs_Down;
          double                dbl_Complex_Traget_Down_middle_channel_Price;//
};
struct iSt_FLAGs_ChartAnalise_Channel_Super
{         bool                  Is_Super;
          bool                  flag_2_Is_Super__Buy_Condition          ;// = false;
          bool                  flag_2_Is_Super__Sell_Condition         ;// = false;
          //--------------------------------------------------------------------------
          bool                  flag_2_Is_Super__Result_Coming_Down_Wave_Sell ;// = false;//                = Is_W4_Under_W2    && Is_Before_Wave_Passed && Is_Maximum_Correction_Under_Correction_50   && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._Current.Is_SM_0_Sell_Supportive; //--- && Is_Place_Thirden__E_Lower_Thirden
          bool                  flag_2_Is_Super__Result_Coming_Down_Wave_Buy  ;// = false;//                = Is_W4_Under_W2    && Is_Before_Wave_Passed && Is_Maximum_Correction_Under_Correction_50   && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._Current.Is_SM_0_Sell_Resistancive; //--- && Is_Place_Thirden__E_Lower_Thirden
          bool                  flag_2_Is_Super__Result_Coming_Up_Wave_Buy    ;// = false;//                = Is_W4_Under_W2    && Is_Before_Wave_Passed && Is_W5_Above_W3                              && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._Current.Is_SM_0_Buy_Supportive;
          bool                  flag_2_Is_Super__Result_Coming_Up_Wave_Sell   ;// = false;//                = Is_W4_Under_W2    && Is_Before_Wave_Passed && Is_W5_Above_W3                              && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._Current.Is_SM_0_Buy_Resistancive;
          //---------------------------------------------------------------------------

};
struct iSt_FLAGs_ChartAnalise_Channel_Macro
{         bool                                                          Is_Macro;
          Sg_Line_Prop_Condition Line_Prop_Condition_W5_High_,          Line_Prop_Condition_W5_Low_;
          Sg_Line_Prop_Condition Line_Prop_Condition_W5_Bar0_High_,     Line_Prop_Condition_W5_Bar0_Low_;

};
struct iSt_FLAGs_ChartAnalise_Channel_Ultra
{         bool Is_Ultra;

};

struct iSt_FLAGs_ChartAnalise_Channel
{         //---
          iSt_FLAGs_ChartAnalise_Channel_Basic   Basic;
          iSt_FLAGs_ChartAnalise_Channel_Complex Complex;
          iSt_FLAGs_ChartAnalise_Channel_Super   Super;
          iSt_FLAGs_ChartAnalise_Channel_Macro   Macro;
          iSt_FLAGs_ChartAnalise_Channel_Ultra  FLAGs_ChartAnalise_Channel_Ultra;
          //
};
//+------------------------------------------------------------------+
