//+------------------------------------------------------------------+
//||   ||||||||||                 C_FLOWPANEL.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
//+------------------------------------------------------------------+, public C_TOOLS
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
//class NotAbsTotal : public AbsInit, public AbsWork {
//A derived class, in which private member cannot be modified  by protected access (public | protected | private)
///cant use base class obj///caused naming obj undefine..
//>>>>>>if drived from C_TOOLS can access its members/// directly//public C_TOOLS we use it... C_COMPLEXTOOLS//no used any item..//

//C_TOOLS cant keep varibels value because derived class to far.in momory.......use complex  not work..again....///child cant access thirl level..C_COMPLEXTOOLS
//C_TOOLS has drived claas that chane fathers obj addreess.. must be defused,,,
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_FLOWPANEL// : public C_COMPLEXTOOLS//??Use Pool COMPLEXTOOLS//  ///C_TOOLS///can accessing fathers log.//^^^^^^^^ERORRING?? "Access violation reading location 0x0000000c"// depend to obj name of class..//cant access father func//with out obj any.. on class name///fore the buttons
{         /// firend class//not defined in mql
          /* //WHY RIGHT MWNU WORK? BEACUSE OF SPARAM BY DIRECT NAME, CALING. */
public:
          //--Constructors
          void           C_FLOWPANEL();
          void           ~C_FLOWPANEL() {  }; //
          bool           Update();
          //--States
          bool           IsMove ;// = false; ///Smart class..// Educated///
          bool           IsRest ;// = false; ///Smart class..// Educated///
          //-------------------------------------
          Sg_Position2D  independ2D, independ2D_CandlBox;
          //-------------------------------------
          bool           CALL(int WhichMode, bool IsKey,  Sg_Position2D & Position2D);

          bool           FlowPanelToolsBox(int WhichMode, bool IsKey, Sg_Position2D & Position2D);
          void           ResetPadPos();//
          void           KeyPad_AutoCharter(int WhichMode, bool IsKey, bool KeyClear, Sg_Position2D & Position2D, color BackColorZ = clrCadetBlue, color BorderColorZ = clrDarkGray, color DescColorZ = clrWhite); ///'DescColorZ' - redefinition of default parameter
          //--Tests
          string        C_FLOWPANELPublic()
          {         //
                    //C_TOOLSPrivate();   ///error // 'C_TOOLS::C_TOOLSPrivate' - cannot access private member function FlowPanel.mqh       38        21
                    //C_TOOLSProtected();// //defusing drived //'C_TOOLSProtected' - function not defined     FlowPanel.mqh       40        21
                    //C_TOOLSPublic();//    //defusing drived
                    //
                    //
                    return "--";//
          }
          Cgs_DevObjectPack          Object_Pack;//

};

////=============================================
//C_TOOLS C_FLOWPANEL::gFlow_Pad.BTN_Mover = NULL;
////=============================================
//C_TOOLS C_FLOWPANEL::gFlow_Pad.BTN_AddChart = NULL;

//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_FLOWPANEL::C_FLOWPANEL()
{         if(IsTesting()) return;//
///==================
          BtnColors_FlowPanel.Set_(clrBeige, C'144,176,239', clrBlack, clrGold, clrRed, clrRed);
          BtnColors_FlowPanelB.Set_(clrLavender, clrDarkCyan, clrDarkCyan, clrDarkCyan, clrLavender, clrLavender);
///==================
//===================
          {         int Long_chart_Max    = Dev_Chart_Window._Mql_.CHART_WIDTH_IN_PIXELS_int(); //==900
                    int hight_chart_Max   = Dev_Chart_Window._Mql_.CHART_HEIGHT_IN_PIXELS_int() ;
                    //---
                    Sg_Position2D RightUP, RightDown, LetfUp, LetfDown;
                    RightUP.x   = -Long_chart_Max / 2 - 300 + Long_chart_Max - 340;         RightUP.y  =  20; //hight_chart_Max / 25; //--700
                    RightDown.x = -Long_chart_Max / 2 - 300 + Long_chart_Max - 360;         RightDown.y =  hight_chart_Max - 200; //--700
                    //--
                    LetfUp.x    = -Long_chart_Max / 2 - 300 ;                               LetfUp.y    =  20; //hight_chart_Max / 25 ; //--700
                    LetfDown.x  = -Long_chart_Max / 2 - 400;                                LetfDown.y =  hight_chart_Max - 200 - 150; //--- panel high
                    //----
                    CALL(MODE_CREATE, true, RightDown); //////Solutin...if any object of UNdefined (declared) caling then the object created are loose there name...
                    //  Alert("CALL");//
          }
//===================SYMBOL_TIME//SYMBOL_DIGITS//SYMBOL_CURRENCY_BASE//SUNDAY
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_FLOWPANEL::KeyPad_AutoCharter(int WhichMode, bool IsKey, bool KeyClear, Sg_Position2D & Position2D, color BackColorZ = clrCadetBlue, color BorderColorZ = clrDarkGray, color DescColorZ = clrWhite)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //resetKeys();////stille off from main panel...can delete create againd,,
          if(KeyClear && true)
          {         //======================================//
                    AutoCharter.Fibos.Arc.GAC.Delete();
                    AutoCharter.Fibos.Channel.GAC.Delete();
                    AutoCharter.Fibos.Expansion.GAC.Delete();
                    AutoCharter.Fibos.Fan.GAC.Delete();
                    AutoCharter.Fibos.TimeZone.GAC.Delete();
                    AutoCharter.Fibos.Retracement.GAC.Delete();
                    //
                    AutoCharter.Texts.RectLabel.GAC.Delete();   ///-- NUll obj
                    AutoCharter.Texts.Edit.GAC.Delete();
                    AutoCharter.Texts.Description.GAC.Delete();
                    //
                    AutoCharter.Channels.StandardDeviation.GAC.Delete(); //
                    AutoCharter.Channels.Equidistant.GAC.Delete();
                    AutoCharter.Channels.Regression.GAC.Delete();
                    AutoCharter.Channels.Pitchfork.GAC.Delete();
                    //--------------------------------------------------------
                    AutoCharter.Lines.Horizontal.GAC.Delete();
                    AutoCharter.Lines.Vertical.GAC.Delete();
                    AutoCharter.Lines.Trend.GAC.Delete();
                    AutoCharter.Lines.TrendByAngle.GAC.Delete();
                    AutoCharter.Lines.Cycles.GAC.Delete();
                    //--------------------------------------------------------
          }//
          if(WhichMode == MODE_CREATE && IsKey)       {independ2D.x = 0  ; independ2D.y = 0; } ////fixe restart where
          if(WhichMode == MODE_MOVE   && IsKey)       {gFlow_Pad.IsMove_AutoCharter = IsKey;} //  260,160
          int XSize = 70, YSize = 15;   int i = 1;  int j = 1;
          int XCordinate = (int)(286); //+ XSize * i++;//(int)(575.9),
          int YCordinate = (int)(176) + YSize * i++; //(int)(88)
          ENUM_BASE_CORNER Corner = CORNER_LEFT_UPPER;
          ENUM_ANCHOR_POINT Anchor = ANCHOR_CENTER;
          bool Backgrand = false; //
          int SolidX = 0;
          int SolidY =  0;
          //============================================================================================
          ///[Pad] line 166 ///
          ///--- gAutoCharter_Pad.RLBL_Pad_AutoCharter---///
          {         gAutoCharter_Pad.RLBL_Pad_AutoCharter.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.RLBL_Pad_AutoCharter.GDS.Set_Desc_1("gAutoCharter_Pad.RLBL_Pad_AutoCharter");
                    gAutoCharter_Pad.RLBL_Pad_AutoCharter.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    gAutoCharter_Pad.RLBL_Pad_AutoCharter.GDS.Set_Color_2(clrDarkCyan, clrNONE);
                    gAutoCharter_Pad.RLBL_Pad_AutoCharter.GDS.Set_Location_5(XCordinate - 80 + FixPadChartToolsX, YCordinate + 25 + FixPadChartToolsY,   230,   115, Corner);
                    gAutoCharter_Pad.RLBL_Pad_AutoCharter.GDS.Set_Chart_6();
                    gAutoCharter_Pad.RLBL_Pad_AutoCharter.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "gAutoCharter_Pad.RLBL_Pad_AutoCharter");
                    gAutoCharter_Pad.RLBL_Pad_AutoCharter.Action(gAutoCharter_Pad.RLBL_Pad_AutoCharter);//
                    //0//gAutoCharter_Pad.RLBL_Pad_AutoCharter.Create(Is_Create, Is_Move, "RLBL_Pad_AutoCharter",  " ",
                    //0// XCordinate - 80 + FixPadChartToolsX, YCordinate + 25 + FixPadChartToolsY,   230,   115,
                    //0//Corner, Anchor, Backgrand, BORDER_FLAT, clrDarkCyan, clrNONE,  0, STYLE_SOLID, 1, 7, "Arial" );
          }//
          ////--- gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove ---//
          {         gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Desc_4("gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove", "n", "Webdings", 14);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Color_1(clrWhite);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Location_5(XCordinate - 40 + FixPadChartToolsX, YCordinate + YSize  + 100 + FixPadChartToolsY, 0, Corner, Anchor);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove");
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Chart_6();
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove.Action(gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove);//
                    //0//gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove.Create(Is_Create,  Is_Move, "gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove", "n",
                    //0// XCordinate - 40 + FixPadChartToolsX, YCordinate + YSize  + 100 + FixPadChartToolsY, Corner, Anchor, Backgrand, clrWhite, 0, 14, "Webdings");
          }
          ////--- gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear ---//
          {         gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear.GDS.Set_Desc_4("gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear", "q", "Webdings", 14);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear.GDS.Set_Color_1(clrWhite);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear.GDS.Set_Location_5(XCordinate - 18 + FixPadChartToolsX, YCordinate + YSize  + 100 + FixPadChartToolsY, 0, Corner, Anchor);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear");
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear.GDS.Set_Chart_6();
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear.Action(gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear);//
                    //0//gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear.Create(Is_Create,  Is_Move, "gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear", "q",
                    //0// XCordinate - 18 + FixPadChartToolsX, YCordinate + YSize  + 100 + FixPadChartToolsY, Corner, Anchor, Backgrand, clrWhite, 0, 14, "Webdings");
          }
          ////--- gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit ---//
          {         gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit.GDS.Set_Desc_4("gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit", "r", "Webdings", 14);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit.GDS.Set_Color_1(clrWhite);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit.GDS.Set_Location_5(XCordinate - 60 + FixPadChartToolsX, YCordinate + YSize  + 100 + FixPadChartToolsY, 0, Corner, Anchor);
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit");
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit.GDS.Set_Chart_6();
                    gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit.Action(gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit);//
                    //0//gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit.Create(Is_Create,  Is_Move, "gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit", "r",
                    //0// XCordinate - 60 + FixPadChartToolsX, YCordinate + YSize  + 100 + FixPadChartToolsY,
                    //0//Corner, Anchor, Backgrand, clrWhite, 0, 14, "Webdings");
          }
          ///[onPad] line 213 ///
          ////--- gAutoCharter_Pad.BTN_EditX  --- Column one ---//
          {         gAutoCharter_Pad.BTN_EditX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_EditX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_EditX", "UseEdit", "Arial", 7);
                    gAutoCharter_Pad.BTN_EditX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_EditX.GDS.Set_Location_5(XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) + 60 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_EditX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_EditX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_EditX");
                    gAutoCharter_Pad.BTN_EditX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_EditX.Action(gAutoCharter_Pad.BTN_EditX);//
                    //0//gAutoCharter_Pad.BTN_EditX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyEdit", "UseEdit",
                    //0// XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) + 60 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          }
          ////--- gAutoCharter_Pad.BTN_RectLabelX  --- Column one ---//
          {         gAutoCharter_Pad.BTN_RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_RectLabelX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_RectLabelX", "RectLabel", "Arial", 7);
                    gAutoCharter_Pad.BTN_RectLabelX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_RectLabelX.GDS.Set_Location_5(XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) + 60 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_RectLabelX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_RectLabelX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_RectLabelX");
                    gAutoCharter_Pad.BTN_RectLabelX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_RectLabelX.Action(gAutoCharter_Pad.BTN_RectLabelX);//
                    //0//gAutoCharter_Pad.BTN_RectLabelX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyRectLabel", "RectLabel",
                    //0// XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) + 60 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          }
          ////--- gAutoCharter_Pad.BTN_TextX  --- Column one ---//
          {         gAutoCharter_Pad.BTN_TextX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_TextX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_TextX", "Text", "Arial", 7);
                    gAutoCharter_Pad.BTN_TextX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_TextX.GDS.Set_Location_5(XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) + 60 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_TextX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_TextX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_TextX");
                    gAutoCharter_Pad.BTN_TextX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_TextX.Action(gAutoCharter_Pad.BTN_TextX);//
                    //0//gAutoCharter_Pad.BTN_TextX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyText", "Text",
                    //0// XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) + 60 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          } i++;
          ////--- gAutoCharter_Pad.BTN_ChannelX  --- Column two ---//
          {         gAutoCharter_Pad.BTN_ChannelX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_ChannelX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_ChannelX", "Channel", "Arial", 7);
                    gAutoCharter_Pad.BTN_ChannelX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_ChannelX.GDS.Set_Location_5(XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) - 60 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_ChannelX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_ChannelX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_ChannelX");
                    gAutoCharter_Pad.BTN_ChannelX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_ChannelX.Action(gAutoCharter_Pad.BTN_ChannelX);//
                    //0//gAutoCharter_Pad.BTN_ChannelX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyChannel", "Channel",
                    //0// XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) - 60 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          }
          ////--- gAutoCharter_Pad.BTN_StdDevChannelX  --- Column two ---//
          {         gAutoCharter_Pad.BTN_StdDevChannelX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_StdDevChannelX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_StdDevChannelX", "StdDevChannel", "Arial", 7);
                    gAutoCharter_Pad.BTN_StdDevChannelX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_StdDevChannelX.GDS.Set_Location_5(XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) - 60 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_StdDevChannelX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_StdDevChannelX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_StdDevChannelX");
                    gAutoCharter_Pad.BTN_StdDevChannelX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_StdDevChannelX.Action(gAutoCharter_Pad.BTN_StdDevChannelX);//
                    //0//gAutoCharter_Pad.BTN_StdDevChannelX.Create( Is_Create,  Is_Move, __FUNCSIG__, "IsStdDevChannel", "StdDevChannel",
                    //0// XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) - 60 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          }
          ////--- gAutoCharter_Pad.BTN_RegressionX  --- Column two ---//
          {         gAutoCharter_Pad.BTN_RegressionX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_RegressionX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_RegressionX", "Regression", "Arial", 7);
                    gAutoCharter_Pad.BTN_RegressionX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_RegressionX.GDS.Set_Location_5(XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) - 60 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_RegressionX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_RegressionX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_RegressionX");
                    gAutoCharter_Pad.BTN_RegressionX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_RegressionX.Action(gAutoCharter_Pad.BTN_RegressionX);//
                    //0//gAutoCharter_Pad.BTN_RegressionX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyRegression", "Regression",
                    //0// XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) - 60 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          }
          ////--- gAutoCharter_Pad.BTN_PitchforkX  --- Column two//
          {         gAutoCharter_Pad.BTN_PitchforkX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_PitchforkX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_PitchforkX", "Pitchfork", "Arial", 7);
                    gAutoCharter_Pad.BTN_PitchforkX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_PitchforkX.GDS.Set_Location_5(XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) - 60 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_PitchforkX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_PitchforkX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_PitchforkX");
                    gAutoCharter_Pad.BTN_PitchforkX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_PitchforkX.Action(gAutoCharter_Pad.BTN_PitchforkX);//
                    //0//gAutoCharter_Pad.BTN_PitchforkX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyPitchfork", "Pitchfork",
                    //0// XCordinate + FixPadChartToolsX, (YCordinate + YSize * i++) - 60 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          } i++;
          ////--- gAutoCharter_Pad.BTN_TrendAngleX  --- Column three//
          {         gAutoCharter_Pad.BTN_TrendAngleX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_TrendAngleX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_TrendAngleX", "TrendAngle", "Arial", 7);
                    gAutoCharter_Pad.BTN_TrendAngleX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_TrendAngleX.GDS.Set_Location_5(XCordinate - 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 135 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_TrendAngleX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_TrendAngleX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_TrendAngleX");
                    gAutoCharter_Pad.BTN_TrendAngleX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_TrendAngleX.Action(gAutoCharter_Pad.BTN_TrendAngleX);//
                    //0//gAutoCharter_Pad.BTN_TrendAngleX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyTrendAngle", "TrendAngle",
                    //0// XCordinate - 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 135 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          }
          ////--- gAutoCharter_Pad.BTN_HLineX  --- Column three//
          {         gAutoCharter_Pad.BTN_HLineX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_HLineX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_HLineX", "HLine", "Arial", 7);
                    gAutoCharter_Pad.BTN_HLineX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_HLineX.GDS.Set_Location_5(XCordinate - 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 135 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_HLineX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_HLineX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_HLineX");
                    gAutoCharter_Pad.BTN_HLineX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_HLineX.Action(gAutoCharter_Pad.BTN_HLineX);//
                    //0//gAutoCharter_Pad.BTN_HLineX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyHLine", "HLine",
                    //0// XCordinate - 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 135 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          }
          ////--- gAutoCharter_Pad.BTN_VLineX  --- Column three//
          {         gAutoCharter_Pad.BTN_VLineX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_VLineX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_VLineX", "VLine", "Arial", 7);
                    gAutoCharter_Pad.BTN_VLineX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_VLineX.GDS.Set_Location_5(XCordinate - 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 135 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_VLineX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_VLineX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_VLineX");
                    gAutoCharter_Pad.BTN_VLineX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_VLineX.Action(gAutoCharter_Pad.BTN_VLineX);//
                    //0//gAutoCharter_Pad.BTN_VLineX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyVLine", "VLine",
                    //0// XCordinate - 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 135 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          }
          ////--- gAutoCharter_Pad.BTN_TrendX  --- Column three//
          {         gAutoCharter_Pad.BTN_TrendX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_TrendX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_TrendX", "Trend", "Arial", 7);
                    gAutoCharter_Pad.BTN_TrendX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_TrendX.GDS.Set_Location_5(XCordinate - 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 135 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_TrendX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_TrendX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_TrendX");
                    gAutoCharter_Pad.BTN_TrendX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_TrendX.Action(gAutoCharter_Pad.BTN_TrendX);//
                    //0//gAutoCharter_Pad.BTN_TrendX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyTrend", "Trend",
                    //0//XCordinate - 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 135 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          } i++;
          ////--- gAutoCharter_Pad.BTN_CycleX  --- Column three//
          {         gAutoCharter_Pad.BTN_CycleX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_CycleX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_CycleX", "Cycle", "Arial", 7);
                    gAutoCharter_Pad.BTN_CycleX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_CycleX.GDS.Set_Location_5(XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_CycleX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_CycleX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_CycleX");
                    gAutoCharter_Pad.BTN_CycleX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_CycleX.Action(gAutoCharter_Pad.BTN_CycleX);//
                    //0//gAutoCharter_Pad.BTN_CycleX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyCycle", "Cycle",
                    //0//XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );
          }
          ////--- gAutoCharter_Pad.BTN_FiboTimesX  --- Column four//
          {         gAutoCharter_Pad.BTN_FiboTimesX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_FiboTimesX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_FiboTimesX", "FiboTimes", "Arial", 7);
                    gAutoCharter_Pad.BTN_FiboTimesX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_FiboTimesX.GDS.Set_Location_5(XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_FiboTimesX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_FiboTimesX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_FiboTimesX");
                    gAutoCharter_Pad.BTN_FiboTimesX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_FiboTimesX.Action(gAutoCharter_Pad.BTN_FiboTimesX);//
                    //0// gAutoCharter_Pad.BTN_FiboTimesX.Create( Is_Create,  Is_Move, __FUNCSIG__, "gAutoCharter_Pad.BTN_FiboTimesX", "FiboTimes",
                    //0// XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );  //
          }
          ////--- gAutoCharter_Pad.BTN_FiboArcX  --- Column four//
          {         gAutoCharter_Pad.BTN_FiboArcX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_FiboArcX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_FiboArcX", "FiboArc", "Arial", 7);
                    gAutoCharter_Pad.BTN_FiboArcX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_FiboArcX.GDS.Set_Location_5(XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_FiboArcX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_FiboArcX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_FiboArcX");
                    gAutoCharter_Pad.BTN_FiboArcX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_FiboArcX.Action(gAutoCharter_Pad.BTN_FiboArcX);//
                    //0//gAutoCharter_Pad.BTN_FiboArcX.Create( Is_Create,  Is_Move, __FUNCSIG__, "gAutoCharter_Pad.BTN_FiboArcX", "FiboArc",
                    //0//XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );  //
          }
          ////--- gAutoCharter_Pad.BTN_FiboFanX  --- Column four//
          {         gAutoCharter_Pad.BTN_FiboFanX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_FiboFanX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_FiboFanX", "FiboFan", "Arial", 7);
                    gAutoCharter_Pad.BTN_FiboFanX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_FiboFanX.GDS.Set_Location_5(XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_FiboFanX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_FiboFanX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_FiboFanX");
                    gAutoCharter_Pad.BTN_FiboFanX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_FiboFanX.Action(gAutoCharter_Pad.BTN_FiboArcX);//
                    //0//gAutoCharter_Pad.BTN_FiboFanX.Create( Is_Create,  Is_Move, __FUNCSIG__, "gAutoCharter_Pad.BTN_FiboFanX", "FiboFan",
                    //0// XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );  //
          }
          ////--- gAutoCharter_Pad.BTN_FiboChannelX  --- Column four//
          {         gAutoCharter_Pad.BTN_FiboChannelX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_FiboChannelX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_FiboChannelX", "FiboChannel", "Arial", 7);
                    gAutoCharter_Pad.BTN_FiboChannelX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_FiboChannelX.GDS.Set_Location_5(XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_FiboChannelX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_FiboChannelX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_FiboChannelX");
                    gAutoCharter_Pad.BTN_FiboChannelX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_FiboChannelX.Action(gAutoCharter_Pad.BTN_FiboChannelX);//
                    //0//gAutoCharter_Pad.BTN_FiboChannelX.Create( Is_Create,  Is_Move, __FUNCSIG__, "gAutoCharter_Pad.BTN_FiboChannelX", "FiboChannel",
                    //0// XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );  //
          }
          ////--- gAutoCharter_Pad.BTN_FiboExpansionX  --- Column four//
          {         gAutoCharter_Pad.BTN_FiboExpansionX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_FiboExpansionX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_FiboExpansionX", "FiboExpansion", "Arial", 7);
                    gAutoCharter_Pad.BTN_FiboExpansionX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_FiboExpansionX.GDS.Set_Location_5(XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_FiboExpansionX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_FiboExpansionX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_FiboExpansionX");
                    gAutoCharter_Pad.BTN_FiboExpansionX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_FiboExpansionX.Action(gAutoCharter_Pad.BTN_FiboExpansionX);//
                    //0//gAutoCharter_Pad.BTN_FiboExpansionX.Create( Is_Create,  Is_Move, __FUNCSIG__, "gAutoCharter_Pad.BTN_FiboExpansionX", "FiboExpansion",
                    //0// XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );  //
          }
          ////--- gAutoCharter_Pad.BTN_FiboX  --- Column four//
          {         gAutoCharter_Pad.BTN_FiboX.GDS.Set_Action_2(WhichMode, IsKey);
                    gAutoCharter_Pad.BTN_FiboX.GDS.Set_Desc_4("gAutoCharter_Pad.BTN_FiboX", "Fibo", "Arial", 7);
                    gAutoCharter_Pad.BTN_FiboX.GDS.Set_Self_1(ButtonDEF_state);
                    gAutoCharter_Pad.BTN_FiboX.GDS.Set_Location_5(XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize, Corner);
                    gAutoCharter_Pad.BTN_FiboX.GDS.Set_Color_3(BackColorZ, BorderColorZ, DescColorZ);
                    gAutoCharter_Pad.BTN_FiboX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gAutoCharter_Pad.BTN_FiboX");
                    gAutoCharter_Pad.BTN_FiboX.GDS.Set_Chart_6();
                    gAutoCharter_Pad.BTN_FiboX.Action(gAutoCharter_Pad.BTN_FiboX);//
                    //0//gAutoCharter_Pad.BTN_FiboX.Create( Is_Create,  Is_Move, __FUNCSIG__, "KeyFibo", "Fibo",
                    //0//XCordinate + 75 + FixPadChartToolsX, (YCordinate + YSize * i++) - 210 + FixPadChartToolsY, XSize, YSize,
                    //0//Corner, Anchor, Backgrand,  BackColorZ, BorderColorZ, DescColorZ  );  //
          }
          ///---Progressed
          ///--
          ///-
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_FLOWPANEL::FlowPanelToolsBox(int WhichMode, bool IsKey, Sg_Position2D & Position2D)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ComplexToolsController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          bool result = false;
          Position2D.x = 335;   Position2D.y  = -70;//ist modifyed Defined one
          Sg_Position2D  Position2D_2;
          Position2D_2.x = 0;    Position2D_2.y =   0;
          int MoveToolsBoxX = -1149;   int MoveToolsBoxY = -50 + -80;
///
          if(WhichMode == MODE_CREATE && IsKey) {MoveToolsBoxX = 50;     MoveToolsBoxY = -50;}
          if(WhichMode == MODE_MOVE   && IsKey)
          {         if(   true) ////make  offf even key not presed  //need for fixed moving
                    {         independ2D.x = 0; independ2D.y = 0;
                              //Move2X += Move2X - 1699+50; Move2Y += -82+100;//
                              //FixPadFlowX=0;//FixPadFlowY=0;//notWork//
                    }
                    else if(true)
                    {         // ---gFlow_Pad.LBL_C2.GraphicalActionClass =gFlow_Pad.LBL_C2.GDS;   //--- un matched type and fields It Must convert in Frame Action
                              independ2D.x = Position2D_2.x = gFlow_Pad.LBL_C2.GAC.X_Distance() - 1199;
                              independ2D.y = Position2D_2.y = gFlow_Pad.LBL_C2.GAC.Y_Distance() - 82; //
                    }//
          }
          //
          {         ///[onPad] line 460 ///
                    //--- gFlow_Pad.BTN_ToolsBoxKeyClear  --- Column one//
                    {         gToolsBox_Pad.BTN_ToolsBoxKeyClear.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_ToolsBoxKeyClear.GDS.Set_Desc_4("gToolsBox_Pad.BTN_ToolsBoxKeyClear", "Clear", "Arial", 7);
                              gToolsBox_Pad.BTN_ToolsBoxKeyClear.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_ToolsBoxKeyClear.GDS.Set_Location_5(MoveToolsBoxX + (int)(317.2) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(251.2) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH / 3 + 12, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_ToolsBoxKeyClear.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_ToolsBoxKeyClear.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_ToolsBoxKeyClear");
                              gToolsBox_Pad.BTN_ToolsBoxKeyClear.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_ToolsBoxKeyClear.Action(gToolsBox_Pad.BTN_ToolsBoxKeyClear);//
                              //0// gToolsBox_Pad.BTN_ToolsBoxKeyClear.Create( Is_Create, Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_ToolsBoxKeyClear", "Clear",
                              //0// MoveToolsBoxX + (int)(317.2) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(251.2) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH / 3 + 12, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- gFlow_Pad.BTN_TrendLine  --- Column one//
                    {         gToolsBox_Pad.BTN_TrendLine.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_TrendLine.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TrendLine", "TL", "Arial", 6);
                              gToolsBox_Pad.BTN_TrendLine.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_TrendLine.GDS.Set_Location_5(MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_TrendLine.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_TrendLine.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_TrendLine");
                              gToolsBox_Pad.BTN_TrendLine.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_TrendLine.Action(gToolsBox_Pad.BTN_TrendLine);//
                              //0// gToolsBox_Pad.BTN_TrendLine.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_TrendLine", "TL",
                              //0// MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column one//
                    {         gToolsBox_Pad.BTN_VerticalLine.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_VerticalLine.GDS.Set_Desc_4("gToolsBox_Pad.BTN_VerticalLine", "VL", "Arial", 6);
                              gToolsBox_Pad.BTN_VerticalLine.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_VerticalLine.GDS.Set_Location_5(MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_VerticalLine.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_VerticalLine.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_VerticalLine");
                              gToolsBox_Pad.BTN_VerticalLine.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_VerticalLine.Action(gToolsBox_Pad.BTN_VerticalLine);//
                              //0// gToolsBox_Pad.BTN_VerticalLine.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_VerticalLine", "VL",
                              //0// MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column one//
                    {         gToolsBox_Pad.BTN_HorizontalLine.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_HorizontalLine.GDS.Set_Desc_4("gToolsBox_Pad.BTN_HorizontalLine", "HL", "Arial", 6);
                              gToolsBox_Pad.BTN_HorizontalLine.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_HorizontalLine.GDS.Set_Location_5(MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_HorizontalLine.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_HorizontalLine.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_HorizontalLine");
                              gToolsBox_Pad.BTN_HorizontalLine.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_HorizontalLine.Action(gToolsBox_Pad.BTN_HorizontalLine);//
                              //0// gToolsBox_Pad.BTN_HorizontalLine.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_HorizontalLine", "HL",
                              //0// MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column one//
                    {         gToolsBox_Pad.BTN_TrendLineByAngel.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_TrendLineByAngel.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TrendLineByAngel", "TLA", "Arial", 6);
                              gToolsBox_Pad.BTN_TrendLineByAngel.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_TrendLineByAngel.GDS.Set_Location_5(MoveToolsBoxX + (int)(182) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_TrendLineByAngel.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_TrendLineByAngel.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_TrendLineByAngel");
                              gToolsBox_Pad.BTN_TrendLineByAngel.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_TrendLineByAngel.Action(gToolsBox_Pad.BTN_TrendLineByAngel);//
                              //0// gToolsBox_Pad.BTN_TrendLineByAngel.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_TrendLineByAngel", "TLA",
                              //0// MoveToolsBoxX + (int)(182) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column two//
                    {         gToolsBox_Pad.BTN_ChannelsFibonachi.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_ChannelsFibonachi.GDS.Set_Desc_4("gToolsBox_Pad.BTN_ChannelsFibonachi.", "CF", "Arial", 6);
                              gToolsBox_Pad.BTN_ChannelsFibonachi.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_ChannelsFibonachi.GDS.Set_Location_5(MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(217.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_ChannelsFibonachi.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_ChannelsFibonachi.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_ChannelsFibonachi.");
                              gToolsBox_Pad.BTN_ChannelsFibonachi.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_ChannelsFibonachi.Action(gToolsBox_Pad.BTN_ChannelsFibonachi);//
                              //0// gToolsBox_Pad.BTN_ChannelsFibonachi.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_ChannelsFibonachi", "CF",
                              //0// MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(217.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column two//
                    {         gToolsBox_Pad.BTN_ChannelsLinerRegression.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_ChannelsLinerRegression.GDS.Set_Desc_4("gToolsBox_Pad.BTN_ChannelsLinerRegression", "CLR", "Arial", 6);
                              gToolsBox_Pad.BTN_ChannelsLinerRegression.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_ChannelsLinerRegression.GDS.Set_Location_5(MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(217.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_ChannelsLinerRegression.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_ChannelsLinerRegression.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_ChannelsLinerRegression");
                              gToolsBox_Pad.BTN_ChannelsLinerRegression.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_ChannelsLinerRegression.Action(gToolsBox_Pad.BTN_ChannelsLinerRegression);//
                              //0// gToolsBox_Pad.BTN_ChannelsLinerRegression.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_ChannelsLinerRegression", "CLR",
                              //0// MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(217.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column two//
                    {         gToolsBox_Pad.BTN_ChannelsEquidistant.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_ChannelsEquidistant.GDS.Set_Desc_4("gToolsBox_Pad.BTN_ChannelsEquidistant", "CE", "Arial", 6);
                              gToolsBox_Pad.BTN_ChannelsEquidistant.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_ChannelsEquidistant.GDS.Set_Location_5(MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(217.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_ChannelsEquidistant.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_ChannelsEquidistant.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_ChannelsEquidistant");
                              gToolsBox_Pad.BTN_ChannelsEquidistant.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_ChannelsEquidistant.Action(gToolsBox_Pad.BTN_ChannelsEquidistant);//
                              //0// gToolsBox_Pad.BTN_ChannelsEquidistant.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_ChannelsEquidistant", "CE",
                              //0// MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(217.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column two//
                    {         gToolsBox_Pad.BTN_ChannelsStandardDeviation.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_ChannelsStandardDeviation.GDS.Set_Desc_4("gToolsBox_Pad.BTN_ChannelsStandardDeviation", "CS", "Arial", 6);
                              gToolsBox_Pad.BTN_ChannelsStandardDeviation.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_ChannelsStandardDeviation.GDS.Set_Location_5(MoveToolsBoxX + (int)(182) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(217.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_ChannelsStandardDeviation.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_ChannelsStandardDeviation.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_ChannelsStandardDeviation");
                              gToolsBox_Pad.BTN_ChannelsStandardDeviation.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_ChannelsStandardDeviation.Action(gToolsBox_Pad.BTN_ChannelsStandardDeviation);//
                              //0// gToolsBox_Pad.BTN_ChannelsStandardDeviation.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_ChannelsStandardDeviation", "CS",
                              //0// MoveToolsBoxX + (int)(182) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(217.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column three//
                    {         gToolsBox_Pad.BTN_GannLine.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_GannLine.GDS.Set_Desc_4("gToolsBox_Pad.BTN_GannLine", "GL", "Arial", 6);
                              gToolsBox_Pad.BTN_GannLine.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_GannLine.GDS.Set_Location_5(MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(233.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_GannLine.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_GannLine.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_GannLine");
                              gToolsBox_Pad.BTN_GannLine.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_GannLine.Action(gToolsBox_Pad.BTN_GannLine);//
                              //0// gToolsBox_Pad.BTN_GannLine.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_GannLine", "GL",
                              //0// MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(233.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column three//
                    {         gToolsBox_Pad.BTN_GannFan.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_GannFan.GDS.Set_Desc_4("gToolsBox_Pad.BTN_GannFan", "GF", "Arial", 6);
                              gToolsBox_Pad.BTN_GannFan.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_GannFan.GDS.Set_Location_5(MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(233.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_GannFan.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_GannFan.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_GannFan");
                              gToolsBox_Pad.BTN_GannFan.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_GannFan.Action(gToolsBox_Pad.BTN_GannFan);//
                              //0// gToolsBox_Pad.BTN_GannFan.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_GannFan", "GF",
                              //0// MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(233.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column three//
                    {         gToolsBox_Pad.BTN_GannGrid.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_GannGrid.GDS.Set_Desc_4("gToolsBox_Pad.BTN_GannGrid", "GG", "Arial", 6);
                              gToolsBox_Pad.BTN_GannGrid.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_GannGrid.GDS.Set_Location_5(MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(233.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_GannGrid.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_GannGrid.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_GannGrid");
                              gToolsBox_Pad.BTN_GannGrid.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_GannGrid.Action(gToolsBox_Pad.BTN_GannGrid);//
                              //0// gToolsBox_Pad.BTN_GannGrid.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_GannGrid", "GG",
                              //0// MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(233.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column four//
                    {         gToolsBox_Pad.BTN_FibonacciRetracement.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_FibonacciRetracement.GDS.Set_Desc_4("gToolsBox_Pad.BTN_FibonacciRetracement", "FR", "Arial", 6);
                              gToolsBox_Pad.BTN_FibonacciRetracement.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_FibonacciRetracement.GDS.Set_Location_5(MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(249.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_FibonacciRetracement.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_FibonacciRetracement.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_FibonacciRetracement");
                              gToolsBox_Pad.BTN_FibonacciRetracement.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_FibonacciRetracement.Action(gToolsBox_Pad.BTN_FibonacciRetracement);//
                              //0// gToolsBox_Pad.BTN_FibonacciRetracement.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_FibonacciRetracement", "FR",
                              //0// MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(249.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column four//
                    {         gToolsBox_Pad.BTN_FibonacciTimeZone.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_FibonacciTimeZone.GDS.Set_Desc_4("gToolsBox_Pad.BTN_FibonacciTimeZone", "FT", "Arial", 6);
                              gToolsBox_Pad.BTN_FibonacciTimeZone.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_FibonacciTimeZone.GDS.Set_Location_5(MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(249.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_FibonacciTimeZone.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_FibonacciTimeZone.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_FibonacciTimeZone");
                              gToolsBox_Pad.BTN_FibonacciTimeZone.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_FibonacciTimeZone.Action(gToolsBox_Pad.BTN_FibonacciTimeZone);//
                              //0// gToolsBox_Pad.BTN_FibonacciTimeZone.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_FibonacciTimeZone", "FT",
                              //0// MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(249.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column four//
                    {         gToolsBox_Pad.BTN_FibonacciFan.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_FibonacciFan.GDS.Set_Desc_4("gToolsBox_Pad.BTN_FibonacciFan", "FF", "Arial", 6);
                              gToolsBox_Pad.BTN_FibonacciFan.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_FibonacciFan.GDS.Set_Location_5(MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(249.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_FibonacciFan.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_FibonacciFan.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_FibonacciFan");
                              gToolsBox_Pad.BTN_FibonacciFan.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_FibonacciFan.Action(gToolsBox_Pad.BTN_FibonacciFan);//
                              //0// gToolsBox_Pad.BTN_FibonacciFan.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_FibonacciFan", "FF",
                              //0// MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(249.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column four//
                    {         gToolsBox_Pad.BTN_FibonacciArcs.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_FibonacciArcs.GDS.Set_Desc_4("gToolsBox_Pad.BTN_FibonacciArcs", "FA", "Arial", 6);
                              gToolsBox_Pad.BTN_FibonacciArcs.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_FibonacciArcs.GDS.Set_Location_5(MoveToolsBoxX + (int)(182) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(249.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_FibonacciArcs.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_FibonacciArcs.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_FibonacciArcs");
                              gToolsBox_Pad.BTN_FibonacciArcs.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_FibonacciArcs.Action(gToolsBox_Pad.BTN_FibonacciArcs);//
                              //0// gToolsBox_Pad.BTN_FibonacciArcs.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_FibonacciArcs", "FA",
                              //0// MoveToolsBoxX + (int)(182) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(249.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column four//
                    {         gToolsBox_Pad.BTN_FibonacciExpansion.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_FibonacciExpansion.GDS.Set_Desc_4("gToolsBox_Pad.BTN_FibonacciExpansion", "FE", "Arial", 6);
                              gToolsBox_Pad.BTN_FibonacciExpansion.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_FibonacciExpansion.GDS.Set_Location_5(MoveToolsBoxX + (int)(156) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(249.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_FibonacciExpansion.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_FibonacciExpansion.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_FibonacciExpansion");
                              gToolsBox_Pad.BTN_FibonacciExpansion.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_FibonacciExpansion.Action(gToolsBox_Pad.BTN_FibonacciExpansion);//
                              //0// gToolsBox_Pad.BTN_FibonacciExpansion.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_FibonacciExpansion", "FE",
                              //0// MoveToolsBoxX + (int)(156) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(249.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column five//
                    {         gToolsBox_Pad.BTN_ShapeRectangle.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_ShapeRectangle.GDS.Set_Desc_4("gToolsBox_Pad.BTN_ShapeRectangle", "SR", "Arial", 6);
                              gToolsBox_Pad.BTN_ShapeRectangle.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_ShapeRectangle.GDS.Set_Location_5(MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(265.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_ShapeRectangle.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_ShapeRectangle.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_ShapeRectangle");
                              gToolsBox_Pad.BTN_ShapeRectangle.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_ShapeRectangle.Action(gToolsBox_Pad.BTN_ShapeRectangle);//
                              //0// gToolsBox_Pad.BTN_ShapeRectangle.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_ShapeRectangle", "SR",
                              //0// MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(265.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column five//
                    {         gToolsBox_Pad.BTN_ShapeTriangle.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_ShapeTriangle.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TrendLine", "ST", "Arial", 6);
                              gToolsBox_Pad.BTN_ShapeTriangle.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_ShapeTriangle.GDS.Set_Location_5(MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(265.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_ShapeTriangle.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_ShapeTriangle.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_ShapeTriangle");
                              gToolsBox_Pad.BTN_ShapeTriangle.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_ShapeTriangle.Action(gToolsBox_Pad.BTN_ShapeTriangle);//
                              //0// gToolsBox_Pad.BTN_ShapeTriangle.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_ShapeTriangle", "ST",
                              //0// MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(265.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column five//
                    {         gToolsBox_Pad.BTN_ShapeEllipse.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_ShapeEllipse.GDS.Set_Desc_4("gToolsBox_Pad.BTN_ShapeEllipse", "SE", "Arial", 6);
                              gToolsBox_Pad.BTN_ShapeEllipse.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_ShapeEllipse.GDS.Set_Location_5(MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(265.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_ShapeEllipse.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_ShapeEllipse.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_ShapeEllipse");
                              gToolsBox_Pad.BTN_ShapeEllipse.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_ShapeEllipse.Action(gToolsBox_Pad.BTN_TrendLine);//
                              //0// gToolsBox_Pad.BTN_ShapeEllipse.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_ShapeEllipse", "SE",
                              //0// MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(265.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 22, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column six//
                    {         gToolsBox_Pad.BTN_TimeFrames_1Minute.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_TimeFrames_1Minute.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TimeFrames_1Minute", "M1", "Arial", 6);
                              gToolsBox_Pad.BTN_TimeFrames_1Minute.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_TimeFrames_1Minute.GDS.Set_Location_5(MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_TimeFrames_1Minute.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_TimeFrames_1Minute.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_TimeFrames_1Minute");
                              gToolsBox_Pad.BTN_TimeFrames_1Minute.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_TimeFrames_1Minute.Action(gToolsBox_Pad.BTN_TimeFrames_1Minute);//
                              //0// gToolsBox_Pad.BTN_TimeFrames_1Minute.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_TimeFrames_1Minute", "M1",
                              //0// MoveToolsBoxX + (int)(260) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column six//
                    {         gToolsBox_Pad.BTN_TimeFrames_5Minute.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_TimeFrames_5Minute.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TimeFrames_5Minute", "M5", "Arial", 6);
                              gToolsBox_Pad.BTN_TimeFrames_5Minute.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_TimeFrames_5Minute.GDS.Set_Location_5(MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_TimeFrames_5Minute.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_TimeFrames_5Minute.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_TimeFrames_5Minute");
                              gToolsBox_Pad.BTN_TimeFrames_5Minute.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_TimeFrames_5Minute.Action(gToolsBox_Pad.BTN_TimeFrames_5Minute);//
                              //0// gToolsBox_Pad.BTN_TimeFrames_5Minute.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_TimeFrames_5Minute", "M5",
                              //0// MoveToolsBoxX + (int)(234) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column six//
                    {         gToolsBox_Pad.BTN_TimeFrames_15Minute.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_TimeFrames_15Minute.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TimeFrames_15Minute", "M15", "Arial", 6);
                              gToolsBox_Pad.BTN_TimeFrames_15Minute.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_TimeFrames_15Minute.GDS.Set_Location_5(MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_TimeFrames_15Minute.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_TimeFrames_15Minute.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_TimeFrames_15Minute");
                              gToolsBox_Pad.BTN_TimeFrames_15Minute.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_TimeFrames_15Minute.Action(gToolsBox_Pad.BTN_TimeFrames_15Minute);//
                              //0// gToolsBox_Pad.BTN_TimeFrames_15Minute.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_TimeFrames_15Minute", "M15 ",
                              //0// MoveToolsBoxX + (int)(208) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column six//
                    {         gToolsBox_Pad.BTN_TimeFrames_30Minute.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_TimeFrames_30Minute.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TimeFrames_30Minute", "M30", "Arial", 6);
                              gToolsBox_Pad.BTN_TimeFrames_30Minute.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_TimeFrames_30Minute.GDS.Set_Location_5(MoveToolsBoxX + (int)(182) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_TimeFrames_30Minute.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_TimeFrames_30Minute.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_TimeFrames_30Minute");
                              gToolsBox_Pad.BTN_TimeFrames_30Minute.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_TimeFrames_30Minute.Action(gToolsBox_Pad.BTN_TimeFrames_30Minute);//
                              //0// gToolsBox_Pad.BTN_TimeFrames_30Minute.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_TimeFrames_30Minute", "M30",
                              //0// MoveToolsBoxX + (int)(182) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column six//
                    {         gToolsBox_Pad.BTN_TimeFrames_1Hour.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_TimeFrames_1Hour.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TimeFrames_1Hour", "H1", "Arial", 6);
                              gToolsBox_Pad.BTN_TimeFrames_1Hour.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_TimeFrames_1Hour.GDS.Set_Location_5(MoveToolsBoxX + (int)(156) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_TimeFrames_1Hour.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_TimeFrames_1Hour.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_TimeFrames_1Hour");
                              gToolsBox_Pad.BTN_TimeFrames_1Hour.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_TimeFrames_1Hour.Action(gToolsBox_Pad.BTN_TimeFrames_1Hour);//
                              //0// gToolsBox_Pad.BTN_TimeFrames_1Hour.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_TimeFrames_1Hour", "H1",
                              //0// MoveToolsBoxX + (int)(156) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column six//
                    {         gToolsBox_Pad.BTN_TimeFrames_4Hours.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_TimeFrames_4Hours.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TimeFrames_4Hours", "H4", "Arial", 6);
                              gToolsBox_Pad.BTN_TimeFrames_4Hours.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_TimeFrames_4Hours.GDS.Set_Location_5(MoveToolsBoxX + (int)(130) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_TimeFrames_4Hours.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_TimeFrames_4Hours.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_TimeFrames_4Hours");
                              gToolsBox_Pad.BTN_TimeFrames_4Hours.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_TimeFrames_4Hours.Action(gToolsBox_Pad.BTN_TimeFrames_4Hours);//
                              //0// gToolsBox_Pad.BTN_TimeFrames_4Hours.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_TimeFrames_4Hours", "H4",
                              //0// MoveToolsBoxX + (int)(130) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column six//
                    {         gToolsBox_Pad.BTN_TimeFrames_Daily.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_TimeFrames_Daily.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TimeFrames_Daily", "D1", "Arial", 6);
                              gToolsBox_Pad.BTN_TimeFrames_Daily.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_TimeFrames_Daily.GDS.Set_Location_5(MoveToolsBoxX + (int)(104) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_TimeFrames_Daily.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_TimeFrames_Daily.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_TimeFrames_Daily");
                              gToolsBox_Pad.BTN_TimeFrames_Daily.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_TimeFrames_Daily.Action(gToolsBox_Pad.BTN_TimeFrames_Daily);//
                              //0// gToolsBox_Pad.BTN_TimeFrames_Daily.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_TimeFrames_Daily", "D1",
                              //0// MoveToolsBoxX + (int)(104) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column six//
                    {         gToolsBox_Pad.BTN_TimeFrames_Weekly.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_TimeFrames_Weekly.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TimeFrames_Weekly", "W1", "Arial", 6);
                              gToolsBox_Pad.BTN_TimeFrames_Weekly.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_TimeFrames_Weekly.GDS.Set_Location_5(MoveToolsBoxX + (int)(78) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_TimeFrames_Weekly.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_TimeFrames_Weekly.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_TimeFrames_Weekly");
                              gToolsBox_Pad.BTN_TimeFrames_Weekly.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_TimeFrames_Weekly.Action(gToolsBox_Pad.BTN_TimeFrames_Weekly);//
                              //0// gToolsBox_Pad.BTN_TimeFrames_Weekly.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_TimeFrames_Weekly", "W1",
                              //0// MoveToolsBoxX + (int)(78) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");
                    }
                    //t --- gFlow_Pad.BTN_TrendLine  --- Column six//
                    {         gToolsBox_Pad.BTN_TimeFrames_Monthly.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_TimeFrames_Monthly.GDS.Set_Desc_4("gToolsBox_Pad.BTN_TimeFrames_Monthly", "MN", "Arial", 6);
                              gToolsBox_Pad.BTN_TimeFrames_Monthly.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_TimeFrames_Monthly.GDS.Set_Location_5(MoveToolsBoxX + (int)(52) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_TimeFrames_Monthly.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_TimeFrames_Monthly.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_TimeFrames_Monthly");
                              gToolsBox_Pad.BTN_TimeFrames_Monthly.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_TimeFrames_Monthly.Action(gToolsBox_Pad.BTN_TimeFrames_Monthly);//
                              //0// gToolsBox_Pad.BTN_TimeFrames_Monthly.Create( Is_Create,  Is_Move, __FUNCSIG__, "gToolsBox_Pad.BTN_TimeFrames_Monthly", "MN",
                              //0// MoveToolsBoxX + (int)(52) + FixPadFlowX + independ2D.x, MoveToolsBoxY + (int)(281.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 20, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrLavender, clrLavender, clrDarkCyan, 0, 6, "Arial");  //
                    }
                    result = true; //
          }//
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ComplexToolsController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return (result);//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_FLOWPANEL::CALL(int WhichMode, bool IsKey,   Sg_Position2D & Position2D) ///(335,-75);
{         //---
          if(WhichMode == MODE_CREATE)  { RightMenu.IsBasic_Showed_Active_Flow = IsKey; };
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ComplexToolsController Error",  __LINE__, __FUNCTION__); //|
          {         if(WhichMode == MODE_CREATE && !IsKey)
                    {         Elliott_PAD.__CALL(MODE_CREATE, false, Position2D);
                              Candels_Box.__Call(MODE_CREATE, false, Position2D); //
                    }//
          }
          bool result = true; //
          ChartData_ChartFrame.PixelGet();
          //--define x y                             //--- update in call..//cant defined in de maximize
          {         //------------------------------------------------------------------------------------------------------------------------------------------------------------
                    if(gFlow_Pad.IsLBL_ == IsKey && WhichMode == MODE_CREATE ) {independ2D.x  = 0; independ2D.y  = 0; }
                    ////fixe restart where
                    int XbyChart = (int)(ChartData_ChartFrame.WidthPixel * 0.55);
                    int YbyChart = (int)(ChartData_ChartFrame.HeightPixel * 0.02);
                    //------------------------------------------------------------------------------------------------------------------------------------------------------------
                    independ2D.x  = Position2D.x + XbyChart;   //- 410; ////Must init in self class... for not value zerooll..// Position2D.xChart =
                    independ2D.y  = Position2D.y + YbyChart;
                    if( WhichMode == MODE_MOVE )
                    {         //
                              independ2D.x  = Position2D.x - (428) + 28; //
                              independ2D.y  = Position2D.y - (80) + 400; //
                              //
                    }
                    //------------------------------------------------------------------------------------------------------------------------------------------------------------
                    independ2D_CandlBox.x   = -50 + Position2D.y;
                    independ2D_CandlBox.y   = FixPadFlowY + Position2D.y;
                    //------------------------------------------------------------------------------------------------------------------------------------------------------------
                    color BackColorPad  = clrDarkRed;
                    //Alert("(429) +  independ2D.x + FixPadFlowX: ", "(429) +", independ2D.x, "+", FixPadFlowX);  //
          }
          //------------------------------------------------------------------------------------------------------------------------------------------------------------
          //int x =  Dev_Chart_Window._Mql_.CHART_WIDTH_IN_PIXELS_int();//Dev_Chart_Window._Mql_.PropertyData.CHART_WIDTH_IN_PIXELS_int;
          //int y =  Dev_Chart_Window._Mql_.CHART_HEIGHT_IN_PIXELS_int();//Dev_Chart_Window._Mql_.PropertyData.CHART_HEIGHT_IN_PIXELS_int;
          //(int)(395.2) +  independ2D.x + FixPadFlowX, (int)(208) + FixPadFlowY + independ2D.y
          Object_Pack.Texts.Label.GreateGDS(WhichMode, IsKey, false, 0, "FXTradingMasters", 0, (int)(435) + independ2D.x + FixPadFlowX, (int)(270)  + FixPadFlowY + independ2D.y, CORNER_LEFT_UPPER, "FXTradingMasters", "Arial Bold", 21, clrGold, 0, ANCHOR_CENTER);
          //------------------------------------------------------------------------------------------------------------------------------------------------------------
          {         //--- LBL_Base Generic ---//
                    {         Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL, CChartObjectLabel, Cg_TextsLabel>  *gLBL_Base = new Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL, CChartObjectLabel, Cg_TextsLabel>();
                              Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL, CChartObjectLabel, Cg_TextsLabel>  gLBL_Base2;//
                              //---Error 'Factory<Sg_LABEL,CChartObjectLab…' - parameter passed as reference, variable expected   //--- Need Class type of Sg_LABEL for Refcency heap
                              //---
                              gLBL_Base.GDS.Set_Action_2(WhichMode, IsKey); //Alert("gFlow_Pad.LBL_Base. MODE_MOVE: ", WhichMode, IsKey);
                              gLBL_Base.GDS.Set_Desc_4("gFlow_Pad.LBL_Base", "n", "Webdings",  55); ///Segoe MDL2 Assets
                              gLBL_Base.GDS.Set_Color_1(clrDarkCyan);
                              gLBL_Base.GDS.Set_Location_5((int)(429) +  independ2D.x + FixPadFlowX, (int)(201.6) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gLBL_Base.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_Base");
                              gLBL_Base.GDS.Set_Chart_6();
                              gLBL_Base.Action(gLBL_Base); //
                              //0// gFlow_Pad.LBL_Base.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_Base", "n",
                              //0// (int)(429) +  independ2D.x + FixPadFlowX,      (int)(201.6) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 55, "Webdings");   ///Segoe MDL2 Assets
                              delete gLBL_Base; }
                    //---
                    //---
                    //---
                    //--- [ LBL_ line 281 ] ---//
                    //--- LBL_Base ---// Non Generic
                    {         gFlow_Pad.LBL_Base.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_Base.GDS.Set_Desc_4("gFlow_Pad.LBL_Base", "n", "Webdings",  55); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_Base.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_Base.GDS.Set_Location_5((int)(429) +  independ2D.x + FixPadFlowX, (int)(201.6) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_Base.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_Base");
                              gFlow_Pad.LBL_Base.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_Base.Action(gFlow_Pad.LBL_Base); //
                              //0//gFlow_Pad.LBL_Base.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_Base", "n",
                              //0// (int)(429) +  independ2D.x + FixPadFlowX,      (int)(201.6) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 55, "Webdings");   ///Segoe MDL2 Assets
                    }
                    //--- LBL_Base2 ---//
                    {         gFlow_Pad.LBL_Base2.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_Base2.GDS.Set_Desc_4("gFlow_Pad.LBL_Base2", "n", "Webdings",  45); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_Base2.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_Base2.GDS.Set_Location_5((int)(429) +  independ2D.x + FixPadFlowX, (int)(201.6) - 2 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_Base2.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_Base");
                              gFlow_Pad.LBL_Base2.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_Base2.Action(gFlow_Pad.LBL_Base2); //
                              //0//gFlow_Pad.LBL_Base2.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_Base2", "n",
                              //0// (int)(429) +  independ2D.x + FixPadFlowX,       (int)(201.6) - 2 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 45, "Webdings");   ///Segoe MDL2 Assets
                    }
                    //--- LBL_Base3 ---//
                    {         gFlow_Pad.LBL_Base3.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_Base3.GDS.Set_Desc_4("gFlow_Pad.LBL_Base3", "n", "Webdings",  35); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_Base3.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_Base3.GDS.Set_Location_5((int)(429) + independ2D.x + FixPadFlowX, (int)(201.6) - 2 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_Base3.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_Base3");
                              gFlow_Pad.LBL_Base3.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_Base3.Action(gFlow_Pad.LBL_Base3); //
                              //0//gFlow_Pad.LBL_Base3.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_Base3", "n",
                              //0// (int)(429) +  independ2D.x + FixPadFlowX,       (int)(201.6) - 2 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 35, "Webdings");   ///Segoe MDL2 Assets
                    }
                    //--- LBL_R ---//
                    {         gFlow_Pad.LBL_R.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_R.GDS.Set_Desc_4("gFlow_Pad.LBL_R", "n", "Webdings",  17); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_R.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_R.GDS.Set_Location_5((int)(462.8) +  independ2D.x + FixPadFlowX, (int)(201.6) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_R.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_R");
                              gFlow_Pad.LBL_R.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_R.Action(gFlow_Pad.LBL_R); //
                              //0//gFlow_Pad.LBL_R.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_R", "n",
                              //0//(int)(462.8) +  independ2D.x + FixPadFlowX,     (int)(201.6) + FixPadFlowY + independ2D.y,
                              //0//CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 17, "Webdings");
                    }
                    //--- LBL_R2 ---//
                    {         gFlow_Pad.LBL_R2.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_R2.GDS.Set_Desc_4("gFlow_Pad.LBL_R2", "n", "Webdings",  14); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_R2.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_R2.GDS.Set_Location_5((int)(462.8) +  independ2D.x + FixPadFlowX, (int)(201.6) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_R2.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_R2");
                              gFlow_Pad.LBL_R2.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_R2.Action(gFlow_Pad.LBL_R2); //
                              //0//gFlow_Pad.LBL_R2.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_R2", "n",
                              //0//(int)(462.8) +  independ2D.x + FixPadFlowX,     (int)(201.6) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 14, "Webdings");
                    }
                    //--- LBL_Zigzag ---//
                    {         gFlow_Pad.LBL_Zigzag.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_Zigzag.GDS.Set_Desc_4("gFlow_Pad.LBL_Zigzag", "7", "Wingdings 3",  15); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_Zigzag.GDS.Set_Color_1(clrRed);
                              gFlow_Pad.LBL_Zigzag.GDS.Set_Location_5((int)(459.68) +  independ2D.x + FixPadFlowX, (int)(201.6) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_Zigzag.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_Zigzag");
                              gFlow_Pad.LBL_Zigzag.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_Zigzag.Action(gFlow_Pad.LBL_Zigzag); //
                              //0// gFlow_Pad.LBL_Zigzag.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_Zigzag", "7",
                              //0// (int)(459.68) +  independ2D.x + FixPadFlowX,    (int)(201.6) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrRed, 0, 15, "Wingdings 3");
                    }
                    //--- LBL_L ---//
                    {         gFlow_Pad.LBL_L.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_L.GDS.Set_Desc_4("gFlow_Pad.LBL_L", "n", "Webdings",  17); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_L.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_L.GDS.Set_Location_5((int)(397.8) +  independ2D.x + FixPadFlowX, (int)(201.6) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_L.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_L");
                              gFlow_Pad.LBL_L.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_L.Action(gFlow_Pad.LBL_L); //
                              //0//gFlow_Pad.LBL_L.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_L", "n",
                              //0// (int)(397.8) +  independ2D.x + FixPadFlowX,     (int)(201.6) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 17, "Webdings");
                    }
                    //--- LBL_L2 ---//
                    {         gFlow_Pad.LBL_L2.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_L2.GDS.Set_Desc_4("gFlow_Pad.LBL_L2", "n", "Webdings",  14); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_L2.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_L2.GDS.Set_Location_5((int)(397.8) +  independ2D.x + FixPadFlowX, (int)(201.6) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_L2.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_L2");
                              gFlow_Pad.LBL_L2.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_L2.Action(gFlow_Pad.LBL_L2); //
                              //0//gFlow_Pad.LBL_L2.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_L2", "n",
                              //0// (int)(397.8) +  independ2D.x + FixPadFlowX,     (int)(201.6) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 14, "Webdings");
                    }
                    //--- LBL_L_R ---//
                    {         gFlow_Pad.LBL_L_R.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_L_R.GDS.Set_Desc_4("gFlow_Pad.LBL_L_R", "n", "Webdings",  13); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_L_R.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_L_R.GDS.Set_Location_5((int)(408.2) +  independ2D.x + FixPadFlowX, (int)(201.6) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_L_R.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_L_R");
                              gFlow_Pad.LBL_L_R.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_L_R.Action(gFlow_Pad.LBL_L_R); //
                              //0//gFlow_Pad.LBL_L_R.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_L_R", "n",
                              //0//(int)(408.2) +  independ2D.x + FixPadFlowX,     (int)(201.6) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 13, "Webdings");
                    }
                    //--- LBL_L2_R ---//
                    {         gFlow_Pad.LBL_L2_R.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_L2_R.GDS.Set_Desc_4("gFlow_Pad.LBL_L2_R", "n", "Webdings",  10); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_L2_R.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_L2_R.GDS.Set_Location_5((int)(408.2) +  independ2D.x + FixPadFlowX, (int)(200) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_L2_R.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_L2_R");
                              gFlow_Pad.LBL_L2_R.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_L2_R.Action(gFlow_Pad.LBL_L2_R); //
                              //0//gFlow_Pad.LBL_L2_R.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_L2_R", "n",
                              //0//(int)(408.2) +  independ2D.x + FixPadFlowX,     (int)(200) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 10, "Webdings");
                    }
                    //--- LBL_ShowOrdHistory ---//
                    {         gFlow_Pad.LBL_ShowOrdHistory.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_ShowOrdHistory.GDS.Set_Desc_4("gFlow_Pad.LBL_ShowOrdHistory", "6", "Webdings",  10); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_ShowOrdHistory.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_ShowOrdHistory.GDS.Set_Location_5((int)(408.2) +  independ2D.x + FixPadFlowX, (int)(201.6) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_ShowOrdHistory.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_ShowOrdHistory");
                              gFlow_Pad.LBL_ShowOrdHistory.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_ShowOrdHistory.Action(gFlow_Pad.LBL_ShowOrdHistory); //
                              //0//gFlow_Pad.LBL_ShowOrdHistory.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_ShowOrdHistory", "6",
                              //0//(int)(408.2) +  independ2D.x + FixPadFlowX, (int)(201.6) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 10, "Wingdings");
                    }
                    //--- LBL_L_L ---//
                    {         gFlow_Pad.LBL_L_L.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_L_L.GDS.Set_Desc_4("gFlow_Pad.LBL_L_L", "n", "Webdings",  10); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_L_L.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_L_L.GDS.Set_Location_5((int)(382.2) +  independ2D.x + FixPadFlowX, (int)(200) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_L_L.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_L_L");
                              gFlow_Pad.LBL_L_L.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_L_L.Action(gFlow_Pad.LBL_L_L); //
                              //0//gFlow_Pad.LBL_L_L.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_L_L", "n",
                              //0//(int)(382.2) +  independ2D.x + FixPadFlowX,      (int)(200) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 10, "Webdings");
                    }
                    //--- LBL_L2_L ---//
                    {         gFlow_Pad.LBL_L2_L.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_L2_L.GDS.Set_Desc_4("gFlow_Pad.LBL_L2_L", "n", "Webdings",  6); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_L2_L.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_L2_L.GDS.Set_Location_5((int)(382.2) +  independ2D.x + FixPadFlowX, (int)(200) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_L2_L.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_L2_L");
                              gFlow_Pad.LBL_L2_L.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_L2_L.Action(gFlow_Pad.LBL_L2_L); //
                              //0//gFlow_Pad.LBL_L2_L.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_L2_L", "n",
                              //0//(int)(382.2) +  independ2D.x + FixPadFlowX, (int)(200) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 6, "Webdings");
                    }
                    //--- LBL_L_U ---//
                    {         gFlow_Pad.LBL_L_U.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_L_U.GDS.Set_Desc_4("gFlow_Pad.LBL_L_U", "n", "Webdings",  10); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_L_U.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_L_U.GDS.Set_Location_5((int)(395.2) +  independ2D.x + FixPadFlowX, (int)(192) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_L_U.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_L_U");
                              gFlow_Pad.LBL_L_U.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_L_U.Action(gFlow_Pad.LBL_L_U); //
                              //0//gFlow_Pad.LBL_L_U.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_L_U", "n",
                              //0//(int)(395.2) +  independ2D.x + FixPadFlowX, (int)(192) + FixPadFlowY + independ2D.y,
                              //0//CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 10, "Webdings");
                    }
                    //--- LBL_L2_U ---//
                    {         gFlow_Pad.LBL_L2_U.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_L2_U.GDS.Set_Desc_4("gFlow_Pad.LBL_L2_U", "n", "Webdings",  6); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_L2_U.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_L2_U.GDS.Set_Location_5((int)(395.2) +  independ2D.x + FixPadFlowX, (int)(192) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_L2_U.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_L2_U");
                              gFlow_Pad.LBL_L2_U.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_L2_U.Action(gFlow_Pad.LBL_L2_U); //
                              //0//gFlow_Pad.LBL_L2_U.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_L2_U", "n",
                              //0//(int)(395.2) +  independ2D.x + FixPadFlowX, (int)(192) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 6, "Webdings");
                    }
                    //--- LBL_L_D ---//
                    {         gFlow_Pad.LBL_L_D.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_L_D.GDS.Set_Desc_4("gFlow_Pad.LBL_L_D", "n", "Webdings",  13); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_L_D.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_L_D.GDS.Set_Location_5((int)(395.2) +  independ2D.x + FixPadFlowX, (int)(209.6) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_L_D.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_L_D");
                              gFlow_Pad.LBL_L_D.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_L_D.Action(gFlow_Pad.LBL_L_D); //
                              //0//gFlow_Pad.LBL_L_D.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_L_D", "n",
                              //0// (int)(395.2) +  independ2D.x + FixPadFlowX,      (int)(209.6) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 13, "Webdings");
                    }
                    //--- LBL_L2_D ---//
                    {         gFlow_Pad.LBL_L2_D.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_L2_D.GDS.Set_Desc_4("gFlow_Pad.LBL_L2_D", "n", "Webdings",  10); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_L2_D.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_L2_D.GDS.Set_Location_5((int)(395.2) +  independ2D.x + FixPadFlowX, (int)(208) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_L2_D.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_L2_D");
                              gFlow_Pad.LBL_L2_D.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_L2_D.Action(gFlow_Pad.LBL_L2_D); //
                              //0//gFlow_Pad.LBL_L2_D.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_L2_D", "n",
                              //0// (int)(395.2) +  independ2D.x + FixPadFlowX,      (int)(208) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 10, "Webdings");
                    }
                    //--- LBL_ResetPadPos ---//
                    {         gFlow_Pad.LBL_ResetPadPos.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_ResetPadPos.GDS.Set_Desc_4("gFlow_Pad.LBL_ResetPadPos", "R", "Wingdings 3",  8); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_ResetPadPos.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_ResetPadPos.GDS.Set_Location_5((int)(395.2) +  independ2D.x + FixPadFlowX, (int)(208) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_ResetPadPos.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_ResetPadPos");
                              gFlow_Pad.LBL_ResetPadPos.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_ResetPadPos.Action(gFlow_Pad.LBL_ResetPadPos); //
                              //0//gFlow_Pad.LBL_ResetPadPos.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_ResetPadPos", "R",
                              //0// (int)(395.2) +  independ2D.x + FixPadFlowX,      (int)(208) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 8, "Wingdings 3");
                    }
                    //--- LBL_U ---//
                    {         gFlow_Pad.LBL_U.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_U.GDS.Set_Desc_4("gFlow_Pad.LBL_U", "n", "Webdings",  17); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_U.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_U.GDS.Set_Location_5((int)(429) +  independ2D.x + FixPadFlowX, (int)(169.6) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_U.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_U");
                              gFlow_Pad.LBL_U.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_U.Action(gFlow_Pad.LBL_U); //
                              //0//gFlow_Pad.LBL_U.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_U", "n",
                              //0// (int)(429) +  independ2D.x + FixPadFlowX, (int)(169.6) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 17, "Webdings");
                    }
                    //--- LBL_U2 ---//
                    {         gFlow_Pad.LBL_U2.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_U2.GDS.Set_Desc_4("gFlow_Pad.LBL_U2", "n", "Webdings",  14); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_U2.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_U2.GDS.Set_Location_5((int)(429) +  independ2D.x + FixPadFlowX, (int)(169.6) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_U2.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_U2");
                              gFlow_Pad.LBL_U2.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_U2.Action(gFlow_Pad.LBL_U2); //
                              //0//gFlow_Pad.LBL_U2.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_U2", "n",
                              //0// (int)(429) +  independ2D.x + FixPadFlowX, (int)(169.6) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 14, "Webdings");
                    }
                    //--- LBL_U2_AutoCharter ---//
                    {         gFlow_Pad.LBL_U2_AutoCharter.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_U2_AutoCharter.GDS.Set_Desc_4("gFlow_Pad.LBL_U2_AutoCharter", "AutoCharter", "Arial Bold",  7); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_U2_AutoCharter.GDS.Set_Color_1(clrWhite);
                              gFlow_Pad.LBL_U2_AutoCharter.GDS.Set_Location_5((int)(429) +  independ2D.x + FixPadFlowX, (int)(152) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_U2_AutoCharter.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_U2_AutoCharter");
                              gFlow_Pad.LBL_U2_AutoCharter.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_U2_AutoCharter.Action(gFlow_Pad.LBL_U2_AutoCharter); //
                              //0//gFlow_Pad.LBL_U2_AutoCharter.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_U2_AutoCharter", "AutoCharter",
                              //0//(int)(429) +  independ2D.x + FixPadFlowX,      (int)(152) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrWhite, 0, 7, "Arial Bold");
                    }
                    //--- LBL_U2 ---//
                    {         gFlow_Pad.LBL_D.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_D.GDS.Set_Desc_4("gFlow_Pad.LBL_D", "n", "Webdings",  17); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_D.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_D.GDS.Set_Location_5((int)(429) +  independ2D.x + FixPadFlowX, (int)(233.6) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_D.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_D");
                              gFlow_Pad.LBL_D.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_D.Action(gFlow_Pad.LBL_D); //
                              //0//gFlow_Pad.LBL_D.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_D", "n",
                              //0// (int)(429) +  independ2D.x + FixPadFlowX,      (int)(233.6) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 17, "Webdings"); Sleep(10);
                    }
                    //--- LBL_D2 ---//
                    {         gFlow_Pad.LBL_D2.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_D2.GDS.Set_Desc_4("gFlow_Pad.LBL_D2", "n", "Webdings",  14); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_D2.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_D2.GDS.Set_Location_5((int)(429) +  independ2D.x + FixPadFlowX, (int)(233.6) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_D2.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_D2");
                              gFlow_Pad.LBL_D2.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_D2.Action(gFlow_Pad.LBL_D2); //
                              //0//gFlow_Pad.LBL_D2.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_D2", "n",
                              //0// (int)(429) +  independ2D.x + FixPadFlowX,      (int)(233.6) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 14, "Webdings");
                    }
                    //--- LBL_D2 ---//
                    {         gFlow_Pad.LBL_D2ShowComment.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Desc_4("gFlow_Pad.LBL_D2ShowComment", "Comment", "Arial Bold",  7); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Color_1(clrWhite);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Location_5((int)(429) +  independ2D.x + FixPadFlowX, (int)(240) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_D2ShowComment");
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_D2ShowComment.Action(gFlow_Pad.LBL_D2ShowComment); //
                              //0//gFlow_Pad.LBL_D2ShowComment.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_D2ShowComment", "Comment",
                              //0// (int)(429) +  independ2D.x + FixPadFlowX,      (int)(251.2) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrWhite, 0, 7, "Arial Bold");
                    }
                    //0s////KeyShowComment.Create("KeyShowComment", "CommentX", (int)(286), (int) (64), BUTTONX_WIDTH, BUTTONX_HEIGHT,
                    //0s//CORNER_RIGHT_LOWER, ANCHOR_RIGHT, false, PANEL_BUTTON_COLOR, clrGray, clrGreen, 0, 5, "Arial Bold");
                    //--- LBL_C ---//
                    {         gFlow_Pad.LBL_C.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_C.GDS.Set_Desc_4("gFlow_Pad.LBL_C", "n", "Webdings",  17); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_C.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_C.GDS.Set_Location_5((int)(429) +  independ2D.x + FixPadFlowX, (int)(201.6) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_C.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_C");
                              gFlow_Pad.LBL_C.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_C.Action(gFlow_Pad.LBL_C); //
                              //0//gFlow_Pad.LBL_C.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_C", "n",
                              //0// (int)(429) +  independ2D.x + FixPadFlowX,      (int)(201.6) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 17, "Webdings");
                    }
                    //--- LBL_C2 ---//
                    {         gFlow_Pad.LBL_C2.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_C2.GDS.Set_Desc_4("gFlow_Pad.LBL_C2", "l", "Webdings",  18); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_C2.GDS.Set_Color_1(clrDodgerBlue);
                              gFlow_Pad.LBL_C2.GDS.Set_Location_5((int)(429) +  independ2D.x + FixPadFlowX, (int)(203.2) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_C2.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_C2");
                              gFlow_Pad.LBL_C2.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_C2.Action(gFlow_Pad.LBL_C2); //
                              //0//gFlow_Pad.LBL_C2.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_C2", "l",
                              //0// (int)(429) +  independ2D.x + FixPadFlowX,      (int)(203.2) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDodgerBlue, 0, 18, "Webdings");
                    }
                    //--- [ LBL_ line 281 ] ---//
                    //--- [ BTN_ line 597] ---//
                    //if(true){
                    //--- ERORRING?? "Access violation reading location 0x0000000c"// depend to obj name of class..//cant access parent func
                    //--- Cant access two order of parent class...its violet..//Comlpex cann access to C_TOOLS class members//
                    //--- Refrence Dependsency Controling
                    //--- Creator of button class not defined i changed...2021 08 01 ---//
                    //--- BTN_AddChart ---////--------------------------------------------------
                    {         gFlow_Pad.BTN_AddChart.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_AddChart.GDS.Set_Desc_4("gFlow_Pad.BTN_AddChart", "Chart++", "Arial", 7);
                              gFlow_Pad.BTN_AddChart.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_AddChart.GDS.Set_Location_5((int)(442) +  independ2D.x + FixPadFlowX, (int)(158.4) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 3, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_AddChart.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_AddChart.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_AddChart");
                              gFlow_Pad.BTN_AddChart.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_AddChart.Action(gFlow_Pad.BTN_AddChart);//
                              //0//gFlow_Pad.BTN_AddChart.Create(Is_Create,  Is_Move, __FUNCSIG__,  "gFlow_Pad.BTN_AddChart", "Chart++",
                              //0// (int)(442) +  independ2D.x + FixPadFlowX, (int)(158.4) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 3, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan,0, 7, "Arial");
                    }
                    //--- BTN_CloseChart ---//
                    {         gFlow_Pad.BTN_CloseChart.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_CloseChart.GDS.Set_Desc_4("gFlow_Pad.BTN_CloseChart", "û", "Wingdings", 10);
                              gFlow_Pad.BTN_CloseChart.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_CloseChart.GDS.Set_Location_5((int)(480.48) +  independ2D.x + FixPadFlowX, (int)(158.4) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_CloseChart.GDS.Set_Color_3(clrDarkCyan, clrDarkCyan, clrLavender);
                              gFlow_Pad.BTN_CloseChart.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_CloseChart");
                              gFlow_Pad.BTN_CloseChart.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_CloseChart.Action(gFlow_Pad.BTN_CloseChart);//
                              //0//gFlow_Pad.BTN_CloseChart.Create(Is_Create,  Is_Move, __FUNCSIG__, "gFlow_Pad.BTN_CloseChart", "û",
                              //0// (int)(480.48) +  independ2D.x + FixPadFlowX,          (int)(158.4) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, clrDarkCyan, clrLavender, 0, 10, "Wingdings");
                    }
                    //--- BTN_MaximizeChart ---//
                    {         gFlow_Pad.BTN_MaximizeChart.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_MaximizeChart.GDS.Set_Desc_4("gFlow_Pad.BTN_MaximizeChart", "n", "Wingdings", 10);
                              gFlow_Pad.BTN_MaximizeChart.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_MaximizeChart.GDS.Set_Location_5((int)(480.48) +  independ2D.x + FixPadFlowX, (int)(142.4) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_MaximizeChart.GDS.Set_Color_3(clrDarkCyan, clrDarkCyan, clrLavender);
                              gFlow_Pad.BTN_MaximizeChart.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_MaximizeChart");
                              gFlow_Pad.BTN_MaximizeChart.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_MaximizeChart.Action(gFlow_Pad.BTN_MaximizeChart);//
                              //0//gFlow_Pad.BTN_MaximizeChart.Create(Is_Create,  Is_Move, __FUNCSIG__,  "gFlow_Pad.BTN_MaximizeChart", "n",
                              //0// (int)(480.48) +  independ2D.x + FixPadFlowX, (int)(142.4) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, clrDarkCyan, clrLavender, 0, 10, "Wingdings");
                    }
                    //---location on cart butun
                    int XRD = 205; int YRD = -48;
                    //--- BTN_RightUp_OfChart ---//
                    {         gFlow_Pad.BTN_RightUp_OfChart.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_RightUp_OfChart.GDS.Set_Desc_4("gFlow_Pad.BTN_RightUp_OfChart", "ä", "Wingdings", 10);
                              gFlow_Pad.BTN_RightUp_OfChart.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_RightUp_OfChart.GDS.Set_Location_5(305 +  independ2D.x + FixPadFlowX + XRD, 175 + FixPadFlowY + independ2D.y + YRD, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_RightUp_OfChart.GDS.Set_Color_3(clrDarkCyan, clrDarkCyan, clrLavender);
                              gFlow_Pad.BTN_RightUp_OfChart.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_RightUp_OfChart");
                              gFlow_Pad.BTN_RightUp_OfChart.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_RightUp_OfChart.Action(gFlow_Pad.BTN_RightUp_OfChart);//
                    }
                    //--- BTN_RightDown_OfChart ---//
                    {         gFlow_Pad.BTN_RightDown_OfChart.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_RightDown_OfChart.GDS.Set_Desc_4("gFlow_Pad.BTN_RightDown_OfChart", "æ", "Wingdings", 10);
                              gFlow_Pad.BTN_RightDown_OfChart.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_RightDown_OfChart.GDS.Set_Location_5(305 +  independ2D.x + FixPadFlowX + XRD, 190 + FixPadFlowY + independ2D.y + YRD, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_RightDown_OfChart.GDS.Set_Color_3(clrDarkCyan, clrDarkCyan, clrLavender);
                              gFlow_Pad.BTN_RightDown_OfChart.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_RightDown_OfChart");
                              gFlow_Pad.BTN_RightDown_OfChart.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_RightDown_OfChart.Action(gFlow_Pad.BTN_RightDown_OfChart);//
                    }
                    //--- BTN_LeftUp_OfChart ---//
                    {         gFlow_Pad.BTN_LeftUp_OfChart.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_LeftUp_OfChart.GDS.Set_Desc_4("gFlow_Pad.BTN_LeftUp_OfChart", "ã", "Wingdings", 10);
                              gFlow_Pad.BTN_LeftUp_OfChart.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_LeftUp_OfChart.GDS.Set_Location_5(290 +  independ2D.x + FixPadFlowX + XRD, 175 + FixPadFlowY + independ2D.y + YRD, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_LeftUp_OfChart.GDS.Set_Color_3(clrDarkCyan, clrDarkCyan, clrLavender);
                              gFlow_Pad.BTN_LeftUp_OfChart.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_LeftUp_OfChart");
                              gFlow_Pad.BTN_LeftUp_OfChart.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_LeftUp_OfChart.Action(gFlow_Pad.BTN_LeftUp_OfChart);//
                    }
                    //--- BTN_LeftDown_OfChart ---//
                    {         gFlow_Pad.BTN_LeftDown_OfChart.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_LeftDown_OfChart.GDS.Set_Desc_4("gFlow_Pad.BTN_LeftDown_OfChart", "å", "Wingdings", 10);
                              gFlow_Pad.BTN_LeftDown_OfChart.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_LeftDown_OfChart.GDS.Set_Location_5(290 +  independ2D.x + FixPadFlowX + XRD, 190 + FixPadFlowY + independ2D.y + YRD, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_LeftDown_OfChart.GDS.Set_Color_3(clrDarkCyan, clrDarkCyan, clrLavender);
                              gFlow_Pad.BTN_LeftDown_OfChart.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_LeftDown_OfChart");
                              gFlow_Pad.BTN_LeftDown_OfChart.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_LeftDown_OfChart.Action(gFlow_Pad.BTN_LeftDown_OfChart);//
                    }
                    //---
                    //TOOLS.Create(true, "gFlow_Pad.BTN_MaximizeChart", "n",              (int)(480.48) +  independ2D.x + FixPadFlowX,      (int)(142.4) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT,                                                                             CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, clrDarkCyan, clrLavender, 0, 10, "Wingdings");
                    //--- BTN_Bar ---//// --------------------------------------------------
                    {         gFlow_Pad.BTN_Bar.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_Bar.GDS.Set_Desc_4("gFlow_Pad.BTN_Bar", "Bar", "Arial", 7);
                              gFlow_Pad.BTN_Bar.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_Bar.GDS.Set_Location_5((int)(442) +  independ2D.x + FixPadFlowX, (int)(172.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 15, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_Bar.GDS.Set_Color_3(clrLavender, clrDarkCyan, clrDarkCyan);
                              gFlow_Pad.BTN_Bar.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_Bar");
                              gFlow_Pad.BTN_Bar.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_Bar.Action(gFlow_Pad.BTN_Bar);//
                              //0//gFlow_Pad.BTN_Bar.Create(Is_Create,  Is_Move, __FUNCSIG__,   "gFlow_Pad.BTN_Bar", "Bar",
                              //0// (int)(442) +  independ2D.x + FixPadFlowX, (int)(172.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 15, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_Candel ---////
                    {         gFlow_Pad.BTN_Candel.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_Candel.GDS.Set_Desc_4("gFlow_Pad.BTN_Candel", "Candel", "Arial", 7);
                              gFlow_Pad.BTN_Candel.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_Candel.GDS.Set_Location_5((int)(386.1) +  independ2D.x + FixPadFlowX, (int)(172.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 6, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_Candel.GDS.Set_Color_3(clrLavender, clrDarkCyan, clrDarkCyan);
                              gFlow_Pad.BTN_Candel.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_Candel");
                              gFlow_Pad.BTN_Candel.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_Candel.Action(gFlow_Pad.BTN_Candel);//
                              //0//gFlow_Pad.BTN_Candel.Create(Is_Create,  Is_Move, __FUNCSIG__,   "gFlow_Pad.BTN_Candel", "Candel",
                              //0// (int)(386.1) +  independ2D.x + FixPadFlowX, (int)(172.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 6, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_Line ---////
                    {         gFlow_Pad.BTN_Line.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_Line.GDS.Set_Desc_4("gFlow_Pad.BTN_Line", "Line", "Arial", 7);
                              gFlow_Pad.BTN_Line.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_Line.GDS.Set_Location_5((int)(442) +  independ2D.x + FixPadFlowX, (int)(216) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 15, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_Line.GDS.Set_Color_3(clrLavender, clrDarkCyan, clrDarkCyan);
                              gFlow_Pad.BTN_Line.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_Line");
                              gFlow_Pad.BTN_Line.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_Line.Action(gFlow_Pad.BTN_Line);//
                              //0//gFlow_Pad.BTN_Line.Create(Is_Create,  Is_Move, __FUNCSIG__,  "gFlow_Pad.BTN_Line", "Line",
                              //0// (int)(442) +  independ2D.x + FixPadFlowX, (int)(216) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 15, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_FiboExpTrade ---////  --------------------------------------------------
                    {         gFlow_Pad.BTN_FiboExpTrade.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_FiboExpTrade.GDS.Set_Desc_4("gFlow_Pad.BTN_FiboExpTrade", "FiboExp", "Arial", 7);
                              gFlow_Pad.BTN_FiboExpTrade.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_FiboExpTrade.GDS.Set_Location_5((int)(338) +  independ2D.x + FixPadFlowX, (int)(216) + FixPadFlowY + independ2D.y, PANEL_BUTTON2_WIDTH * 1, PANEL_BUTTON2_HEIGHT + 3 - 7, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_FiboExpTrade.GDS.Set_Color_3(clrDarkSlateGray, clrDarkSlateGray, clrWhite);
                              gFlow_Pad.BTN_FiboExpTrade.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_FiboExpTrade");
                              gFlow_Pad.BTN_FiboExpTrade.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_FiboExpTrade.Action(gFlow_Pad.BTN_FiboExpTrade);//
                    }
                    //--- BTN_TrendZ ---////
                    {         gFlow_Pad.BTN_TrendZ.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_TrendZ.GDS.Set_Desc_4("gFlow_Pad.BTN_TrendZ", "TrendX", "Arial Bold", 7);
                              gFlow_Pad.BTN_TrendZ.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_TrendZ.GDS.Set_Location_5((int)(338) +  independ2D.x + FixPadFlowX, (int)(232) + FixPadFlowY + independ2D.y, PANEL_BUTTON2_WIDTH * 1, PANEL_BUTTON2_HEIGHT + 3 - 7, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_TrendZ.GDS.Set_Color_3(clrRed, clrRed, clrWhite);
                              gFlow_Pad.BTN_TrendZ.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_TrendZ");
                              gFlow_Pad.BTN_TrendZ.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_TrendZ.Action(gFlow_Pad.BTN_TrendZ);//
                              //0//gFlow_Pad.BTN_TrendZ.Create(Is_Create,  Is_Move, __FUNCSIG__,  "gFlow_Pad.BTN_TrendZ", "TrendX",
                              //0// (int)(338) +  independ2D.x + FixPadFlowX, (int)(232) + FixPadFlowY + independ2D.y, PANEL_BUTTON2_WIDTH * 1, PANEL_BUTTON2_HEIGHT + 3 - 7,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false,  clrRed, clrRed, clrWhite, 0, 7, "Arial Bold");
                    }
                    //--- BTN_Pivot ---////  --------------------------------------------------
                    {         gFlow_Pad.BTN_Pivot.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_Pivot.GDS.Set_Desc_4("gFlow_Pad.BTN_Pivot", "Pivot", "Arial", 7);
                              gFlow_Pad.BTN_Pivot.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_Pivot.GDS.Set_Location_5((int)(338) + 52 +  independ2D.x + FixPadFlowX, (int)(156.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 13, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_Pivot.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_Pivot.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_Pivot");
                              gFlow_Pad.BTN_Pivot.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_Pivot.Action(gFlow_Pad.BTN_Pivot);//
                              //0//gFlow_Pad.BTN_Pivot.Create(Is_Create,  Is_Move, __FUNCSIG__,  "gFlow_Pad.BTN_Pivot", "Pivot",
                              //0// (int)(338) + 52 +  independ2D.x + FixPadFlowX,   (int)(156.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 13, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_CandelBox ---////
                    {         gCandelBox_Pad.BTN_CandelBox.GDS.Set_Action_2(WhichMode, IsKey);
                              gCandelBox_Pad.BTN_CandelBox.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBox", "CandelBox", "Arial", 7);
                              gCandelBox_Pad.BTN_CandelBox.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBox.GDS.Set_Location_5((int)(338) + independ2D.x + FixPadFlowX, (int)(156.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  + 10, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBox.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBox.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBox");
                              gCandelBox_Pad.BTN_CandelBox.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBox.Action(gCandelBox_Pad.BTN_CandelBox);//
                              //0//gCandelBox_Pad.BTN_CandelBox.Create(Is_Create,  Is_Move, __FUNCSIG__,   "gCandelBox_Pad.BTN_CandelBox", "CandelBox",
                              //0// (int)(338) +  independ2D.x + FixPadFlowX, (int)(156.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH + 10, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_PaternBox ---////
                    {         gFlow_Pad.BTN_PaternBox.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_PaternBox.GDS.Set_Desc_4("gFlow_Pad.BTN_PaternBox", "PaternBox", "Arial", 7);
                              gFlow_Pad.BTN_PaternBox.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_PaternBox.GDS.Set_Location_5((int)(338) + independ2D.x + FixPadFlowX, (int)(186.88) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  + 10, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_PaternBox.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_PaternBox.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_PaternBox");
                              gFlow_Pad.BTN_PaternBox.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_PaternBox.Action(gFlow_Pad.BTN_PaternBox);//
                              //0// gFlow_Pad.BTN_PaternBox.Create(Is_Create,  Is_Move, __FUNCSIG__,   "gFlow_Pad.BTN_PaternBox", "PaternBox",
                              //0// (int)(338) +  independ2D.x + FixPadFlowX,        (int)(186.88) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH + 10, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_ElliottWAVE ---////
                    {         if(!Elliott_PAD.Runed)
                              {         gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Action_2(WhichMode, IsKey);
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Desc_4("gElliotWave_Pad.BTN_ElliottWAVE", "h", "Wingdings", 10);
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Self_1(ButtonDEF_state);
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Location_5((int)(338) + independ2D.x + FixPadFlowX, (int)(171.2) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gElliotWave_Pad.BTN_ElliottWAVE");
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Chart_6();
                                        gElliotWave_Pad.BTN_ElliottWAVE.Action(gElliotWave_Pad.BTN_ElliottWAVE);//
                                        //0// if(!Elliott_PAD.Runed)
                                        //0//gElliotWave_Pad.BTN_ElliottWAVE.Create(Is_Create,  Is_Move, __FUNCSIG__, "gElliotWave_Pad.BTN_ElliottWAVE", "h",
                                        //0// (int)(338) +  independ2D.x + FixPadFlowX, (int)(171.2) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 10, "Wingdings");
                              }//
                              else
                              {         gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Action_2(WhichMode, IsKey);
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Desc_4("gElliotWave_Pad.BTN_ElliottWAVE", "h", "Wingdings", 10);
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Self_1(ButtonDEF_state);
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Location_5((int)(338 - 14) + independ2D.x + FixPadFlowX, (int)(171.2) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gElliotWave_Pad.BTN_ElliottWAVE");
                                        gElliotWave_Pad.BTN_ElliottWAVE.GDS.Set_Chart_6();
                                        gElliotWave_Pad.BTN_ElliottWAVE.Action(gElliotWave_Pad.BTN_ElliottWAVE);//
                                        //0// else
                                        //0//gElliotWave_Pad.BTN_ElliottWAVE.Create(Is_Create,  Is_Move, __FUNCSIG__,   "gElliotWave_Pad.BTN_ElliottWAVE", "h",
                                        //0// (int)(338 - 14) +  independ2D.x + FixPadFlowX,      (int)(171.2) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 10, "Wingdings");
                              }//
                    }
                    //--- BTN_Crosshair ---////
                    {         gFlow_Pad.BTN_Crosshair.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_Crosshair.GDS.Set_Desc_4("gFlow_Pad.BTN_Crosshair", "±", "Wingdings", 10);
                              gFlow_Pad.BTN_Crosshair.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_Crosshair.GDS.Set_Location_5((int)(338) + independ2D.x + FixPadFlowX, (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_Crosshair.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_Crosshair.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_Crosshair");
                              gFlow_Pad.BTN_Crosshair.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_Crosshair.Action(gFlow_Pad.BTN_Crosshair);//
                              //0//gFlow_Pad.BTN_Crosshair.Create(Is_Create,  Is_Move, __FUNCSIG__,  "gFlow_Pad.BTN_Crosshair", "±",
                              //0// (int)(338) +  independ2D.x + FixPadFlowX,      (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 10, "Wingdings");
                    }
                    //--- BTN_ToolsBox ---////
                    {         gToolsBox_Pad.BTN_ToolsBox.GDS.Set_Action_2(WhichMode, IsKey);
                              gToolsBox_Pad.BTN_ToolsBox.GDS.Set_Desc_4("gToolsBox_Pad.BTN_ToolsBox", "]", "Wingdings", 10);
                              gToolsBox_Pad.BTN_ToolsBox.GDS.Set_Self_1(ButtonDEF_state);
                              gToolsBox_Pad.BTN_ToolsBox.GDS.Set_Location_5((int)(353.6) + independ2D.x + FixPadFlowX, (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gToolsBox_Pad.BTN_ToolsBox.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gToolsBox_Pad.BTN_ToolsBox.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gToolsBox_Pad.BTN_ToolsBox");
                              gToolsBox_Pad.BTN_ToolsBox.GDS.Set_Chart_6();
                              gToolsBox_Pad.BTN_ToolsBox.Action(gToolsBox_Pad.BTN_ToolsBox);//
                              //0//gToolsBox_Pad,BTN_ToolsBox.Create(Is_Create,  Is_Move, __FUNCSIG__,   "gToolsBox_Pad.BTN_ToolsBox", "]",
                              //0// (int)(353.6) +  independ2D.x + FixPadFlowX,      (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 27, BUTTONX_HEIGHT,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 10, "Wingdings");
                    }
                    //--- BTN_Zigzag ---////  --------------------------------------------------
                    {         gFlow_Pad.BTN_Zigzag.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_Zigzag.GDS.Set_Desc_4("gFlow_Pad.BTN_Zigzag", "Zigzag", "Arial", 7);
                              gFlow_Pad.BTN_Zigzag.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_Zigzag.GDS.Set_Location_5((int)(495.8) + independ2D.x + FixPadFlowX, (int)(158.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 5, BUTTONX_HEIGHT - 1, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_Zigzag.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_Zigzag.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_Zigzag");
                              gFlow_Pad.BTN_Zigzag.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_Zigzag.Action(gFlow_Pad.BTN_Zigzag);//
                              //0//gFlow_Pad.BTN_Zigzag.Create(Is_Create,  Is_Move, __FUNCSIG__,   "gFlow_Pad.BTN_Zigzag", "Zigzag",
                              //0// (int)(495.8) +  independ2D.x + FixPadFlowX,      (int)(158.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH - 5, BUTTONX_HEIGHT - 1,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 7, "Arial");
                    }
                    //--- BTN_MovingAvrege ---////
                    {         gFlow_Pad.BTN_MovingAvrege.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_MovingAvrege.GDS.Set_Desc_4("gFlow_Pad.BTN_MovingAvrege", "MovingAvrege", "Arial", 7);
                              gFlow_Pad.BTN_MovingAvrege.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_MovingAvrege.GDS.Set_Location_5((int)(475.8) + independ2D.x + FixPadFlowX, (int)(172.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH + 23, BUTTONX_HEIGHT - 1, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_MovingAvrege.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_MovingAvrege.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_MovingAvrege");
                              gFlow_Pad.BTN_MovingAvrege.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_MovingAvrege.Action(gFlow_Pad.BTN_MovingAvrege);//
                              //0//gFlow_Pad.BTN_MovingAvrege.Create(Is_Create,  Is_Move, __FUNCSIG__,   "gFlow_Pad.BTN_MovingAvrege", "MovingAvrege",
                              //0// (int)(475.8) +  independ2D.x + FixPadFlowX, (int)(172.8) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH +23, BUTTONX_HEIGHT - 1,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 7, "Arial");
                    }
                    //--- BTN_WiliamR ---////  --------------------------------------------------
                    {         gFlow_Pad.BTN_WiliamR.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_WiliamR.GDS.Set_Desc_4("gFlow_Pad.BTN_WiliamR", "WiliamR%", "Arial", 7);
                              gFlow_Pad.BTN_WiliamR.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_WiliamR.GDS.Set_Location_5((int)(475.8) + independ2D.x + FixPadFlowX, (int)(187.2) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH + 23, BUTTONX_HEIGHT - 1, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_WiliamR.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_WiliamR.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_WiliamR");
                              gFlow_Pad.BTN_WiliamR.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_WiliamR.Action(gFlow_Pad.BTN_WiliamR);//
                              //0s//  LabelWiliamR.Create("RectLabelWiliamR", "WiliamR", (int)(337.48) +  independ2D.x+ FixPadFlowX , (int)(185.28) + FixPadFlowY + independ2D.y, 41, 8,
                              //0s//CORNER_LEFT_UPPER, ANCHOR_LEFT, false, BORDER_FLAT, clrCadetBlue, clrCadetBlue, 0, STYLE_SOLID, 1, 8, "Arial");
                              //0s//  LabelWiliamR.Create("LabelWiliamR", "WiliamR",     (int)(300+38) +  independ2D.x+ FixPadFlowX  , (int)(188.8) + FixPadFlowY + independ2D.y,
                              //0s//CORNER_LEFT_UPPER, ANCHOR_LEFT, false, clrWhite, 0, 7, "Arial Bold");
                              // ----
                              //0//gFlow_Pad.BTN_WiliamR.Create(Is_Create,  Is_Move, __FUNCSIG__,   "gFlow_Pad.BTN_WiliamR", "WiliamR%",
                              //0// (int)(475.8) +  independ2D.x + FixPadFlowX, (int)(187.2) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH + 23, BUTTONX_HEIGHT - 1,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 7, "Arial");
                    }
                    //--- BTN_Fractals ---////
                    {         gFlow_Pad.BTN_Fractals.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_Fractals.GDS.Set_Desc_4("gFlow_Pad.BTN_Fractals", "Fractals", "Arial", 7);
                              gFlow_Pad.BTN_Fractals.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_Fractals.GDS.Set_Location_5((int)(475.8) + independ2D.x + FixPadFlowX, (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH + 23, BUTTONX_HEIGHT - 1, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_Fractals.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_Fractals.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_Fractals");
                              gFlow_Pad.BTN_Fractals.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_Fractals.Action(gFlow_Pad.BTN_Fractals);//
                              //0s/LabelFractals.Create("RectLabelFractals", "Fractals", (int)(337.48) +  independ2D.x+ FixPadFlowX  , (int)(194.88) + FixPadFlowY + independ2D.y, 41, 8,
                              //0s///0s/CORNER_LEFT_UPPER, ANCHOR_LEFT, false, BORDER_FLAT, clrCadetBlue, clrCadetBlue, 0, STYLE_SOLID, 1, 8, "Arial");
                              //0s///LabelFractals.Create("LabelFractals", "Fractals", (int)(300+38) +  independ2D.x+ FixPadFlowX  , (int)(198.4) + FixPadFlowY + independ2D.y,
                              //0s/ CORNER_LEFT_UPPER, ANCHOR_LEFT, false, clrWhite, 0, 7, "Arial Bold");
                              // ----
                              //0//gFlow_Pad.BTN_Fractals.Create(Is_Create,  Is_Move, __FUNCSIG__,  "gFlow_Pad.BTN_Fractals", "Fractals",
                              //0// (int)(475.8) +  independ2D.x + FixPadFlowX,      (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH + 23, BUTTONX_HEIGHT - 1,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 7, "Arial");
                    }
                    //--- BTN_Stochastic ---////
                    {         gFlow_Pad.BTN_Stochastic.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_Stochastic.GDS.Set_Desc_4("gFlow_Pad.BTN_Stochastic", "Stochastic", "Arial", 7);
                              gFlow_Pad.BTN_Stochastic.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_Stochastic.GDS.Set_Location_5((int)(475.8) + independ2D.x + FixPadFlowX, (int)(216) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH + 23, BUTTONX_HEIGHT - 1, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_Stochastic.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_Stochastic.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_Stochastic");
                              gFlow_Pad.BTN_Stochastic.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_Stochastic.Action(gFlow_Pad.BTN_Stochastic);//
                    }
                    //--- BTN_Stochastic ---////
                    {         gFlow_Pad.BTN_OBV.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_OBV.GDS.Set_Desc_4("gFlow_Pad.BTN_OBV", "OBV", "Arial", 7);
                              gFlow_Pad.BTN_OBV.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_OBV.GDS.Set_Location_5((int)(475.8 + BUTTONX_WIDTH + 23 + 3) + independ2D.x + FixPadFlowX, (int)(187.2) + FixPadFlowY + independ2D.y, 0 + 23 + 8, BUTTONX_HEIGHT - 1, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_OBV.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_OBV.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_Stochastic");
                              gFlow_Pad.BTN_OBV.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_OBV.Action(gFlow_Pad.BTN_OBV);//
                    }
                    //--- BTN_Stochastic ---////
                    {         gFlow_Pad.BTN_MFI.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_MFI.GDS.Set_Desc_4("gFlow_Pad.BTN_MFI", "MFI", "Arial", 7);
                              gFlow_Pad.BTN_MFI.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_MFI.GDS.Set_Location_5((int)(475.8 + BUTTONX_WIDTH + 23 + 3) + independ2D.x + FixPadFlowX, (int)(201.6) + FixPadFlowY + independ2D.y, 0 + 23 + 8, BUTTONX_HEIGHT - 1, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_MFI.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_MFI.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_Stochastic");
                              gFlow_Pad.BTN_MFI.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_MFI.Action(gFlow_Pad.BTN_MFI);//
                    }
                    //--- BTN_Stochastic ---////
                    {         gFlow_Pad.BTN_MACD.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_MACD.GDS.Set_Desc_4("gFlow_Pad.BTN_MACD", "MACD", "Arial", 7);
                              gFlow_Pad.BTN_MACD.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_MACD.GDS.Set_Location_5((int)(475.8 + BUTTONX_WIDTH + 23 + 3) + independ2D.x + FixPadFlowX, (int)(216) + FixPadFlowY + independ2D.y, 0 + 23 + 8, BUTTONX_HEIGHT - 1, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_MACD.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_MACD.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_Stochastic");
                              gFlow_Pad.BTN_MACD.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_MACD.Action(gFlow_Pad.BTN_MACD);//
                    }
                    //}//--- [ BTN_ line 597] ---//
                    //--- [ LBL_ line 904 ] ---//
                    //--- LBL_DL ---//
                    {         gFlow_Pad.LBL_DL.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_DL.GDS.Set_Desc_4("gFlow_Pad.LBL_DL", "n", "Webdings",  16); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_DL.GDS.Set_Color_1(clrDarkCyan);
                              gFlow_Pad.LBL_DL.GDS.Set_Location_5((int)(408.2) +  independ2D.x + FixPadFlowX, (int)(224) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_DL.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_DL");
                              gFlow_Pad.LBL_DL.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_DL.Action(gFlow_Pad.LBL_DL); //
                              //0//gFlow_Pad.LBL_DL.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_DL", "n",
                              //0// (int)(408.2) +  independ2D.x + FixPadFlowX,      (int)(224) + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 16, "Webdings");
                    }
                    //--- LBL_DL2 ---//
                    {         gFlow_Pad.LBL_DL2.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_DL2.GDS.Set_Desc_4("gFlow_Pad.LBL_DL2", "n", "Webdings",  12); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_DL2.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_DL2.GDS.Set_Location_5((int)(408.2) +  independ2D.x + FixPadFlowX, (int)(224) + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_DL2.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_DL2");
                              gFlow_Pad.LBL_DL2.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_DL2.Action(gFlow_Pad.LBL_DL2); //
                              //0//gFlow_Pad.LBL_DL2.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_DL2", "n",
                              //0// (int)(408.2) +  independ2D.x + FixPadFlowX, (int)(224) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 12, "Webdings");
                    }
                    //--- LBL_Exit ---//
                    {         gFlow_Pad.LBL_Exit.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_Exit.GDS.Set_Desc_4("gFlow_Pad.LBL_Exit", "û", "Wingdings",  16); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_Exit.GDS.Set_Color_1(clrRed);
                              gFlow_Pad.LBL_Exit.GDS.Set_Location_5((int)(407.94) +  independ2D.x + FixPadFlowX, (int)(224) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_Exit.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_Exit");
                              gFlow_Pad.LBL_Exit.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_Exit.Action(gFlow_Pad.LBL_Exit); //
                              //0//gFlow_Pad.LBL_Exit.Create(Is_Create,  Is_Move, "gFlow_Pad.LBL_Exit", "û",
                              //0// (int)(407.94) +  independ2D.x + FixPadFlowX, (int)(224) - 1 + FixPadFlowY + independ2D.y,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false,  clrRed, 0, 16, "Wingdings");  ///Segoe MDL2 Assets
                    }
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    //--- LBL_D2 ---//
                    {         gFlow_Pad.LBL_D2ShowComment.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Desc_4("gFlow_Pad.LBL_D2ShowComment-Pip", "SL Pip:   | TP Pip:   | PP Pip:", "Arial Bold",  9); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Location_5((int)(440) +  independ2D.x + FixPadFlowX, (int)(253) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_D2ShowComment-Pip");
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_D2ShowComment.Action(gFlow_Pad.LBL_D2ShowComment); //
                    }
                    //--- LBL_D2 ---//
                    {         gFlow_Pad.LBL_D2ShowComment.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Desc_4("gFlow_Pad.LBL_D2ShowComment2-Pip", "TS Pip:  |  MP Pip:", "Arial Bold",  9); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Location_5((int)(415) +  independ2D.x + FixPadFlowX, (int)(135) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_D2ShowComment2-Pip");
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_D2ShowComment.Action(gFlow_Pad.LBL_D2ShowComment); //
                    }
                    //--- LBL_D2 ---//
                    {         gFlow_Pad.LBL_D2ShowComment.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Desc_4("gFlow_Pad.LBL_D2ShowComment3-Pip", "Lot:", "Arial Bold",  9); ///Segoe MDL2 Assets
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Color_1(clrLavender);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Location_5((int)(505) +  independ2D.x + FixPadFlowX, (int)(238) - 1 + FixPadFlowY + independ2D.y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlow_Pad.LBL_D2ShowComment3-Pip");
                              gFlow_Pad.LBL_D2ShowComment.GDS.Set_Chart_6();
                              gFlow_Pad.LBL_D2ShowComment.Action(gFlow_Pad.LBL_D2ShowComment); //
                    }
                    //--- [ LBL_ line 904 ] ---//
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    {         gFlow_Pad.BTN_AllShapes.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_AllShapes.GDS.Set_Desc_4("gFlow_Pad.BTN_AllShapes", "w", "Webdings", 10);
                              gFlow_Pad.BTN_AllShapes.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_AllShapes.GDS.Set_Location_5((int)(338 - 30) + independ2D.x + FixPadFlowX, (int)(201.6 - 45) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_AllShapes.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_AllShapes.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_AllShapes");
                              gFlow_Pad.BTN_AllShapes.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_AllShapes.Action(gFlow_Pad.BTN_AllShapes);//
                    }
                    {         gFlow_Pad.BTN_EventsSignal.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_EventsSignal.GDS.Set_Desc_4("gFlow_Pad.BTN_EventsSignal", "?", "Webdings", 10);
                              gFlow_Pad.BTN_EventsSignal.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_EventsSignal.GDS.Set_Location_5((int)(338 - 15) + independ2D.x + FixPadFlowX, (int)(201.6 - 45) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_EventsSignal.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_EventsSignal.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_EventsSignal");
                              gFlow_Pad.BTN_EventsSignal.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_EventsSignal.Action(gFlow_Pad.BTN_EventsSignal);//
                    }
                    //--- BTN_Crosshair ---////
                    {         gFlow_Pad.BTN_ChannelSignal.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_ChannelSignal.GDS.Set_Desc_4("gFlow_Pad.BTN_ChannelSignal", "¶", "Webdings", 10);
                              gFlow_Pad.BTN_ChannelSignal.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_ChannelSignal.GDS.Set_Location_5((int)(338 - 15) + independ2D.x + FixPadFlowX, (int)(201.6 - 30) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_ChannelSignal.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_ChannelSignal.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_ChannelSignal");
                              gFlow_Pad.BTN_ChannelSignal.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_ChannelSignal.Action(gFlow_Pad.BTN_ChannelSignal);//
                    }
                    {         gFlow_Pad.BTN_Pivotssignals.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_Pivotssignals.GDS.Set_Desc_4("gFlow_Pad.BTN_PivotsSignal", "á", "Webdings", 10);
                              gFlow_Pad.BTN_Pivotssignals.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_Pivotssignals.GDS.Set_Location_5((int)(338 - 15) + independ2D.x + FixPadFlowX, (int)(201.6 - 15) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_Pivotssignals.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_Pivotssignals.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_PivotsSignal");
                              gFlow_Pad.BTN_Pivotssignals.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_Pivotssignals.Action(gFlow_Pad.BTN_Pivotssignals);//
                    }
                    {         gFlow_Pad.BTN_MACDsignals.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_MACDsignals.GDS.Set_Desc_4("gFlow_Pad.BTN_MACDSignal", "?", "Webdings", 10);
                              gFlow_Pad.BTN_MACDsignals.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_MACDsignals.GDS.Set_Location_5((int)(338 - 15) + independ2D.x + FixPadFlowX, (int)(201.6) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_MACDsignals.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_MACDsignals.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_MACDSignal");
                              gFlow_Pad.BTN_MACDsignals.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_MACDsignals.Action(gFlow_Pad.BTN_MACDsignals);//
                    }
                    //--- BTN_OrderBook ---////
                    {         gFlow_Pad.BTN_OrderBook.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_OrderBook.GDS.Set_Desc_4("gFlow_Pad.BTN_OrderBook", "¨", "Webdings", 10);
                              gFlow_Pad.BTN_OrderBook.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_OrderBook.GDS.Set_Location_5((int)(338 - 15) + independ2D.x + FixPadFlowX, (int)(201.6 + 15) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_OrderBook.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_OrderBook.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_OrderBook");
                              gFlow_Pad.BTN_OrderBook.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_OrderBook.Action(gFlow_Pad.BTN_OrderBook);//
                    }//
                    //--- BTN_CHSD ---////
                    {         gFlow_Pad.BTN_CHSD.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_CHSD.GDS.Set_Desc_4("gFlow_Pad.BTN_CHSD", "è", "Webdings", 10);
                              gFlow_Pad.BTN_CHSD.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_CHSD.GDS.Set_Location_5((int)(338 - 15) + independ2D.x + FixPadFlowX, (int)(201.6 + 30) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_CHSD.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_CHSD.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_CHSD");
                              gFlow_Pad.BTN_CHSD.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_CHSD.Action(gFlow_Pad.BTN_CHSD);//
                    }//
                    //--- BTN_CHSD ---////
                    {         gFlow_Pad.BTN_RRBoxs.GDS.Set_Action_2(WhichMode, IsKey);
                              gFlow_Pad.BTN_RRBoxs.GDS.Set_Desc_4("gFlow_Pad.BTN_RRBoxs", ".", "Webdings", 10);
                              gFlow_Pad.BTN_RRBoxs.GDS.Set_Self_1(ButtonDEF_state);
                              gFlow_Pad.BTN_RRBoxs.GDS.Set_Location_5((int)(338 - 30) + independ2D.x + FixPadFlowX, (int)(201.6 + 30) + FixPadFlowY + independ2D.y, BUTTONX_WIDTH  - 27, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gFlow_Pad.BTN_RRBoxs.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gFlow_Pad.BTN_RRBoxs.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_RRBoxs");
                              gFlow_Pad.BTN_RRBoxs.GDS.Set_Chart_6();
                              gFlow_Pad.BTN_RRBoxs.Action(gFlow_Pad.BTN_RRBoxs);//
                    }//
                    result = true; //
          }//
          if(WhichMode == MODE_MOVE && IsKey )//--flag moving
          {         if(ToolsCall.KeyToolsBox)             { FlowPanelToolsBox( WhichMode, IsKey,  Position2D);} //Alert(ToolsCall.KeyToolsBox); ////
                    if(Elliott_PAD.Is_ElliottWave_Shown)  { Position2D.x -= 108; Position2D.y -= 30; Elliott_PAD.__CALL(WhichMode, IsKey, Position2D);} //
          } //
          //=========================================================|
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ComplexToolsController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_FLOWPANEL::ResetPadPos()
{         static bool KeySwitcher = true;
          //Alert(__FUNCSIG__);//
          if(true)
          {         ObjectSetInteger(0, "gFlow_Pad.LBL_ResetPadPos", OBJPROP_COLOR, clrWhite);
                    ObjectSetInteger(0, "gFlow_Pad.LBL_L2_D", OBJPROP_COLOR, clrDarkCyan); //
                    ObjectSetInteger(0, "gFlow_Pad.LBL_L_D", OBJPROP_COLOR, clrLavender); //
                    IsRest = true; //
                    CALL(MODE_CREATE, false, Sg_Position2D_Def); //
                    //KeySwitcher = false; //
                    CALL(MODE_CREATE, true, Sg_Position2D_Def); //
                    if(Elliott_PAD.Is_ElliottWave_Run)
                    {         Elliott_PAD.__CALL(MODE_CREATE, false, Sg_Position2D_Def); /////need move...
                              Elliott_PAD.__CALL(MODE_CREATE, true, Sg_Position2D_Def); //
                    } //
                    IsRest = false; //
          }
          if(Elliott_PAD.Runed)
          {         gElliotWave_Pad.BTN_ElliottWAVE.GAC.Color(BtnColors_FlowPanelB.DescColorPress);
                    gElliotWave_Pad.BTN_ElliottWAVE.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress);
                    gElliotWave_Pad.BTN_ElliottWAVE.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress);//
                    gElliotWave_Pad.BTN_ElliottWAVE.GAC.State(true);//
          }
          else
          {         gElliotWave_Pad.BTN_ElliottWAVE.GAC.Color(BtnColors_FlowPanelB.DescColor);
                    gElliotWave_Pad.BTN_ElliottWAVE.GAC.BackColor(BtnColors_FlowPanelB.BackColor);
                    gElliotWave_Pad.BTN_ElliottWAVE.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor);//
                    gElliotWave_Pad.BTN_ElliottWAVE.GAC.State(false);//
          }//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_FLOWPANEL::Update()
{         if(gFlow_Pad.IsLBL_D2)
          {         color BackColorPressIN, BorderColorPressIN, DescColorPressIN;
                    gFlow_Pad.BTN_Mover.GAC.Color(DescColorPressIN = clrWhite);///Can inject in self function//
                    gFlow_Pad.BTN_Mover.GAC.BackColor(BackColorPressIN = clrDarkCyan);
                    gFlow_Pad.BTN_Mover.GAC.BorderColor(BorderColorPressIN = clrGray);//
          }//
          {         string desc = "SL Pip:" + (string)ct_Drive.TDD.ct_StopLoss.Curr_Pip + " | TP Pip:" + (string)ct_Drive.TDD.ct_TakeProfit.Curr_Pip + " | PP Pip:" + (string)ct_Drive.TDD.ct_Pending.Curr_Pip;
                    ObjectSetString(0, "gFlow_Pad.LBL_D2ShowComment-Pip", OBJPROP_TEXT, desc); //
                    //---
                    string desc2 = "TS Pip:" + (string)ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.Curr_Pip + " | MP Pip:" + (string)ct_Drive.TDD.ct_Modify.Trails.TrailSL.ProfitMin.Curr_Pip;
                    ObjectSetString(0, "gFlow_Pad.LBL_D2ShowComment2-Pip", OBJPROP_TEXT, desc2); //
                    //--- "Lot:"
                    string desc3 = "Lots:" + (string)ct_Drive.TDD.st_Size.Curr_Lots;
                    ObjectSetString(0, "gFlow_Pad.LBL_D2ShowComment3-Pip", OBJPROP_TEXT, desc3); //
          }
          return true;//
}//
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
