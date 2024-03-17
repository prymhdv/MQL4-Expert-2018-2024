//+------------------------------------------------------------------+
//|                                                          C_BitmapBar.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

struct S_BITMAP: public _COBF_
{         void                   S_BITMAP() {TYPE_O_00 = OBJ_BITMAP;}
//============================================================================================================
          int                   XOFFSET;              //The X coordinate of the upper left corner of the rectangular visible area in the graphical objects"Bitmap Label" and "Bitmap" (OBJ_BITMAP_LABEL and OBJ_BITMAP).The value is set in pixels relative to the upper left corner of the original image.  int
          int                   YOFFSET;              //The Y coordinate of the upper left corner of the rectangular visible area in the graphical objects "Bitmap Label" and "Bitmap" (OBJ_BITMAP_LABEL and OBJ_BITMAP). The value is set in pixels relative to the upper left corner of the original image.    int
          //
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          int                   WIDTH;                        //Line thickness                  int
          //
          int                   XSIZE;                //The object's width along the X axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.       int
          int                   YSIZE;                //The object's height along the Y axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.      int
          ////----------------------------------
          string                BMPFILE;       //The name of BMP-file for Bitmap Label. See also Resources       string    modifier: 0-state ON, 1-state OFF
          //////----------------------------------

          //============================================================================================================
          //OBJECT.X_Offset(XOFFSET);               //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_XOFFSET, XOFFSET);
          //OBJECT.Y_Offset(YOFFSET);               //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_YOFFSET, YOFFSET); /
          ///
          //OBJECT.Color(COLOR);                    //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE);                    //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(Width);                    //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);
          //
          //OBJECT.SetInteger(OBJPROP_XSIZE, XSIZE);//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_XSIZE, XSIZE);
          //OBJECT.SetInteger(OBJPROP_YSIZE, YSIZE);//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_YSIZE, YSIZE);//
          //----------------------------------
          //OBJECT.BmpFile(BMPFILE);              { /*ObjectSetString( ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BMPFILE, BMPFILE);*/} //privet
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
          bool Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         // if(IsCreated)return false;
                    TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_BITMAP;
                    CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          }; };

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsBmpControls.mqh>
// C_Objects             C_BitmapsBar::OBJ;
//OBJ_BITMAP
//OBJ_BITMAP_LABEL
class C_BitmapsBar: public __COBFA__<S_BITMAP>
{
//====================================================================
private:
          string                 m_name;
          int                    m_index;
//====================================================================
public:
          void                   C_BitmapsBar()  {};
          void                  ~C_BitmapsBar() {};
          //============================================================ChartObjectsBmpControls.mqh
          CChartObjectBitmap    GAC;
          S_BITMAP              GDS;

//====================================================================
//====================================================================
          bool C_BitmapsBar::Create(int                 MODE            = MODE_CREATE,
                                    bool                IsKey          = false,
                                    string              Name            = "LineV",
                                    datetime            XCordinate      = 0,
                                    double              YCordinate      = 0,
                                    ENUM_LINE_STYLE     Style           = 1,
                                    int                 Width           = 1,
                                    color               DescColorIN     = clrYellow,
                                    bool                Background      = false);


//====================================================================
          void Create_GDS(int WhichMode, bool IsKey, string n)//, string d, datetime t, double p, color colors, string f, int s, ENUM_ANCHOR_POINT a, bool Is_Delete
          {         GDS.Set_Action_2(WhichMode, IsKey); //---DescX
                    GDS.Set_Desc_1(n);      //---"TEXTs.Description " + n
                    // GDS.Set_Color_1(colors);
                    //-- GDS.Set_Location_4(t, p, 0, a); //---ANCHOR_LEFT
                    GDS.Set_Common_6(false, 50, false, false, true, "tooltip-" + "TEXTs.Description " + n);
                    GDS.Set_Chart_6();
                    //GDS.Set_ToDelete_1(Is_Delete);
                   // GDS.File_F_01               = "\\Images\\euro.bmp";  
                    GDS.TIME_6                  = Time[300];
                    GDS.PRICE_7                 = Close[300];
                    GDS.WIDTH_10                = 32;  //32  //24
                    GDS.HEIGHT_12               = 32;
                    GDS.XOFFSET_L_07            = 0;  //4  //8
                    GDS.YOFFSET_L_08            = 0;
                    GDS.COLOR_C_00              = clrRed;
                    GDS.STYLE_9                 = STYLE_SOLID;
                    GDS.POINT_WIDTH             = 1;
                    GDS.BACK_G_00               = false;
                    GDS.SELECTABLE_G_00         = true;
                    GDS.SELECTED_G_00           = false;
                    GDS.HIDDEN_G_00             = false;
                    GDS.ZORDER_G_00             = 100;
                    GDS.TOOLTIP_G_00            = "bitmap.bar." + n;
                    Action(this); //
          }
//====================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_BitmapsBar::Create(int                 mode            = MODE_CREATE,
                          bool                IsKey          = false,
                          string              Name            = "LineV",
                          datetime            XCordinate      = 0,
                          double              YCordinate      = 0,
                          ENUM_LINE_STYLE     Style           = 1,
                          int                 Width           = 1,
                          color               DescColorIN     = clrYellow,
                          bool                Background      = false)// LineV
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LineVertical Error",  __LINE__, __FUNCTION__); //|
//=========================================================
          string              Description     = "LineVertical" + Name;
//=========================================================
          if(mode == MODE_MOVE   && IsKey  && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 ) {return ObjectSetInteger(0, Name, OBJPROP_XDISTANCE, XCordinate);} ////Label_.X_Distance(XCordinate);
          if(mode == MODE_CREATE && !IsKey && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 ) {return ObjectDelete(ChartData_ChartInfo.ID, Name);}
          if(mode == MODE_CREATE && IsKey  && ObjectFind(ChartData_ChartInfo.ID, Name) < 0)
          {         GAC.Create(ChartData_ChartInfo.ID, Name, ChartData_ChartInfo.SubWindow, 0, 0);
                    if(ObjectFind(ChartData_ChartInfo.ID, Name) >= 0)
                    {         //
                              ENUM_ANCHOR_POINT anchor = ANCHOR_LEFT_UPPER;
                              GAC.Price(anchor, YCordinate);
                              GAC.Time(anchor, XCordinate);
                              //
                              GAC.Color(DescColorIN);
                              GAC.Width(Width);
                              GAC.Style(Style);// LineV.SetInteger(OBJPROP_STYLE, Style);   // LineV.Style(2)
                              GAC.Background(Background);       //
                              GAC.Description(Description);     //
                              // GAC.X_Offset();                   //
                              // GAC.Y_Offset();                   //
                              GAC.BmpFile();
                              //GAC.SetInteger(OBJPROP_XSIZE, 0);
                              // GAC.SetInteger(OBJPROP_YSIZE, 0);
                              //
                              //GAC.Background();
                              //GAC.Selectable();
                              //GAC.Selected();
                              //GAC.Hidden();
                              //GAC.Z_Order();
                              //GAC.Tooltip();
                              return true;//
                    } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LineVertical Error",  __LINE__, __FUNCTION__); //|
          return false;//
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
