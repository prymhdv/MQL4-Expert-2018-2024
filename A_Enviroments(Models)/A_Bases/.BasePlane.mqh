//+------------------------------------------------------------------+
//||   ||||||||||                 BasePlane.mqh                     ||SSahandim@ymail.com
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    |||Portal.Portal@yahoo.com
//|||  ||   |||||             Email: @prymhdvgmail.com             |||Pourya.Mahdavi@yahoo.com
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//---Check Dependency--(None-Any)To Varables off => #include <.RTL_Prymhdv\QuartsExperts\A_Bases\.A_Bases.mqh> //--- Module Existasnce(.A_Bases.mqh)) Can BroadCast to Any Other Enviroment
#ifndef __BASEPLAN__
//+----------------------------------------------------------------------------+
//| Module ~~ Defines ~ Macros ~ Enums ~ Variables ~ Imports ~ Inputs (DMEVII) | CoverA
//+----------------------------------------------------------------------------+
class Ct_Drive;   ///--forward declaring mean can say name sace using..std...
class St_Drive_Data;
void StringAdder(string sInp, string &sOut) {  sOut += "_" + sInp;}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string MainRootPath = "QuArtsRoot\\"; //from MQL4\Files

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_Inputs_A.mqh>   ///A_01_InputVar_A
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_Defines_A.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_Defines_MT4.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_Defines_GUI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_Defines_TRADE.mqh>

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_Defines.mqh>
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_Macros.mqh> 
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_Enums.mqh>
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_StructsFrist.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_Structs.mqh>
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_Variables.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\uMultiVariables.mqh>                 C_MULTIVARIABLE         MultiVariables; ///>>OKEY 010 ///gone Global scoping //#NOERRORRING
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\A_01_ImportsCppWINAPI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\uVolumetric.mqh>                     C_Volumetric            CandelVolume;
//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Parser\jsonParser\json.mqh>////mql4 alowed say override allowed mql5 not signiture changed see help
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Parser\xmlParser\\XML\xmlbase.mqh>
//
class Cu_Cat
{         //
public:   void say(string x = "") {         Print("''--------" + x + "-------------''");} //
          //
};  Cu_Cat Cat;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\DF_Booleans.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\DF_Pointers.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\DF_Interfaces.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sg_Position2D
{         int     x, y;
          void    reset() {x = y = 0; }

};
Sg_Position2D  Sg_Position2D_Def;

//+----------------------------------------------------------------------------+
//| Module ~~ Defines ~ Macros ~ Enums ~ Variables ~ Imports ~ Inputs (DMEVII) | CoverA
//+----------------------------------------------------------------------------+
#endif 
//+------------------------------------------------------------------+
//||   ||||||||||                 BasePlane.mqh                     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    |||
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
