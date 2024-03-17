//+------------------------------------------------------------------+
//|                                                    CoverOGC.mqh  |
//|                       Copyright © 2020-2022, Oprymhdv@Gmail.com  |
//|                                        Email: @prymhdvgmail.com  |
//|                                        HTTPS: www.Oprymhdv.com   |
//+------------------------------------------------------------------+
#ifndef  __COVEROGC__
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.CoverOG.mqh> //---Check Dependency--(Super) (Chart ~~ E ~~ Symbol ~~ Account_ )
//----------SubNeed
////+------------------------------------------------------------------+
////|                   Graphical UTILITIES                            |
////+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\pGraphicalUTILITIES.mqh>;           C_GraphicalUTILITIES    GraphicalUtillities;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\gTools.mqh>;                        C_TOOLS                 TOOLS;           ///>>OKEY 051   //==>>used ElliottWave                       //<<<normal ///in uniniting clear all created object//depending it
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\gComplexTools.mqh>;                 C_COMPLEXTOOLS          Complex;  ///>>OKEY 051   //==>>used ElliottWave //not accepting FlowPanel_OBJ after himself
////+------------------------------------------------------------------+
////|     GraphicalUserInterface(GUI) ~~ Panels ~~ CLI  ~~             |Shell  //---   Objects Graphical Complex
////+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\pMasterPanel.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\pPanel_WndObj.mqh>;             C_Panel_WndObj          Panel_WndObj;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\pPanel_ChartObj.mqh>;           C_Panel_ChartObj        Panel_ChartObj;
////-------------------------------------------------------------------------------------------------------------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\pClicker.mqh>                   C_CLICKER               Clicker;                           ///>>OKEY 052 >>>>by ordering calll class.//==>>used Tools   //<<<normal ///in uniniting clear all created object//depending it
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\oTrendLevel.mqh>
#endif
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
