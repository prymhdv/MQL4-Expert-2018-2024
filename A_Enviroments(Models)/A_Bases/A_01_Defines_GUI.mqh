//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

//=====================================================================================================
//--FixPadFlow
#define FixPadFlowX              0              //+770//Must Out of Function block for fixed value///else changing,,, acculumative//fristly its the zero// after its gone valuess
#define FixPadFlowY             -120            //-75  ///-125///alwayse fixe value///
//--FixPadChartTools
#define FixPadChartToolsX       -209 + independ2D.x     //+335///335,-75
#define FixPadChartToolsY       +88  + independ2D.y      //-75
//--SPEEDTEXT
#define SPEEDTEXT_GAP_X         240
#define SPEEDTEXT_GAP_Y         28
//--SPEEDBAR
#define SPEEDBAR_GAP_X          0  //210
#define SPEEDBAR_GAP_Y          0 //28
//#define bXXX    "define 1076\\168C"
//Alert("\\168C","-Line:"__LINE__);
//--PANELLeft
#define PANELLeft_LXaxMin      260          //===RIGHTWIDTH
#define PANELLeft_LYaxMin      160        //===RIGHTHIGHT
//--YBoxOne 
#define  YBoxOne                -55
#define  XBoxOne                -5
//--XBoxTwo 
#define  XBoxTwo                -10
#define  YBoxTwo                (int)(161.6)

#define  Y_Edite              11
#define  Y_Price              115
#define  Y_Cordinate           42
//-------------------------------------------------
#define All_RightMenu_Pad_X   0 
#define All_RightMenu_Pad_Y   10 
//==============================================================================
//=====================================
#define         PeriodMain      0
#define         PeriodDaily     1
#define         Period4Hour     2
#define         Period30Min     3
#define         Period5Min      4
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+