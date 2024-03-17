//+------------------------------------------------------------------+
//|                                          Ctp_TECHNICAL.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.CoverOG.mqh>
//#include <0srcCapitan\QuartsExperts\ErrorController.mqh>
//#include <0srcCapitan\QuartsExperts\ToolsController.mqh>//???..has static members function...
#define LineDepth 3  //#define LineDepth 3
//+------------------------------------------------------------------+
//|             Class Ctp_TECHNICAL Header for analiser     BEGIN      |
//+------------------------------------------------------------------+
struct C_TECHNICAL_PriceDistance
{         double        PriceDistance_Target_Start;
          double        PriceDistance_Target_One;
          double        PriceDistance_Target_Two;
          double        PriceDistance_Target_Three;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Ctp_TECHNICAL_Base
{         //***********************************************************
          bool                  Is_Create;      // = false,
          string                Names;          // = "",
          int                   IDX;           // = 0;
          int                   IDX_Limit;        // = 100,
          ENUM_MA_METHOD        Mode;           // = MODE_SMA,
          ENUM_APPLIED_PRICE    Price;          // = PRICE_CLOSE,
          int                   PeriodX;        // = 0,
          double                Level;          // = 0,
          ENUM_LINE_STYLE       STYLE;          // = STYLE_DOT,
          int                   WIDTH;          // = 1,
          color                 Color;          // = clrRed,
          datetime              shift;          // = 0
          //***********************************************************
          double     MA_Fast[];            //= iMA(NULL, 0, PeriodX, 0, Mode, Price, IDX);
          double     MA_Fast_Shift_1[];    //= iMA(NULL, 0, PeriodX, 0, Mode, Price, IDX + 1);
          double     MA_Fast_Actual;
          //***********************************************************bool Is_Create = false, string Names = "", int IDX = 0, ENUM_MA_METHOD Mode = MODE_SMA, ENUM_APPLIED_PRICE Price = PRICE_CLOSE, int PeriodX = 0,  double Level = 0, ENUM_LINE_STYLE STYLE = STYLE_DOT, int WIDTH = 1, color Color = clrRed, datetime shift = 0
          void       Ctp_TECHNICAL_Base(bool Is_Create, string Names = "", int IDX_Limit = 0, ENUM_MA_METHOD Mode = MODE_SMA, ENUM_APPLIED_PRICE Price = PRICE_CLOSE,
                                        int PeriodX = 0,  double Level = 0, ENUM_LINE_STYLE STYLE = STYLE_DOT, int WIDTH = 1, color Color = clrRed, datetime shift = 0);//
          void                  Ctp_TECHNICAL_Base();    //********!!!!!!!!!**********   if all parameters are default then not recognize it is default constractor
          void                  ~Ctp_TECHNICAL_Base();
          void                  initer();
          bool                  Update();
          bool                  UPDATED;
          //Cgs_DevObjectPack     Object_Pack;
          //
          void                  DeEMAset_______NoUse();
          void                  TechnicalXRun_EMA20_Levels(bool f_is_Create, int f_IDX_limit);

          //----
          void                  MA_Create(bool b);
          void                  Draw_Trend_Section();
          void                  Erase_Trend_Section();
          // void               OnTimerRedrewLinesTechnicalController();
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_TECHNICAL_Base::Ctp_TECHNICAL_Base() { initer(); }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_TECHNICAL_Base::Ctp_TECHNICAL_Base(bool f_Is_Create, string f_Names = "", int f_IDX_Limit = 0, ENUM_MA_METHOD f_Mode = MODE_SMA, ENUM_APPLIED_PRICE f_Price = PRICE_CLOSE,
                    int f_PeriodX = 0, double f_Level = 0, ENUM_LINE_STYLE f_STYLE = STYLE_DOT, int f_WIDTH = 1, color f_Color = clrRed, datetime f_shift = 0)
{         Is_Create     = f_Is_Create;    // = false,
          Names         = f_Names;  // = "",
          IDX_Limit     = f_IDX_Limit;           // = 0,
          Mode          = f_Mode;           // = MODE_SMA,
          Price         = f_Price;          // = PRICE_CLOSE,
          PeriodX       = f_PeriodX;       // = 0,
          Level         = f_Level;          // = 0,
          STYLE         = f_STYLE;          // = STYLE_DOT,
          WIDTH         = f_WIDTH;          // = 1,
          Color         = f_Color;         // = clrRed,
          shift         = f_shift;         // = 0
          initer();//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_TECHNICAL_Base:: initer()
{         ArrayResize(MA_Fast, IDX_Limit + 1);
          ArrayResize(MA_Fast_Shift_1, IDX_Limit + 1); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_TECHNICAL_Base::~Ctp_TECHNICAL_Base()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ctp_TECHNICAL_Base::Update()
{         UPDATED = false;
//Alert("Start-Stack error " + __FUNCTION__);
//==========================================================
// SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
//==========================================================
//
          UPDATED = true;
//
//==========================================================
// SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
//==========================================================
          return UPDATED;//
//
}
//+------------------------------------------------------------------+
//|                                                                  |bool Is_Create = false, string Names = "", int IDX = 0, ENUM_MA_METHOD Mode = MODE_SMA, ENUM_APPLIED_PRICE Price = PRICE_CLOSE, int PeriodX = 0,  double Level = 0, ENUM_LINE_STYLE STYLE = STYLE_DOT, int WIDTH = 1, color Color = clrRed, datetime shift = 0
//+------------------------------------------------------------------+
void Ctp_TECHNICAL_Base::Draw_Trend_Section()
{         //*****************************
          MA_Fast[IDX]                  = iMA(NULL, 0, PeriodX, 0, Mode, Price, IDX);
          MA_Fast_Shift_1[IDX + 1]      = iMA(NULL, 0, PeriodX, 0, Mode, Price, IDX + 1);
//---
//----
          if (!Is_Create) { C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, Names  + IntegerToString(IDX), __LINE__);  return;}
          if(Period() == PERIOD_MN1 || Period() == PERIOD_W1)IDX /= 2;
          if(Price == PRICE_HIGH)
                    if (ObjectFind(0, Names + IntegerToString(IDX, 0, 0) ) < 0)
                    {         ObjectCreate(0, Names + IntegerToString(IDX, 0, 0), OBJ_TREND, 0, Time[0 + IDX] - shift, MA_Fast[IDX] + 20, Time[0 + IDX + 1], MA_Fast_Shift_1[IDX + 1] + 20 );
                              if (ObjectFind(0, Names +  IntegerToString(IDX, 0, 0) ) >= 0)
                              {         ObjectSetInteger(0, Names +  IntegerToString(IDX, 0, 0), OBJPROP_RAY, false); //
                                        // ObjectSetInteger(0, Names + "ooooLM#" + IntegerToString(IDX, 0, 0), OBJPROP_ANCHOR, ANCHOR_BOTTOM); //
                                        ObjectSetInteger(0, Names +  IntegerToString(IDX, 0, 0), OBJPROP_STYLE, STYLE); //
                                        ObjectSetInteger(0, Names +   IntegerToString(IDX, 0, 0), OBJPROP_WIDTH, WIDTH); //
                                        ObjectSetInteger(0, Names +   IntegerToString(IDX, 0, 0), OBJPROP_COLOR, Color); //
                                        ObjectSetInteger(0, Names +   IntegerToString(IDX, 0, 0), OBJPROP_BACK, True); //
                                        //
                              }//
                    }//
          if(Price == PRICE_CLOSE)
                    if (ObjectFind(0, Names + IntegerToString(IDX, 0, 0) ) < 0)
                    {         ObjectCreate(0, Names + IntegerToString(IDX, 0, 0), OBJ_TREND, 0, Time[0 + IDX] - shift, MA_Fast[IDX] - 0 + Level, Time[0 + IDX + 1], MA_Fast_Shift_1[IDX + 1] - 0 + Level);
                              if (ObjectFind(0, Names + IntegerToString(IDX, 0, 0) ) >= 0)
                              {         ObjectSetInteger(0, Names + IntegerToString(IDX, 0, 0), OBJPROP_RAY, false); //
                                        //ObjectSetInteger(0, Names + IntegerToString(IDX, 0, 0), OBJPROP_ANCHOR, ANCHOR_BOTTOM); //
                                        ObjectSetInteger(0, Names + IntegerToString(IDX, 0, 0), OBJPROP_STYLE, STYLE); //
                                        ObjectSetInteger(0, Names + IntegerToString(IDX, 0, 0), OBJPROP_WIDTH, WIDTH); //
                                        ObjectSetInteger(0, Names + IntegerToString(IDX, 0, 0), OBJPROP_COLOR, Color); //
                                        ObjectSetInteger(0, Names +   IntegerToString(IDX, 0, 0), OBJPROP_BACK, True); //
                              } //
                    } //
          if(Price == PRICE_LOW)
                    if (ObjectFind(0, Names + IntegerToString(IDX, 0, 0) ) < 0)
                    {         ObjectCreate(0, Names + IntegerToString(IDX, 0, 0), OBJ_TREND, 0, Time[0 + IDX] - shift, MA_Fast[IDX] - 20, Time[0 + IDX + 1], MA_Fast_Shift_1[IDX + 1] - 20 );
                              if (ObjectFind(0, Names + IntegerToString(IDX, 0, 0) ) >= 0)
                              {         ObjectSetInteger(0, Names + IntegerToString(IDX, 0, 0), OBJPROP_RAY, false); //
                                        //ObjectSetInteger(0, Names + IntegerToString(IDX, 0, 0), OBJPROP_ANCHOR, ANCHOR_BOTTOM); //
                                        ObjectSetInteger(0, Names + IntegerToString(IDX, 0, 0), OBJPROP_STYLE, STYLE); //
                                        ObjectSetInteger(0, Names + IntegerToString(IDX, 0, 0), OBJPROP_WIDTH, WIDTH); //
                                        ObjectSetInteger(0, Names + IntegerToString(IDX, 0, 0), OBJPROP_COLOR, Color); //
                                        ObjectSetInteger(0, Names +   IntegerToString(IDX, 0, 0), OBJPROP_BACK, True); //
                              }//
                    } //
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
//============================//============================
}//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+bool Is_Create = false, string Names = "", int IDX_Limit = 100, ENUM_MA_METHOD Mode = MODE_EMA, ENUM_APPLIED_PRICE Price = PRICE_CLOSE, int PeriodX = 12, double Level = 0, ENUM_LINE_STYLE STYLE = STYLE_DOT, int WIDTH = 1, color Color = clrRed, datetime shift = 0
void Ctp_TECHNICAL_Base::MA_Create(bool b)
{         if(b)
          {         for(IDX = 0; IDX < IDX_Limit ; IDX++) { Draw_Trend_Section(); } //
          }
          else
          {         Erase_Trend_Section();//
          }
          MA_Fast_Actual = MA_Fast[0] + Level;
          Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "To.30" + Names,"",  Time[0], MA_Fast_Actual, Time[0] + PeriodSeconds() * 30, MA_Fast_Actual, Color, WIDTH, false, STYLE, false); //
//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_TECHNICAL_Base::Erase_Trend_Section( )
{         for(  IDX = 0; IDX < IDX_Limit ; IDX++) { C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, Names  + IntegerToString(IDX), __LINE__); } }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_TECHNICAL_Base::TechnicalXRun_EMA20_Levels(bool f_is_Create, int f_IDX_limit)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
//============================//============================
          IDX_Limit = f_IDX_limit;
          for(   IDX = 0; IDX < IDX_Limit ; IDX++)
          {         //
                    //Sleep(1);
                    if (ObjectFind(0, "HIGH#" + IntegerToString(IDX, 0, 0) ) < 0)
                    {         if (!ObjectCreate(0, "HIGH#" + IntegerToString(IDX, 0, 0), OBJ_TEXT, 0, Time[0 + IDX], High[0 + IDX] + 10 ))
                                        //============================//============================
                                        ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              if (ObjectFind(0, "HIGH#" + IntegerToString(IDX, 0, 0) ) >= 0)
                              {         ObjectSetText("HIGH#" + IntegerToString(IDX, 0, 0), "*" + "\x0#" + IntegerToString(IDX, 0, 0), 13, "Segoe MDL2 Assets", clrBlue);
                                        //---off---Draw_Trend_Section(true, "HIGH", IDX, MODE_EMA, PRICE_HIGH, 12,  0,  STYLE_SOLID, 1, clrBlue); //
                              } //
                    }
                    if (!f_is_Create) //
                    {         C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "HIGH#" + IntegerToString(IDX), __LINE__);
                              //============================//============================
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              //
                              //---off---Draw_Trend_Section(false, "HIGH", IDX, MODE_EMA, PRICE_HIGH, 12,  0,  STYLE_SOLID, 1, clrBlue);
                              //
                    }
                    //====================================================================
                    //====================================================================
                    if (ObjectFind(0, "CLOSE#" + IntegerToString(IDX, 0, 0) ) < 0)
                    {         if(!ObjectCreate(0, "CLOSE#" + IntegerToString(IDX, 0, 0), OBJ_TEXT, 0, Time[0 + IDX], Close[0 + IDX]  ))
                                        //============================//============================
                                        ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              if (ObjectFind(0, "CLOSE#" + IntegerToString(IDX, 0, 0) ) >= 0)
                              {         ObjectSetText("CLOSE#" + IntegerToString(IDX, 0, 0), "*" + "\x0#" + IntegerToString(IDX, 0, 0), 13, "Segoe MDL2 Assets", clrWhite);
                                        //---off---Draw_Trend_Section(true, "CLOSE", IDX, MODE_EMA, PRICE_CLOSE, 12,  0,  STYLE_SOLID, 1, clrYellow); //
                              } //
                    }
                    if (!f_is_Create) //
                    {         C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "CLOSE#" + IntegerToString(IDX), __LINE__);
                              //============================//============================
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              //---off---Draw_Trend_Section(false, "CLOSE", IDX, MODE_EMA, PRICE_CLOSE, 12,  0,  STYLE_SOLID, 1, clrYellow); //
                              //
                    }
                    //==============
                    //==============
                    if (ObjectFind(0, "Median#" + IntegerToString(IDX, 0, 0) ) < 0)
                    {         if(!ObjectCreate(0, "Median#" + IntegerToString(IDX, 0, 0), OBJ_TEXT, 0, Time[0 + IDX], ( High[0 + IDX] + Low[0 + IDX]) / 2 ))
                                        //============================//============================
                                        ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              if (ObjectFind(0, "Median#" + IntegerToString(IDX, 0, 0) ) >= 0)
                              {         if(!ObjectSetText("Median#" + IntegerToString(IDX, 0, 0), "*" + "\x0#" + IntegerToString(IDX, 0, 0), 13, "Segoe MDL2 Assets", clrYellow))
                                                  //============================//============================
                                                  ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
                                        //============================//============================
                              } //
                    }
                    if (!f_is_Create) //
                    {         C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "Median#" + IntegerToString(IDX), __LINE__);
                              //============================//============================
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              //
                    }
                    //==============//////////////////////////////////////////////////////////////////
                    if (ObjectFind(0, "LOW#" + IntegerToString(IDX, 0, 0) ) < 0)
                    {         if(!ObjectCreate(0, "LOW#" + IntegerToString(IDX, 0, 0), OBJ_TEXT, 0, Time[0 + IDX], Low[0 + IDX] - 10 ))
                                        //============================//============================
                                        ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              if (ObjectFind(0, "LOW#" + IntegerToString(IDX, 0, 0) ) >= 0)
                              {         ObjectSetText("LOW#" + IntegerToString(IDX, 0, 0), "*" + "\x0#" + IntegerToString(IDX, 0, 0), 13, "Segoe MDL2 Assets", clrRed);
                                        //---off---Draw_Trend_Section(true, "LOW", IDX, MODE_EMA, PRICE_LOW, 12,  0,  STYLE_DOT, 1, clrRed); //
                              } //
                    } //
                    if (!f_is_Create) //
                    {         C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "LOW#" + IntegerToString(IDX), __LINE__);
                              //============================//============================
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              //
                              //---off---Draw_Trend_Section(false, "LOW", IDX, MODE_EMA, PRICE_LOW, 12,  0,  STYLE_DOT, 1, clrRed); //
                    }
                    //
                    if (ObjectFind(0, "LOWoL#" + IntegerToString(IDX, 0, 0) ) < 0)
                    {         ObjectCreate(0, "LOWoL#" + IntegerToString(IDX, 0, 0), OBJ_TREND, 0, Time[0 + IDX], Low[0 + IDX] - 10, Time[0 + IDX + 1], Low[0 + IDX + 1] - 10 );
                              if (ObjectFind(0, "LOWoL#" + IntegerToString(IDX, 0, 0) ) >= 0) //
                              {         ObjectSetInteger(0, "LOWoL#" + IntegerToString(IDX, 0, 0), OBJPROP_RAY, false);//
                                        //ObjectSetInteger(0, "LOWoL#" + IntegerToString(IDX, 0, 0), OBJPROP_ANCHOR, ANCHOR_BOTTOM);//
                                        ObjectSetInteger(0, "LOWoL#" + IntegerToString(IDX, 0, 0), OBJPROP_STYLE, STYLE_DOT);//
                              }//
                    }//
                    if (!f_is_Create) //
                    {         C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "LOWoL#" + IntegerToString(IDX), __LINE__);
                              //============================//============================
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              //
                    }
                    //
          } //
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
//============================//============================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_TECHNICAL_Base::DeEMAset_______NoUse()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
//============================//============================
          
          for( IDX = 0; IDX < IDX_Limit ; IDX++)
          {         C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "o#" + IntegerToString(IDX), __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "oo#" + IntegerToString(IDX), __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1,  "ooo#" + IntegerToString(IDX), __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "oooo#" + IntegerToString(IDX), __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "ooooL#" + IntegerToString(IDX), __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "o1" + "ooooLM#" + IntegerToString(IDX), __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "o3" + "ooooLM#" + IntegerToString(IDX), __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "1" + "ooooLM#" + IntegerToString(IDX), __LINE__); //
          } //
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ctp_TECHNICAL Error",  __LINE__, __FUNCTION__); //
//============================//============================
}//
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|                                                                  |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
class Ctp_TECHNICAL
{
private:
//==========================================================
protected:
//==========================================================
public:

          void                  Ctp_TECHNICAL();
          void                  ~Ctp_TECHNICAL() {};

          bool                  Update();
          bool                  UPDATED;
          void                  FiboExpansionXTrading_INIT();
          void                  ReDrawEMALines();
          void                  TechnicalOMACreator(bool KeyCreate = false, int WithMain = 2, int WithSide = 1);
          //
          C_GOLDVIP             GoldVIP;
          C_PivotsDivergence    TradePivotsDivergence;
          //
          C_TECHNICAL_PriceDistance _CURRENT;
          C_TECHNICAL_PriceDistance _MN1;
          C_TECHNICAL_PriceDistance _W1;
          C_TECHNICAL_PriceDistance _H4;
          C_TECHNICAL_PriceDistance _H1;
          C_TECHNICAL_PriceDistance _D1;
          C_TECHNICAL_PriceDistance _M30;
          C_TECHNICAL_PriceDistance _M15;
          C_TECHNICAL_PriceDistance _M5;
          C_TECHNICAL_PriceDistance _M1;

          //------
          Ctp_TECHNICAL_Base     test,
                                 _Ema5Micro_,   _Sma5Micro_,
                                 _Ema20_, _Ema30_, _Ema70_,
                                 _Ema200_, _Ema200_200_, _Ema200__200_,  _Ema200_400_, _Ema200__400_,
                                 _Ema200_800_, _Ema200__800_,  _Ema200_1300_, _Ema200__1300_,
                                 _Ema500_,
                                 _Ema500__300level_,    _Ema500_300level_,      _Ema500__500level_,     _Ema500_500level_,      _Ema500__800level_,     _Ema500_800level_,
                                 _Ema500__1300level_,   _Ema500_1300level_,     _Ema500__2100level_,    _Ema500_2100level_,     _Ema500__3400level_,    _Ema500_3400level_,
                                 _Ema500__5500level_,   _Ema500_5500level_,     _Ema500__8900level_,    _Ema500_89000level_,    _Ema500__14400level_,   _Ema500_14400level_,
                                 _Ema1000_;
          //==========================================================
} ;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_TECHNICAL::Ctp_TECHNICAL()//----init values
{         //===
          Ctp_TECHNICAL_Base Ema5Micro_(                true, "Ema5Micro",             200, MODE_EMA, PRICE_CLOSE, 5,          0               * Point, STYLE_SOLID, 2, clrYellow, 0);         _Ema5Micro_             = Ema5Micro_;
          Ctp_TECHNICAL_Base Sma5Micro_(                true, "Sma5Micro",             200, MODE_SMA, PRICE_CLOSE, 5,          0               * Point, STYLE_SOLID, 2, clrDodgerBlue, 0);     _Sma5Micro_             = Sma5Micro_;
//
          Ctp_TECHNICAL_Base Ema20_(                    true, "Ema20",                 200, MODE_EMA, PRICE_CLOSE, 20,         0               * Point, STYLE_SOLID, 2, clrYellow, 0);         _Ema20_                 = Ema20_;
          Ctp_TECHNICAL_Base Ema30_(                    true, "Ema30",                 200, MODE_EMA, PRICE_CLOSE, 30,         0               * Point, STYLE_SOLID, 2, clrCoral, 0);          _Ema30_                 = Ema30_;
          Ctp_TECHNICAL_Base Ema70_(                    true, "Ema70",                 200, MODE_EMA, PRICE_CLOSE, 70,         0               * Point, STYLE_SOLID, 2, clrCoral, 0);          _Ema70_                 = Ema70_;
//
          Ctp_TECHNICAL_Base Ema200_(                   true, "Ema200",                200, MODE_EMA, PRICE_CLOSE, 200,        0               * Point, STYLE_SOLID, 2, clrLavender, 0);            _Ema200_                = Ema200_;
          Ctp_TECHNICAL_Base Ema200_200_(               true, "Ema200-200",            200, MODE_EMA, PRICE_CLOSE, 200,        200             * Point, STYLE_SOLID, 2, clrLimeGreen, 0);      _Ema200_200_            = Ema200_200_;
          Ctp_TECHNICAL_Base Ema200__200_(              true, "Ema200+200",            200, MODE_EMA, PRICE_CLOSE, 200,        -200            * Point, STYLE_SOLID, 2, clrCrimson, 0);        _Ema200__200_           = Ema200__200_;
          Ctp_TECHNICAL_Base Ema200_400_(               true, "Ema200-400",            200, MODE_EMA, PRICE_CLOSE, 200,        400             * Point, STYLE_SOLID, 2, clrLimeGreen, 0);      _Ema200_400_            = Ema200_400_;
          Ctp_TECHNICAL_Base Ema200__400_(              true, "Ema200+400",            200, MODE_EMA, PRICE_CLOSE, 200,        -400            * Point, STYLE_SOLID, 2, clrCrimson, 0);        _Ema200__400_           = Ema200__400_;
          //
          Ctp_TECHNICAL_Base Ema200_800_(               true, "Ema200-800",            200, MODE_EMA, PRICE_CLOSE, 200,        800             * Point, STYLE_SOLID, 2, clrLimeGreen, 0);      _Ema200_800_            = Ema200_800_;
          Ctp_TECHNICAL_Base Ema200__800_(              true, "Ema200+800",            200, MODE_EMA, PRICE_CLOSE, 200,        -800            * Point, STYLE_SOLID, 2, clrCrimson, 0);        _Ema200__800_           = Ema200__800_;
          Ctp_TECHNICAL_Base Ema200_1300_(              true, "Ema200-1300",           200, MODE_EMA, PRICE_CLOSE, 200,        1300            * Point, STYLE_SOLID, 2, clrLimeGreen, 0);      _Ema200_1300_            = Ema200_1300_;
          Ctp_TECHNICAL_Base Ema200__1300_(             true, "Ema200+1300",           200, MODE_EMA, PRICE_CLOSE, 200,        -1300           * Point, STYLE_SOLID, 2, clrCrimson, 0);        _Ema200__1300_           = Ema200__1300_;
//
          Ctp_TECHNICAL_Base Ema500_(                   true, "Ema500",                200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 0          * Point, STYLE_DASHDOTDOT, 2, clrBlue);         _Ema500_                = Ema500_;
//
          Ctp_TECHNICAL_Base Ema500__300level_(         true, "Ema500__300level",      200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 300        * Point, STYLE_DOT, 1, clrGreen);               _Ema500__300level_      = Ema500__300level_;
          Ctp_TECHNICAL_Base Ema500_300level_(          true, "Ema500_300level",       200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, -300       * Point, STYLE_DOT, 1, clrGreen);               _Ema500_300level_       = Ema500_300level_;
          Ctp_TECHNICAL_Base Ema500__500level_(         true, "Ema500__500level",      200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 500        * Point, STYLE_DOT, 1, clrTeal);                _Ema500__500level_      = Ema500__500level_;
          Ctp_TECHNICAL_Base Ema500_500level_(          true, "Ema500_500level",       200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, -500       * Point, STYLE_DOT, 1, clrTeal);                _Ema500_500level_       = Ema500_500level_;
          Ctp_TECHNICAL_Base Ema500__800level_(         true, "Ema500__800level",      200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 800        * Point, STYLE_DOT, 1, clrRed);                 _Ema500__800level_      = Ema500__800level_;
          Ctp_TECHNICAL_Base Ema500_800level_(          true, "Ema500_800level",       200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, -800       * Point, STYLE_DOT, 1, clrRed);                 _Ema500_800level_       = Ema500_800level_;
          Ctp_TECHNICAL_Base Ema500__1300level_(        true, "Ema500__1300level",     200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 1300       * Point, STYLE_DOT, 1, clrSkyBlue);             _Ema500__1300level_     = Ema500__1300level_;
          Ctp_TECHNICAL_Base Ema500_1300level_(         true, "Ema500_1300level",      200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, -1300      * Point, STYLE_DOT, 1, clrSkyBlue);             _Ema500_1300level_      = Ema500_1300level_;
          Ctp_TECHNICAL_Base Ema500__2100level_(        true, "Ema500__2100level",     200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 2100       * Point, STYLE_DOT, 1, clrTomato);              _Ema500__2100level_     = Ema500__2100level_;
          Ctp_TECHNICAL_Base Ema500_2100level_(         true, "Ema500_2100level",      200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, -2100      * Point, STYLE_DOT, 1, clrTomato);              _Ema500_2100level_      = Ema500_2100level_;
          Ctp_TECHNICAL_Base Ema500__3400level_(        true, "Ema500__3400level",     200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 3400       * Point, STYLE_DOT, 1, clrPeru);                _Ema500__3400level_     = Ema500__3400level_;
          Ctp_TECHNICAL_Base Ema500_3400level_(         true, "Ema500_3400level",      200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, -3400      * Point, STYLE_DOT, 1, clrPeru);                _Ema500_3400level_      = Ema500_3400level_;
          Ctp_TECHNICAL_Base Ema500__5500level_(        true, "Ema500__5500level",     200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 5500       * Point, STYLE_DOT, 1, clrBisque);              _Ema500__5500level_     = Ema500__5500level_;
          Ctp_TECHNICAL_Base Ema500_5500level_(         true, "Ema500_5500level",      200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, -5500      * Point, STYLE_DOT, 1, clrBisque);              _Ema500_5500level_      = Ema500_5500level_;
          Ctp_TECHNICAL_Base Ema500__8900level_(        true, "Ema500__8900level",     200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 8900       * Point, STYLE_DOT, 1, clrViolet);              _Ema500__8900level_     = Ema500__8900level_;
          Ctp_TECHNICAL_Base Ema500_89000level_(        true, "Ema500_89000level",     200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, -8900      * Point, STYLE_DOT, 1, clrViolet);              _Ema500_89000level_     = Ema500_89000level_;
          Ctp_TECHNICAL_Base Ema500__14400level_(       true, "Ema500__14400level",    200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 14400      * Point, STYLE_DOT, 1, clrWheat);               _Ema500__14400level_    = Ema500__14400level_;
          Ctp_TECHNICAL_Base Ema500_14400level_(        true, "Ema500_14400level",     200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, -14400     * Point, STYLE_DOT, 1, clrWheat);               _Ema500_14400level_     = Ema500_14400level_;
          //
          Ctp_TECHNICAL_Base Ema1000_(                   true, "Ema1000",                200 * LineDepth, MODE_EMA, PRICE_CLOSE, 1000, 0          * Point, STYLE_DASHDOTDOT, 2, clrRed);         _Ema1000_                = Ema1000_;
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ctp_TECHNICAL::Update()
{         UPDATED = false;
//Alert("Start-Stack error " + __FUNCTION__);
          if(1) ReDrawEMALines();//
//==========================================================
// SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
//==========================================================
//
          UPDATED = true;
//
//==========================================================
// SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
//==========================================================
          return UPDATED;//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_TECHNICAL::FiboExpansionXTrading_INIT()
{         //------
          _CURRENT.PriceDistance_Target_Start = -1;
          _CURRENT.PriceDistance_Target_One = -1;
          _CURRENT.PriceDistance_Target_Two = -1;
          _CURRENT.PriceDistance_Target_Three = -1; //
//------
          _H4.PriceDistance_Target_Start = -1;
          _H4.PriceDistance_Target_One = -1;
          _H4.PriceDistance_Target_Two = -1;
          _H4.PriceDistance_Target_Three = -1; //
//------
          _D1.PriceDistance_Target_Start = -1;
          _D1.PriceDistance_Target_One = -1;
          _D1.PriceDistance_Target_Two = -1;
          _D1.PriceDistance_Target_Three = -1; //
//------
          _M30.PriceDistance_Target_Start = -1;
          _M30.PriceDistance_Target_One = -1;
          _M30.PriceDistance_Target_Two = -1;
          _M30.PriceDistance_Target_Three = -1; //
//------
          _M5.PriceDistance_Target_Start = -1;
          _M5.PriceDistance_Target_One = -1;
          _M5.PriceDistance_Target_Two = -1;
          _M5.PriceDistance_Target_Three = -1; //
//------
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_TECHNICAL::ReDrawEMALines()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Chart Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if (Detect_NewBar._CURRENT.CBT.Is_NewBar)//   C_STATICSUN::Key20Band, Key5Micro, Key20EMA, Key30EMA, Key200EMA, Key500EMA; //
          {         //---Alert("Detect_NewBar._CURRENT.Is_NewBar: ", Detect_NewBar._CURRENT.Is_NewBar);
                    if( RightMenu.SubEMA.Key.IsPadPress_5Micro )
                    {         /*--Deleting--*/  _Ema5Micro_.MA_Create(false);   _Sma5Micro_.MA_Create(false);   //
                              /*--Drawing--*/   _Ema5Micro_.MA_Create(true);    _Sma5Micro_.MA_Create(true);   //
                    }  //
                    if( RightMenu.SubEMA.Key.IsPadPress_20EMA ) {       _Ema20_.MA_Create(false);       _Ema20_.MA_Create(true);        }   //
                    if( RightMenu.SubEMA.Key.IsPadPress_30EMA ) {       _Ema30_.MA_Create(false);       _Ema30_.MA_Create(true);        } //
                    if( RightMenu.SubEMA.Key.IsPadPress_70EMA ) {       _Ema70_.MA_Create(false);       _Ema70_.MA_Create(true);        } //
                    if( RightMenu.SubEMA.Key.IsPadPress_200EMA )
                    {         _Ema200_.MA_Create(false);        _Ema200_.MA_Create(true);    //
                              _Ema200_200_.MA_Create(false);    _Ema200_200_.MA_Create(true);    //
                              _Ema200__200_.MA_Create(false);   _Ema200__200_.MA_Create(true);    //
                              _Ema200_400_.MA_Create(false);    _Ema200_400_.MA_Create(true);    //
                              _Ema200__400_.MA_Create(false);   _Ema200__400_.MA_Create(true);    //]
                              //
                              _Ema200_800_.MA_Create(false);    _Ema200_800_.MA_Create(true);    //
                              _Ema200__800_.MA_Create(false);   _Ema200__800_.MA_Create(true);    //
                              _Ema200_1300_.MA_Create(false);    _Ema200_1300_.MA_Create(true);    //
                              _Ema200__1300_.MA_Create(false);   _Ema200__1300_.MA_Create(true);    //
                    }
                    if( RightMenu.SubEMA.Key.IsPadPress_500EMA )//>>   if(Complex.KeyEma500.UseButton.State()||RightMenu.SubEMA.IsPadPress_500EMA )
                    {         _Ema500_.MA_Create(false); //
                              _Ema500__300level_.MA_Create(false);
                              _Ema500_300level_.MA_Create(false);
                              _Ema500__500level_.MA_Create(false);
                              _Ema500_500level_.MA_Create(false);
                              _Ema500__800level_.MA_Create(false);
                              _Ema500_800level_.MA_Create(false);
                              //
                              _Ema500__1300level_.MA_Create(false);
                              _Ema500_1300level_.MA_Create(false);
                              _Ema500__2100level_.MA_Create(false);
                              _Ema500_2100level_.MA_Create(false);
                              _Ema500__3400level_.MA_Create(false);
                              _Ema500_3400level_.MA_Create(false);
                              //
                              _Ema500__5500level_.MA_Create(false);
                              _Ema500_5500level_.MA_Create(false);
                              _Ema500__8900level_.MA_Create(false);
                              _Ema500_89000level_.MA_Create(false);
                              _Ema500__14400level_.MA_Create(false);
                              _Ema500_14400level_.MA_Create(false);
                              ///=====//////////======
                              _Ema500_.MA_Create(true); //
                              _Ema500__300level_.MA_Create(true);
                              _Ema500_300level_.MA_Create(true);
                              _Ema500__500level_.MA_Create(true);
                              _Ema500_500level_.MA_Create(true);
                              _Ema500__800level_.MA_Create(true);
                              _Ema500_800level_.MA_Create(true);
                              //
                              _Ema500__1300level_.MA_Create(true);
                              _Ema500_1300level_.MA_Create(true);
                              _Ema500__2100level_.MA_Create(true);
                              _Ema500_2100level_.MA_Create(true);
                              _Ema500__3400level_.MA_Create(true);
                              _Ema500_3400level_.MA_Create(true);
                              //
                              _Ema500__5500level_.MA_Create(true);
                              _Ema500_5500level_.MA_Create(true);
                              _Ema500__8900level_.MA_Create(true);
                              _Ema500_89000level_.MA_Create(true);
                              _Ema500__14400level_.MA_Create(true);
                              _Ema500_14400level_.MA_Create(true);
                              //
                    }
                    if( RightMenu.SubEMA.Key.IsPadPress_1000EMA ) {       _Ema1000_.MA_Create(false);       _Ema1000_.MA_Create(true);        } //
                    //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Chart Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_TECHNICAL::TechnicalOMACreator(bool KeyCreate = false, int WithMain = 2, int WithSide = 1)
{         //   Technical_MACreator(KeyCreate, "Ema500", 200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 0 * Point, STYLE_DASHDOTDOT, WithMain, clrBlue, 0); //
//   Technical_MACreator(KeyCreate, "Ema500|+300level", 200 * LineDepth, MODE_EMA, PRICE_CLOSE, 500, 300 * Point, STYLE_DOT, WithSide, clrGreen);
///=====//////////======
          _Ema500_.MA_Create(KeyCreate); //
          _Ema500__300level_.MA_Create(KeyCreate);
          _Ema500_300level_.MA_Create(KeyCreate);
          _Ema500__500level_.MA_Create(KeyCreate);
          _Ema500_500level_.MA_Create(KeyCreate);
          _Ema500__800level_.MA_Create(KeyCreate);
          _Ema500_800level_.MA_Create(KeyCreate);
//
          _Ema500__1300level_.MA_Create(KeyCreate);
          _Ema500_1300level_.MA_Create(KeyCreate);
          _Ema500__2100level_.MA_Create(KeyCreate);
          _Ema500_2100level_.MA_Create(KeyCreate);
          _Ema500__3400level_.MA_Create(KeyCreate);
          _Ema500_3400level_.MA_Create(KeyCreate);
//
          _Ema500__5500level_.MA_Create(KeyCreate);
          _Ema500_5500level_.MA_Create(KeyCreate);
          _Ema500__8900level_.MA_Create(KeyCreate);
          _Ema500_89000level_.MA_Create(KeyCreate);
          _Ema500__14400level_.MA_Create(KeyCreate);
          _Ema500_14400level_.MA_Create(KeyCreate);
//
};
//+------------------------------------------------------------------+
//|             Class TechnicalX     BEGIN-END                       |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
