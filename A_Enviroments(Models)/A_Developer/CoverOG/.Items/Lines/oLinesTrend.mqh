//+------------------------------------------------------------------+
//|                                                 C_LinesTrend.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\Item_Structs\S_TREND.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI.mqh>
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
struct Sg_Conditions
{         string                name;
          double                Profit;
          double                Current_Line_Price;
          //-----------------------------
          double                Correction_Profit;
          void                  setCorrection_Profit();
          //-----------------------------
          double                Diff_Ask, Diff_Bid, Diff_High, Diff_Low, Diff_Close, Diff_Open ;//
          double                Diff_Ask_Array[], Diff_Bid_Array[], Diff_High_Array[], Diff_Low_Array[], Diff_Close_Array[], Diff_Open_Array[];//
          bool                  Is_Above_Ask, Is_Above_Bid, Is_Above_Open, Is_Above_Close, Is_Above_High, Is_Above_Low ;
          bool                  Is_Supporter, Is_Ressistancer;
          bool                  Is_OnLine;
          bool                  Is_Diff_Ask_Array_Bulish, Is_Diff_Bid_Array_Bulish, Is_Diff_High_Array_Bulish, Is_Diff_Low_Array_Bulish, Is_Diff_Close_Array_Bulish, Is_Diff_Open_Array_Bulish;
          double                Line_Border;
          bool                  Is_Basic__Bulish_Line;
          void                  get_Is_Bulish_Line(double p1, double p2) {Is_Basic__Bulish_Line =  p2 > p1;};
          //-------------------------------------------------------

          bool Cond_A1_TLBulish__AskBelow__Trend_Bulish    ;//= Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Ressistancer && Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Bulish_Line && Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Diff_Open_Array_Bulish;  //    /\
          bool Cond_A1_TLBulish__AskBelow__Trend_Bearish     ;//= Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Ressistancer && Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Bulish_Line && !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Diff_Open_Array_Bulish;
          bool Cond_A1_TLBearish__AskBelow__Trend_Bulish ;//= Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Ressistancer && !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Bulish_Line && Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Diff_Open_Array_Bulish;
          bool Cond_A1_TLBearish__AskBelow__Trend_Bearish   ;//= Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Ressistancer && !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Bulish_Line && !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Diff_Open_Array_Bulish;
          //
          bool Cond_A2_TLBulish__AskAbove__Trend_Bearish     ;//= !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Ressistancer && Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Bulish_Line && Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Diff_Open_Array_Bulish;  //  \/
          bool Cond_A2_TLBulish__AskAbove__Trend_Bulish   ;//= !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Ressistancer && Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Bulish_Line && !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Diff_Open_Array_Bulish;
          bool Cond_A2_TLBearish__AskAbove__Trend_Bulish ;//= !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Ressistancer && !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Bulish_Line && Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Diff_Open_Array_Bulish;
          bool Cond_A2_TLBearish__AskAbove__Trend_Bearish   ;//= !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Ressistancer && !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Bulish_Line && !Data.FLAGs.Line_Prop_Condition_W5_High_.Is_Diff_Open_Array_Bulish;
          //--------------------------------------------------------
          E_Point_Possition_Ask     Line_Possition_Ask;
          E_Point_Possition_Bid     Line_Possition_Bid;
          E_Point_Possition_Open    Line_Possition_Open;
          E_Point_Possition_Close   Line_Possition_Close;
          E_Point_Possition_High    Line_Possition_High;
          E_Point_Possition_Low     Line_Possition_Low;//
          //--------------------------------------------------------
          void setDiff(string n, int shift, int count, int Border, double p1, double p2)
          {         name = n;
                    get_Is_Bulish_Line(p1, p2);
                    Line_Border         = Border;
                    Current_Line_Price  = ObjectGetValueByShift(n, shift);
                    Profit              = (Current_Line_Price - Ask) * 100 * ct_Drive.TDD.st_Size.Curr_Lots ;
                    int Sizer = shift + count;
                    ArrayResize(Diff_Ask_Array, Sizer); ArrayResize(Diff_Bid_Array, Sizer); ArrayResize(Diff_High_Array, Sizer); ArrayResize(Diff_Low_Array, Sizer); ArrayResize(Diff_Close_Array, Sizer); ArrayResize(Diff_Open_Array, Sizer);
                    for(int i = shift; i < Sizer; i++)
                    {         Diff_Ask_Array[i]         = Ask           - Current_Line_Price;  //---are same value for loop
                              Diff_Bid_Array[i]         = Bid           - Current_Line_Price; //
                              Diff_High_Array[i]        = High[i]       - Current_Line_Price;
                              Diff_Low_Array[i]         = Low[i]        - Current_Line_Price; //
                              Diff_Close_Array[i]       = Close[i]      - Current_Line_Price;
                              Diff_Open_Array[i]        = Open[i]       - Current_Line_Price; //
                    }
                    {         Is_Diff_Ask_Array_Bulish  =  Diff_Ask_Array[1]    < Diff_Ask_Array[0]     ? true : false;
                              Is_Diff_Bid_Array_Bulish   = Diff_Bid_Array[1]    < Diff_Bid_Array[0]     ? true : false;
                              Is_Diff_High_Array_Bulish  = Diff_High_Array[1]   < Diff_High_Array[0]    ? true : false;
                              Is_Diff_Low_Array_Bulish   = Diff_Low_Array[1]    < Diff_Low_Array[0]     ? true : false;
                              Is_Diff_Close_Array_Bulish = Diff_Close_Array[1]  < Diff_Close_Array[0]   ? true : false;
                              Is_Diff_Open_Array_Bulish  = Diff_Open_Array[1]   < Diff_Open_Array[0]    ? true : false; //
                              //---Is_Diff_iMA3_Array_Bulish
                    }
                    //------------------------------------------------------------
                    Diff_Ask    = Ask           - Current_Line_Price;
                    Diff_Bid    = Bid           - Current_Line_Price; //
                    Diff_High   = High[0]       - Current_Line_Price;
                    Diff_Low    = Low[0]        - Current_Line_Price; //
                    Diff_Close  = Close[0]      - Current_Line_Price;
                    Diff_Open   = Open[0]       - Current_Line_Price; //
                    //------------------------------------------------------------
                    Is_Above_Ask   = Is_Ressistancer = Ask          < Current_Line_Price;
                    Is_Above_Bid   = Is_Supporter    = Bid          < Current_Line_Price;
                    Is_Above_Open  = Open[0]      < Current_Line_Price;
                    Is_Above_Close = Close[0]     < Current_Line_Price;
                    Is_Above_High  = High[0]      < Current_Line_Price;
                    Is_Above_Low   = Low[0]       < Current_Line_Price;
                    //------------------------------------------------------------
                    Line_Possition_Ask          =  Is_Above_Ask   ?       E_Above_Ask   : E_Below_Ask   ;
                    Line_Possition_Bid          =  Is_Above_Bid   ?       E_Above_Bid   : E_Below_Bid   ;
                    Line_Possition_Open         =  Is_Above_Open  ?       E_Above_Open  : E_Below_Open  ;
                    Line_Possition_Close        =  Is_Above_Close ?       E_Above_Close : E_Below_Close ;
                    Line_Possition_High         =  Is_Above_High  ?       E_Above_High  : E_Below_High  ;
                    Line_Possition_Low          =  Is_Above_Low   ?       E_Above_Low   : E_Below_Low   ;
                    //------------------------------------------------------------
                    Is_OnLine = (MathAbs(Diff_Open) < Line_Border * Point) ? true : false;
                    //------------------------------------------------------------
                    if( Diff_Open > +1)          { bool Is_Range_Open_Over_Pos_1Dollar  = true; }
                    else if( Diff_Open > +2)     { bool Is_Range_Open_Over_Pos_2Dollar  = true; }
                    else if( Diff_Open > +3)     { bool Is_Range_Open_Over_Pos_3Dollar  = true; }
                    else if( Diff_Open > +4)     { bool Is_Range_Open_Over_Pos_4Dollar  = true; }//
                    if( Diff_Close > +1)         { bool Is_Range_Close_Over_Pos_1Dollar = true; }
                    else if( Diff_Close > +2)    { bool Is_Range_Close_Over_Pos_2Dollar = true; }
                    else if( Diff_Close > +3)    { bool Is_Range_Close_Over_Pos_3Dollar = true; }
                    else if( Diff_Close > +4)    { bool Is_Range_Close_Over_Pos_4Dollar = true; }//
                    if( Diff_Ask > +1)           { bool Is_Range_Ask_Over_Pos_1Dollar = true; }
                    else if( Diff_Ask > +2)      { bool Is_Range_Ask_Over_Pos_2Dollar = true; }
                    else if( Diff_Ask > +3)      { bool Is_Range_Ask_Over_Pos_3Dollar = true; }
                    else if( Diff_Ask > +4)      { bool Is_Range_Ask_Over_Pos_4Dollar = true; }//
                    if( Diff_Bid > +1)           { bool Is_Range_Bid_Over_Pos_1Dollar = true; }
                    else if( Diff_Bid > +2)      { bool Is_Range_Bid_Over_Pos_2Dollar = true; }
                    else if( Diff_Bid > +3)      { bool Is_Range_Bid_Over_Pos_3Dollar = true; }
                    else if( Diff_Bid > +4)      { bool Is_Range_Bid_Over_Pos_4Dollar = true; }//
                    if( Diff_High > +1)           { bool Is_Range_High_Over_Pos_1Dollar = true; }
                    else if( Diff_High > +2)      { bool Is_Range_High_Over_Pos_2Dollar = true; }
                    else if( Diff_High > +3)      { bool Is_Range_High_Over_Pos_3Dollar = true; }
                    else if( Diff_High > +4)      { bool Is_Range_High_Over_Pos_4Dollar = true; }//
                    if( Diff_Low > +1)           { bool Is_Range_Low_Over_Pos_1Dollar = true; }
                    else if( Diff_Low > +2)      { bool Is_Range_Low_Over_Pos_2Dollar = true; }
                    else if( Diff_Low > +3)      { bool Is_Range_Low_Over_Pos_3Dollar = true; }
                    else if( Diff_Low > +4)      { bool Is_Range_Low_Over_Pos_4Dollar = true; }//
                    //--------------------------------------------------------------------------
                    if( Diff_Open < -1)          { bool Is_Range_Open_Over_Neg_1Dollar  = true; }
                    else if( Diff_Open < -2)     { bool Is_Range_Open_Over_Neg_2Dollar  = true; }
                    else if( Diff_Open < -3)     { bool Is_Range_Open_Over_Neg_3Dollar  = true; }
                    else if( Diff_Open < -4)     { bool Is_Range_Open_Over_Neg_4Dollar  = true; }//
                    if( Diff_Close < -1)         { bool Is_Range_Close_Over_Neg_1Dollar = true; }
                    else if( Diff_Close < -2)    { bool Is_Range_Close_Over_Neg_2Dollar = true; }
                    else if( Diff_Close < -3)    { bool Is_Range_Close_Over_Neg_3Dollar = true; }
                    else if( Diff_Close < -4)    { bool Is_Range_Close_Over_Neg_4Dollar = true; }//
                    if( Diff_Ask < -1)           { bool Is_Range_Ask_Over_Neg_1Dollar = true; }
                    else if( Diff_Ask < -2)      { bool Is_Range_Ask_Over_Neg_2Dollar = true; }
                    else if( Diff_Ask < -3)      { bool Is_Range_Ask_Over_Neg_3Dollar = true; }
                    else if( Diff_Ask < -4)      { bool Is_Range_Ask_Over_Neg_4Dollar = true; }//
                    if( Diff_Bid < -1)           { bool Is_Range_Bid_Over_Neg_1Dollar = true; }
                    else if( Diff_Bid < -2)      { bool Is_Range_Bid_Over_Neg_2Dollar = true; }
                    else if( Diff_Bid < -3)      { bool Is_Range_Bid_Over_Neg_3Dollar = true; }
                    else if( Diff_Bid < -4)      { bool Is_Range_Bid_Over_Neg_4Dollar = true; }//
                    if( Diff_High < -1)           { bool Is_Range_High_Over_Neg_1Dollar = true; }
                    else if( Diff_High < -2)      { bool Is_Range_High_Over_Neg_2Dollar = true; }
                    else if( Diff_High < -3)      { bool Is_Range_High_Over_Neg_3Dollar = true; }
                    else if( Diff_High < -4)      { bool Is_Range_High_Over_Neg_4Dollar = true; }//
                    if( Diff_Low < -1)           { bool Is_Range_Low_Over_Neg_1Dollar = true; }
                    else if( Diff_Low < -2)      { bool Is_Range_Low_Over_Neg_2Dollar = true; }
                    else if( Diff_Low < -3)      { bool Is_Range_Low_Over_Neg_3Dollar = true; }
                    else if( Diff_Low < -4)      { bool Is_Range_Low_Over_Neg_4Dollar = true; }//
                    //------------------------------------------------------------------------------------------------------------------------
                    Cond_A1_TLBulish__AskBelow__Trend_Bulish       =  Is_Ressistancer &&   Is_Basic__Bulish_Line &&   Is_Diff_Open_Array_Bulish;  //    /\
                    Cond_A1_TLBulish__AskBelow__Trend_Bearish      =  Is_Ressistancer &&   Is_Basic__Bulish_Line && ! Is_Diff_Open_Array_Bulish;
                    Cond_A1_TLBearish__AskBelow__Trend_Bulish      =  Is_Ressistancer && ! Is_Basic__Bulish_Line &&   Is_Diff_Open_Array_Bulish;
                    Cond_A1_TLBearish__AskBelow__Trend_Bearish     =  Is_Ressistancer && ! Is_Basic__Bulish_Line && ! Is_Diff_Open_Array_Bulish;
                    //
                    Cond_A2_TLBulish__AskAbove__Trend_Bearish      = ! Is_Ressistancer &&   Is_Basic__Bulish_Line &&   Is_Diff_Open_Array_Bulish;  //  \/
                    Cond_A2_TLBulish__AskAbove__Trend_Bulish       = ! Is_Ressistancer &&   Is_Basic__Bulish_Line && ! Is_Diff_Open_Array_Bulish;
                    Cond_A2_TLBearish__AskAbove__Trend_Bulish      = ! Is_Ressistancer && ! Is_Basic__Bulish_Line &&   Is_Diff_Open_Array_Bulish;
                    Cond_A2_TLBearish__AskAbove__Trend_Bearish     = ! Is_Ressistancer && ! Is_Basic__Bulish_Line && ! Is_Diff_Open_Array_Bulish;
                    //------------------------------------------------------------------------------------------------------------------------
                    setCorrection_Profit();//
          };//

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sg_Conditions::setCorrection_Profit()
{         //
          if(  Is_Ressistancer ) {  Correction_Profit =  (Current_Line_Price - Ask)  * 100 * ct_Drive.TDD.st_Size.Curr_Lots; }; //   \/
          if( !Is_Ressistancer ) {  Correction_Profit =  (Ask - Current_Line_Price ) * 100 * ct_Drive.TDD.st_Size.Curr_Lots; }; //
          //
          //
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsLines.mqh>

class C_LinesTrend_Demo: public __COBFA__<S_TREND>
{         //====================================================================
private:
          //====================================================================
public:
          void                  C_LinesTrend_Demo() {};
          void                  ~C_LinesTrend_Demo() {};
          string                name;
          void                  getName() {name = GDS.NAME_A_01; };

          //====================================================================
          S_TREND               GDS;
          CChartObjectTrend_MQL4     GAC;
          void                  SetupSignal() {};
          //====================================================================
          Sg_Conditions        Conditions;
          //-------------------------------------------------------------------------------------
          void Create_GDS_Lines(int WhichMode, bool IsKey, string n, datetime t1, double p1, datetime t2, double p2, color c, int w, bool r, ENUM_LINE_STYLE s, bool Is_Delete)
          {         GDS.Set_Action_2(WhichMode, IsKey);
                    GDS.Set_Desc_1(n); getName(); //--"Lines.Trend "  +
                    GDS.Set_Location_4(t1, p1, t2, p2);
                    //GDS.Calc_Locations(PERIOD_CURRENT, AddBar, StartBar);
                    GDS.Set_Color_1(c);
                    GDS.Set_Tip_2(s, w, r); //STYLE_DOT
                    GDS.Set_Common_6(false, 10, true, false, true, n);//"Lines.Trend "
                    GDS.Set_Chart_6();
                    GDS.Set_ToDelete_1(Is_Delete);
                    GDS.Set_Signal_1(true);
                    Action(this);//
                    Conditions.setDiff(GDS.NAME_A_01, 0, 20, 50, GDS.PRICE1, GDS.PRICE2 );
                    //--off---GDS.LookIs_Broken();//
          }

          //----------------------------------------------------------------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_LinesTrend: public __COBFA__<S_TREND>
{
//====================================================================
private:


//====================================================================
public:
          void                  C_LinesTrend()
          {         //
                    if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //
                    //---------------------------------------------
                    //---_Low_Channel_TL_S     = new CObject();    //---'=' - type mismatch         oLinesTrend.mqh     631       43
                    //_Low_Channel_TL_S     = new C_LinesTrend () ;
                    //_High_Channel_TL_R    = new C_LinesTrend () ;
                    //_Low_Channel_         = new C_LinesTrend () ;
                    //_High_Channel_        = new C_LinesTrend () ;
                    //2022.10.27 15:14:16.474     Stack overflow in 'C:\Users\Quartz\AppData\Roaming\MetaQuotes\Terminal\63603D13555081059CD774AC70BBC63B\MQL4\Experts\69ouryA 2018 3xQertS\QUARTS_DEBUGZ.ex4'
                    //The new operator automatically creates an object of a corresponding size, calls the object constructor
                    //---------------------------------------------
          };
          void                  ~C_LinesTrend()
          {         //---------------------------------------------
                    //delete _Low_Channel_TL_S;//    = new CObject();
                    //delete _Low_Channel_TL_S;//    = new C_LinesTrend() ;
                    //delete _High_Channel_TL_R;//   = new C_LinesTrend() ;
                    //delete _Low_Channel_;//        = new C_LinesTrend() ;
                    //delete _High_Channel_;//       = new C_LinesTrend() ;
                    //---------------------------------------------
                    //---------------------------------------------
                    //---_Low_Channel_TL_S     = new CObject();   //---'=' - type mismatch         oLinesTrend.mqh     631       43
                    //_Low_Channel_TL_S     =  C_LinesTrend () ;  //---create with out new operator  mean normal object life time //-- 2022.10.27 15:25:09.105    QUARTS_DEBUGZ XAUUSD.F,M1: invalid pointer access in 'oLinesTrend.mqh' (642,21)
                    //_High_Channel_TL_R    =  C_LinesTrend () ;
                    //_Low_Channel_         =  C_LinesTrend () ;
                    //_High_Channel_        =  C_LinesTrend () ; //make auto  //---2022.10.27 15:26:57.518    QUARTS_DEBUGZ XAUUSD.F,M1: invalid pointer access in 'oLinesTrend.mqh' (652,21)
                    //---------------------------------------------
          };
          string                name;
          void                  getName()         {name = GDS.NAME_A_01; };
          bool                  Is_Bulish_Line;
          void                  get_Is_Bulish_Line() {Is_Bulish_Line =  GDS.PRICE2 > PRICE1;};
          //====================================================================
          S_TREND               GDS;
          CChartObjectTrend_MQL4     GAC;
          void                  SetupSignal() {};
          //====================================================================
          Sg_Conditions        Conditions;
          //====================================================================
          int                   Count ;
          int                   Start ;
          bool                  GradientPositive;//        = TimeCordinateOne > TimeCordinateTwo;
          bool                  GradientNegative;//        = TimeCordinateOne < TimeCordinateTwo;
          double                PriceCordinateOne;// = PriceCordinateOne;
          datetime              TimeCordinateOne;//  = TimeCordinateOne;
          double                PriceCordinateTwo;// = PriceCordinateTwo;
          datetime              TimeCordinateTwo;//  = TimeCordinateTwo;
          double                PriceCordinateThere;// = PriceCordinateTwo;
          datetime              TimeCordinateThere;//  = TimeCordinateTwo;
          //====================================================================
          bool       Create(int WhichMode, bool IsKey, const string Trend_Name =  "UseTrend", const string DescriptionIN = "UseTrendDescription",
                            datetime T1 = 0, double P1 = 0, datetime T2 = 0, double P2 = 0,
                            bool SelectableIN = false, int WidthIN = 1, color  DescColorIN = clrYellow, bool RayedIN = false, ENUM_LINE_STYLE StyleIN = STYLE_SOLID); // UseTrend
          //====================================================================
          static bool    Create2(const long            chart_ID = 0,      // chart's ID
                                 const string          name = "TrendLine", // line name
                                 const int             sub_window = 0,    // subwindow index
                                 datetime              time1 = 0,         // first point time
                                 double                price1 = 0,        // first point price
                                 datetime              time2 = 0,         // second point time
                                 double                price2 = 0,        // second point price
                                 const color           clr = clrRed,      // line color
                                 const ENUM_LINE_STYLE style = STYLE_SOLID, // line style
                                 const int             width = 1,         // line width
                                 const bool            back = false,      // in the background
                                 const bool            selection = true,  // highlight to move
                                 const bool            ray_right = false, // line's continuation to the right
                                 const bool            hidden = true,     // hidden in the object list
                                 const long            z_order = 0);       // priority for mouse click
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          void       TrendZer( bool KeyX );           //TREND line
          //====================================================================
          bool       Delete() {return (GAC.Delete());}

          //---[----Draw Trend Lines//ExtemumPlace by indexed---]
          void Draw_GDS(int WhichMode, bool IsKey, string n, int AddBar, int StartBar, bool Is_Delete, color c, ENUM_LINE_STYLE s, int w, bool r, bool b)
          {         GDS.Set_Action_2(WhichMode, IsKey);
                    GDS.Set_Desc_1(n); getName();//--"Lines.Trend "  +
                    GDS.Set_Check_IsBroken(b);
                    GDS.Set_Location_4(0, 0, 0, 0);
                    GDS.Calc_Locations(PERIOD_CURRENT, AddBar, StartBar); get_Is_Bulish_Line(); //
                    GDS.Set_Color_1(c);
                    GDS.Set_Tip_2(s, w, r); //STYLE_DOT
                    GDS.Set_Common_6(TRUE, 10, true, false, true,  "Lines.Trend " + n);
                    GDS.Set_Chart_6();
                    GDS.Set_ToDelete_1(Is_Delete);
                    GDS.Set_Signal_1(true);
                    Action(this);//
                    Conditions.setDiff(GDS.NAME_A_01, 0, 20, 50, GDS.PRICE1, GDS.PRICE2); //
          } //
          void Draw_GDS_Lines(int WhichMode, bool IsKey, string n, string tooltip, datetime t1, double p1, datetime t2, double p2, color c, int w, bool r, ENUM_LINE_STYLE s, bool Is_Delete)
          {         ObjectDelete(0,n);
                    GDS.Set_Action_2(WhichMode, IsKey);
                    GDS.Set_Desc_1(n); getName(); //--"Lines.Trend "  +
                    GDS.Set_Location_4(t1, p1, t2, p2); get_Is_Bulish_Line();
                    //GDS.Calc_Locations(PERIOD_CURRENT, AddBar, StartBar);
                    GDS.Set_Color_1(c);
                    GDS.Set_Tip_2(s, w, r); //STYLE_DOT
                    GDS.Set_Common_6(TRUE, 10, true, false, true, n + " " + tooltip); //"Lines.Trend "
                    GDS.Set_Chart_6();
                    GDS.Set_ToDelete_1(Is_Delete);
                    GDS.Set_Signal_1(true);
                    Action(this);//
                    Conditions.setDiff(GDS.NAME_A_01, 0, 20, 50, GDS.PRICE1, GDS.PRICE2);
                    //--off---GDS.LookIs_Broken();//
          }
          void       Draw_Channel_High_Low_By_TL(int WhichMode, bool IsKey, bool Is_Delete, string n, datetime t1, double p1, datetime t2, double p2, color c, int w, bool r, ENUM_LINE_STYLE s, ENUM_TIMEFRAMES tf, int StepForward);
          C_LinesTrend_Demo _Low_Channel_TL_S ;
          C_LinesTrend_Demo _High_Channel_TL_R;
          C_LinesTrend_Demo _Low_Channel_;
          C_LinesTrend_Demo _High_Channel_;
          //--------------------------------
          Sg_Point_ Point_Externed_Low, Point_Externed_High;
//====================================================================

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_LinesTrend::Create(int WhichMode, bool IsKey, const string Trend_Name =  "UseTrend", const string DescriptionIN = "UseTrendDescription",
                          datetime T1 = 0, double P1 = 0, datetime T2 = 0, double P2 = 0,
                          bool SelectableIN = false, int WidthIN = 1, color  DescColorIN = clrYellow, bool RayedIN = false, ENUM_LINE_STYLE StyleIN = STYLE_SOLID ) // UseTrend
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesTrend Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          {         if(T1 == 0) { T1 = Time[200];   T2 = Time[20]; P1 = Close[200];   P2 = Close[50]; }
                    if(ObjectFind(ChartData_ChartInfo.ID, Trend_Name) >= 0 && (IsKey && WhichMode == MODE_MOVE ) )
                    {         int CordinateXone = 0; int  CordinateYone = 0;
                              int CordinateXtwo = 0; int  CordinateYtwo = 0;
                              Dev_Chart_Window.TimePrice_To_XY(T1, P1, CordinateXone, CordinateYone);
                              Dev_Chart_Window.TimePrice_To_XY(T2, P2, CordinateXtwo, CordinateYtwo);
                              ObjectSetInteger(0, Trend_Name, OBJPROP_XDISTANCE, CordinateXone);//Label_.X_Distance(XCordinate);
                              ObjectSetInteger(0, Trend_Name, OBJPROP_YDISTANCE, CordinateYone);////Label_.Y_Distance(YCordinate); //
                              return true;//
                    }
                    if(ObjectFind(ChartData_ChartInfo.ID, Trend_Name) >= 0 && (!IsKey && WhichMode == MODE_CREATE )) {return ObjectDelete(ChartData_ChartInfo.ID, Trend_Name);} //
          }
//---
          if(IsKey && WhichMode == MODE_CREATE )
          {         if(ObjectFind(ChartData_ChartInfo.ID, Trend_Name) < 0)
                              if(!GAC.Create(ChartData_ChartInfo.ID, Trend_Name, ChartData_ChartInfo.SubWindow, T1, P1, T2, P2))
                                        ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesTrend Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    if(ObjectFind(ChartData_ChartInfo.ID, Trend_Name) >= 0)
                    {         GAC.Description(DescriptionIN);
                              GAC.Color(DescColorIN);
                              GAC.RayRight(RayedIN);
                              GAC.Width(WidthIN);
                              GAC.SetInteger(OBJPROP_STYLE, 3);
                              GAC.Style(StyleIN);//
                              GAC.Selectable(SelectableIN); //
                    }
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesTrend Error",  __LINE__, __FUNCTION__); return true;//
                    //=========================================================|
          } //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesTrend Error",  __LINE__, __FUNCTION__); //|
          return false;//
//=========================================================|
}

//+------------------------------------------------------------------+
//| Create a trend line by the given coordinates                     |
//+------------------------------------------------------------------+
bool C_LinesTrend::Create2(const long            chart_ID = 0,      // chart's ID
                           const string          name = "TrendLine", // line name
                           const int             sub_window = 0,    // subwindow index
                           datetime              time1 = 0,         // first point time
                           double                price1 = 0,        // first point price
                           datetime              time2 = 0,         // second point time
                           double                price2 = 0,        // second point price
                           const color           clr = clrRed,      // line color
                           const ENUM_LINE_STYLE style = STYLE_SOLID, // line style
                           const int             width = 1,         // line width
                           const bool            back = false,      // in the background
                           const bool            selection = true,  // highlight to move
                           const bool            ray_right = false, // line's continuation to the right
                           const bool            hidden = true,     // hidden in the object list
                           const long            z_order = 0)       // priority for mouse click
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//-- reset the error value
          if(Capitan_ResetLastErrorX)
                    ResetLastError();
//--
          if(ObjectFind(chart_ID, name) < 0)
          {         if(!ObjectCreate(chart_ID, name, OBJ_TREND, sub_window, time1, price1, time2, price2))
                    {         Print(__FUNCTION__,
                                    ": failed to create a trend line! Error code = ", _LastError);
                              return(false); }
                    if(ObjectFind(chart_ID, name) >= 0)//(0 means the main window of the chart), in which the object is found. If the object is not found, the function returns a negative number.
                    {         //-- SetObjects
                              ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);
                              ObjectSetInteger(chart_ID, name, OBJPROP_STYLE, style);
                              ObjectSetInteger(chart_ID, name, OBJPROP_WIDTH, width);
                              ObjectSetInteger(chart_ID, name, OBJPROP_BACK, back);
                              ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, selection);
                              ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, selection);
                              ObjectSetInteger(chart_ID, name, OBJPROP_RAY_RIGHT, ray_right);
                              ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, hidden);
                              ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order); }//
          }//
//--
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return(true);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_LinesTrend::TrendZer( bool KeyX )           //TREND line
{         ///static bool Key = KeyX;///keeep same value
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          ENUM_OBJECT          type        = OBJ_TREND;
          int                  arg_shift    = 500;         // arg_shift
          double               arg_Price1   = Close[500];
          datetime             arg_Time1    = Time[500];
          double               arg_Price2   = Close[10];
          datetime             arg_Time2    = Time[10]; //
          if(Dev_Checkup_Terminal._Mql_.CONNECTED)
          {         arg_Price1 = iLow(Symbol(),  PERIOD_CURRENT, arg_shift);
                    arg_Time1  = iTime(Symbol(), PERIOD_CURRENT, arg_shift);
                    arg_Price2 = iLow(Symbol(),  PERIOD_CURRENT, 5);
                    arg_Time2  = iTime(Symbol(), PERIOD_CURRENT, 5); //
                    if(Capitan_ResetLastErrorX)
                              ResetLastError();
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
          }
          string      nameTREND        = "TREND0";
          string      nameTREND1       = "TREND+1";
          string      nameTREND01      = "TREND-1";
          string      nameTREND2       = "TREND+2";
          string      nameTREND02      = "TREND-2";
          string      nameTREND3       = "TREND+3";
          string      nameTREND03      = "TREND-3";
// Alert(KeyX,",,,","-Line:",__LINE__);
          if(KeyX)
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND) < 0)
                              if(!ObjectCreate(ChartData_ChartInfo.ID, nameTREND, OBJ_TREND, ChartData_ChartInfo.SubWindow, arg_Time1, arg_Price1, arg_Time2, Bid))Alert("Not Object Create" + (string)__LINE__);
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND) >= 0)
                    {         ObjectSet(nameTREND, OBJPROP_COLOR, clrGreen) ;
                              ObjectSet(nameTREND, OBJPROP_WIDTH, 4);
                              ObjectSet(nameTREND, OBJPROP_RAY, true) ;
                              ObjectSet(nameTREND, OBJPROP_STYLE, STYLE_DASH) ; //
                    }
                    //Print("````TREND````Create```"); //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND1) < 0)
                              if(!ObjectCreate(ChartData_ChartInfo.ID, nameTREND1, OBJ_TREND, ChartData_ChartInfo.SubWindow, arg_Time1, arg_Price1 + (0.01 * arg_Price1), arg_Time2, Bid + (0.01 * Bid) ))Alert("Not Object Create" + (string)__LINE__);
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND1) >= 0)
                    {         ObjectSet(nameTREND1, OBJPROP_COLOR, clrWhite) ;
                              ObjectSet(nameTREND1, OBJPROP_WIDTH, 1);
                              ObjectSet(nameTREND1, OBJPROP_RAY, true) ;
                              ObjectSet(nameTREND1, OBJPROP_STYLE, STYLE_DASH) ; //
                    } //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND01) < 0)
                              if(!ObjectCreate(ChartData_ChartInfo.ID, nameTREND01, OBJ_TREND, ChartData_ChartInfo.SubWindow, arg_Time1, arg_Price1 - (0.01 * arg_Price1), arg_Time2, Bid - (0.01 * Bid)))Alert("Not Object Create" + (string)__LINE__);
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND01) >= 0)
                    {         ObjectSet(nameTREND01, OBJPROP_COLOR, clrWhite) ;
                              ObjectSet(nameTREND01, OBJPROP_WIDTH, 1);
                              ObjectSet(nameTREND01, OBJPROP_RAY, true) ;
                              ObjectSet(nameTREND01, OBJPROP_STYLE, STYLE_DASH) ;//
                    }
                    //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND2) < 0)
                              if(!ObjectCreate(ChartData_ChartInfo.ID, nameTREND2, OBJ_TREND, ChartData_ChartInfo.SubWindow, arg_Time1, arg_Price1 + (0.02 * arg_Price1), arg_Time2, Bid + (0.02 * Bid)))Alert("Not Object Create" + (string)__LINE__);
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND2) >= 0)
                    {         ObjectSet(nameTREND2, OBJPROP_COLOR, clrYellow) ;
                              ObjectSet(nameTREND2, OBJPROP_WIDTH, 1);
                              ObjectSet(nameTREND2, OBJPROP_RAY, true) ;
                              ObjectSet(nameTREND2, OBJPROP_STYLE, STYLE_DASH) ;//
                    }
                    //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND02) < 0)
                              if(!ObjectCreate(ChartData_ChartInfo.ID, nameTREND02, OBJ_TREND, ChartData_ChartInfo.SubWindow, arg_Time1, arg_Price1 - (0.02 * arg_Price1), arg_Time2, Bid - (0.02 * Bid)))Alert("Not Object Create" + (string)__LINE__);
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND02) >= 0)
                    {         ObjectSet(nameTREND02, OBJPROP_COLOR, clrYellow) ;
                              ObjectSet(nameTREND02, OBJPROP_WIDTH, 1);
                              ObjectSet(nameTREND02, OBJPROP_RAY, true) ;
                              ObjectSet(nameTREND02, OBJPROP_STYLE, STYLE_DASH) ;//
                    }
                    //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND3) < 0)
                              if(!ObjectCreate(ChartData_ChartInfo.ID, nameTREND3, OBJ_TREND, ChartData_ChartInfo.SubWindow, arg_Time1, arg_Price1 + (0.03 * arg_Price1), arg_Time2, Bid + (0.03 * Bid)))Alert("Not Object Create" + (string)__LINE__);
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND3) >= 0)
                    {         ObjectSet(nameTREND3, OBJPROP_COLOR, clrRed) ;
                              ObjectSet(nameTREND3, OBJPROP_WIDTH, 1);
                              ObjectSet(nameTREND3, OBJPROP_RAY, true) ;
                              ObjectSet(nameTREND3, OBJPROP_STYLE, STYLE_DASH) ;//
                    }
                    //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND03) < 0)
                              if(!ObjectCreate(ChartData_ChartInfo.ID, nameTREND03, OBJ_TREND, ChartData_ChartInfo.SubWindow, arg_Time1, arg_Price1 - (0.03 * arg_Price1), arg_Time2, Bid - (0.03 * Bid)))Alert("Not Object Create" + (string)__LINE__);
                    if(ObjectFind(ChartData_ChartInfo.ID, nameTREND03) >= 0)
                    {         ObjectSet(nameTREND03, OBJPROP_COLOR, clrRed) ;
                              ObjectSet(nameTREND03, OBJPROP_WIDTH, 1);
                              ObjectSet(nameTREND03, OBJPROP_RAY, true) ;
                              ObjectSet(nameTREND03, OBJPROP_STYLE, STYLE_DASH) ;//
                    }
                    //
          }//
          else
          {         C_STATICSUN::DeleteAnaliseAllObjectName(false, false, true, nameTREND, __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(false, false, true, nameTREND1, __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(false, false, true, nameTREND01, __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(false, false, true, nameTREND2, __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(false, false, true, nameTREND02, __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(false, false, true, nameTREND3, __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(false, false, true, nameTREND03, __LINE__); //
          }
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_LinesTrend::Draw_Channel_High_Low_By_TL( int WhichMode, bool IsKey, bool Is_Delete, string n, datetime t1, double p1, datetime t2, double p2, color c, int w, bool r, ENUM_LINE_STYLE s, ENUM_TIMEFRAMES tf, int StepForward)
{         //---z.time  mean shift is lower frist t1 p1
          //***important to say start and end point secound shift is lower that frist......frist param in inc by for
          // Alert("--------------------------" );//
          int ShiftPoint1 = iBarShift(NULL, tf, t1);   int ShiftPoint2 = iBarShift(NULL, tf, t2);;
          bool Is_Bulish = p1 > p2;  //---Z .A
          Sg_Point_      All[];
          int diff_High_Shift  = 0;
          int diff_Low_Shift   = 0;//
          {         int BarCount = ShiftPoint1 + MathAbs(ShiftPoint2 - ShiftPoint1)  + 1;
                    if(BarCount < 4) {return ;};
                    int szArray = ArrayResize(All, BarCount + 2);   //--- Alert(n + " BarCount: ", BarCount, "  sz: ", szArray, "  ShiftPoint2: ", ShiftPoint2, "  ShiftPoint1: ", ShiftPoint1);
                    //---not work--- for(int i = ShiftPoint1  ; i < ShiftPoint2 + 0 ; i++ ) { All[i].set(i, 0, 0, tf, name);    All[i].setArray(All, i, 0, 0, tf, name);          }
                    for(int i = ShiftPoint1  ; i < ShiftPoint2 + 0 ; i++ )
                    {         All[i]._Shift        = i;
                              All[i]._Close        = Close[i];
                              All[i]._Time         = Time[i];
                              All[i].Diff_High     = High[i] - ObjectGetValueByShift( n, i);
                              All[i].Diff_Low      = Low[i]  - ObjectGetValueByShift( n, i);//
                              All[i]._High         = High[i];
                              All[i]._Low          = Low[i];//
                    }
                    //----------------------------------------------------------------------------------------------------
                    double temp_diff_high               = 0;
                    int    temp_diff_High_Shift         = 0;
                    double temp_diff_low                = 0;
                    int    temp_diff_low_Shift          = 0;
                    //
                    double max_High = All[0].Diff_High;
                    double max_Low  = All[0].Diff_Low;
                    {         for(int i = ShiftPoint1  ; i < ShiftPoint2 + 0 ; i++ )
                              {         /*--find maximum_high in aarray--*/  if( All[i].Diff_High > max_High) { max_High = All[i].Diff_High;    temp_diff_high = All[i].Diff_High;   temp_diff_High_Shift = i; All[0].All_diff_High_Shift = i; }//
                                        /*--find maximum_low in aarray--*/   if( All[i].Diff_Low < max_Low)   { max_Low = All[i].Diff_Low;      temp_diff_low = All[i].Diff_Low;     temp_diff_low_Shift = i;  All[0].All_diff_Low_Shift = i; }//
                              }//
                    }
                    diff_High_Shift =   All[0].All_diff_High_Shift;
                    diff_Low_Shift  =   All[0].All_diff_Low_Shift ;//
                    int sz = ArraySize(All);
                    if(sz < diff_Low_Shift)  { ArrayResize(All, sz + diff_Low_Shift ); }
                    if(sz < diff_High_Shift) { ArrayResize(All, sz + diff_High_Shift ); } //
          }
          Sg_Wave_  _channel_High, _channel_Low;
          {         //--Find Slope of trend line calc p1  and p2
                    _channel_High.Dev_Math.Slope            = _channel_High.Dev_Math.calcSlope(p2, p1, t2, t1);
                    _channel_High.Dev_Math.Diff_B           = _channel_High.Dev_Math.GetB_LineFormule(_channel_High.Dev_Math.Slope, t1, p1 + All[diff_High_Shift].Diff_High);
                    _channel_High.Z._Time                    = t1 + PeriodSeconds() * StepForward;
                    _channel_High.Z._Price          = _channel_High.Dev_Math.GetY_LineFormule(_channel_High.Dev_Math.Slope, _channel_High.Z._Time, _channel_High.Dev_Math.Diff_B);
                    _High_Channel_.Create_GDS_Lines(WhichMode, IsKey, n + "_High_Channel_", t2, p2 + All[diff_High_Shift].Diff_High, _channel_High.Z._Time, _channel_High.Z._Price, c, w, false, s, Is_Delete);
                    //
                    //
                    _channel_High.S._Time                    = Time[0] ;
                    _channel_High.S._Price          = _channel_High.Dev_Math.GetY_LineFormule(_channel_High.Dev_Math.Slope, _channel_High.S._Time, _channel_High.Dev_Math.Diff_B);
                    //-- Alert("t1  ", t1, "  p1 + _channel_High.Z._Price  ", _channel_High.Z._Price    );
                    //--Find Slope of trend line calc p1  and p2
          }
          //***************************************************************************************************************************************************************************
          {         _channel_Low.Dev_Math.Slope            = _channel_Low.Dev_Math.calcSlope(p2, p1, t2, t1); //--- Alert("GDS.Wave0_1_4_5_Middle.Z._Price: ", GDS.Wave0_1_4_5_Middle.Z._Price);
                    _channel_Low.Dev_Math.Diff_B           = _channel_Low.Dev_Math.GetB_LineFormule(_channel_Low.Dev_Math.Slope, t1, p1 + All[diff_Low_Shift].Diff_Low);
                    _channel_Low.Z._Time                    = t1 + PeriodSeconds() * StepForward;
                    _channel_Low.Z._Price          = _channel_Low.Dev_Math.GetY_LineFormule(_channel_Low.Dev_Math.Slope, _channel_Low.Z._Time, _channel_Low.Dev_Math.Diff_B);
                    //
                    _channel_Low.S._Time                    = Time[0] ;
                    _channel_Low.S._Price          = _channel_Low.Dev_Math.GetY_LineFormule(_channel_Low.Dev_Math.Slope, _channel_Low.S._Time, _channel_Low.Dev_Math.Diff_B);
                    //---Alert( " _channel_Low.S._Price ", _channel_Low.S._Price);
                    _Low_Channel_.Create_GDS_Lines(WhichMode, IsKey, n + "_Low_Channel_", t2, p2 + All[diff_Low_Shift].Diff_Low, _channel_Low.Z._Time, _channel_Low.Z._Price, c, w, false, s, Is_Delete); //
                    //***************************************************************************************************************************************************************************
          } //
          {         if(!Is_Bulish) {   _High_Channel_TL_R.Create_GDS_Lines(WhichMode, IsKey, n + "_High_Channel" + "TL.R", t2, p2,  All[diff_High_Shift]._Time,  All[diff_High_Shift]._High, clrWhite, 1, false, STYLE_DASH, Is_Delete);}
                    else           {   _Low_Channel_TL_S.Create_GDS_Lines(WhichMode, IsKey, n + "_Low_Channel" + "TL.S",  t2, p2,  All[diff_Low_Shift]._Time,   All[diff_Low_Shift]._Low,   clrWhite, 1, false, STYLE_DASH, Is_Delete);}//
          }
          {         Point_Externed_Low._Price   = All[diff_Low_Shift]._Low;
                    Point_Externed_Low._Time            = All[diff_Low_Shift]._Time;
                    Point_Externed_High._Price  = All[diff_High_Shift]._High;//
                    Point_Externed_High._Time           = All[diff_High_Shift]._Time; //
          }
//
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
////+------------------------------------------------------------------+
//  for(int i = ShiftPoint1  ; i < ShiftPoint2 + 0 ; i++ )
//                    {         All[i].Shift        = i;
//                              All[i].Close        = Close[i];
//                              All[i].Time         = Time[i];
//                              All[i].Diff_High    = High[i] - ObjectGetValueByShift( n, i);
//                              All[i].Diff_Low     = Low[i]  - ObjectGetValueByShift( n, i);//
//                              All[i].High         = High[i];
//                              All[i].Low          = Low[i];//
//                    }
