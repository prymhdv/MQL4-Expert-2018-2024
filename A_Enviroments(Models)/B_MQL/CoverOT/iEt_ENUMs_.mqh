//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum E_Signals_Type   //----Alternative (Gozine) (Sechenek)
{         ES_VOID = 0,         //-- _ENUM_Signal_VOID
          //
          ES_NEUTRAL,           //-- _ENUM_Signal_NEUTRAL
          ES_BUY,               //-- _ENUM_Signal_BUY
          ES_SELL //            //-- _ENUM_Signal_SELL
          //---- 
}; 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum E_Points_Power
{         E_Points_Power_ON,
          E_Points_Power_OFF,
          E_Points_Power_VOID //
};
enum E_SM_Possition
{         E_SMP_Void,
          E_SMP_Buy_Supportive,
          E_SMP_Buy_Resistancive,
          E_SMP_Sell_Supportive,
          E_SMP_Sell_Resistancive };
enum E_Direction
{         E_Direction_Void,
          E_Direction_Side,
          E_Direction_UpWard,
          E_Direction_DownWard //
};
enum E_Trend_Keep
{         E_Keep_Void,
          E_Keep_Up,
          E_Keep_Down,
          E_Keep_Side,//
          E_Keep_Up_Fast,
          E_Keep_Down_Fast,
          E_Keep_Side_Fast,//
          E_Keep_Up_Slow,
          E_Keep_Down_Slow,
          E_Keep_Side_Slow//
};
enum E_BreakOut_Type
{         E_BreakOut_Void,
          E_BreakOut_Up,
          E_BreakOut_Down

};
enum E_Place_Thirden
{         E_Place_Thirden_Void,

          E_Place_Thirden_Upper,
          E_Place_Thirden_Middle,
          E_Place_Thirden_Lower
          //
};
enum E_Place_Ninth
{         E_Place_Ninth_Void,

          E_Place_Ninth_Upper_Upper,
          E_Place_Ninth_Upper_Middle,
          E_Place_Ninth_Upper_Lower,

          E_Place_Ninth_Middle_Upper,
          E_Place_Ninth_Middle_Middle,
          E_Place_Ninth_Middle_Lower,

          E_Place_Ninth_Lower_Upper,
          E_Place_Ninth_Lower_Middle,
          E_Place_Ninth_Lower_Lower
          //
};

enum E_MCDB0IT_Type
{         E_MCDB0IT_Void,
          E_MCDB0IT_Up,
          E_MCDB0IT_Down //
};
enum E_IOSMCDB0_Type
{         E_IOSMCDB0_Void,
          E_IOSMCDB0_Up,
          E_IOSMCDB0_Down //
};

enum E_OFFER_Type
{         E_OFFER_VOID,
          E_OFFER_BUY,
          E_OFFER_SELL //
};

//+------------------------------------------------------------------+
