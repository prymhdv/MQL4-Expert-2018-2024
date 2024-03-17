//+------------------------------------------------------------------+
//|                                                  S_GANN_GRID.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

struct S_GANN_GRID: public _COBF_
{         //============================================================================================================
          void                  S_GANN_GRID() {TYPE_O_00 = OBJ_GANNGRID;}; // {Point2XY(0, 0, 0, 0);}; //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          S_point                Point2XY;                                                 //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                        //Line thickness                  int
          //double                SCALE;         //Scale (properties of Gann objects, Fibonacci Arcs and Ellipse)  double
          ////----------------------------------
          //bool                  DIRECTION;       //const bool downtrend
          //////----------------------------------

          //============================================================================================================
          //OBJECT.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(Width);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);//
          //OBJECT.PipsPerBar(SCALE);       //ObjectSetDouble(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SCALE, SCALE); //
          ////----------------------------------
          //OBJECT.Downtrend(DIRECTION) /*ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_DIRECTION, DIRECTION);*/
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
};
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsGann.mqh>
// C_Objects             C_GannsGrid::OBJ;
class C_GannsGrid: public __COBFA__<S_GANN_GRID> 
{
//===================================================================
private:
          string                 m_name;
          int                    m_index;
//===================================================================
public:
          void                   C_GannsGrid()  {};
          void                   ~C_GannsGrid() {};
//===================================================================
          bool                   Create(int                 mode            = MODE_CREATE,
                                        bool                IsKey          = false,
                                        string              Name            = "LineV",
                                        datetime            XCordinate      = 0,
                                        ENUM_LINE_STYLE     Style           = 1,
                                        int                 Width           = 1,
                                        color               DescColorIN     = clrYellow,
                                        bool                Background      = false);
//===================================================================
          CChartObjectGannGrid   GAC;
          S_GANN_GRID            GDS;
       
//===================================================================
//===================================================================
//===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_GannsGrid::Create(int                 mode            = MODE_CREATE,
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
          {         GAC.Create(ChartData_ChartInfo.ID, Name, ChartData_ChartInfo.SubWindow, 0, 0, 0, 0);
                    if(ObjectFind(ChartData_ChartInfo.ID, Name) >= 0)
                    {         GAC.Color(DescColorIN);
                              GAC.Width(Width);
                              GAC.Style(Style);// LineV.SetInteger(OBJPROP_STYLE, Style);   // LineV.Style(2)
                              GAC.Background(Background); //
                              GAC.Description(Description); //
                              //
                              //GAC.Background();
                              //GAC.Selectable();
                              //GAC.Selected();
                              //GAC.Hidden();
                              //GAC.Z_Order();
                              //GAC.Tooltip();
                              GAC.PipsPerBar();///OBJPROP_SCALE//Scale (properties of Gann objects, Fibonacci Arcs and Ellipse)//double
                              //GAC.PipsPerBar()
                              //GAC.Downtrend(true)//
                              return true;//
                    } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LineVertical Error",  __LINE__, __FUNCTION__); //|
          return false;//
}
//+------------------------------------------------------------------+
