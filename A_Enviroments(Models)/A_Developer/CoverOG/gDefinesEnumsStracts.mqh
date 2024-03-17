//+------------------------------------------------------------------+
//|                                                 C_ObjectPack.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class ObjectsStruct     BEGIN                        |
//|              noDependency (Build-In Mine)                        |
//+------------------------------------------------------------------+
//---------------------------------------------------------------------------
#define         MODE_CREATE   0
#define         MODE_MOVE     1
#define         MODE_MINI     2
#define         MODE_REPOS    3
#define         MODE_EXIT     4
#define         MODE_MODIFY   5
#define         MODE_COLOR    6
//---------------------------------------------------------------------------''
//#define         TYPE_CREATE   0
//#define         TYPE_MOVE     1
//#define         TYPE_MINI     2
//#define         TYPE_REPOS    3
//#define         TYPE_EXIT     4
enum E_Point_Possition_Ask       { E_Above_Ask,   E_Below_Ask   };
enum E_Point_Possition_Bid       { E_Above_Bid,   E_Below_Bid   };
enum E_Point_Possition_Open      { E_Above_Open,  E_Below_Open  };
enum E_Point_Possition_Close     { E_Above_Close, E_Below_Close };
enum E_Point_Possition_High      { E_Above_High,  E_Below_High  };
enum E_Point_Possition_Low       { E_Above_Low,   E_Below_Low   };
//---------------------------------------------------------------------------
bool IsCreateMode(int WhichMode) {  return (WhichMode == MODE_CREATE);}
//---------------------------------------------------------------------------
struct S_Level
{         void                   S_Level() {};
          void                   ~S_Level() {};
//-------------------------------------------------------------------
          int                    LEVELS;                       //Number of levels    int
          color                  LEVELCOLOR;                   //Color of the line-level    color   modifier=level number
          ENUM_LINE_STYLE        LEVELSTYLE;                   //Style of the line-level   ENUM_LINE_STYLE modifier=level number
          int                    LEVELWIDTH;                   //Thickness of the line-level    int      modifier=level number
          string                 LEVELTEXT;     //Level description                                               string    modifier=level number
          double                 LEVELVALUE;    //Level value
          int                    _FIRSTLEVEL_00;         //210+n   int             Integer value to set/get the value of Fibonacci object level with index n. Index n can be from 0 (number of levels -1), but not larger than 31
//-------------------------------------------------------------------
};
struct S_point
{         void                   S_point(datetime time1 = 0, double price1 = 0, datetime time2 = 0, double price2 = 0, datetime time3 = 0, double price3 = 0) {};
          void                 ~S_point() {};
//-------------------------------------------------------------------
          datetime              TIME1;                 //0       datetime        Datetime value to set/get first coordinate time part
          double                PRICE1;                //1       double          Double value to set/get first coordinate price part
          datetime              TIME2;                 //2       datetime        Datetime value to set/get second coordinate time part
          double                PRICE2;                //3       double          Double value to set/get second coordinate price part
          datetime              TIME3;                 //4       datetime        Datetime value to set/get third coordinate time part
          double                PRICE3;                //5       double          Double value to set/get third coordinate price part
//-------------------------------------------------------------------
};
struct Sgo_ButtonColor
{
//
          void Sgo_ButtonColor();
          color                 BackColor;
          color                 BorderColor;
          color                 DescColor;              // BtnColors_TradePanel.DescColor
          color                 BackColorPress;      // = clrGold;
          color                 BorderColorPress;      // = clrRed;
          color                 DescColorPress;      // = clrRed; //
          void                  Set_( color backColor, color borderColor,  color descColor, color backColorPress,  color borderColorPress, color descColorPress) //Sgo_ButtonColor
          {         BackColor           = backColor;
                    BorderColor         = borderColor;
                    DescColor           = descColor;            // BtnColors_TradePanel.DescColor
                    BackColorPress      = backColorPress;       // = clrGold;
                    BorderColorPress    = borderColorPress;     // = clrRed;
                    DescColorPress      = descColorPress;       // = clrRed; //
          } //
          //

}; Sgo_ButtonColor  BtnColors_TradePanel, BtnColors_FlowPanel, BtnColors_FlowPanelB;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sgo_ButtonColor::Sgo_ButtonColor()
{         BackColor             = clrBeige ;//clrWhite;//clrBeige//= C'36, 52, 69'
          BorderColor           = C'144,176,239';//clrGray;
          DescColor             = clrBlack;//C'59,41,40';//clrBlack;//= clrYellow,
          BackColorPress        = clrGold;
          BorderColorPress      = clrRed;
          DescColorPress        = clrRed; //
          //---------------------------------------------------------
          color DescColorPressV         = clrWhite;
          color BackColorPressV         = clrDarkCyan;
          color BorderColorPressV       = clrDarkGray;
          color DescColorV              = clrWhite;
          color BackColorV              = clrCadetBlue;
          color BorderColorV            = clrDarkGray;
          //---------------------------------------------------------
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sgp_RightMenuPad_Color
{         color                 CclrLogo;                  //= clrBlue;
          color                 CclrBody;                  //= clrWhite;
          color                 CclrBodyMargine;            //= clrNavy;
          color                 CclrBodyText;               //= clrNavy;
          color                 CclrBodyCyrcleUnPress;      //= clrRed; //
          color                 CclrBodyCyrclePress;        //= clrYellowGreen; //
          color                 CclrBodyCyrcleActive;       //= clrOrange;
          //---
          color                 GclrLogo;                   //= clrBlue;
          color                 GclrBody;                   //= clrWhite;
          color                 GclrBodyMargine;            //= clrNavy;
          color                 GclrBodyText;               //= clrNavy;
          color                 GclrBodyCyrcleUnPress;      //= clrRed; //
          color                 GclrBodyCyrclePress;        //= clrYellowGreen; //
          color                 GclrBodyCyrcleActive;       //= clrOrange;
          //---
          void                  Set_(color CclrLogo_, color CclrBody_, color CclrBodyMargine_, color CclrBodyText_, color CclrBodyCyrcleUnPress_, color CclrBodyCyrclePress_, color CclrBodyCyrcleActive_)
          {         //---menubutton
                    //---
                    CclrLogo                     = GclrLogo                 = CclrLogo_;   ////  (clrBlue,clrWhite,clrNavy,clrNavy,clrRed,clrYellowGreen,clrOrange)
                    CclrBody                     = GclrBody                 = CclrBody_;
                    CclrBodyMargine              = GclrBodyMargine          = CclrBodyMargine_;
                    CclrBodyText                 = GclrBodyText             = CclrBodyText_;
                    CclrBodyCyrcleUnPress        = GclrBodyCyrcleUnPress    = CclrBodyCyrcleUnPress_; //
                    CclrBodyCyrclePress          = GclrBodyCyrclePress      = CclrBodyCyrclePress_; //
                    CclrBodyCyrcleActive         = GclrBodyCyrcleActive     = CclrBodyCyrcleActive_; //
                    //
                    //
          } //
}; Sgp_RightMenuPad_Color RightMenuPad_Color;
//color clrOne                  = clrOrange ;
//color clrTwo                  = clrFireBrick;
//color clrTwo2                 = clrFireBrick;
//color clrLogo                 = clrBlue;
//color clrBody                 = clrWhite;
//color clrBodyMargine          = clrNavy;
//color clrBodyText             = clrNavy;
//color clrBodyCyrcleUnPress    = clrRed; //
//color clrBodyCyrclePress      = clrYellowGreen; //
//color clrBodyCyrcleActive     = clrOrange; //
//+------------------------------------------------------------------+
//|             Class ObjectsStruct     BEGIN                        |
//|              noDependency (Build-In Mine)                        |
//+------------------------------------------------------------------+
