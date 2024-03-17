//+------------------------------------------------------------------+
//|                                                    RectLabel.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//--------------------------------------------------
#define RectLabelDEF_NAME          "LabelDEF_NAME"
//--------------------------------------------------
#define RectLabelDEF_XDISTANCE      200
#define RectLabelDEF_YDISTANCE      200
#define RectLabelDEF_XSIZE          60
#define RectLabelDEF_YSIZE          20
#define RectLabelDEF_CORNER         CORNER_LEFT_UPPER
//--------------------------------------------------
#define RectLabelDEF_COLOR         clrGreen
#define RectLabelDEF_BGCOLOR       clrGray
//--------------------------------------------------
#define RectLabelDEF_tooltip "tooltip_"
//--------------------------------------------------
//--------------------------------------------------
#define RLDEF_NAME          "LabelDEF_NAME"
//--------------------------------------------------
#define RLDEF_XDISTANCE      200
#define RLDEF_YDISTANCE      200
#define RLDEF_XSIZE          60
#define RLDEF_YSIZE          20
#define RLDEF_CORNER         CORNER_LEFT_UPPER
//--------------------------------------------------
#define RLDEF_COLOR         clrGreen
#define RLDEF_BGCOLOR       clrGray
//--------------------------------------------------ENUM_LINE_STYLE , width_10, ENUM_BORDER_TYPE
#define RLDEF_tooltip "tooltip_"
//--------------------------------------------------
///---Progressing non-Generic
///--
///-
///---nonGeneric RectLabelX---///
//{
// RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
// RectLabelX.GDS.Set_Desc_1(RectLabelDEF_NAME);
// RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
// RectLabelX.GDS.Set_Color_2(COLOR_C_00, COLOR_BackGround_C_01);
// RectLabelX.GDS.Set_Location_5(X,Y,XSize,YSize, CORNER_LEFT_UPPER);
// RectLabelX.GDS.Set_Chart_6();
// RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "");
// RectLabelX.Action(RectLabelX);//
//}//
///---Progressing Generic
///--
///-
///---- Generic  gFlowPad.RLBL_Pad_AutoCharter---/// gRectLabelX.GDS
//{
//          gFlowPad.RLBL_Pad_AutoCharter.GDS.Set_Action_2(WhichMode, IsKey);
//          gFlowPad.RLBL_Pad_AutoCharter.GDS.Set_Desc_1(RectLabelDEF_NAME);
//          gFlowPad.RLBL_Pad_AutoCharter.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
//          gFlowPad.RLBL_Pad_AutoCharter.GDS.Set_Color_2(COLOR_C_00, COLOR_BackGround_C_01);
//          gFlowPad.RLBL_Pad_AutoCharter.GDS.Set_Location_5(X, Y, XSize, YSize, CORNER_LEFT_UPPER);
//          gFlowPad.RLBL_Pad_AutoCharter.GDS.Set_Chart_6();
//          gFlowPad.RLBL_Pad_AutoCharter.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "");
//          gFlowPad.RLBL_Pad_AutoCharter.Action(gFlowPad.RLBL_Pad_AutoCharter);//
//              //0// RLBL_.Create(WhichMode, IsKey, "PanelGoldVip1", "RightMiddleBorderBS",
//              //0// MoveX + SaveMoveXCom + XSideBS + (int)(0), YSideBS + (int)(192) + MoveY + SaveMoveYCom, SizeX + SizeinX + SizeExtendX, SizeY + SizeinY + SizeExtendY,
//              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, BORDER_FLAT, clrDarkSlateGray, clrDarkSlateGray, 0, STYLE_SOLID, 1, 8, "Arial" );
//}//
///---Progressing
///--
///-
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\Sg_RECTANGLE_LABEL.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsTxtControls.mqh>   //C_Objects                     Cg_TextsRectLabel::OBJ;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cg_TextsRectLabel: public __COBFA__<S_RECTANGLE_LABEL>
{
//====================================================================
private:
          string                        m_name;
          int                           m_index;
//====================================================================
public:
          void                          Cg_TextsRectLabel() {};
          void                          ~Cg_TextsRectLabel() {};
//====================================================================
          void                          SetAttribe();
//====================================================================
//====================================================================
          S_RECTANGLE_LABEL             GDS; ///---Mine Invoke---///
          CChartObjectRectLabel         GAC; ///---API  Invoke---///

          void                          SetupSignal() {}
//===================================================================///in function memvers must static
          bool   GAC_CreateCall(long ChartID_, string Name_, int SubWindow_) {return GAC.Create(ChartID_, Name_, SubWindow_, 0, 0, 0, 0);}
          bool   Create(int                     MODE            = MODE_CREATE,
                        bool                    IsKey          = false,
                        string                  Name            = "GAC",
                        int                     XCordinate      = 120,
                        int                     YCordinate      = 160,
                        int                     XSize           = 120,
                        int                     YSize           = 40,
                        ENUM_BASE_CORNER        Corner          = CORNER_LEFT_UPPER,
                        ENUM_ANCHOR_POINT       Anchor          = ANCHOR_UPPER, bool Background = false,
                        ENUM_BORDER_TYPE        border          = BORDER_SUNKEN,
                        color                   BackColor       = C'36, 52, 69',
                        color                   DescColor       = clrYellow,
                        double                  Angle           = 0,
                        ENUM_LINE_STYLE         style           = STYLE_SOLID,
                        int                     Width           = 1,
                        int                     FontSize        = 7,
                        string                  Font            = "Arial",
                        int                     LineCOM         = 0,
                        string                  FuncCome        = "None"  ); // RectLabel
          //---  Object_Pack.Texts.RectLabel.Draw_GDS(MODE_CREATE, true, "RL.BackGrandTexts", 0, 0, 200, 200, CORNER_RIGHT_LOWER, clrBlack, clrBlack, STYLE_SOLID, 1, BORDER_FLAT);
          void Draw_GDS(int f_WhichMode, bool f_IsKey, string n, int x, int y, int xs, int ys, ENUM_BASE_CORNER bc, color c, color cb, ENUM_LINE_STYLE s, int w, ENUM_BORDER_TYPE b,bool back)
          {         GDS.Set_Action_2(f_WhichMode, f_IsKey);
                    GDS.Set_Desc_1(n);
                    GDS.Set_Tip_3(s, w, b);//--STYLE_SOLID, 1, BORDER_FLAT
                    GDS.Set_Color_2(c, cb);
                    GDS.Set_Location_5(x, y, xs, ys, bc);//--CORNER_LEFT_UPPER
                    GDS.Set_Chart_6();
                    GDS.Set_Common_6(back, 10, false, false, false, RLDEF_tooltip + "");
                    Action(this);//
          }
//====================================================================

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cg_TextsRectLabel::Create(int                     mode            = MODE_CREATE,
                               bool                    IsKey          = false,
                               string                  Name            = "GAC",
                               int                     XCordinate      = 120,
                               int                     YCordinate      = 160,
                               int                     XSize           = 120,
                               int                     YSize           = 40,
                               ENUM_BASE_CORNER        Corner          = CORNER_LEFT_UPPER,
                               ENUM_ANCHOR_POINT       Anchor          = ANCHOR_UPPER, bool Background = false,
                               ENUM_BORDER_TYPE        border          = BORDER_SUNKEN,
                               color                   BackColor       = C'36, 52, 69',
                               color                   DescColor       = clrYellow,
                               double                  Angle           = 0,
                               ENUM_LINE_STYLE         style           = STYLE_SOLID,
                               int                     Width           = 1,
                               int                     FontSize        = 7,
                               string                  Font            = "Arial",
                               int                     LineCOM         = 0,
                               string                  FuncCome        = "None"  ) // RectLabel
{         color            clr              = clrRed;
          color            back_clr         = C'236,233,216';
          bool             back             = false;
          //=========================================================
          bool IsObj = true;
          bool IsSet = true;
          //--- C_Proxy Proxy  = new C_Proxy();
          if(mode == MODE_CREATE && !IsKey && ObjectFind(0, Name) >= 0)         { return ObjectDelete(0, Name);}
          if(mode == MODE_MOVE   && IsKey  && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 ) { ObjectSetInteger(0, Name, OBJPROP_XDISTANCE, XCordinate); return ObjectSetInteger(0, Name, OBJPROP_YDISTANCE, YCordinate);    } //Label_.Y_Distance(YCordinate); // //Label_.X_Distance(XCordinate);
          if(mode == MODE_CREATE && IsKey  && ObjectFind(ChartData_ChartInfo.ID, Name) < 0)   { return GAC.Create(ChartData_ChartInfo.ID, Name, ChartData_ChartInfo.SubWindow, 0, 0, 0, 0); }
          if(mode == MODE_CREATE && IsKey  && ObjectFind(ChartData_ChartInfo.ID, Name) < 0 )  { return ObjectCreate(0, Name, OBJ_RECTANGLE_LABEL, 0, 0, 0, 0, 0) ? ( Attribe_NoObj(IsSet )) : false;}
          {
//===================================================================
                    if(Capitan_ResetLastErrorX)ResetLastError();
//===================================================================
                    const int              sub_window = 0;           // subwindow index
                    const long             chart_ID   = 0;             // chart's ID
                    const bool             selection  = false;       // highlight to move
                    const bool             hidden     = true;            // hidden in the object list
                    const long             z_order    = 0;              // priority for mouse click
                    const string           tooltip    = "\n";
//===================================================================
                    GDS.CHART_O_00          = chart_ID;
                    GDS.SUBWINDOW_O_00      = sub_window;
                    //
                    GDS.NAME_A_01           = Name;
                    GDS.TYPE_O_00      = OBJ_RECTANGLE_LABEL;
//===================================================================WIDTH
                    return Create(MODE_CREATE, true); //  if(!ObjectCreate(chart_ID, name, OBJ_RECTANGLE_LABEL, sub_window, 0, 0))
                    return(true); //
          }
//=========================================================|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_TextsRectLabel::SetAttribe()
{         if(ObjectFind(0, GDS.NAME_A_01) >= 0 )
          {         ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_XDISTANCE,     GDS.XDISTANCE_L_02);        //GAC.X_Distance(XDISTANCE_4);
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_YDISTANCE,     GDS.YDISTANCE_L_03);        //GAC.Y_Distance(YDISTANCE_5); //
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_XSIZE,         GDS.XSIZE_L_04);            //GAC.X_Size(XSIZE_L_04); //
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_YSIZE,         GDS.YSIZE_L_05);            //GAC.Y_Size(YSIZE_L_05); //
                    //
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_BGCOLOR,       GDS.COLOR_BackGround_C_01);          //GAC.BackColor(COLOR_BackGround_C_01);
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_COLOR,         GDS.COLOR_C_00);            //GAC.Color(COLOR_C_00);
                    //---ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_BORDER_TYPE,   GDS.BORDER_TYPE_11);     //GAC.BorderType(BORDER_TYPE_11);
                    //
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_STYLE,         GDS.STYLE_9); //1        //GAC.Style(STYLE_9);
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_WIDTH,         GDS.WIDTH_10);///3       //GAC.Width(WIDTH_10);
                    //
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_CORNER,        GDS.CORNER_L_06);           //GAC.Corner(CORNER);// GAC.SetInteger(OBJPROP_STYLE, 3); //
                    //
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_BACK,          GDS.BACK_G_00);            //GAC.Background(BACK_G_00);
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_SELECTABLE,    GDS.SELECTABLE_G_00);      //GAC.Selectable(SELECTABLE_G_00);
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_SELECTED,      GDS.SELECTED_G_00);        //GAC.Selected(SELECTED_G_00);
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_HIDDEN,        GDS.HIDDEN_G_00);          //GAC.Hidden(HIDDEN_G_00);
                    ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_ZORDER,        GDS.ZORDER_G_00);//        //GAC.Z_Order(ZORDER_G_00);
                    ObjectSetString(0,  GDS.NAME_A_01, OBJPROP_TOOLTIP,       GDS.TOOLTIP_G_00);         //GAC.Tooltip(TOOLTIP_G_00);
          }
          //
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
