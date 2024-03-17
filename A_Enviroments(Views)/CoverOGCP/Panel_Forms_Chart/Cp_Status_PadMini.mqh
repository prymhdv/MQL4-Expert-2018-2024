//+------------------------------------------------------------------+
//||   ||||||||||                 Cp_SubEMA.mqh                     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cp_StatusSubPadMini
{         //---
          //---
          //---
public:
          //---PadMini keys
          bool                  IsPadPress_Mini,                IsPadActive_Mini;
          //--- sub keys
          bool                  IsPadPress_MicroTrendUp;        // IsPadPress_MicroTrendUp  IsPadPress_SuperKeysUp  IsPadPress_OBVClose_EMA20  IsPadPress_MFI_Up   IsPadPress_BullsPower  IsPadPress_Accelerator_Up      IsPadPress_WpR20_CrossUp
          bool                  IsPadPress_SuperKeysUp;
          bool                  IsPadPress_OBVClose_EMA20;
          bool                  IsPadPress_MFI_Up;
          bool                  IsPadPress_BullsPower;
          bool                  IsPadPress_Accelerator_Up;
          bool                  IsPadPress_WpR20_CrossUp;
//---PadMini

          bool                  _Call(int Type,        bool Is_Create = false, bool  Is_CreateMini = false, int MoveX = 0, int MoveY = 0, int SizeX = 0, int SizeY = 0, int FontSize = 0, color clrBody = clrWhite,  color clrBodyMargine = clrFireBrick, color clrBodyText = clrFireBrick, color clrBodyCyrcle = clrRed);
          bool                  _Show(int WhichMode,   bool IsKey,             int MoveX = 0, int MoveY = 0, int SizeX = 0, int SizeY = 0, int FontSize = 0, color clrBody = clrWhite, color clrBodyMargine = clrFireBrick, color clrBodyText = clrFireBrick, color clrBodyCyrcle = clrRed);
          void                  Update();
          //------------------------------------------------------------------------------------
          bool                  ON_MasterPanel(int WhichMode, bool IsKey, int MoveX, int MoveY, int SizeX, int SizeY, int FontSize);
          C_MasterPanel         MasterPanel;    /*Must Static to know before state or define in class scope*///Alert("00 MasterPanel.is__MoveClicked: ", MasterPanel.is__MoveClicked); //
          //---
          //---
          //---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cp_StatusSubPadMini::ON_MasterPanel(int WhichMode, bool IsKey, int MoveX, int MoveY, int SizeX, int SizeY, int FontSize)// FIs_Create,  is__Move, MoveX, MoveY, SizeX, SizeY, FontSize = -3)
{         /*Alert("======================================");*/
          return _Show(MODE_CREATE, IsKey, MoveX, MoveY, SizeX, SizeY, FontSize = -3);
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cp_StatusSubPadMini::_Call(int   Type, bool  IsKey = false, bool Is_CreateMini = false,
                                int   MoveX = 0,   int   MoveY = 0,
                                int   SizeX = 0,   int   SizeY = 0,
                                int   FontSize = 0,//8
                                color clrBody = clrWhite,
                                color clrBodyMargine = clrFireBrick,
                                color clrBodyText = clrFireBrick,
                                color clrBodyCyrcle = clrRed)
{         //-------------------------------------------------------------------------------------------------------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
          bool Is_MoveTracking = false;
          //-------------------------------------------------------------------------------------------------------------------
          //---
          //---
          //---
          Manage_KeysActions_Data<Cp_StatusSubPadMini> KeysActions_Data;
          KeysActions_Data.ObjGetClassMember  = this;
          KeysActions_Data.NameCom            = "PadMini";//_MasterPanel
          KeysActions_Data.Type               = Type;
          KeysActions_Data.IsKey              = IsKey;            // = false;
          KeysActions_Data.Is_CreateMini      = Is_CreateMini;        // = false;
          KeysActions_Data.Is_Move            = Is_MoveTracking;      // = false;
          KeysActions_Data.MoveX              = MoveX;                // = 0;
          KeysActions_Data.MoveY              = MoveY;                // = 0;
          KeysActions_Data.SizeX              = 0;                    // = 0;
          KeysActions_Data.SizeY              = 0;                    // = 0;
          KeysActions_Data.FontSize           = -3;                   // = 0;//8
          KeysActions_Data.clrBody            = clrWhite;             // = clrWhite;
          KeysActions_Data.clrBodyMargine     = clrFireBrick;         // = clrFireBrick;
          KeysActions_Data.clrBodyText        = clrFireBrick;         // = clrFireBrick;
          KeysActions_Data.clrBodyCyrcle      = clrRed;               // = clrRed;
          KeysActions_Data.Is_PanelActive     = false;                // = false;
          KeysActions_Data.Is_Vertical        = false;                // = false; //
          //------------------------------------------------------------------
          /*Alert("TPX_DESC == PadMini __ KeysActions_Data.Type: ", KeysActions_Data.Type);*/
          return MasterPanel.Manage_KeysActions(KeysActions_Data); //  return   offf  for correction !
          //---
          //---
          //---
          //---
          //---
          //---
          //---
          //---
          //---
          if(false)//--defused for Manage_KeysActions do all self
          {         //-------------------------------------------------------------------------------------------------------------------
                    if(Type != -2) {MoveX = 15;       MoveY = 290;}
                    bool Is_Vertical = false;
                    //-------------------------------------------------------------------------------------------------------------------_MasterPanel
                    MasterPanel.Check_KeysStatus("PadMini", Type, Is_Vertical, IsKey, Is_CreateMini, Is_MoveTracking, IsPadActive_Mini, MoveX, MoveY, SizeX, SizeY, FontSize);
                    //-------------------------------------------------------------------------------------------------------------------
                    //"PadMiniMini-ExitLeftO1"  "PadMiniMove-ExitLeftO1"  "PadMiniExit-ExitLeftO1"
                    if(MasterPanel.Data.is__Delete || MasterPanel.Data.is__Create || MasterPanel.Data.is__Mini)
                    {         return _Show(MODE_CREATE, IsKey, MoveX, MoveY, SizeX, SizeY, FontSize = -3); }
                    //-------------------------------------------------------------------------------------------------------------------
                    //double true_range = (High==Low)?0:(Close-Open)/(High-Low);//
                    if(MasterPanel.Data.is__Move)//by function calling//
                    {         //-------------------------------------------------------------------------------------------------------------------
                              if(Is_MoveTracking) { MasterPanel.Data.is__MoveClicked = MasterPanel.Data.is__MoveClicked ? false : true; }
                              // Alert(" Is_MoveTracking: ", Is_MoveTracking, " === ", "MasterPanel.is__MoveClicked: ", MasterPanel.is__MoveClicked, " Is_Create: ", Is_Create, " MasterPanel.is__Move: ", MasterPanel.is__Move); //
                              //-------------------------------------------------------------------------------------------------------------------
                              if(!MasterPanel.Data.is__MoveClicked) {return false;}
                              else if(MasterPanel.Data.is__MoveClicked)
                              {         Complex.BottumXAllMove(MODE_CREATE, IsKey, MasterPanel.Data.CObj_Name, MasterPanel.Data.Obj_Is_Vertical,  Is_CreateMini, MoveX, MoveY );
                                        _Show(MODE_CREATE, IsKey, MoveX,   MoveY,   SizeX,   SizeY,   FontSize);//
                              }; ///
                              return true;//
                              //-------------------------------------------------------------------------------------------------------------------
                    }
                    //-------------------------------------------------------------------------------------------------------------------
                    if(MasterPanel.Data.is__RePos)  //int &MoveX, int &MoveY, int &SizeX, int &SizeY, int &FontSize
                    {         //Alert("is__RePos: ", is__RePos);
                              _Call(MODE_CREATE, IsKey = false, Is_CreateMini = false, Is_MoveTracking, MoveX, MoveY, SizeX,  SizeY, FontSize);
                              return _Call(MODE_REPOS, IsKey = true, Is_CreateMini = true, Is_MoveTracking,  MoveX, MoveY, SizeX, SizeY, FontSize); //
                    }
                    //-------------------------------------------------------------------------------------------------------------------
                    return false; //
          }//
          //---
          //---
          //---
          //---
          //---
          //---
          //-------------------------------------------------------------------------------------------------------------------
          return false; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cp_StatusSubPadMini::_Show(int WhichMode, bool IsKey, int MoveX = 0, int MoveY = 0, int SizeX = 0, int SizeY = 0, int FontSize = 0,
                                color clrBody = clrWhite, color clrBodyMargine = clrFireBrick,
                                color clrBodyText = clrFireBrick, color clrBodyCyrcle = clrRed)
{         //---
          //---
          //---
          //Alert("************************SubStatus_PadMini_Show******************************");//
          bool          TextColored     = false;
          double        FixedRatio      = 5; //6
          int           lenth           = 20;
          int           MoveinX         = 150;  ///-350;
          int           MoveinY         = 80 - 288; //MoveinX = -335; int MoveinY = 230;
          int           lenthText       = StringLen(CD_Status_PAD.Pad_MAmicro_TrendUp.Desc);
          //---
          //---
          //---
          if(StringLen(CD_Status_PAD.Pad_MAmicro_TrendUp.Desc) == 0)        {lenthText = StringLen("MicroTrendUP"); FixedRatio = 5;}
          if(!DoOnTimer)                                                                {lenthText = StringLen("MicroTrendUP"); FixedRatio = 5;} //
          //Alert("lenthText: ", lenthText, "--FixedRatio: ", FixedRatio); ///
          lenth                         = lenthText * (int)FixedRatio;
          //"MicroTrendUP" +
          int           MoveText        = 5;
          //---
          //---
          //---
          if(CD_Status_PAD.Pad_MAmicro_TrendUp.IsTrue && TextColored)clrBodyText = clrGreen;
          IsPadPress_MicroTrendUp = CD_Status_PAD.Pad_MAmicro_TrendUp.IsTrue;
          //=======================================
          bool res = Complex.Menu_ButtonXX(WhichMode, IsKey, CD_Status_PAD.Pad_MAmicro_TrendUp.Name, MoveX + MoveinX,  MoveY + MoveinY + 75, lenth, 0, FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
          clrBodyText = clrFireBrick;
          //---
          //---MoveX + MoveinX+
          //---MoveY + MoveinY +
          //Alert("************************SubStatus_PadMini_Show******************************res: ", res, "======X: ", MoveX + MoveinX - 100, "======Y: ", MoveY + MoveinY + 75); //
          //=======================================
          lenthText = StringLen(CD_Status_PAD.Pad_SuperIndicators_TrendUp.Desc);
          if(StringLen(CD_Status_PAD.Pad_SuperIndicators_TrendUp.Desc) == 0) {lenthText = StringLen("SuperKeysUP");}
          if(!DoOnTimer) lenthText = StringLen("SuperKeysUP");
          lenth = lenthText * (int)FixedRatio;
          //"SuperKeysUP" +
          if(CD_Status_PAD.Pad_SuperIndicators_TrendUp.IsTrue && TextColored)clrBodyText = clrGreen;
          IsPadPress_SuperKeysUp = CD_Status_PAD.Pad_SuperIndicators_TrendUp.IsTrue;//Is_Move, IsPadPress_SuperKeysUp,
          Complex.Menu_ButtonXX(WhichMode, IsKey, CD_Status_PAD.Pad_SuperIndicators_TrendUp.Name, MoveX + MoveinX, MoveY + MoveinY + 50, lenth, 0, FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
          clrBodyText = clrFireBrick;
          //---
          //---
          //---
          //=======================================
          lenthText = StringLen(CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.Desc);
          if(StringLen(CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.Desc) == 0) {lenthText = StringLen("Pad_OBVClose_EMA20_CrossUp_SMA20");}
          if(!DoOnTimer) lenthText = StringLen("Pad_OBVClose_EMA20_CrossUp_SMA20");
          lenth = lenthText * (int)FixedRatio;
          //"Pad_OBVClose_EMA20_CrossUp_SMA20" +
          if(CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.IsTrue && TextColored)clrBodyText = clrGreen;
          IsPadPress_OBVClose_EMA20 = CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.IsTrue;
          Complex.Menu_ButtonXX(WhichMode, IsKey, CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.Name, MoveX + MoveinX, MoveY + MoveinY + 25, lenth, 0, FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle, -48);
          clrBodyText = clrFireBrick;
          //---
          //---
          //---
          //=======================================
          lenthText = StringLen(CD_Status_PAD.Pad_MFI_Up.Desc);
          if(StringLen(CD_Status_PAD.Pad_MFI_Up.Desc) == 0) {lenthText = StringLen("MFI_UP");}
          if(!DoOnTimer) lenthText = StringLen("MFI_UP");
          lenth = lenthText * (int)FixedRatio - 30;
          // "MFI_UP" +
          if(CD_Status_PAD.Pad_MFI_Up.IsTrue && TextColored)clrBodyText = clrGreen;
          IsPadPress_MFI_Up = CD_Status_PAD.Pad_MFI_Up.IsTrue;
          Complex.Menu_ButtonXX(WhichMode, IsKey, CD_Status_PAD.Pad_MFI_Up.Name, MoveX + MoveinX, MoveY + MoveinY + 0, lenth + 30, 0, FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle, +13);
          clrBodyText = clrFireBrick;
          //---
          //---
          //---
          //=======================================
          lenthText = StringLen(CD_Status_PAD.Pad_BullsPower_14_UpTrend.Desc);
          if(StringLen(CD_Status_PAD.Pad_BullsPower_14_UpTrend.Desc) == 0) {lenthText = StringLen("Pad_BullsPower_14_UpTrend");}
          if(!DoOnTimer) lenthText = StringLen("Pad_BullsPower_14_UpTrend");
          lenth = lenthText * (int)FixedRatio;
          //"Pad_BullsPower_14_UpTrend" +
          if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._BullsPower.IsBullsPower_14_UpTrend && TextColored)clrBodyText = clrGreen;
          IsPadPress_BullsPower = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._BullsPower.IsBullsPower_14_UpTrend;
          Complex.Menu_ButtonXX(WhichMode, IsKey, CD_Status_PAD.Pad_BullsPower_14_UpTrend.Name, MoveX + MoveinX, MoveY + MoveinY + -25, lenth, 0, FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle, -33);
          clrBodyText = clrFireBrick;
          //---
          //---
          //---
          //=======================================
          lenthText = StringLen(CD_Status_PAD.Pad_Accelerator_Up.Desc);
          if(StringLen(CD_Status_PAD.Pad_Accelerator_Up.Desc) == 0) {lenthText = StringLen("Accelerator_UP");}
          if(!DoOnTimer) lenthText = StringLen("Accelerator_UP");
          lenth = lenthText * (int)FixedRatio;
          //"Accelerator_UP" +
          if(CD_Status_PAD.Pad_Accelerator_Up.IsTrue && TextColored)clrBodyText = clrGreen;
          IsPadPress_Accelerator_Up = CD_Status_PAD.Pad_Accelerator_Up.IsTrue;
          Complex.Menu_ButtonXX(WhichMode, IsKey, CD_Status_PAD.Pad_Accelerator_Up.Name, MoveX + MoveinX, MoveY + MoveinY + -50, lenth, 0, FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle, -5);
          clrBodyText = clrFireBrick;
          //---
          //---
          //---
          //=======================================
          lenthText = StringLen(CD_Status_PAD.Pad_WpR20_CrossUp_200.Desc);
          if(StringLen(CD_Status_PAD.Pad_WpR20_CrossUp_200.Desc) == 0) {lenthText = StringLen("Pad_WpR20_CrossUp_200");}
          if(!DoOnTimer) lenthText = StringLen("Pad_WpR20_CrossUp_200");
          lenth = lenthText * (int)FixedRatio;
          // "Pad_WpR20_CrossUp_200" +
          if(CD_Status_PAD.Pad_WpR20_CrossUp_200.IsTrue && TextColored)clrBodyText = clrGreen;
          IsPadPress_WpR20_CrossUp = CD_Status_PAD.Pad_WpR20_CrossUp_200.IsTrue;
          Complex.Menu_ButtonXX(WhichMode, IsKey, CD_Status_PAD.Pad_WpR20_CrossUp_200.Name, MoveX + MoveinX, MoveY + MoveinY + -75, lenth, 0, FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle, -25);
          //---
          //---
          //---MasterPanel.Data.CObj_Name
          Complex.BottumXAllMove(MODE_CREATE, IsKey, "X", MasterPanel.Data.Obj_Is_Vertical,  false, MoveX + 160, MoveY - 140 );
          //===============
          if(WhichMode == MODE_CREATE)return IsPadPress_Mini = IsKey;
          return  IsPadPress_Mini; //double true_range = (High==Low)?0:(Close-Open)/(High-Low);
          //---
          //---
          //---
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_StatusSubPadMini::Update()
{         color DNWard = clrRed, UPWard = clrDodgerBlue;
          if(true && !TRADER_Panel_DATA.IsConditionWatch && ct_Drive.TDD.ct_Conductor.Is_Condicatored) //unknowen panel objects
          {         if(ObjectFind(0, "LabelWpR20") >= 0)
                    {         if(!ObjectSetString(0, "LabelWpR20", OBJPROP_TEXT, 0, CD_Status_PAD.Pad_WpR20_CrossUp_200.Desc = "Pad_WpR20_CrossUp_200: " +  (string)CD_Status_PAD.Pad_WpR20_CrossUp_200.IsTrue  )) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_WpR20_CrossUp_200.IsTrue)
                              {         if(!ObjectSetInteger(0, "LabelWpR20", OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); }
                              else
                              {         if(!ObjectSetInteger(0, "LabelWpR20", OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); }
                              //
                    }
                    //=========================================
                    if(ObjectFind(0, "LabelAccelerator") >= 0)
                    {         if(!ObjectSetString(0, "LabelAccelerator", OBJPROP_TEXT, 0, CD_Status_PAD.Pad_Accelerator_Up.Desc = "Accelerator_UP: " +  (string)CD_Status_PAD.Pad_Accelerator_Up.IsTrue )) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_Accelerator_Up.IsTrue)
                              {         if(!ObjectSetInteger(0, "LabelAccelerator", OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); //
                              }
                              else
                              {         if(!ObjectSetInteger(0, "LabelAccelerator", OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); //
                              }
                              //
                    } //
                    //=========================================
                    if(ObjectFind(0, "LabelBullsPower") >= 0)
                    {         if(!ObjectSetString(0, "LabelBullsPower", OBJPROP_TEXT, 0, CD_Status_PAD.Pad_BullsPower_14_UpTrend.Desc = "Pad_BullsPower_14_UpTrend: " + (string)CD_Status_PAD.Pad_BullsPower_14_UpTrend.IsTrue )) //Set_Object//---ct_Drive.TDD.ct_Conductor.IsBullsPower_14_UpTrend
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_BullsPower_14_UpTrend.IsTrue)
                              {         if(!ObjectSetInteger(0, "LabelBullsPower", OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, "LabelBullsPower", OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              //
                    }
                    //=========================================
                    if(ObjectFind(0, "LabelMFI") >= 0)
                    {         if(!ObjectSetString(0, "LabelMFI", OBJPROP_TEXT, 0, CD_Status_PAD.Pad_MFI_Up.Desc = "MFI_UP: " + (string) CD_Status_PAD.Pad_MFI_Up.IsTrue )) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_MFI_Up.IsTrue)
                              {         if(!ObjectSetInteger(0, "LabelMFI", OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, "LabelMFI", OBJPROP_COLOR, DNWard )) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              //
                    }
                    //=========================================
                    if(ObjectFind(0, "LabelOBVClose") >= 0)
                    {         if(!ObjectSetString(0, "LabelOBVClose", OBJPROP_TEXT, 0, CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.Desc = "Pad_OBVClose_EMA20_CrossUp_SMA20: " + (string)CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.IsTrue )) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.IsTrue)
                              {         if(!ObjectSetInteger(0, "LabelOBVClose", OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, "LabelOBVClose", OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              //
                    }
                    //=========================================
                    if(ObjectFind(0, "LabelSuperKeys") >= 0)
                    {         if(!ObjectSetString(0, "LabelSuperKeys", OBJPROP_TEXT, 0, CD_Status_PAD.Pad_SuperIndicators_TrendUp.Desc = "SuperKeysUP: " +  (string)CD_Status_PAD.Pad_SuperIndicators_TrendUp.IsTrue )) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_SuperIndicators_TrendUp.IsTrue)
                              {         if(!ObjectSetInteger(0, "LabelSuperKeys", OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, "LabelSuperKeys", OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                    }
                    //=========================================
                    if(ObjectFind(0, "LabelMicroTrendUp") >= 0)
                    {         if(!ObjectSetString(0, "LabelMicroTrendUp", OBJPROP_TEXT, 0, CD_Status_PAD.Pad_MAmicro_TrendUp.Desc = "MicroTrendUP: " +  (string)CD_Status_PAD.Pad_MAmicro_TrendUp.IsTrue )) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_MAmicro_TrendUp.IsTrue)
                              {         if(!ObjectSetInteger(0, "LabelMicroTrendUp", OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, "LabelMicroTrendUp", OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              //
                    } //
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          if(ct_Drive.TDD.ct_Conductor.Is_Condicatored && RightMenu.SubStatus.PadMini.IsPadPress_Mini)//modify by timer//TRADER_Panel_DATA.IsConditionWatch &&
          {         string HelperName = "LabelMenuPadsMainText-" + "" + CD_Status_PAD.Pad_WpR20_CrossUp_200.Name; //+ " ";
                    //Alert("HelperName: ",HelperName);///
                    StringReplace(HelperName, "false", "");
                    StringReplace(HelperName, "true", "");
                    //"LabelMenuPadsMainText-Pad_WpR20_CrossUp_200";
                    //HelperName = "LabelMenuPadsMainText-Pad_WpR20_CrossUp_200 ";//LabelMenuPadsMainText-Pad_OBVClose_EMA20_CrossUp_SMA20
                    if(ObjectFind(0, HelperName) >= 0)
                    {         if(!ObjectSetString(0, HelperName, OBJPROP_TEXT, 0, CD_Status_PAD.Pad_WpR20_CrossUp_200.Desc = "Pad_WpR20_CrossUp_200" )) //Set_Object//+  (string)CD_Status_PAD.Pad_WpR20_CrossUp_200.IsTrue
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_WpR20_CrossUp_200.IsTrue)
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                    }
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    HelperName = "LabelMenuPadsMainText-" + "" + CD_Status_PAD.Pad_Accelerator_Up.Name; //+ " ";
                    StringReplace(HelperName, "false", "");
                    StringReplace(HelperName, "true", "");
                    //HelperName = "LabelMenuPadsMainText-Accelerator_UP ";
                    if(ObjectFind(0, HelperName) >= 0)
                    {         if(!ObjectSetString(0, HelperName, OBJPROP_TEXT, 0, CD_Status_PAD.Pad_Accelerator_Up.Desc = "Accelerator_UP" )) //Set_Object// +  (string)CD_Status_PAD.Pad_Accelerator_Up.IsTrue
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_Accelerator_Up.IsTrue)
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); //
                              }
                              else
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); //
                              }
                              //
                    }
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    HelperName = "LabelMenuPadsMainText-" + "" + CD_Status_PAD.Pad_BullsPower_14_UpTrend.Name; //+ " ";
                    StringReplace(HelperName, "false", "");
                    StringReplace(HelperName, "true", "");
                    //HelperName = "LabelMenuPadsMainText-Pad_BullsPower_14_UpTrend ";
                    if(ObjectFind(0, HelperName) >= 0)
                    {         if(!ObjectSetString(0, HelperName, OBJPROP_TEXT, 0, CD_Status_PAD.Pad_BullsPower_14_UpTrend.Desc = "Pad_BullsPower_14_UpTrend" )) //Set_Object// + (string)ct_Drive.TDD.ct_Conductor.IsBullsPower_14_UpTrend
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_BullsPower_14_UpTrend.IsTrue) //---ct_Drive.TDD.ct_Conductor.IsBullsPower_14_UpTrend
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                    }
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    HelperName = "LabelMenuPadsMainText-" + "" + CD_Status_PAD.Pad_MFI_Up.Name; //+ " ";
                    StringReplace(HelperName, "false", "");
                    StringReplace(HelperName, "true", "");
                    //HelperName = "LabelMenuPadsMainText-MFI_UP ";
                    if(ObjectFind(0, HelperName) >= 0)
                    {         if(!ObjectSetString(0, HelperName, OBJPROP_TEXT, 0, CD_Status_PAD.Pad_MFI_Up.Desc = "MFI_UP" )) //Set_Object// + (string) CD_Status_PAD.Pad_MFI_Up.IsTrue
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_MFI_Up.IsTrue)
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, DNWard )) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                    }
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    HelperName = "LabelMenuPadsMainText-" + "" + CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.Name; //+ " ";
                    StringReplace(HelperName, "false", "");
                    StringReplace(HelperName, "true", "");
                    //HelperName = "LabelMenuPadsMainText-Pad_OBVClose_EMA20_CrossUp_SMA20 ";
                    if(ObjectFind(0, HelperName) >= 0)
                    {         if(!ObjectSetString(0, HelperName, OBJPROP_TEXT, 0, CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.Desc = "Pad_OBVClose_EMA20_CrossUp_SMA20")) //Set_Object// + (string)CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.IsTrue
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.IsTrue)
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                    }
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    HelperName = "LabelMenuPadsMainText-" + "" + CD_Status_PAD.Pad_SuperIndicators_TrendUp.Name; //+ " ";
                    StringReplace(HelperName, "false", "");
                    StringReplace(HelperName, "true", "");
                    //HelperName = "LabelMenuPadsMainText-SuperKeysUP ";
                    if(ObjectFind(0, HelperName) >= 0)
                    {         if(!ObjectSetString(0, HelperName, OBJPROP_TEXT, 0, CD_Status_PAD.Pad_SuperIndicators_TrendUp.Desc = "SuperKeysUP")) //Set_Object// +  (string)CD_Status_PAD.Pad_SuperIndicators_TrendUp.IsTrue
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_SuperIndicators_TrendUp.IsTrue)
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                    }//
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    HelperName = "LabelMenuPadsMainText-" + "" + CD_Status_PAD.Pad_MAmicro_TrendUp.Name; //+ " ";
                    StringReplace(HelperName, "false", "");
                    StringReplace(HelperName, "true", "");
                    //HelperName = "LabelMenuPadsBox2-MicroTrendUP ";
                    if(ObjectFind(0, HelperName) >= 0)
                    {         if(!ObjectSetString(0, HelperName, OBJPROP_TEXT, 0, CD_Status_PAD.Pad_MAmicro_TrendUp.Desc = "MicroTrendUP")) //Set_Object// +  (string)CD_Status_PAD.Pad_MAmicro_TrendUp.IsTrue
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                              if(CD_Status_PAD.Pad_MAmicro_TrendUp.IsTrue)
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, HelperName, OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("-Line:", __LINE__, " ChartMeterX"); } //
                    }//
          }//
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          if(RightMenu.SubStatus.PadMini.IsPadPress_Mini)
          {         color ColorBody           = clrWhite;
                    color ColorBodyMargine    = clrNavy;
                    color ColorBodyText       = clrNavy;
                    color ColorBodyCyrcle     = clrRed;    //
                    Complex.Menu_Button(MODE_MODIFY, CD_Status_PAD.Pad_WpR20_CrossUp_200.IsTrue,                  CD_Status_PAD.Pad_WpR20_CrossUp_200.Name,                   ColorBody, ColorBodyMargine, clrWhite, ColorBodyCyrcle = clrYellowGreen);
                    Complex.Menu_Button(MODE_MODIFY, CD_Status_PAD.Pad_Accelerator_Up.IsTrue,                     CD_Status_PAD.Pad_Accelerator_Up.Name,                      ColorBody, ColorBodyMargine, clrWhite, ColorBodyCyrcle = clrYellowGreen);
                    Complex.Menu_Button(MODE_MODIFY, CD_Status_PAD.Pad_BullsPower_14_UpTrend.IsTrue,              CD_Status_PAD.Pad_BullsPower_14_UpTrend.Name,               ColorBody, ColorBodyMargine, clrWhite, ColorBodyCyrcle = clrYellowGreen);
                    Complex.Menu_Button(MODE_MODIFY, CD_Status_PAD.Pad_MFI_Up.IsTrue,                             CD_Status_PAD.Pad_MFI_Up.Name,                              ColorBody, ColorBodyMargine, clrWhite, ColorBodyCyrcle = clrYellowGreen);
                    Complex.Menu_Button(MODE_MODIFY, CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.IsTrue,       CD_Status_PAD.Pad_OBVClose_EMA20_CrossUp_SMA20.Name,        ColorBody, ColorBodyMargine, clrWhite, ColorBodyCyrcle = clrYellowGreen);
                    Complex.Menu_Button(MODE_MODIFY, CD_Status_PAD.Pad_SuperIndicators_TrendUp.IsTrue,            CD_Status_PAD.Pad_SuperIndicators_TrendUp.Name,             ColorBody, ColorBodyMargine, clrWhite, ColorBodyCyrcle = clrYellowGreen);
                    Complex.Menu_Button(MODE_MODIFY, CD_Status_PAD.Pad_MAmicro_TrendUp.IsTrue,                    CD_Status_PAD.Pad_MAmicro_TrendUp.Name,                     ColorBody, ColorBodyMargine, clrWhite, ColorBodyCyrcle = clrYellowGreen);
                    //
          } //
}
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
