//+------------------------------------------------------------------+
//|                                                  ElliotWave5.mqh |
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
#define  OBJ_ELLIOTWAVE5 9001
struct S_ElliotsWave5: public _COBF_
{         void                  S_ElliotsWave5() {TYPE_O_00 = (ENUM_OBJECT)OBJ_ELLIOTWAVE5;}
//============================================================================================================
          bool                  DRAWLINES;                    //Displaying lines for marking the Elliott Wave  bool
//============================================================================================================
//============================================================================================================
//============================================================================================================
};
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsGann.mqh>
// C_Objects             C_ElliotsWave5::OBJ;
class C_ElliotsWave5_Base: public __COBFA__<S_ElliotsWave5> 
{
//===================================================================
private:
          string                 m_name;
          int                    m_index;
//===================================================================
public:
          void                   C_ElliotsWave5_Base()  {};
          void                   ~C_ElliotsWave5_Base() {};
//===================================================================
//===================================================================
          S_ElliotsWave5        GAC;
          S_ElliotsWave5        GDS;
          
          //*************************
          void Draw_GDS(int WhichMode , bool IsKey ,bool Is_Delete){};
//===================================================================
};
//+------------------------------------------------------------------+
