//+------------------------------------------------------------------+
//|                                                      Clicker.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//#include <0srcCapitan\QuartsExperts\ErrorController.mqh>
//#include <0srcCapitan\QuartsExperts\C_STATICSUN.mqh>
//#include <0srcCapitan\QuartsExperts\InformController.mqh>
class C_CLICKER
{         //
public: //need Class Object
          void                   C_CLICKER(bool Is_Create, bool Is_Move, string nameCOM = "");
          void                   C_CLICKER() {};
          void                   ~C_CLICKER() { if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); };

          //C_TOOLS       C_CLICKER:: ,,  ,  ,  , BTN_PanelV, ;   ///>>>gone Global kepp valuse untill exites//or uper class.to save positions
          Cg_TextsRectLabel      RLBL_Border;
          Cg_TextsLabel          LBL_InfoC, LBL_BarTimer, LBL_StartTimeX, LBL_StartTimeY;
          Cg_TextsButton         BTN_ButtonX, BTN_ButtonY, BTN_PanelV;
          //C_TextEdit          EDT_;

          // C_TOOLS BTN_ButtonX, BTN_ButtonY, LBL_BarTimer, LBL_StartTimeX, LBL_StartTimeY ;///!!!!!FINDAFTER ALL
public:
          string                 buttonID  ;
          string                 labelID ;
          int                    broadcastEventID  ;
          string                 nameCOMx;
          ///////////////////////

          //============sends broadcast event to all open charts
          void                   BroadcastEvent(long lparam, double dparam, string sparam);
          void                   OBJECT_CLICK(string FuncCom, const string & sparam);
          void                   clickinger_CUSTOM(const int id, const long  lparam, const double   dparam, const string   sparam);
          void                   CreatingMode(int WhichMode = MODE_CREATE,
                              bool       IsKey          = false,
                              string     nameCOM         = "",
                              int        MoveX           = 0,
                              int        MoveY           = 0);

}; ///Clicker;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CLICKER::C_CLICKER(bool Is_Create, bool Is_Move, string nameCOM = "" )
{         RunCallFunction++;
          C_CLICKER::CreatingMode(Is_Create, Is_Move, nameCOMx = nameCOM, 0, -50);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CLICKER::BroadcastEvent(long lparam, double dparam, string sparam)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          int eventID = broadcastEventID - CHARTEVENT_CUSTOM;
          long currChart = ChartFirst();
          int i = 0;
          while(i < CHARTS_MAX)               // We have certainly no more than CHARTS_MAX open charts
          {         EventChartCustom(currChart, (ushort)eventID, lparam, dparam, sparam);
                    if(ChartNext(currChart) < 0) currChart = ChartNext(currChart); // We have received a new chart from the previous
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    if(currChart == -1) break;      // Reached the end of the charts list
                    i++;// Do not forget to increase the counter
          } //
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //
          //============================//============================
}
//+------------------------------------------------------------------+
void C_CLICKER::OBJECT_CLICK(string FuncCom, const string & sparam)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          string clickedChartObject = sparam;
          if(clickedChartObject == this.buttonID)  //--- If you click on the object with the name buttonID  //--- State of the button - pressed or not
          {         bool selected = ObjectGetInteger(0, this.buttonID, OBJPROP_STATE);
                    Print("Button pressed = ", selected);   //--- log a debug message
                    int customEventID; // Number of the custom event to send
                    string message;    // Message to be sent in the event
                    if(selected) {         message = "Button pressed"; customEventID = CHARTEVENT_CUSTOM + 1; } //--- If the button is pressed
                    else {         message = "Button in not pressed"; customEventID = CHARTEVENT_CUSTOM + 999; }// Button is not pressed
                    EventChartCustom(0, (ushort)(customEventID - CHARTEVENT_CUSTOM), 0, 0, message);//--- Send a custom event "our" chart
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    this.BroadcastEvent(ChartID(), 0, "Broadcast Message");///--- Send a message to all open charts
                    Print("Sent an event with ID = ", customEventID);// //--- Debug message
          }//
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //
          //============================//============================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CLICKER::clickinger_CUSTOM(const int id, const long  lparam, const double   dparam, const string   sparam)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //
          if(id == this.broadcastEventID) { Print("Got broadcast message from a chart with id = " + (string)lparam); }
          else
          {         //--- We read a text message in the event
                    string info = sparam;
                    Print("Handle the user event with the ID = ", id);//--- Display a message in a label
                    ObjectSetString(0, this.labelID, OBJPROP_TEXT, sparam);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  | Is_Create,Is_Move,
//+------------------------------------------------------------------+
void C_CLICKER::CreatingMode(int        WhichMode       = MODE_CREATE,
                             bool       IsKey          = false,
                             string     nameCOM         = "",
                             int        MoveX           = 0,
                             int        MoveY           = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          static int J = 0;
          buttonID = nameCOM = nameCOM + "#" + IntegerToString(J++);
          if(IsKey)
          {         //C_TOOLS UseTools;///>>>not globlal..it deleted in function prossessing..
                    static datetime R1          = DevTime.prevTime;///JUST IS CONSTRUCTORS
                    static datetime R12         = DevTime.myTime;///JUST IS CONSTRUCTORS
                    static datetime R123        = DevTime.localtime;///JUST IS CONSTRUCTORS
                    static datetime R1234       = DevTime.timeOffset;///JUST IS CONSTRUCTORS
                    datetime TimeX ;
                    datetime TimeC = -1;
                    if(IsConnected() && ct_Series_Base.IsRefreshRate)
                    {         TimeX = Time[0] + Period() * 60 - DevTime.localtime - DevTime.timeOffset;/// MAY HAS OBJECT CANT CARRYING STATIC..
                              TimeC = Time[0]; //
                    }
                    else
                    {         if(iBars(NULL, 0) > 0)//existed
                              {         TimeX = Time[0];//
                                        TimeC = Time[0]; //
                              }//
                              else
                              {         TimeX = 0; //
                                        TimeC = 0; //
                              } //
                    }
                    string TIME0_SECONDS =  TimeToStr(TimeX, TIME_SECONDS );
                    static int V = 0;
                    broadcastEventID = 5000; //
                    //
                    //================================================================================================================================================
                    LBL_InfoC.GDS.Set_Action_2(WhichMode, IsKey);
                    LBL_InfoC.GDS.Set_Desc_4(nameCOM + "LBL_InfoC", "====No information====", "Trebuchet MS", 7);
                    LBL_InfoC.GDS.Set_Location_5(70 + MoveX, MoveY + 160, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LBL_InfoC.GDS.Set_Color_1(clrWhite);
                    LBL_InfoC.GDS.Set_Common_6(false, 10, false, false, false, "LBL_InfoC");
                    LBL_InfoC.GDS.Set_Chart_6();
                    LBL_InfoC.Action(LBL_InfoC);
                    //================================================================================================================================================
                    LBL_BarTimer.GDS.Set_Action_2(WhichMode, IsKey);
                    LBL_BarTimer.GDS.Set_Desc_4(nameCOM + "LBL_BarTimer", "===LBL_BarTimer: " + TIME0_SECONDS + "_" + (string)V++, "Trebuchet MS", 7);
                    LBL_BarTimer.GDS.Set_Location_5( 70 + MoveX, MoveY + 150, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LBL_BarTimer.GDS.Set_Color_1(clrRed);
                    LBL_BarTimer.GDS.Set_Common_6(false, 10, false, false, false, "LBL_BarTimer");
                    LBL_BarTimer.GDS.Set_Chart_6();
                    LBL_BarTimer.Action(LBL_InfoC);
                    //================================================================================================================================================
                    LBL_StartTimeX.GDS.Set_Action_2(WhichMode, IsKey);
                    LBL_StartTimeX.GDS.Set_Desc_4(nameCOM + "LBL_StartTimeX", "===LBL_StartTimeX: " + (string)(TimeC + Period()) + "_" + (string)V++, "Trebuchet MS", 7);
                    LBL_StartTimeX.GDS.Set_Location_5( 70 + MoveX, MoveY + 140, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LBL_StartTimeX.GDS.Set_Color_1(clrRed);
                    LBL_StartTimeX.GDS.Set_Common_6(false, 10, false, false, false, "LBL_StartTimeX");
                    LBL_StartTimeX.GDS.Set_Chart_6();
                    LBL_StartTimeX.Action(LBL_InfoC);
                    //================================================================================================================================================
                    LBL_StartTimeY.GDS.Set_Action_2(WhichMode, IsKey);
                    LBL_StartTimeY.GDS.Set_Desc_4(nameCOM + "LBL_StartTimeY", "===LBL_StartTimeY: " + Dev_Calender.TimeCurrentDec  + "_" + (string)V++, "Trebuchet MS", 7);
                    LBL_StartTimeY.GDS.Set_Location_5( 70 + MoveX, MoveY + 130, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LBL_StartTimeY.GDS.Set_Color_1(clrRed);
                    LBL_StartTimeY.GDS.Set_Common_6(false, 10, false, false, false, "BTN_PanelV");
                    LBL_StartTimeY.GDS.Set_Chart_6();
                    LBL_StartTimeY.Action(LBL_InfoC);
                    //================================================================================================================================================
                    //================================================================================================================================================
                    BTN_PanelV.GDS.Set_Action_2(WhichMode, IsKey);
                    BTN_PanelV.GDS.Set_Desc_4(nameCOM + "BTN_PanelV", "Panel:", "Trebuchet MS", 7);
                    BTN_PanelV.GDS.Set_Self_1(false);
                    BTN_PanelV.GDS.Set_Location_5(0 + MoveX, MoveY + 177, 60, 15, CORNER_LEFT_LOWER);
                    BTN_PanelV.GDS.Set_Color_3(clrDarkCyan, clrGray, clrWhite);
                    BTN_PanelV.GDS.Set_Common_6(false, 10, false, false, false, "BTN_PanelV");
                    BTN_PanelV.GDS.Set_Chart_6();
                    BTN_PanelV.Action(BTN_PanelV);
                    //================================================================================================================================================
                    BTN_PanelV.GDS.Set_Action_2(WhichMode, IsKey);
                    BTN_PanelV.GDS.Set_Desc_4(nameCOM + "BTN_ButtonX", "Time: " + (string)V++, "Trebuchet MS", 7);
                    BTN_PanelV.GDS.Set_Self_1(false);
                    BTN_PanelV.GDS.Set_Location_5(0 + MoveX, MoveY + 157, 60, 15, CORNER_LEFT_LOWER);
                    BTN_PanelV.GDS.Set_Color_3(clrGreen, clrGray, clrWhite);
                    BTN_PanelV.GDS.Set_Common_6(false, 10, false, false, false, "BTN_PanelV");
                    BTN_PanelV.GDS.Set_Chart_6();
                    BTN_PanelV.Action(BTN_PanelV);
                    //================================================================================================================================================
                    BTN_PanelV.GDS.Set_Action_2(WhichMode, IsKey);
                    BTN_PanelV.GDS.Set_Desc_4(nameCOM + "BTN_ButtonY", "Time: " + (string)(2 * V++), "Trebuchet MS", 7);
                    BTN_PanelV.GDS.Set_Self_1(false);
                    BTN_PanelV.GDS.Set_Location_5(0 + MoveX, MoveY + 137, 60, 15, CORNER_LEFT_LOWER);
                    BTN_PanelV.GDS.Set_Color_3(clrGreen, clrGray, clrWhite);
                    BTN_PanelV.GDS.Set_Common_6(false, 10, false, false, false, "BTN_PanelV");
                    BTN_PanelV.GDS.Set_Chart_6();
                    BTN_PanelV.Action(BTN_PanelV);
                    //================================================================================================================================================
                    //================================================================================================================================================
                    //
                    {         //LBL_InfoC.Create(     mode, IsKey, nameCOM + "LBL_InfoC",         "====No information====",            70 + MoveX, MoveY + 160, CORNER_LEFT_LOWER, ANCHOR_LEFT, 0, clrWhite, 0, 7, "Trebuchet MS");                                        //
                              //LBL_BarTimer.Create(  mode, IsKey, nameCOM + "LBL_BarTimer",      "===LBL_BarTimer: " + TIME0_SECONDS + "_" + (string)V++,70 + MoveX, MoveY + 150, CORNER_LEFT_LOWER, ANCHOR_LEFT, 0, clrRed, 0, 7, "Trebuchet MS");
                              //LBL_StartTimeX.Create( mode, IsKey, nameCOM + "LBL_StartTimeX",    "===LBL_StartTimeX: " + (string)(TimeC + Period()) + "_" + (string)V++, 70 + MoveX, MoveY + 140, CORNER_LEFT_LOWER, ANCHOR_LEFT, 0, clrRed, 0, 7, "Trebuchet MS");
                              //LBL_StartTimeY.Create( mode, IsKey, nameCOM + "LBL_StartTimeY",    "===LBL_StartTimeY: " + Dev_Calender.TimeCurrentDec  + "_" + (string)V++,70 + MoveX, MoveY + 130, CORNER_LEFT_LOWER, ANCHOR_LEFT, 0, clrRed, 0, 7, "Trebuchet MS");
                              //==============================================================
                              // BTN_PanelV.Create(WhichMode, IsKey, __FUNCSIG__, nameCOM + "BTN_PanelV", "Panel:",0 + MoveX, MoveY + 177, 60, 15,   CORNER_LEFT_LOWER, ANCHOR_CENTER, 0, clrDarkCyan, clrGray, clrWhite, 0, 7, "Trebuchet MS");
                              //BTN_ButtonX.Create(WhichMode, IsKey, __FUNCSIG__, nameCOM + "BTN_ButtonX", "Time: " + (string)V++,0 + MoveX, MoveY + 157, 60, 15,   CORNER_LEFT_LOWER, ANCHOR_CENTER, 0, clrGreen,    clrGray, clrWhite, 0, 7, "Trebuchet MS");
                              // BTN_ButtonY.Create(WhichMode, IsKey, __FUNCSIG__, nameCOM + "BTN_ButtonY", "Time: " + (string)(2 * V++),0 + MoveX, MoveY + 137, 60, 15,   CORNER_LEFT_LOWER, ANCHOR_CENTER, 0, clrGreen,    clrGray, clrWhite, 0, 7, "Trebuchet MS");//
                    } //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CLICKER Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
