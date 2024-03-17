//+------------------------------------------------------------------+
//|                                              C_BitmapLabelLabel.mqh |
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
struct S_BITMAP_LABEL: public _COBF_
{         void                   S_BITMAP_LABEL() {TYPE_O_00 = OBJ_BITMAP_LABEL;}
//============================================================================================================
          // int                   XOFFSET;                  //The X coordinate of the upper left corner of the rectangular visible area in the graphical objects"Bitmap Label" and "Bitmap" (OBJ_BITMAP_LABEL and OBJ_BITMAP).The value is set in pixels relative to the upper left corner of the original image.  int
          // int                   YOFFSET;                  //The Y coordinate of the upper left corner of the rectangular visible area in the graphical objects "Bitmap Label" and "Bitmap" (OBJ_BITMAP_LABEL and OBJ_BITMAP). The value is set in pixels relative to the upper left corner of the original image.    int
          //
          //color                 COLOR;                    //Color                           color
          //ENUM_LINE_STYLE       STYLE;                    //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                    //Line thickness                  int
          //
          int                   XSIZE;                    //The object's width along the X axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.       int
          int                   YSIZE;                    //The object's height along the Y axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.      int
          ////----------------------------------
          string                BMPFILE_OFF;
          string                BMPFILE_ON;
          //
          // int                   XDISTANCE;                //The distance in pixels along the X axis from the binding corner (see note)  int
          // int                   YDISTANCE;                //The distance in pixels along the Y axis from the binding corner (see note)  int
          //
          bool                  STATE;                    //Button state (pressed / depressed)      bool
          ENUM_BASE_CORNER      CORNER;                   //The corner of the chart to link a graphical object   ENUM_BASE_CORNER
          ENUM_ANCHOR_POINT     ANCHOR_POINT;             //Location of the anchor point of a graphical object  ENUM_ARROW_ANCHOR (for OBJ_ARROW), ENUM_ANCHOR_POINT //(for OBJ_LABEL, OBJ_BITMAP_LABEL and OBJ_TEXT)
          //////----------------------------------
          //bool                  BACK;          //Object in the background        bool
          //long                  ZORDER;        //Priority of a graphical object for receiving events of clicking on a chart (CHARTEVENT_CLICK).The default zero value is set when creating an object; the priority can be increased if necessary.When objects are placed one atop another, only one of them with the highest priority will receive the CHARTEVENT_CLICK event.       long
          //bool                  HIDDEN;        //Prohibit showing of the name of a graphical object in the list of objects from the terminal menu "Charts" - "Objects" - "List of objects". The true value allows to hide an object from the list. By default, true is set to the objects that display calendar events, trading history and to the objects created from MQL4 programs. To see such graphical objects and access their properties, click on the "All" button in the "List of objects" window.   bool
          //bool                  SELECTED;      //Object is selected   bool
          //bool                  SELECTABLE;    //Object availability    bool
          //string                TOOLTIP;       //The text of a tooltip. If the property is not set, then the tooltip generated automatically by the terminal is shown. A tooltip can be disabled by setting the "\n" (line feed) value to it    string
          //////----------------------------------
          //long                  TIMEFRAMES;    //Visibility of an object at timeframes    set of flags flags (OBJ_ALL_PERIODS)  ObjectSetInteger(0,highlevel,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15|OBJ_PERIOD_H1);
          //string                NAME;          //Object name                                                     string
          //string                SYMBOL;        //Symbol for the Chart object                                     string
          //datetime              CREATETIME;    //Time of object creation      datetime    r/o
          //ENUM_OBJECT           TYPE;          //Object type   ENUM_OBJECT   r/o
          bool Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         // if(IsCreated)return false;
                    TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_BITMAP_LABEL;
                    CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };
          //==============================================================================================================
          //int                   XDISTANCE_L_02;
          //int                   YDISTANCE_L_03;
          //int                   WIDTH_10;
          //int                   HEIGHT_12;
          //int                   XOFFSET_L_07;
          //int                   YOFFSET_L_08;
          //bool                  STATE_13;
          //ENUM_BASE_CORNER      CORNER_L_06;
          //ENUM_ANCHOR_POINT     ANCHOR_POINT_9;
          //color                 COLOR_C_00;
          //ENUM_LINE_STYLE       STYLE_9;
          //int                   POINT_WIDTH;
          //bool                  BACK_G_00;
          //bool                  SELECTABLE_G_00;
          //bool                  SELECTED_G_00;
          //bool                  HIDDEN_G_00;
          //int                   ZORDER_G_00; //
          //string                TOOLTIP_G_00;



          //============================================================================================================
          //OBJECT.X_Offset(XOFFSET);               //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_XOFFSET, XOFFSET);
          //OBJECT.Y_Offset(YOFFSET);               //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_YOFFSET, YOFFSET); /
          /////
          //OBJECT.Color(COLOR);                    //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE);                    //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(Width);                    //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);
          ////
          //OBJECT.SetInteger(OBJPROP_XSIZE, XSIZE);//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_XSIZE, XSIZE);
          //OBJECT.SetInteger(OBJPROP_YSIZE, YSIZE);//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_YSIZE, YSIZE);//
          //------------------
          //OBJECT.BmpFileOn(BMPFILE_ON);                   //ObjectSetString(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BMPFILE, 0, BMPFILE_ON);
          //OBJECT.BmpFileOff(BMPFILE_OFF);                  //ObjectSetString(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BMPFILE, 1, BMPFILE_OFF);
          ////
          //OBJECT.X_Distance(XDISTANCE);                  //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_XDISTANCE, XDISTANCE);
          //OBJECT.Y_Distance(YDISTANCE);                  //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_YDISTANCE, YDISTANCE);
          ////
          //OBJECT.State(STATE);                       //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STATE, STATE);
          //OBJECT.Corner(CORNER);                      //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_CORNER, CORNER);
          //OBJECT.SetInteger(OBJPROP_ANCHOR, ANCHOR_POINT);//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ANCHOR, ANCHOR_POINT);//
          //------------------
          /*
                       const long              chart_ID=0,               // chart's ID
                       const string            name="BmpLabel",          // label name
                       const int               sub_window=0,             // subwindow index
                       const int               x=0,                      // X coordinate
                       const int               y=0,                      // Y coordinate
                       const string            file_on="",               // image in On mode
                       const string            file_off="",              // image in Off mode
                       const int               width=0,                  // visibility scope X coordinate
                       const int               height=0,                 // visibility scope Y coordinate
                       const int               x_offset=10,              // visibility scope shift by X axis
                       const int               y_offset=10,              // visibility scope shift by Y axis
                       const bool              state=false,              // pressed/released
                       const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                       const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // anchor type
                       const color             clr=clrRed,               // border color when highlighted
                       const ENUM_LINE_STYLE   style=STYLE_SOLID,        // line style when highlighted
                       const int               point_width=1,            // move point size
                       const bool              back=false,               // in the background
                       const bool              selection=false,          // highlight to move
                       const bool              hidden=true,              // hidden in the object list
                       const long              z_order=0)                // priority for mouse click
                       //---------------------------------------------------------------------------------
                       //--- set label coordinates
          ObjectSetString(chart_ID,name,OBJPROP_BMPFILE,file))
          ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
          ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
          ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
          ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
          ObjectSetInteger(chart_ID,name,OBJPROP_XOFFSET,x_offset);
          ObjectSetInteger(chart_ID,name,OBJPROP_YOFFSET,y_offset);
          ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
          ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
          ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
          ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
          ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
          ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,point_width);
          ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
          ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
          ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
          ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
          ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
          */
          //void SetATTRIBES(    int _x,
          //                     int _y,
          //                     int _width,
          //                     int _height,
          //                     int _x_offset,
          //                     int _y_offset,
          //                     bool _state,
          //                     ENUM_BASE_CORNER _corner,
          //                     ENUM_ANCHOR_POINT _anchor,
          //                     color _clr,
          //                     ENUM_LINE_STYLE _style,
          //                     int _point_width,
          //                     bool _back,
          //                     bool _selectable,
          //                     bool _selection,
          //                     bool _hidden,
          //                     int _z_order  )
          //{         int                   x;
          //          int                   y;
          //          int                   width;
          //          int                   height;
          //          int                   x_offset;
          //          int                   y_offset;
          //          bool                  state;
          //          ENUM_BASE_CORNER      corner;
          //          ENUM_ANCHOR_POINT     anchor;
          //          color                 clr;
          //          ENUM_LINE_STYLE       style;
          //          int                   point_width;
          //          bool                  back;
          //          bool                  selectable;
          //          bool                  selection;
          //          bool                  hidden;
          //          int                   z_order; //
          //}
          //============================================================================================================
};
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsBmpControls.mqh>
// C_Objects             C_BitmapsLabel::OBJ;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_BitmapsLabel: public __COBFA__<S_BITMAP_LABEL>
{         //===================================================================
private:
          string                 m_name;
          int                    m_index;
//===================================================================
public:
          void                  C_BitmapsLabel()  {};
          void                  ~C_BitmapsLabel() {};
          //===================================================================
          CChartObjectBmpLabel  GAC;
          S_BITMAP_LABEL        GDS;

//===================================================================
          bool C_BitmapsLabel::Create(int              mode            = MODE_CREATE,
                                      bool                IsKey          = false,
                                      string              Name            = "LineV",
                                      datetime            XCordinate      = 0,
                                      ENUM_LINE_STYLE     Style           = 1,
                                      int                 Width           = 1,
                                      color               DescColorIN     = clrYellow,
                                      bool                Background      = false);

//===================================================================
          void Create_GDS(int WhichMode, bool IsKey, string n)//, string d, datetime t, double p, color colors, string f, int s, ENUM_ANCHOR_POINT a, bool Is_Delete
          {         GDS.Set_Action_2(WhichMode, IsKey); //---DescX
                    GDS.Set_Desc_1(n);      //---"TEXTs.Description " + n
                    // GDS.Set_Color_1(colors);
                    //-- GDS.Set_Location_4(t, p, 0, a); //---ANCHOR_LEFT
                    //GDS.Set_Common_6(false, 50, false, false, true, "tooltip-" + "BITMAP.LABEL " + n);
                    //GDS.Set_Chart_6();
                    //GDS.Set_ToDelete_1(Is_Delete);
                    //GDS.File_OFF_F_03           = "\\Images\\bmp menu\\horizontal-ligh-Logint.bmp";
                    //GDS.File_ON_F_02            = "\\Images\\bmp menu\\horizontal-light.bmp";
                    GDS.XDISTANCE_L_02          = 75;
                    GDS.YDISTANCE_L_03          = 350;
                    GDS.WIDTH_10                = 150;
                    GDS.HEIGHT_12               = 160;
                    GDS.XOFFSET_L_07            = 0;
                    GDS.YOFFSET_L_08            = 0;
                    GDS.STATE_13                = true;
                    GDS.CORNER_L_06             = CORNER_LEFT_UPPER;
                    GDS.ANCHOR_POINT_9          = ANCHOR_CENTER;
                    GDS.COLOR_C_00              = clrLightGray;
                    GDS.STYLE_9                 = STYLE_SOLID;
                    GDS.POINT_WIDTH             = 2;
                    GDS.BACK_G_00               = false;
                    GDS.SELECTABLE_G_00         = false;
                    GDS.SELECTED_G_00           = false;
                    GDS.HIDDEN_G_00             = false;
                    GDS.ZORDER_G_00             = 100;
                    GDS.TOOLTIP_G_00            = "bitmap.label." + n;
                    Action(this); //
                    //-- if(!GDS.IsCreated)Alert("this is : ", n); //
          }
//===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_BitmapsLabel::Create(int              mode            = MODE_CREATE,
                            bool                IsKey          = false,
                            string              Name            = "LineV",
                            datetime            XCordinate      = 0,
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
                              GAC.Color(DescColorIN);
                              GAC.Width(Width);
                              GAC.Style(Style);// LineV.SetInteger(OBJPROP_STYLE, Style);   // LineV.Style(2)
                              GAC.Background(Background);       //
                              GAC.Description(Description);     //
                              //
                              GAC.X_Offset(10);                   //
                              GAC.Y_Offset(10);                   //
                              GAC.BmpFileOff("");
                              GAC.BmpFileOn("");
                              GAC.X_Size( );
                              GAC.Y_Size( );
                              GAC.X_Distance(10);
                              GAC.Y_Distance(10);
                              //
                              GAC.State(false);
                              GAC.Corner(CORNER_RIGHT_UPPER);
                              ENUM_ANCHOR_POINT anchor = 0;
                              GAC.SetInteger(OBJPROP_ANCHOR, anchor);
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

//+------------------------------------------------------------------+
