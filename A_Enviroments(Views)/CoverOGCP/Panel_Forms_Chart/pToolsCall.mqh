//+------------------------------------------------------------------+
//|                                                  C_TOOLSCALL.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Arrays\ArrayString(MQL4).mqh>
//+------------------------------------------------------------------+
//|             Class Cgp_ElliotWavePAD     BEGIN-END                |
//+------------------------------------------------------------------+

//-------------------------------------------------------------------
class C_TOOLSCALL
{
private:
//====================================================================
public:
          C_TOOLSCALL();
          ~C_TOOLSCALL();//
//====================================================================
          void                  Create(bool KeyCreate, const int Safe_ObjectsTotal_BeforeFuncRun);
          void                  OnChartEvents(const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None");
          void                  MOUSE_MOVE(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None");

          int                    UpdateSecound;//
//====================================================================
          /*static*/ CArrayString_MQL4   ArrayStringKeyToolsBox;///Bingooo??***
          CArrayString_MQL4           ArrayStringX,  ArrayStringXComFuncSafeKeeper;

          void                   CalcByTypeName(bool Keyrun = false, string TypeName = "", int ArraySizeX = 5, bool KeyFillArray = false, bool KeySearchArray = false, bool KeyInserToSorted = false);
//====================================================================
          bool                   KeyToolsBox;
          bool                   KeyToolsBoxClear;
          string                 ToolsBoxClearPreFix;// ="WM3_"
          string                 ObjectCreatedAfterKeyToolsBox[500];
          int                    ObjectCreatedAfterKeyToolsBoxSize;
          datetime               ToolsBoxSafe_Time;// = TimeGMT()
//====================================================================
          ///
};
//---off--- CArrayString_MQL4             C_TOOLSCALL::ArrayStringKeyToolsBox;  //---off--- when off not detected
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TOOLSCALL::C_TOOLSCALL()
{         RunCallFunction++; UpdateSecound = 2;
          //---------------------------------------
          KeyToolsBox                           = false;
          KeyToolsBoxClear                      = false;;
          ToolsBoxClearPreFix                   = "WM3_";
          ToolsBoxSafe_Time                     = TimeGMT();
          //---off--ObjectCreatedAfterKeyToolsBox[500];
          ObjectCreatedAfterKeyToolsBoxSize     = -1;//
          //---------------------------------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TOOLSCALL::~C_TOOLSCALL()
{}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TOOLSCALL::Create(bool KeyCreate, const int Safe_ObjectsTotal_BeforeFuncRun)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(KeyCreate) //
          {         if(!KeyToolsBoxClear)
                    {         //===================================//>>Alert(KeyToolsBox, "--KeyToolsBox"); //
                              const static int Safe_ObjectsTotal_AfterFuncRun = C_STATICSUN::ObjectsTotalLastIndex();; ///Safe_ObjectsTotal_AfterFuncRun = ObjectsTotal();This value must be greater or equal to 0 and less than ObjectsTotal().
                              //===================================
                              int diff_AddedObjectCount_AfterFuncRun = Safe_ObjectsTotal_AfterFuncRun - Safe_ObjectsTotal_BeforeFuncRun;
                              int diff_CreatedObjectCount_AfterFuncRun = 0;//28//>>>mean object adding after key down in flowpad
                              //===================================
                              static const datetime Safe_Time = TimeGMT();/// Alert (Safe_Time, ">-Safe_Time-<"); //TimeCurrent();
                              //===================================
                              const static int Safe_ObjectsTotal_AfterFuncRunExisted = diff_AddedObjectCount_AfterFuncRun + Safe_ObjectsTotal_BeforeFuncRun;
                              //Alert(Safe_ObjectsTotal_AfterFuncRunExisted," = ",diff_AddedObjectCount_AfterFuncRun," + ",Safe_ObjectsTotal_BeforeFuncRun   ,"-Safe_ObjectsTotal_AfterFuncRunExisted = diff_AddedObjectCount_AfterFuncRun + Safe_ObjectsTotal_BeforeFuncRun",ObjectsTotal() );
                              //===================================2<<0,1////
                              //string LastCreatedObjectNameSToolsBox2[2][1] = {{"" }, {"" } }; //[Name][Type]//String searching//  a[4][4] = { {1, 1, 1, 1}, {2, 2, 2, 2}, {3, 3, 3, 3}, {4, 4, 4, 4 } };
                              //ArrayResize(LastCreatedObjectNameSToolsBox2, Safe_ObjectsTotal_AfterFuncRun);
                              //int ArrayDimension_LastCreatedObjectNameSToolsBox2 = ArrayDimension(LastCreatedObjectNameSToolsBox2);
                              //Alert(ArrayDimension_LastCreatedObjectNameSToolsBox2, " --ArrayDimension_LastCreatedObjectNameSToolsBox2--");
                              //===================================
                              int Counter = 0;
                              bool KeyNotFound = false;
                              int AddedObjectCount = 0;
                              //===================================
                              //===================================TotalExisted
                              string CreatedObjectNameExistedBeforeInsertOBJSafe[];
                              ArrayResize(CreatedObjectNameExistedBeforeInsertOBJSafe, Safe_ObjectsTotal_AfterFuncRunExisted); ///incluse allelements///ObjectsTotal() not...even if occured
                              //fill the one new from all,,,//zero old
                              //===================================
                              //=============Safe_ObjectsTotal_AfterFuncRunExisted====================== //Even adding any object..
                              bool Is_AddingAnyObject_AfterFuncRun = (Safe_ObjectsTotal_AfterFuncRunExisted <  C_STATICSUN::ObjectsTotalLastIndex());
                              if(Is_AddingAnyObject_AfterFuncRun) //+28///Safe_ObjectsTotal_AfterFuncRun = ObjectsTotal();This value must be greater or equal to 0 and less than ObjectsTotal().
                              {         //===================================
                                        diff_CreatedObjectCount_AfterFuncRun = (ObjectsTotal() - (Safe_ObjectsTotal_AfterFuncRunExisted));
                                        AddedObjectCount = 0; //= (uint)MathAbs(LastCreatedObjectNameElementCount - LastCreatedObjectNameElementCountSafeBefore);
                                        AddedObjectCount = (int)MathAbs(C_STATICSUN:: ObjectsTotalLastIndex() - Safe_ObjectsTotal_AfterFuncRunExisted); //uint not accepted int //negative values
                                        int AddedObjectCountIndex = Safe_ObjectsTotal_AfterFuncRun;//LastCreatedObjectNameElementCount;
                                        //===================================
                                        //===================================Printing Result
                                        if(0)
                                        {         //    //CalcByTypeName(1,"Rectangle", 50);
                                                  //===========
                                                  //CalcByTypeName(bool Keyrun = false, string TypeName = "", int ArraySizeX = 5, bool KeyFillArray = false, bool KeySearchArray = false, bool KeyInserToSorted = false);///
                                                  CalcByTypeName(1, "Rectangle", 50, 1, 0); //filing
                                                  CalcByTypeName(1, "Rectangle", 50, 0, 1); //Searching
                                                  //=========== Triangle
                                                  CalcByTypeName(1, "Line", 50, 1, 0); //filing
                                                  CalcByTypeName(1, "Line", 50, 0, 1); //Searching
                                                  //===========
                                        } //
                              } //
                              //===================================
                              //ObjectFind();
                              //ObjectType();
                              //(int)C_STATICSUN:: ObjectsTotalLastIndex();//
                              //string ObjectCreatedAfterKeyToolsBox[500][1][1];
                              //>>>Gone Global Class ///string ObjectCreatedAfterKeyToolsBox[500];
                              ObjectCreatedAfterKeyToolsBoxSize = ArrayResize(ObjectCreatedAfterKeyToolsBox, AddedObjectCount);
                              //int j = (int)k;///u init in decrising ...gone uter number 66666666.....
                              //===================================
                              // Alert ("k == 0 >>", k  == 0, "---", C_STATICSUN:: ObjectsTotalLastIndex(), " ObjectsTotalLastIndex()", ObjectCreatedAfterKeyToolsBox[0], "--ObjectCreatedAfterKeyToolsBox[", 0, "]"); //
                              ///Not Working/// j  == 0
                              int j = 0;
                              //===================================
                              bool Filling = true;
                              if(Filling)
                              {         //
                                        for(j = C_STATICSUN:: ObjectsTotalLastIndex() ; j  >= 0 ; j--) ///j=(130:0)//j  == 0//Not work
                                        {         //===================================
                                                  // Alert("j: ", j, "----", C_STATICSUN:: ObjectsTotalLastIndex(), " ObjectsTotalLastIndex()", ObjectCreatedAfterKeyToolsBox[0], "--ObjectCreatedAfterKeyToolsBox[", 0, "]"); //
                                                  // CreatedObjectNameInsertSafe[FreeElement] = ObjectName(i); //InsertedLastObjectIndex// uint InsertedLastObjectIndex = i;
                                                  //Alert("Printing>>", "--ArraySize(CreatedObjectNameInsertSafe): ", ArraySize(CreatedObjectNameInsertSafe), " --j: ", j );
                                                  //Alert("Printing>>", CreatedObjectNameInsertSafe[j - 1], " :CreatedObjectNameInsertSafe[", j, "]");
                                                  //===================================
                                                  //(int)Safe_ObjectsTotal_AfterFuncRunExisted;
                                                  string                    KeepName                         = ObjectName(j);
                                                  string                    KeepNameUnchange                 = ObjectName(j);
                                                  bool                      PreFixingName = false;//                    = ObjectSetString(0, KeepName, OBJPROP_NAME, ToolsBoxClearPreFix + KeepName );
                                                  //===================================
                                                  int                       TypeValue                        = 0;
                                                  double                    CREATETIMEValdouble              = ObjectGet(KeepName, OBJPROP_CREATETIME);
                                                  long                      CREATETIMEVallong                = ObjectGetInteger(0, KeepName, OBJPROP_CREATETIME, TIME_DATE | TIME_MINUTES | TIME_SECONDS);
                                                  datetime                  CREATETIME                       = (datetime) CREATETIMEValdouble ;//fore more deiffrence
                                                  datetime                  CREATETIME_long                  = (datetime) CREATETIMEVallong ;//fore more deiffrence
                                                  //Alert("--CREATETIMEVallong: ",CREATETIMEVallong,"--CREATETIMEValdouble:",CREATETIMEValdouble,"--CREATETIMEVallong==CREATETIMEValdouble: ",CREATETIMEVallong==CREATETIMEValdouble);
                                                  //Alert("--CREATETIME: ",CREATETIME,"--CREATETIME_long: ",CREATETIME_long,"--Seconds(): ",Seconds() );//
                                                  //=====================
                                                  int                       CREATETIMETimeSeconds            = TimeSeconds(CREATETIME);
                                                  int                       CREATETIMEMiliSeconds            = (int)CREATETIME * 1000;
                                                  string                    CREATETIMEDesc                   = TimeToString(CREATETIME, TIME_DATE | TIME_MINUTES | TIME_SECONDS);
                                                  //============
                                                  string                    Seprator                         = "__" + "__" + CREATETIMEDesc + "__";
                                                  //===================================
                                                  static const string       KeepNameLastExisted              = ObjectName(Safe_ObjectsTotal_AfterFuncRunExisted);
                                                  static const double       CREATETIMEValdoubleLastExisted   = ObjectGet(KeepNameLastExisted, OBJPROP_CREATETIME);
                                                  datetime                  CREATETIMELastExisted            = (datetime)CREATETIMEValdoubleLastExisted;///***attention
                                                  int                       CREATETIMELastExistedTimeSeconds = TimeSeconds(CREATETIMELastExisted);
                                                  int                       CREATETIMELastExistedMiliSeconds = (int)CREATETIMELastExisted * 1000 + 2;
                                                  //===================================
                                                  bool                      Is_ObjectTimeNew                 = ToolsBoxSafe_Time < CREATETIME; //ToolsBoxSafe_Time///Safe_Time
                                                  //>>>Alert (Safe_Time, ">---Safe_Time---<", Is_ObjectTimeNew, ">---Is_ObjectTimeNew---<", ToolsBoxClearPreFix)  ;
                                                  // Alert (CREATETIMEMiliSeconds > CREATETIMELastExistedMiliSeconds,"CREATETIMEMiliSeconds > CREATETIMELastExistedMiliSeconds://",CREATETIMEMiliSeconds,">",CREATETIMELastExistedMiliSeconds);
                                                  //========================================
                                                  //========================================
                                                  if(Is_ObjectTimeNew) //(CREATETIMEMiliSeconds > CREATETIMELastExistedMiliSeconds)//(CREATETIMETimeSeconds > CREATETIMELastExistedTimeSeconds ) //(CREATETIME > CREATETIMELastExisted + 2)
                                                  {         //===================================
                                                            if(Is_AddingAnyObject_AfterFuncRun)
                                                            {         //static bool  KeyRun = true;
                                                                      string ObjNameGet ;//= ObjectGetString(0, KeepName, OBJPROP_NAME);
                                                                      int StringFindPreFix;// = StringFind(ObjNameGet, ToolsBoxClearPreFix) > -1;
                                                                      if(!PreFixingName)
                                                                      {         //
                                                                                ObjNameGet        = ObjectGetString(0, KeepName, OBJPROP_NAME);
                                                                                StringFindPreFix  = StringFind(ObjNameGet, ToolsBoxClearPreFix) > -1;
                                                                                if(!StringFindPreFix)
                                                                                          PreFixingName     = ObjectSetString(0, KeepName, OBJPROP_NAME, ToolsBoxClearPreFix + KeepName );//
                                                                                //KeyRun = false;
                                                                                //
                                                                      }//
                                                            }
                                                            //===================================
                                                            bool Renaming = false;
                                                            if(Renaming)//
                                                            {         //
                                                                      //
                                                                      if(ObjectType(KeepName) == OBJ_HLINE)               { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_HLINE";              TypeValue = ObjectType(KeepName);} //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_VLINE)               { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_VLINE";              TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_TREND)               { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_TREND";              TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_TRENDBYANGLE)        { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_TRENDBYANGLE";       TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_TRIANGLE)            { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_TRIANGLE";           TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_RECTANGLE)           { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_RECTANGLE";          TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ELLIPSE)             { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ELLIPSE";            TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ARROW)               { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ARROW";              TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_FIBO)                { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_FIBO";               TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_FIBOARC)             { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_FIBOARC";            TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_FIBOCHANNEL)         { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_FIBOCHANNEL";        TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_FIBOFAN)             { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_FIBOFAN";            TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_FIBOTIMES)           { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_FIBOTIMES";          TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_EXPANSION)           { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_EXPANSION";          TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_CHANNEL)             { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_CHANNEL";            TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_REGRESSION)          { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_REGRESSION";         TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_STDDEVCHANNEL)       { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_STDDEVCHANNEL";      TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_PITCHFORK)           { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_PITCHFORK";          TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_TEXT)                { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_TEXT";               TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_GANNFAN)             { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_GANNFAN";            TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_GANNGRID)            { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_GANNGRID";           TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_GANNLINE)            { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_GANNLINE";           TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_CYCLES)              { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_CYCLES";             TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_EVENT)               { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_EVENT";              TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ARROW_THUMB_UP)      { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ARROW_THUMB_UP";     TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ARROW_THUMB_DOWN)    { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ARROW_THUMB_DOWN";   TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ARROW_UP)            { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ARROW_UP";           TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ARROW_DOWN)          { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ARROW_DOWN";         TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ARROW_CHECK)         { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ARROW_CHECK";        TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ARROW_LEFT_PRICE)    { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ARROW_LEFT_PRICE";   TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ARROW_RIGHT_PRICE)   { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ARROW_RIGHT_PRICE";  TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ARROW_BUY)           { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ARROW_BUY";          TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ARROW_SELL)          { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ARROW_SELL";         TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_ARROW)               { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_ARROW";              TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_BUTTON)              { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_BUTTON";             TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_BITMAP)              { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_BITMAP";             TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_LABEL)               { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_LABEL";              TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_BITMAP_LABEL)        { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_BITMAP_LABEL";       TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_EDIT)                { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_EDIT";               TypeValue = ObjectType(KeepName); } //return(0);
                                                                      if(ObjectType(KeepName) == OBJ_RECTANGLE_LABEL)     { KeepName = ToolsBoxClearPreFix + KeepName + Seprator + "OBJ_RECTANGLE_LABEL";    TypeValue = ObjectType(KeepName); } //return(0);
                                                                      //
                                                                      //
                                                            }//
                                                            ///===============================================================================================
                                                            //Alert(j - Safe_ObjectsTotal_AfterFuncRunExisted - 1, " :j-Safe_ObjectsTotal_AfterFuncRunExisted-1: ", j, "-", Safe_ObjectsTotal_AfterFuncRunExisted, "-", 1); //(j-Safe_ObjectsTotal_AfterFuncRunExisted-1)130-129-1
                                                            if( j  >= 0 )///( j  >= 0 && j < (int)k)
                                                                      if(Is_AddingAnyObject_AfterFuncRun)
                                                                      {         //
                                                                                static int indexOfKeeper = 0;
                                                                                static int indexOfKeeperSaved = 0;
                                                                                // Alert(indexOfKeeper <= AddedObjectCount, "--(indexOfKeeper <= AddedObjectCount)--",indexOfKeeper," <= ",AddedObjectCount,"---","ObjectCreatedAfterKeyToolsBox: ",ObjectCreatedAfterKeyToolsBox);
                                                                                if(indexOfKeeper < AddedObjectCount)
                                                                                {         //===========================
                                                                                          bool SolidName = ObjectCreatedAfterKeyToolsBox[indexOfKeeperSaved] != KeepNameUnchange;
                                                                                          if(false)
                                                                                          {         for(int C = 0; C < ObjectCreatedAfterKeyToolsBoxSize  ; C++)
                                                                                                    {         //===================================
                                                                                                              ObjectDelete(0, ObjectCreatedAfterKeyToolsBox[C]); //
                                                                                                              Sleep(10);
                                                                                                              //>>off//Alert("---For---if(KeyToolsBox)DeActive: ",KeyToolsBox);
                                                                                                              Alert("C: ", C, "--Size: ", ObjectCreatedAfterKeyToolsBoxSize, "--->>Name: ", ObjectCreatedAfterKeyToolsBox[C]);
                                                                                                              //===================================
                                                                                                    }//
                                                                                          }//
                                                                                          if(SolidName)
                                                                                          {         //===========================
                                                                                                    Sleep(10);//
                                                                                                    ObjectCreatedAfterKeyToolsBox[indexOfKeeperSaved = indexOfKeeper++] = KeepName; //KeepNameUnchange; //string   KeepNameUnchange = ObjectName(j);//KeepName; //
                                                                                                    //Alert(KeepName);
                                                                                                    //
                                                                                          }//
                                                                                }//
                                                                                else
                                                                                {         //
                                                                                          indexOfKeeper = indexOfKeeperSaved;
                                                                                          //
                                                                                }
                                                                                //
                                                                                //
                                                                      }
                                                            ///===============================================================================================
                                                  } //
                                        } ////
                                        //
                              }//
                              ///===============================================================================================
                              // Alert (ObjectCreatedAfterKeyToolsBox[0], "--ObjectCreatedAfterKeyToolsBox[", 0, "]"); //
                              bool Printing = false;
                              if(Printing)
                              {         //
                                        for(j = C_STATICSUN:: ObjectsTotalLastIndex(); j  >= 0 ; j--) ///j=(130:0)///because of uinit  is uper than -2,,,logic
                                        {         //
                                                  //===================================
                                                  //===================================
                                                  //(int)Safe_ObjectsTotal_AfterFuncRunExisted;
                                                  string   KeepName      = ObjectName(j);
                                                  //>>no need///string   KeepNameUnchange = ObjectName(j);
                                                  int      TypeValue     = 0;
                                                  double   CREATETIMEValdouble = ObjectGet(KeepName, OBJPROP_CREATETIME);
                                                  datetime CREATETIME    = (datetime) CREATETIMEValdouble;
                                                  int CREATETIMETimeSeconds = TimeSeconds(CREATETIME);
                                                  string   CREATETIMEDesc    = TimeToString(CREATETIME, TIME_DATE | TIME_MINUTES | TIME_SECONDS);
                                                  string   Seprator      = "__" + CREATETIMEDesc + "__";
                                                  //===================================
                                                  static const string   KeepNameLastExisted  = ObjectName(Safe_ObjectsTotal_AfterFuncRunExisted);
                                                  static const double   CREATETIMEValdoubleLastExisted = ObjectGet(KeepNameLastExisted, OBJPROP_CREATETIME);
                                                  datetime CREATETIMELastExisted    = (datetime)CREATETIMEValdoubleLastExisted;///***attention
                                                  int CREATETIMELastExistedTimeSeconds = TimeSeconds(CREATETIMELastExisted);
                                                  //===================================
                                                  //Sleep(0);///(CREATETIME > CREATETIMELastExisted + 2)
                                                  if((CREATETIMETimeSeconds > CREATETIMELastExistedTimeSeconds + 2) && false) //(CREATETIME > CREATETIMELastExisted + 2)
                                                  {         //
                                                            if(C_STATICSUN:: ObjectsTotalLastIndex() > Safe_ObjectsTotal_AfterFuncRunExisted)//>>>129?//?130???
                                                            {         //
                                                                      static int indexOfKeeper = 0;
                                                                      static int indexOfKeeperSaved = 0;
                                                                      //Alert(indexOfKeeper <= AddedObjectCount, "--(indexOfKeeper <= AddedObjectCount)--",indexOfKeeper," <= ",AddedObjectCount,"---","ObjectCreatedAfterKeyToolsBoxSize: ",ObjectCreatedAfterKeyToolsBoxSize);
                                                                      // Alert("-----indexOfKeeper <= AddedObjectCount---------",indexOfKeeper <= AddedObjectCount,"---------",indexOfKeeper," <= ",AddedObjectCount,"------------");
                                                                      if(indexOfKeeper < AddedObjectCount)
                                                                      {         //
                                                                                //>>off// Alert (ObjectCreatedAfterKeyToolsBox[indexOfKeeperSaved=indexOfKeeper++], "--ObjectCreatedAfterKeyToolsBox[", indexOfKeeper, "]"); //
                                                                      } //
                                                                      else
                                                                      {         //
                                                                                indexOfKeeper = indexOfKeeperSaved;
                                                                                //
                                                                      }
                                                                      //
                                                            }//
                                                            //
                                                            //
                                                  }
                                                  //===================================
                                                  //
                                        }//
                              }//
                              ///===============================================================================================
                              //===================================
                              //Even adding any object..Is_AddingAnyObject_AfterFuncRun
                    }//
          }//
          else
          {         string PreFix = "WM3";
//if(KeyToolsBox)DeActive
//===================================
//>>.Worke///Alert("if(KeyToolsBox)DeActive: ",KeyToolsBox);
//===================================
                    ObjectsDeleteAll(0, ToolsBoxClearPreFix);
                    if(false)
                    {         for(int C = 0; C < ObjectCreatedAfterKeyToolsBoxSize  ; C++)
                              {         //===================================
                                        ObjectDelete(0, ObjectCreatedAfterKeyToolsBox[C]); //
                                        //OBJPREFIX + "MOVE"
                                        Sleep(10);
                                        //>>off//Alert("---For---if(KeyToolsBox)DeActive: ",KeyToolsBox);
                                        //>>>Alert("C: ", C, "--Size: ", ObjectCreatedAfterKeyToolsBoxSize, "--->>Name: ", ObjectCreatedAfterKeyToolsBox[C]);
                                        //===================================
                              }//
                    }//
                    KeyToolsBoxClear = FALSE;
                    KeyToolsBox =  true;
                    ObjectCreatedAfterKeyToolsBoxSize = 0;
//===================================
//
          }//
//===================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}//
void C_TOOLSCALL::OnChartEvents(const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None")
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(id == CHARTEVENT_OBJECT_CLICK) {}
          if(id == CHARTEVENT_KEYDOWN) {}
          if(id == CHARTEVENT_MOUSE_MOVE) {}
          if(id == CHARTEVENT_CLICK) {};
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TOOLSCALL::MOUSE_MOVE(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None")
{         //  Alert(sparam+"   CHARTEVENT_MOUSE_MOVE", __LINE__); //
          //===================================
          bool GetCursorPosXY2 = GetCursorPos( Mouse.lpPoint); ///....cuurrect//Alert("Mouse.lpPoint.posX:", Mouse.lpPoint.posX, "//-Mouse.lpPoint.posY:", Mouse.lpPoint.posY, "==//", GetCursorPosXY2);
          //===================================
          const static int Safe_ObjectsTotal_BeforeFuncRun = C_STATICSUN:: ObjectsTotalLastIndex(); //ObjectsTotal();///SafeAfterObjectsTotal = ObjectsTotal();This value must be greater or equal to 0 and less than ObjectsTotal().
          C_STATICSUN::ObjectsTotalCount = ObjectsTotal(); //pure value
          //===================================//for sorting..issue
          //  do
          if(PulseTwo.ExecuteONPulse(true, UpdateSecound ))
          {         //Alert("+====================================================+" + __FUNCTION__ + (string)__LINE__); //
                    //
                    if(KeyToolsBox)
                              ToolsCall.Create(true, Safe_ObjectsTotal_BeforeFuncRun);
                    if(KeyToolsBoxClear)
                              ToolsCall.Create(false, Safe_ObjectsTotal_BeforeFuncRun);
                    //
          }//
          //===================================
          ///Tracking  without timer///
          //===================================
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TOOLSCALL::CalcByTypeName(bool Keyrun = false, string TypeName = "", int ArraySizeX = 5, bool KeyFillArray = false, bool KeySearchArray = false, bool KeyInserToSorted = false)
{         //
          if(Keyrun)
          {         //       //
                    {         //=============
                              ArrayStringKeyToolsBox.Resize(ArraySizeX * 2);
                              //>>Alert(ArrayStringKeyToolsBox.Resize(10), "//--ArrayStringKeyToolsBox.Resize(10)");
                              //=============
                    }//
                    if(KeyFillArray)
                    {         //
                              //=============
                              ArrayStringKeyToolsBox.Add(TypeName);
                              //>>Alert(ArrayStringKeyToolsBox.Add("Rectangle"), "//--ArrayStringKeyToolsBox.Add(""Rectangle"")");
                              //=============
                              //=============
                              if(KeyInserToSorted)
                              {         ///
                                        ArrayStringKeyToolsBox.Sort(0);///true//do sort..
                                        //Alert(ArrayStringKeyToolsBox.Sort(1), "//--ArrayStringKeyToolsBox.Sort(1)");//void func
                                        //ArrayStringKeyToolsBox.Sort(1);///wrong
                                        //=============
                                        if(ArrayStringKeyToolsBox.IsSorted(0))
                                        {         //Alert(ArrayStringKeyToolsBox.IsSorted(0), "//--ArrayStringKeyToolsBox.IsSorted(0)"); //
                                                  //=============
                                                  if(KeyInserToSorted)
                                                  {         bool KeyZS = ArrayStringKeyToolsBox.InsertSort(TypeName);// Inserting element in a sorted array
                                                            //Alert(ArrayStringKeyToolsBox.InsertSort("Rectangle"), "//--ArrayStringKeyToolsBox.InsertSort(""Rectangle"")");
                                                  }//
                                        }//
                                        //
                              }//
                    }
                    if(KeySearchArray)///true//do sort...
                    {         ArrayStringKeyToolsBox.Sort(0);///true//do sort..
                              //Alert(ArrayStringKeyToolsBox.Sort(1), "//--ArrayStringKeyToolsBox.Sort(1)");//void func
                              //ArrayStringKeyToolsBox.Sort(1);///wrong
                              //=============
                              if(ArrayStringKeyToolsBox.IsSorted(0))
                              {         //Alert(ArrayStringKeyToolsBox.IsSorted(0), "//--ArrayStringKeyToolsBox.IsSorted(0)"); //
                                        //=============
                                        if(ArrayStringKeyToolsBox.Search("Rectangle") > -1)
                                                  Alert(ArrayStringKeyToolsBox.Search("Rectangle"), "//--C_STATICSUN::ArrayStringX.Search(""Rectangle"")--");   //
                                        //=============
                                        //=============
                                        if(ArrayStringKeyToolsBox.Search("Triangle") > -1)
                                                  Alert(ArrayStringKeyToolsBox.Search(TypeName), "//--C_STATICSUN::ArrayStringX.Search(""TypeName"")--");   //
                                        //=============  //=============
                                        if(ArrayStringKeyToolsBox.Search("Line") > -1)
                                                  Alert(ArrayStringKeyToolsBox.Search(TypeName), "//--C_STATICSUN::ArrayStringX.Search(""TypeName"")--");  //
                                        //=============  //=============
                                        if(ArrayStringKeyToolsBox.Search("TypeName") > -1)
                                                  Alert(ArrayStringKeyToolsBox.Search(TypeName), "//--C_STATICSUN::ArrayStringX.Search(""TypeName"")--");//
                              } //
//=============
//
                    }//
          }//
}//
//+------------------------------------------------------------------+
//|             Class Cgp_ElliotWavePAD     BEGIN-END                    |
//+------------------------------------------------------------------+
