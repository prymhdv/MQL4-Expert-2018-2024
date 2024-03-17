//+------------------------------------------------------------------+
//|                                                 C_STATICSUN-.mqh |
//|                                                    A pourya 2021 |waite until Correction
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//>>>>>>>>>>>>>>>>>>>>>>>>>.deffrence that un solveing members////



//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+
class C_STATICSUN//Keys//Variables//Functions
{
public://Constructors
          void           C_STATICSUN (C_STATICSUN &);
          void           C_STATICSUN ();
          void           C_STATICSUN (string ComName = "Frist_obj"); //MyRoboTrader &);
          //void         Return_obj(C_STATICSUN & obj1) {return obj1; }; ///reback self object//// (C_STATICSUN &){return obj1; }
          //////////////////
          void           ~ C_STATICSUN ();
          static bool    Update();
          static bool    UPDATED;
/////////creating object in timer of static obj caused re create and redelete...destructor call

////InformStatic InformStaticX;///bingo InformStaticX.....pointing by InformStatic::Member////not craationg obj///
          //abstract///virtual void -C_STATICSUN-::Sound() = 0;   // A pure virtual function
          //abstract////virtual void -C_STATICSUN-::Sound() = NULL; // PURE method, should be overridden in the derived class, CAnimal is now abstract and cannot be created
////--- Examples of wrong use
//          new CAnimal;         // Error of 'CAnimal' - the compiler returns the "cannot instantiate abstract class" error
//          CAnimal some_animal; // Error of 'CAnimal' - the compiler returns the "cannot instantiate abstract class" error
////--- A pure virtual function
//   virtual void      Sound(void)=NULL;
//===================================================================================================

/////////////////////////////////////////////////////////////////////////////////////////////////////
public://other classs member///
          //static string runFuncList2;
private: ///informStatic::informStatic(); cant access obj//protected://just method of class
          string                 ClassObject_Name;
          string                 ClassObject_LastName;
          int                    ClassObject_Score;
          //mutable int number;
          int getName()const;
          //firend int func()const;
          virtual const int functest(int, int&[])const;
          //.
          //.
          //.
/////////////////////////////////////////////////////////////////////////////////////////////////////
public://Labels
          //-----this module is rejected by MCV modoule architecture prinsipals..
          //static string          _LabelLogerBuyMarket;////its filed when sending Orders
          //static string          _LabelLogerSellMarket;////its filed when sending Orders
          //static string          _LabelLogerBuyStop;////its filed when sending Orders
          //static string          _LabelLogerBuyLimit;////its filed when sending Orders
          //static string          _LabelLogerSellStop;////its filed when sending Orders
          //static string          _LabelLogerSellLimit;////its filed when sending Orders
          //==================

//==========
public://Keys
          //=======================
public://Keys
          static bool            KeySuperviser;
          static bool            SuperKeyClose;


/////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////
protected: static bool           KeyLog;
/////////////////////////////////////////////////////////////////////////////////////////////////////
public://Variables

          //KeyStartingAllowX//////////////////////////////////////////////////////////////////////////////////////////
          static bool            UpdateKeys_RunTimes(bool KeyCreate = false);
          //=================================================================
          static bool            LabelPadFlowD2;// = false; //
/////////////////////////////////////////////////////////////////////////////////////////////////////
          static double          true_range;
          //iLow("USDCHF", PERIOD_H1, 0);
////////////////////////////////////////////////////////////////////////////////////////////////////
          //informStatic static informStatic:: X;
          ///informStatic obj1;
          //=================================================================


          static string         ObjectsTotalStatic; // = "-ObjectsTotal:" + (string)ObjectsTotal();
          static uint           ObjectsTotalCount; // = "-ObjectsTotal:" + (string)ObjectsTotal();
          //================================

          ///============================

//================================
          /////
          //static color         TradePanel_COLOR_GREEN;///ooff because class of it created againd
          //static color         TradePanel_COLOR_RED;
          //static color         TradePanel_COLOR_FONT;
          ////////
          static color           DescColorPress;
          static color           BackColorPress;
          static color           BorderColorPress;
          static color           DescColor;
          static color           BackColor;
          static color           BorderColor;
public: // Class needs
          static int             Counters_ToolsController; // = 0
          static bool            ClassObjects;
          static string          ObjectsTotalX;
/////////////////////////////////////////////////////////////////////////////////////////////////////
public:///Functions
          static int             ObjectsTotalLastIndex() {  return (ObjectsTotal() - 1);}  //uint not work well in j-- prosesse loop
          static bool            DeleteAnaliseAllObjectName(bool Is_ObjectAnalise = false, bool Is_ObjectsDeleteAll = false, bool Is_ObjectDeleteAllByName  = false, string nameCOM = "-C_STATICSUN-::DeleteObject", int LineCOM = 0, string FuncCome = "None"); ///__LINE__)



          static int             Capacity(); /// informStatic::Capacity());access
          static double          Square(const double w, const double h);
/////////////////////////////////////////////////////////////////////////////////////////////////////
protected:////access eroor in other classs when protected staric access ..  informStatic::KeyPressed_TicketManage;
          ///informStatic::informStatic(); cant access obj
/////////////////////////////////////////////////////////////////////////////////////////////////////
public:
          template<typename Typer2>
          static void C_STATICSUN::CheckPointerX3(   Typer2 * c_items, Typer2 & c_items_Array[]); ///>>>gone globals Static
          //static void -C_STATICSUN-::CheckPointerX4(ToolsController * c_items, ToolsController & c_items_Array[]);///may not defined type before caling class...up one..
/////////////////////////////////////////////////////////////////////////////////////////////////////

} ;
//======================================================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//======================================================================================================
bool            C_STATICSUN::UPDATED = false;
//=====================
///public://Labels

//===============================================

//===============================================
bool            C_STATICSUN::KeyLog = false;
bool            C_STATICSUN::KeySuperviser = false;
bool            C_STATICSUN::SuperKeyClose = false;


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
int             C_STATICSUN::Counters_ToolsController = -1; ////just in scope off funcions////or class definig zone


color          C_STATICSUN::DescColorPress = -1;
color          C_STATICSUN::BackColorPress = -1;
color          C_STATICSUN::BorderColorPress = -1;
color          C_STATICSUN::DescColor = -1;
color          C_STATICSUN::BackColor = -1;
color          C_STATICSUN::BorderColor = -1;
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
bool            C_STATICSUN::ClassObjects  = Capitan_DeinitClass;



/////////////////////////////////////////////////
//========================================================================================
///---------------------------------------
uint            C_STATICSUN::ObjectsTotalCount = ObjectsTotal();
string          C_STATICSUN::ObjectsTotalStatic = " (ObjectsTotal: " + (string)ObjectsTotal() + ") ";
//=================
///just for assinig frist values....for initing need func scope in timer..>>>Upadate staticfunction



//0000000000000000000000000000000000000000000000000000000000000000
//color           C_STATICSUN::TradePanel_COLOR_GREEN = clrNONE;
//color           C_STATICSUN::TradePanel_COLOR_RED = clrNONE;
//color           C_STATICSUN::TradePanel_COLOR_FONT = clrNONE;
///----------------------------------------------------------------
double Ranged = -1 ; //(High[0] == Low[0]) ? 0 : (Close[0] - Open[0]) / (High[0] - Low[0]);////if(true)Ranged = (High[0] == Low[0]) ? 0 : (Close[0] - Open[0]) / (High[0] - Low[0]);
double          C_STATICSUN::true_range = Ranged;//must after chart loded if(iBars(NULL,0)>0)
//======================================================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//======================================================================================================

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_STATICSUN::~ C_STATICSUN ()
{         //Alert("Deinit: ", __FUNCSIG__, __LINE__); //
          RunCallFunction++; if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          // if(-C_STATICSUN-::ClassObjects && false) ///call every time want value...creating object in timer
          //Alert("Deinit: ", __FUNCSIG__, __LINE__); //
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_STATICSUN::C_STATICSUN () ///when call func it create obj from class that hass static members//informStatic::informStatic(informStatic&)wrong work only default func
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(iBars(NULL, 0) > 0)
                    C_STATICSUN::true_range = (High[0] == Low[0]) ? 0 : (Close[0] - Open[0]) / (High[0] - Low[0]);//must after chart loded if(iBars(NULL,0)>0)
          //=============
          static int tries = 0;
          Alert("tries:", tries++, "   __FUNCTION__:", __FUNCTION__);
          ///   return obj1;///void return..
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+//there is no object then not to constructor run///
C_STATICSUN::C_STATICSUN (string ComName = "Frist_obj") //MyRoboTrader &)///is default
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_STATICSUN::Update()
{         UPDATED = false;
          if(1)C_STATICSUN::UpdateKeys_RunTimes(true);////set Base Keys KeyRunMarket
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATED = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          if(! UPDATED)     {Alert("C_STATICSUN::UPDATED: ",  UPDATED);}
          return UPDATED;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_STATICSUN::DeleteAnaliseAllObjectName(bool Is_ObjectAnalise = false, bool Is_ObjectsDeleteAll = false, bool Is_ObjectDeleteAllByName  = false, string nameCOM = "-C_STATICSUN-::DeleteObject", int LineCOM = 0, string FuncCome = "None") ///__LINE__)
{         ///
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          if(Capitan_KeyDeleter)
          {         if(Is_ObjectDeleteAllByName)
                              if(ObjectFind(0, nameCOM) >= 0)
                              {         if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                                        if(!ObjectDelete(0, nameCOM))//   if(ObjectsDeleteAll(0, nameCOM) < 1)
                                        {         Alert("failed DeleteOP >>" + nameCOM, " =Line=(", LineCOM, ")=Func=(", FuncCome);
                                                  ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
                                                  //=========================================================|
                                                  if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                                                  return false;//
                                        }
                                        else
                                        {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
                                                  //=========================================================|
                                                  if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                                                  return true; //
                                        }////
                              }
                              else if(Capitan_KeyAlertNotFound)  Alert("**failed**<< OP cant Find >>" + nameCOM, " =Line=", LineCOM, ")=Func=(", FuncCome);
                    if(Is_ObjectAnalise)
                    {         //
                              if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                              //
                              string name;
                              if(ObjectsTotal() >= 0)
                              {         for(int i = 0; i < ObjectsTotal(); i++)
                                        {         name = ObjectName(i);
                                                  //Alert(i + 1, " object - ", name, " =Line=", LineCOM, ")=Func=(", FuncCome); //
                                                  //PrintFormat("%d object: Object name - %s", i, name); //
                                        } //
                              }; //
                              //
                              if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                              //
                    }
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    if(Is_ObjectsDeleteAll) { ObjectsDeleteAll(); } //
                    //////////////////////////////
                    //________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    //if(ObjectFind(0,nameCOM) < 0)
                    //        if(!ObjectCreate(0,nameCOM, OBJ_VLINE, window, dt, price))
                    //                  Alert("failed OP >>" + nameCOM, " =Line=", LineCOM);
                    //////////////////////////////////////////
          }
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return false;
///
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
static bool C_STATICSUN::UpdateKeys_RunTimes(bool KeyCreate = false) ///by timer
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //Alert(__FUNCSIG__);//
          if(KeyCreate)
          {         //=========================================================|
                    //StaticKeysController::PanelOnOff=false;
                    //=========================================================|
                    //KeyStartingAllowX===============================================================================================
                    //=========================================================|
                    //=========================================================|
                    return true;//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
static double C_STATICSUN::Square(const double w, const double h)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(h * w); //
}

template<typename Typer2>
void C_STATICSUN::CheckPointerX3(Typer2 * c_items, Typer2 & c_items_Array[]) //Typer2 * m_items,
//============================================
{         //________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(CheckPointer(c_items) == POINTER_INVALID)
          {         //Print("POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " to be deleted -is Incorrect pointer - If an incorrect pointer is used, the program execution will be immediately terminated.");
                    Alert("POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " to be deleted -is Incorrect pointer -If an incorrect pointer is used, the program execution will be immediately terminated.");
                    // delete (item);//
          }
          else
          {         //Print("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not Incorrect pointer");//
                    Alert("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not Incorrect pointer");//
          }//
          //============================================
          if(CheckPointer(c_items) == POINTER_DYNAMIC)///need Pointer type of any objects
          {         //
                    //The delete() operator can and should be used only for such pointers.
                    //Print("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
                    Alert("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
                    // delete (item);//
          }
          else
          {         //
                    //The delete() operator can and should be used only for such pointers.
                    //Print("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
                    Alert("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
          }//
          //============================================
          if(CheckPointer(c_items) == POINTER_AUTOMATIC)
          {         //
                    //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
                    //Print("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
                    Alert("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
                    // delete (item);//
          }
          else
          {         //
                    //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
                    //Print("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
                    Alert("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
          }//
          //---------------------------------------------------------------------------------------------
          for(int i = 0;  ArraySize(c_items_Array) >= i; i++)
          {         if(CheckPointer(c_items_Array[i]) == POINTER_INVALID)///c_items_Array[i]
                    {         //Print("POINTER_INVALID object<<<<< ", "item.Identifier(c_items):",i, " to be deleted -is Incorrect pointer - If an incorrect pointer is used, the program execution will be immediately terminated.");
                              Alert("POINTER_INVALID object<<<<< ", "item.Identifier(c_items):", i, " to be deleted -is Incorrect pointer -If an incorrect pointer is used, the program execution will be immediately terminated.");
                              // delete (item);//
                    }
                    else
                    {         //Print("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items):",i, " cannot be deleted -not Incorrect pointer");//
                              Alert("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items):", i, " cannot be deleted -not Incorrect pointer"); //
                    }//
                    //============================================
                    if(CheckPointer(c_items_Array[i]) == POINTER_DYNAMIC)///need Pointer type of any objects
                    {         //
                              //The delete() operator can and should be used only for such pointers.
                              //Print("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
                              Alert("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
                              // delete (item);//
                    }
                    else
                    {         //
                              //The delete() operator can and should be used only for such pointers.
                              //Print("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
                              Alert("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
                    }//
                    //============================================
                    if(CheckPointer(c_items_Array[i]) == POINTER_AUTOMATIC)
                    {         //
                              //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
                              //Print("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
                              Alert("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
                              // delete (item);//
                    }
                    else
                    {         //
                              //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
                              //Print("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
                              Alert("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
                    }//
                    //
          }//
          //________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//void -C_STATICSUN-::CheckPointerX4(ToolsController * c_items, ToolsController & c_items_Array[])   //Typer2 * m_items,
////============================================
//{
//________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
//         //=========================================================|
//  if(CheckPointer(c_items) == POINTER_INVALID)
//          {         //Print("POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " to be deleted -is Incorrect pointer - If an incorrect pointer is used, the program execution will be immediately terminated.");
//                    Alert("POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " to be deleted -is Incorrect pointer -If an incorrect pointer is used, the program execution will be immediately terminated.");
//                    // delete (item);//
//          }
//          else
//          {         //Print("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not Incorrect pointer");//
//                    Alert("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not Incorrect pointer");//
//          }//
//          //============================================
//          if(CheckPointer(c_items) == POINTER_DYNAMIC)///need Pointer type of any objects
//          {         //
//                    //The delete() operator can and should be used only for such pointers.
//                    //Print("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
//                    Alert("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
//                    // delete (item);//
//          }
//          else
//          {         //
//                    //The delete() operator can and should be used only for such pointers.
//                    //Print("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
//                    Alert("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
//          }//
//          //============================================
//          if(CheckPointer(c_items) == POINTER_AUTOMATIC)
//          {         //
//                    //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
//                    //Print("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
//                    Alert("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
//                    // delete (item);//
//          }
//          else
//          {         //
//                    //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
//                    //Print("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
//                    Alert("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
//          }//
//          //---------------------------------------------------------------------------------------------
//          for(int i = 0;  ArraySize(c_items_Array) >= i; i++)
//          {         if(CheckPointer(c_items_Array[i]) == POINTER_INVALID)///c_items_Array[i]
//                    {         //Print("POINTER_INVALID object<<<<< ", "item.Identifier(c_items):",i, " to be deleted -is Incorrect pointer - If an incorrect pointer is used, the program execution will be immediately terminated.");
//                              Alert("POINTER_INVALID object<<<<< ", "item.Identifier(c_items):", i, " to be deleted -is Incorrect pointer -If an incorrect pointer is used, the program execution will be immediately terminated.");
//                              // delete (item);//
//                    }
//                    else
//                    {         //Print("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items):",i, " cannot be deleted -not Incorrect pointer");//
//                              Alert("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items):", i, " cannot be deleted -not Incorrect pointer"); //
//                    }//
//                    //============================================
//                    if(CheckPointer(c_items_Array[i]) == POINTER_DYNAMIC)///need Pointer type of any objects
//                    {         //
//                              //The delete() operator can and should be used only for such pointers.
//                              //Print("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
//                              Alert("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
//                              // delete (item);//
//                    }
//                    else
//                    {         //
//                              //The delete() operator can and should be used only for such pointers.
//                              //Print("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
//                              Alert("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
//                    }//
//                    //============================================
//                    if(CheckPointer(c_items_Array[i]) == POINTER_AUTOMATIC)
//                    {         //
//                              //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
//                              //Print("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
//                              Alert("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
//                              // delete (item);//
//                    }
//                    else
//                    {         //
//                              //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
//                              //Print("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
//                              Alert("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
//                    }//
//                    //
//          }//
//________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
//         //=========================================================|
//}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//- for use in OnChart() event
struct S_ONCHART
{         int id; long  lparam; double  dparam; string  sparam;
          bool GetOnChart() { this.id = id; this.lparam = lparam; this.dparam = dparam; this.sparam = sparam; return true;}; // //-- write parameter to the system global variables
}; S_ONCHART ONCHART;
//+------------------------------------------------------------------+
