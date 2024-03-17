//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
//=====================================================================
struct IdString
{         //std::string name;
          string        name;
          int           identifier;
          //--IdString      get_string()  { return ("foo", 42 );}   //{ return {"foo", 42 };}
          //Note the lack of explicit type.  ///error '{' - parameter conversion not allowed
          //--IdString      get_string2() { return {"foo", 42 };}//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//--IdString      get_string2() { return {"foo", 42 };}           // ---'{' - parameter conversion not allowed
//==============================================================================
#define heikenAshiX 20   // Make this number at least 5 more than the number of candles you plan on analyzing
struct heikenAshi
{         double     haClose;
          double     haOpen;
          double     haHigh;
          double     haLow;
          //---
          //heikenAshi haCandles[ha];///array of objects
          //---
          heikenAshi::heikenAshi() { haClose = 0.0; haOpen = 0.0; haHigh = 0.0; haLow = 0.0; };
          //---class end

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_Proxy {public: C_Proxy() {};};
struct SuperKEY
{         //===========================
          //void SuperKEY::SuperKEY() {};
          void SuperKEY::~SuperKEY() {};
          //===========================
          bool SuperKEY::is_create;     // = true;
          bool SuperKEY::is_mini;       // = false;
          bool SuperKEY::is_move;       // = false;
          int  SuperKEY::MoveX;         // = 0;
          int  SuperKEY::MoveY;         // = 0; //
          //===========================
          void SuperKEY::SuperKEY(): is_create(false), is_mini(false), is_move(false), MoveX(0), MoveY(0)  { };
          //===========================

};
SuperKEY SuperKEYx;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct S_BUFFER
{         double s;
          double st;
          double p; //
};
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
