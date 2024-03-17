//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\Cg_DevObjectPack.mqh>
class C_Login
{
public:
          C_Login(void) {};
          ~C_Login(void) {};



          void Activation()
          {         if(!Is_Login_Passed_Pass)
                    {         LoginDelete();
                              LoginCreate();//
                              Login_Passed_Date_Experied_365Day = D'01.06.2023';
                              Login_Passed_Date_Compile = __DATE__;  //
                    } //
                    if(TimeCurrent() > Login_Passed_Date_Experied_365Day) { Alert("08.06.2023 Out Of Day-  instagram: @FXTradingmasters"); ExpertRemove(); /*return(INIT_FAILED);*/ }//
          } //
          bool Timer()
          {         if(!Is_Login_Passed_Pass)
                    {         Is_Login_Passed_Pass =   Edit_LogIn.GDS.TEXT_B_01_inp == "123321";//
                              //--  Alert("not accessed    Edit_LogIn.GDS.TEXT_B_01:>", Edit_LogIn.GDS.TEXT_B_01, "<  -- Event.sparam == \"BTN_LogIn\": ", Event.sparam == "BTN_LogIn"); ////
                    }
                    if(!Is_Login_Passed_Pass) {/*Alert(" loop access");*/ return false;  }
                    else          {LoginDelete(); return true;}// Alert(" accessed"); }
                    //
                    return false;//
          }


//=============================================
          Cgs_DevObjectPack          Object_Pack;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<S_EDIT, CChartObjectEdit, Cg_TextsEdit>           Edit_LogIn;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>    BTN_LogIn;
          bool Is_Login_Passed_Pass;
          bool Is_Login_Passed_Date;
          datetime Login_Passed_Date_current;
          datetime Login_Passed_Date_RunFrist;
          datetime Login_Passed_Date_Compile;
          datetime Login_Passed_Date_Experied;
          datetime Login_Passed_Date_Experied_365Day;
          void LoginDelete()
          {         int x =  Dev_Chart_Window._Mql_.CHART_WIDTH_IN_PIXELS_int();//Dev_Chart_Window._Mql_.PropertyData.CHART_WIDTH_IN_PIXELS_int;
                    int y =  Dev_Chart_Window._Mql_.CHART_HEIGHT_IN_PIXELS_int();//Dev_Chart_Window._Mql_.PropertyData.CHART_HEIGHT_IN_PIXELS_int;  //--Alert("x:", x, "    y:", y); //
                    Object_Pack.Texts.RectLabel.Draw_GDS(MODE_CREATE, false, "RL.BackGrandAthurication", x, y, x, y, CORNER_LEFT_LOWER, clrBlack, clrBlack, STYLE_SOLID, 1, BORDER_FLAT, false);
                    Object_Pack.Texts.Label.Create_Solo(true, 0, "Log-IN FXTradingMasters", 0, x / 2, y / 2 + 100, CORNER_LEFT_LOWER, "FXTradingMasters", "Arial", 55, clrWhite, 0, ANCHOR_LEFT_LOWER);
                    Object_Pack.Texts.Label.Create_Solo(true, 0, "Log-IN Access",    0, x / 2, y / 2, CORNER_LEFT_LOWER, "Log-IN Access", "Arial", 33, clrWhite, 0, ANCHOR_LEFT_LOWER);
                    Object_Pack.Texts.Label.Create_Solo(true, 0, "Log-IN Pass: ",    0, x / 2, y / 2, CORNER_LEFT_LOWER, "Log-IN Pass: ", "Arial", 33, clrWhite, 0, ANCHOR_CENTER);
                    ////---Generic EDT_Symbol---//
                    {         Edit_LogIn.GDS.Set_Action_2(MODE_CREATE, false);
                              Edit_LogIn.GDS.Set_Desc_4("Edit_LogIn", _Symbol, "Trebuchet MS", 7);
                              Edit_LogIn.GDS.Set_Self_2(ALIGN_CENTER, readonlyDEF);
                              Edit_LogIn.GDS.Set_Location_5((int)(163.8) + XBoxOne, (int)(120) + YBoxOne,   PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT, CORNER_RIGHT_LOWER);
                              Edit_LogIn.GDS.Set_Color_3(clrWhite, clrWhite, clrWhite);
                              Edit_LogIn.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "Edit_LogIn");
                              Edit_LogIn.GDS.Set_Chart_6();
                              Edit_LogIn.Action(Edit_LogIn);//
                              //0// Edit_LogIn.Create(Is_Create, Is_Move, "EDT_Symbol", _Symbol,
                              //0// (int)(163.8) + XBoxOne, (int)(120) + YBoxOne,   PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, STYLE_SOLID, 1, C'240,240,240', clrBlack, clrBlack, 0, ALIGN_CENTER, 7, "Trebuchet MS");
                    }
                    ////---Generic BTN_Buy---//
                    {         BTN_LogIn.GDS.Set_Action_2(MODE_CREATE, false /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              BTN_LogIn.GDS.Set_Desc_4("BTN_LogIn", "LogIn", "Tahoma", 8);
                              BTN_LogIn.GDS.Set_Self_1(ButtonDEF_state);
                              BTN_LogIn.GDS.Set_Location_5((int)(2 * PANEL_BUTTON_GAP_X + 2 * PANEL_BUTTON_WIDTH + 104) + XBoxOne, (int)( 100.8) + YBoxOne, (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1), CORNER_RIGHT_LOWER);
                              BTN_LogIn.GDS.Set_Color_3(C'160,192,255', C'144,176,239', C'59,41,40');
                              BTN_LogIn.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "BTN_Buy");
                              BTN_LogIn.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                              BTN_LogIn.Action(BTN_LogIn);//
                              //0// BTN_LogIn.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_Buy", "Buy",
                              //0// (int)(2 * PANEL_BUTTON_GAP_X + 2 * PANEL_BUTTON_WIDTH + 104) + XBoxOne, (int)( 100.8) + YBoxOne, (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1),
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, C'160,192,255', C'144,176,239', C'59,41,40', 0, 8, "Tahoma");
                    } //
          }
          void LoginCreate ()
          {         int x =   Dev_Chart_Window._Mql_.CHART_WIDTH_IN_PIXELS_int();//Dev_Chart_Window._Mql_.PropertyData.CHART_WIDTH_IN_PIXELS_int;
                    int y =   Dev_Chart_Window._Mql_.CHART_HEIGHT_IN_PIXELS_int();//Dev_Chart_Window._Mql_.PropertyData.CHART_HEIGHT_IN_PIXELS_int;
                    //---Alert("x:", x, "    y:", y); //
                    Object_Pack.Texts.RectLabel.Draw_GDS(MODE_CREATE, true, "RL.BackGrandAthurication", x, y, x, y, CORNER_LEFT_LOWER, clrBlack, clrBlack, STYLE_SOLID, 1, BORDER_FLAT, false);
                    Object_Pack.Texts.Label.Create_Solo(false, 0, "Log-IN FXTradingMasters", 0, x / 2, y / 2 + 200, CORNER_LEFT_LOWER, "FXTradingMasters", "Arial", 55, clrNavy, 0, ANCHOR_CENTER);
                    Object_Pack.Texts.Label.Create_Solo(false, 0, "Log-IN Access",    0, x / 2, y / 2 + 100, CORNER_LEFT_LOWER, "Log-IN Access", "Arial", 33, clrWhite, 0, ANCHOR_CENTER);
                    Object_Pack.Texts.Label.Create_Solo(false, 0, "Log-IN Pass: ",    0, x / 2 - 100, y / 2 - 40, CORNER_LEFT_LOWER, " Pass: ", "Arial", 33, clrWhite, 0, ANCHOR_CENTER);
                    ////---Generic EDT_Symbol---//
                    {         Edit_LogIn.GDS.Set_Action_2(MODE_CREATE, true);
                              Edit_LogIn.GDS.Set_Desc_4("Edit_LogIn", "...", "Trebuchet MS", 50);
                              Edit_LogIn.GDS.Set_Self_2(ALIGN_CENTER, readonlyDEF);
                              Edit_LogIn.GDS.Set_Location_5(x / 3 + x / 5, y / 2,   300, 80, CORNER_LEFT_LOWER);
                              Edit_LogIn.GDS.Set_Color_3(clrWhite, clrBlack, clrWhite);
                              Edit_LogIn.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "Edit_LogIn");
                              Edit_LogIn.GDS.Set_Chart_6();
                              Edit_LogIn.Action(Edit_LogIn);//
                              //0// Edit_LogIn.Create(Is_Create, Is_Move, "EDT_Symbol", _Symbol,
                              //0// (int)(163.8) + XBoxOne, (int)(120) + YBoxOne,   PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, STYLE_SOLID, 1, C'240,240,240', clrBlack, clrBlack, 0, ALIGN_CENTER, 7, "Trebuchet MS");
                    }
                    ////---Generic BTN_Buy---//
                    {         BTN_LogIn.GDS.Set_Action_2(MODE_CREATE, true /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              BTN_LogIn.GDS.Set_Desc_4("BTN_LogIn", "LogIn", "Tahoma", 8);
                              BTN_LogIn.GDS.Set_Self_1(ButtonDEF_state);
                              BTN_LogIn.GDS.Set_Location_5(x / 3 + x / 5,  y / 2 - y / 5, 300, 80, CORNER_LEFT_LOWER);
                              BTN_LogIn.GDS.Set_Color_3(C'160,192,255', C'144,176,239', C'59,41,40');
                              BTN_LogIn.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "BTN_Buy");
                              BTN_LogIn.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                              BTN_LogIn.Action(BTN_LogIn);//
                              //0// BTN_LogIn.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_Buy", "Buy",
                              //0// (int)(2 * PANEL_BUTTON_GAP_X + 2 * PANEL_BUTTON_WIDTH + 104) + XBoxOne, (int)( 100.8) + YBoxOne, (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1),
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, C'160,192,255', C'144,176,239', C'59,41,40', 0, 8, "Tahoma");
                    }//
          }
          void Login_Event()
          {         //--if(Event.sparam ==  Edit_LogIn.GDS.NAME_A_01 )
                    {         //
                              Edit_LogIn.GDS.TEXT_B_01_inp = ObjectGetString(0,  Edit_LogIn.GDS.NAME_A_01, OBJPROP_TEXT, 0); //
                              //Edit_LogIn.GDS.TEXT_B_01 = "*******";
                              ObjectSetString(0,  Edit_LogIn.GDS.NAME_A_01, OBJPROP_TEXT, "*******"); //
                    }; //
          }//



};
//+------------------------------------------------------------------+
