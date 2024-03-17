//+------------------------------------------------------------------+
//|                                                    C_SYMBOLS.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|          IMPLANTING CLASS  C_SYMBOLS BEGIN-END                   |
//+------------------------------------------------------------------+
class C_SYMBOLS_Pannel
{
//===============================================
          void       C_SYMBOLS_Pannel::C_SYMBOLS_Pannel() {if(false)Panel(true, false);}
          bool       C_SYMBOLS_Pannel::Panel(int WhichMode, bool IsKey); //



};


//+------------------------------------------------------------------+
//|                                                                  | Is_Create,Is_Move,
//+------------------------------------------------------------------+
bool C_SYMBOLS_Pannel::Panel(int WhichMode, bool IsKey)
{         //ObjectCreate(0, "ss", OBJ_RECTANGLE_LABEL, 0, 0, 0); ObjectSetInteger(0,"",OBJPROP_XDISTANCE,100);
//RLBL_.Create(Is_Create, Is_Move, "RLBL_Panel_Symbol-BG", "RLBL_Panel_Symbol-BG", (int)(100), (int)(100), 400 / 2, 200 / 2, CORNER_LEFT_UPPER, ANCHOR_LEFT, false, BORDER_FLAT, clrFireBrick, clrFireBrick, 0, STYLE_SOLID, 1, 8, "Arial");
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("RLBL_Panel_Symbol-BG");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    RectLabelX.GDS.Set_Color_2(clrFireBrick, clrFireBrick);
                    RectLabelX.GDS.Set_Location_5((int)(100), (int)(100), 400 / 2, 200 / 2, CORNER_LEFT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBL_Panel_Symbol-BG");
                    RectLabelX.Action(RectLabelX); //
          }
//RLBL_.Create(Is_Create, Is_Move, "RLBL_Panel_Symbol", "RLBL_Panel_Symbol", (int)(120), (int)(120), 360 / 2, 160 / 2, CORNER_LEFT_UPPER, ANCHOR_LEFT, false, BORDER_FLAT, clrWhite, clrWhite, 0, STYLE_SOLID, 1, 8, "Arial");
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("RLBL_Panel_Symbol");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    RectLabelX.GDS.Set_Color_2(clrWhite, clrWhite);
                    RectLabelX.GDS.Set_Location_5((int)(120), (int)(120), 360 / 2, 160 / 2, CORNER_LEFT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBL_Panel_Symbol");
                    RectLabelX.Action(RectLabelX); //
          }
//LBL_.Create(Is_Create, Is_Move,  "LBL_Panel_Symbol", "LBL_Panel_Symbol", (int)(250), (int)(110), CORNER_LEFT_UPPER, ANCHOR_LEFT, false, clrWhite, 0, 10, "Arial bold");     //
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LBL_Panel_Symbol", "LBL_Panel_Symbol", "Arial bold", 10);
                    LabelX.GDS.Set_Location_5( (int)(250), (int)(110), 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Color_1(clrWhite);
                    LabelX.GDS.Set_Common_6(false, 10, false, false, false, "LBL_Panel_Symbol");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
