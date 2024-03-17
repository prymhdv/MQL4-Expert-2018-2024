//+------------------------------------------------------------------+
//|                                                  C_AutoCharter.mqh |
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

enum AutoCharterItem
{
//#define AutoCharter_StdDevChannelX  1
//#define AutoCharter_ChannelX        2
//#define AutoCharter_HLineX          3
//#define AutoCharter_VLineX          4
//#define AutoCharter_TrendX          5
//#define AutoCharter_TrendAngleX     6
//#define AutoCharter_TextX           7
//#define AutoCharter_CycleX          8
//#define AutoCharter_EditX           9
//#define AutoCharter_PitchforkX      10
//#define AutoCharter_RegressionX     11
//#define AutoCharter_RectLabelX      12
//#define AutoCharter_LabelX          13
//#define AutoCharter_ButtonX         14
//#define AutoCharter_FiboX           15
//#define AutoCharter_FiboTimesX      16
//#define AutoCharter_FiboFanX        17
//#define AutoCharter_FiboExpansionX  18
//#define AutoCharter_FiboChannelX    19
//#define AutoCharter_FiboArcX        20
          //==================
          eAutoCharter_StdDevChannel  = 1,
          eAutoCharter_Channel        = 2,
          eAutoCharter_HLine          = 3,
          eAutoCharter_VLine          = 4,
          eAutoCharter_Trend          = 5,
          eAutoCharter_TrendAngle     = 6,
          eAutoCharter_Text           = 7,
          eAutoCharter_Cycle          = 8,
          eAutoCharter_Edit           = 9,
          eAutoCharter_Pitchfork      = 10,
          eAutoCharter_Regression     = 11,
          eAutoCharter_RectLabel      = 12,
          eAutoCharter_Label          = 13,
          eAutoCharter_Button         = 14,
          eAutoCharter_Fibo           = 15,
          eAutoCharter_FiboTimes      = 16,
          eAutoCharter_FiboFan        = 17,
          eAutoCharter_FiboExpansion  = 18,
          eAutoCharter_FiboChannel    = 19,
          eAutoCharter_FiboArc        = 20,
          //==================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_AutoCharter
{
private:
//====================================================================
public:
          C_AutoCharter() {};
          ~C_AutoCharter() {};
//====================================================================

          C_Fibos                Fibos;//
          Cg_Texts                Texts;//
          C_Lines                Lines;//
          C_Channels             Channels;//

//====================================================================
//====================================================================
//====================================================================
          int Draw(int WhichMode = MODE_CREATE, bool IsKey = false, const int Keylog = -1); // Keylog = 5;
};

//+------------------------------------------------------------------+
//|                                                                  | Is_Create,Is_Move,
//+------------------------------------------------------------------+
int C_AutoCharter::Draw(int WhichMode = MODE_CREATE, bool IsKey = false, const  int Keylog = -1 ) // Keylog = 5;
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          Panel_WndObj.Create(); //TOOLS.Set_Label();
          int KeylogRe  = -1;
          //---
          C_ChannelsRegression_Data Regression_Data1;
          //---
          switch(Keylog)///Alert( "-Line:",__LINE__);
          {         //--------------------------------------------------------------------------------------------
                    case eAutoCharter_StdDevChannel:   {Channels.StandardDeviation.Create(WhichMode, IsKey);        } break;
                    case eAutoCharter_Channel:         {Channels.Equidistant.Create(WhichMode, IsKey);              } break;
                    case eAutoCharter_Pitchfork:       {Channels.Pitchfork.Create(WhichMode, IsKey);                } break;
                    case eAutoCharter_Regression:      {Channels.Regression.Create(Regression_Data1);               } break;
                    //--------------------------------------------------------------------------------------------
                    case eAutoCharter_HLine:           {Lines.Horizontal.Create(WhichMode, IsKey);                  } break;
                    case eAutoCharter_VLine:           {Lines.Vertical.Create(WhichMode, IsKey);                    } break;
                    case eAutoCharter_Trend:           {Lines.Trend.Create(WhichMode, IsKey);                       } break;
                    case eAutoCharter_TrendAngle:      {Lines.TrendByAngle.Create(WhichMode, IsKey);                } break;
                    case eAutoCharter_Cycle:           {Lines.Cycles.Create(WhichMode, IsKey);                      } break;
                    //--------------------------------------------------------------------------------------------
                    //case TextX:          Text.Description.Create(Is_Create, Is_Move);                 break;
                    //case eAutoCharter_Text:            Texts.Description.Frame.Action(Texts, false, MODE_CREATE, true, FRAME.Set_(OBJ_VLINE, "Name", /*movex*/50, /*movey*/50, /*sizex*/50, /*sizey*/50, clrRed)); break;
                    case eAutoCharter_Edit:            {Texts.Edit.Create(WhichMode, IsKey);                        } break;
                    case eAutoCharter_RectLabel:       {Texts.RectLabel.Action(RectLabelX);                         } break; //.Create(Is_Create, Is_Move);
                    case eAutoCharter_Label:           {Texts.Label.Action(RectLabelX);                             } break; //Create(Is_Create, Is_Move);
                    case eAutoCharter_Button:          {Texts.Button.Create(WhichMode, IsKey);                      } break;
                    //--------------------------------------------------------------------------------------------
                    case eAutoCharter_Fibo:            {Fibos.Retracement.Create(WhichMode, IsKey);                 } break;
                    case eAutoCharter_FiboTimes:       {Fibos.TimeZone.Create(WhichMode, IsKey);                    } break;
                    case eAutoCharter_FiboFan:         {Fibos.Fan.Create(WhichMode, IsKey);                         } break;
                    case eAutoCharter_FiboExpansion:   {Fibos.Expansion.Create(WhichMode, IsKey);                   } break;
                    case eAutoCharter_FiboChannel:     {Fibos.Channel.Create(WhichMode, IsKey);                     } break;
                    case eAutoCharter_FiboArc:         {Fibos.Arc.Create(WhichMode, IsKey);                         } break;
                    //--------------------------------------------------------------------------------------------
                    default:   Alert("default-Keyboard.ItemX() ", __LINE__); ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartRun default work",  __LINE__, __FUNCTION__); //
                              //default: //Comment("default Keylog is ....." + (string)Keylog);
                              //
          } //
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return Keylog;//
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
