//+------------------------------------------------------------------+
//|                                              C_TOOLS.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class C_TOOLS     BEGIN                      |2721 line class  C_TOOLS start
//+------------------------------------------------------------------+

//#include <stdlib.mqh>
////////////////// CAUSE ERROR FRST DEFINE >>>> #include <0srcCapitan\QuartsExperts\ChartBox2021.mqh>
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
#define PANEL_INDENT_TOP         15
#define PANEL_INDENT_BOTTOM      30
#define PANEL_INDENT_XY          300
//=========================================
#define PANEL_CLIENT_BG_X        5
#define PANEL_CLIENT_BG_Y        20
#define PANEL_CLIENT_BG_WIDTH    245
#define PANEL_CLIENT_BG_HEIGHT   150
//=========================================
#define PANEL_RXaxMin      0           //===RIGHTWIDTH
#define PANEL_RYaxMin      0          //===RIGHTHIGHT
#define PANEL_RXaxMax      200           //===RIGHTWIDTH
#define PANEL_RYaxMax      200          //===RIGHTHIGHT
//=========================================
#define PANEL_RW           200           //===RIGHTWIDTH
#define PANEL_RH           200          //===RIGHTHIGHT
//=========================================
//#define X_260      260           //===RIGHTWIDTH  PANEL_LXaxMin
//#define Y_160      160         //===RIGHTHIGHT//  PANEL_LYaxMin
#define PANEL_LXaxMax      0           //===RIGHTWIDTH
#define PANEL_LYaxMax      0          //===RIGHTHIGHT
#define PANEL_LW           202           //===LEFTTWIDTH
#define PANEL_LH           202          //===LEFTHIGHT
//========================================================
 
//=========================================
#define PANEL_BG_WIDTH     15
#define PANEL_BG_HEIGHT    150
//=========================================
#define PANEL_BUTTON_WIDTH       55
#define PANEL_BUTTON_HEIGHT      13
#define PANEL_BUTTON2_WIDTH      55
#define PANEL_BUTTON2_HEIGHT     18
#define PANEL_BUTTON_COLOR       clrWhite
#define PANEL_BUTTON_GAP_X       5
#define PANEL_BUTTON_GAP_Y       5
//=========================================
#define PANEL_EDIT_WIDTH         55
#define PANEL_EDIT_HEIGHT        13
#define PANEL_EDIT_GAP_X         5
#define PANEL_EDIT_GAP_Y         5
//=========================================
#define PANEL_SPEEDTEXT_GAP_X    240
#define PANEL_SPEEDTEXT_GAP_Y    28
#define PANEL_SPEEDBAR_GAP_X     210
#define PANEL_SPEEDBAR_GAP_Y     28
//=========================================
#define PANEL_GapButton 5
//--
//=========================================
#define  BUTTONX_WIDTH 40
#define  BUTTONX_HEIGHT 13

//================================================

//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
//C_TOOLS::Free   new C_TOOLS();
class C_TOOLS
{
// MAIN ONJ : C_TOOLS;
private:
          string        C_TOOLS::C_TOOLSPrivate() {return (__FUNCSIG__);}
public://Function Constructors.//are publick acceccing../
          void          C_TOOLS::C_TOOLS();///default
          void          C_TOOLS::C_TOOLS(bool KeyRun, string SOZC ); //= "Unknown Error"///if in declaring has defrint viwe cause undiffrence
          void          C_TOOLS::~C_TOOLS();
          void          C_TOOLS::C_TOOLS(string Name) {ObjName =  "#" + (string)++ObjAllNum + " " + Name ;}
          bool          C_TOOLS::initer();//
          void          C_TOOLS::Deiniter();
          string        C_TOOLS::C_TOOLSPublic() {return (__FUNCSIG__);}
protected:
          string        C_TOOLS::C_TOOLSProtected() {return (__FUNCSIG__);}
//===================================================
private:  static uint   ObjAllNum;
          static uint   ObjAllNumDef;
          string        ObjName;//name num comfe from ObjAllNum
          uint          ObjNum;//just run once created obj
          datetime      ObjCreateTime;
          //static int OBJCount;// = 0;>>may come error//resolved//by set value out class block::
public://data member scope deriveds

public:   string ObjNumDesc;//
//==================================================
          string C_TOOLS::SOZ;// = "Unknown Error";
          string C_TOOLS::SOZTwo;///can create Pointer of  class before closing class declaring
          //>>C_TOOLS *SOZPointer;  //Pointer declaring just Pointer

          //int C_TOOLS::*SOZFour;///data member pointer///infunction declaring
          //C_TOOLS Free;////not allowing in definig class
          //>>C_TOOLS *Free;///allowing in this declaring>>can new in glibla scope...
          ///static C_TOOLS *Free = new C_TOOLS();///>>wrong
          //C_TOOLS ToolsT = new C_TOOLS;
          //>>C_TOOLS *Toolser;/// = new C_TOOLS();///pointers //>>
//======================================
public://Variables
          //ENUM_SERIESMODE UseSeries ;
          int C_TOOLS::UseCount ;
          int C_TOOLS::UseStart ;
          ENUM_MARKETINFO C_TOOLS::UseSeries ;
          //
          ///C_TOOLS *KeyPadFlowAddChart;//testing//must poinert//invaliade access
          //=========================================================
          //Lines with a positive gradient slope upwards, from left to right.
          //Lines with a negative gradient slope downwards from left to right.
          //Lines with a zero gradient are horizontal.
          //The value of c is called the vertical intercept of the line.
          //-----------------------------------
          void C_TOOLS::DestroyItems1( C_TOOLS * m_items, C_TOOLS * c_items );  //just declaring ///static or accessing by ToolsA
          // C_TOOLS * m_items = new C_TOOLS(), C_TOOLS * c_items = new C_TOOLS()<<<automatic just declaring..not dynamic
          template<typename Typer>
          void C_TOOLS::DestroyItems3( Typer * m_items, Typer * c_items );
          void C_TOOLS::DestroyItems2( C_TOOLS *  m_items, C_TOOLS *  c_items );
          template<typename Typer4>
          void C_TOOLS::CheckPointerX4(   Typer4 * c_items, Typer4 & c_items_Array[]);///>>>gone  redefine globals Static
          void C_TOOLS::CheckPointerX5(   C_TOOLS * c_items, C_TOOLS & c_items_Array[]);///>>>gone  redefine globals Static
          void C_TOOLS::CheckPointerX ( C_TOOLS * m_items, C_TOOLS * c_items );
          template<typename Typer2>
          void C_TOOLS::CheckPointerX3( Typer2 * m_items, Typer2 * c_items );///>>>gone globals Static
          //static void C_TOOLS::TOOLSX(C_TOOLS * ) {}; ////(new C_TOOLS());/////FUCK BIG
          int C_TOOLS::Main(C_TOOLS * const o, C_TOOLS * P, C_TOOLS & R);
public://Use Objects
          ///////////////////Chart.mqh
public://Function
          
//========================================================================================================================================================


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
};//>>> ToolsA, *ToolsAX, *ToolsOPointer1[5], *ToolsOPointer2[], ToolsOPointer3[5], ToolsOPointer4[]; //C_TOOLS; //ButtonX1;/
uint C_TOOLS::ObjAllNum = 0;
uint C_TOOLS::ObjAllNumDef = 0;
//===================================================================================================================================
///>>>int C_TOOLS::OBJCount  = 0;
//bool C_STATICSUN::KeyLog = false;
C_TOOLS::C_TOOLS()//default //
{         RunCallFunction++; 
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          ObjName = "(Default#" + (string)++ObjAllNumDef + ")";//
          //Alert(ObjName + "Runing " + __FUNCTION__); //
          //=========================================================|
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TOOLS::C_TOOLS(bool KeyRun, string SOZC) //= "Unknown Error"///if in declaring has defrint viwe cause undiffrence
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Alert("RUNIING" + __FUNCSIG__);//
          //=========================================================|
          static uint Recalling = 0;
          SOZC = ErrorDescription(_LastError);
          if(Capitan_SuperKeyToolsConstructor)Alert(SOZC, "-__FUNCTION__:", __FUNCTION__, "-__LINE__:", __LINE__, "__Recalling:", Recalling++);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          initer();
          //=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TOOLS::~C_TOOLS()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //== == == == == == == == == == == == == == == == == == == == == == == == == == == == = |
          ObjNum--; ObjAllNum--;
          Deiniter();
          //=========================================================|
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_TOOLS::initer()
{
//not allowed in construct and destruct ///int C_TOOLS::*SOZFour;///data member pointer///infunction declaring///
          C_TOOLS ToolsX;///>>>>//?? deleted after function exite///is just declaring///invaliade //cause stacoverflow...creating in
          ///>>>>C_TOOLS ToolsXC = new C_TOOLS;//NOTPointer////This is done by the new operator, which returns a descriptor of the created object. Descriptor is 8 bytes large.
          ///>>>>C_TOOLS *ToolsXCF = new C_TOOLS();//This is done by the new operator, which returns a descriptor of the created object. Descriptor is 8 bytes large.
          ///////////////C_TOOLS ToolsXCF = new C_TOOLS();///must be pointer in mql///////////
          ///>>>>C_TOOLS *ToolsXCD ;///Ned to be pointer to creating it...aftr declaring
          ///>>>>ToolsXCD = new  C_TOOLS(); ///'ToolsXCD' - undeclared identifier in other functions
          // UseSeries = 0  ;
          //UseCount = 200;   UseStart = 0;
          ///>>>C_TOOLS::OBJCount++;SOZ = "Unknown Error#" + IntegerToString(C_TOOLS::OBJCount++);
          ///>>>>delete  ToolsXCD ; ToolsXCD = NULL; ///class destructor and frees up memory occupied by the object
          ///After the delete operation is executed, the object descriptor becomes invalid.
          ///>>>>ToolsXCD = ToolsXC; ///assaining///deffrence///passing
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  C_TOOLS::Deiniter()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //not allowed in construct and destruct ///int C_TOOLS::*SOZFour;///data member pointer///infunction declaring///
          static string LastDeletedObjectNameSX[];
          ArrayCopy(LastDeletedObjectNameSX, LastDeletedObjectNameS);
          ArrayResize(LastDeletedObjectNameS, ObjectsTotal());
          static const int SafeObjectTotal = ObjectsTotal();///const keep frist call valuse...
          static int ExactObjectTotal = ObjectsTotal(); ExactObjectTotal = ObjectsTotal();//<<<<in static declaring just keeep frist calll value...need reassining
          static int i = 0;
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(Capitan_KeyPlayObjectsListTries)
                    for(  i = 0; ObjectsTotal() > i; i++)///cased if object existed///*** BINGOO///BIBGO STATIC IFOR
                    {         LastDeletedObjectNameS[i] = ObjectName(0, i);//
                              if(ExactObjectTotal == SafeObjectTotalByDeiniter-- )Alert("SafeObjectTotal:", SafeObjectTotal, "---", LastDeletedObjectNameS[i], "->>For<<-index:", i + 1); //
                              Alert(">>>>", ExactObjectTotal, "/", SafeObjectTotal, "---", LastDeletedObjectNameS[i], "->>For2<<-index:", i + 1); //
                              /////ExactObjectTotal/SafeObjectTotal///remmember i is static...
                              if(0 != ArrayCompare(LastDeletedObjectNameS, LastDeletedObjectNameSX))
                              {         //int indexfoundMaximumS = ArrayMaximum(LastDeletedObjectNameS);
                                        //int indexfoundMaximumSX = ArrayMaximum(LastDeletedObjectNameSX);
                                        //int indexfoundMaximumS = ArrayMinimum(LastDeletedObjectNameS);
                                        //int indexfoundMaximumSX = ArrayMinimum(LastDeletedObjectNameSX);
                                        //ArrayBsearch(LastDeletedObjectNameS,'K');
                                        //
                                        //
                                        //
                              }//
                    }
          {         //
                    //>>>delete ToolsPointer ;///pointers //>>  5560 bytes of leaked memory
                    for(int k = 0; k < 5; k++)
                    {         ///Alert(ArraySize(ToolsC));
                              //>>> if (k < ArraySize(ToolsC))ToolsC[k] = new C_TOOLS();
                              //>>>if (k < ArraySize(ToolsAXer4))delete ToolsAXer4[k]; //
                              //>>>if (k < ArraySize(ToolsAXer5))delete ToolsAXer5[k]; //
                              ///delete ToolsA;///>>> not pointer
                              //>>>delete ToolsAX;
                              //>>>if (k < ArraySize(ToolsOPointer1))delete ToolsOPointer1[k];
                              //>>> if (k < ArraySize(ToolsOPointer2))delete ToolsOPointer2[k];
                              //delete ToolsOPointer3[k];///>>> not pointer
                              //delete ToolsOPointer4[k]; ///>>> not pointer//
                              //
                    } //
          }
          ///ToolsX.s///'ToolsX' - undeclared identifier    C_TOOLS.mqh 467       11
//ToolsXCF.s;//not declaring in this scoope;
          ///>>>C_TOOLS::OBJCount--;
//////////////////////////////////////
//static int tries = 0;
//Alert("-LINE: ",  __LINE__,"-FUNCTION: ", __FUNCTION__,"---tries:",tries++,SOZ, "--this -> SOZ", this.SOZ, "====", SOZTwo, "this -> SOZTwo", this.SOZTwo);//, SOZPointer, "->*", SOZPointer, this.SOZPointer); //SOZ, "this -> SOZ", this.SOZ
//>>>delete SOZPointer;
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_TOOLS::Main(C_TOOLS * const o, C_TOOLS * P, C_TOOLS & R ) //int *a, int*p)
//C_TOOLS::Main(C_TOOLS* const o, C_TOOLS*P,C_TOOLS (*)(C_TOOLS,C_TOOLS) )//int *a, int*p)
//C_TOOLS::Main(C_TOOLS* const o, C_TOOLS*P,int (*)(int,int) )//int *a, int*p)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
///
          ///int C_TOOLS::*SOZFour;///data member pointer///infunction declaring/////not allowed in construct and destruct -musta after creation///
          //int KeyboardController::*SOZFour;///data member pointer///infunction declaring/////not allowed in construct and destruct -musta after creation///
          //int KeyboardController::*SOZFour;///data member pointer///infunction declaring/////not allowed in construct and destruct -musta after creation///
          //int (KeyboardController::*SOZFourFunction)());//member function pointer
          //SOZFour= &C_TOOLS::Soz;
          //int*P;
          //p = new int;
          C_TOOLS P2;
          //P2 = new C_TOOLS();//();//deffrend constructors
          P2 = new C_TOOLS ;//();//deffrend constructors///>>>>>.non Pointer
          //  C_TOOLS( ); //new C_TOOLS());
          P = new C_TOOLS();//new C_TOOLS());>>>>>pointer
          //D = new C_TOOLS();
          if(P == new C_TOOLS(false, "new obj"))
          {         new C_TOOLS;///call default constructor//at self class ok
                    P = new C_TOOLS;
                    P = new C_TOOLS("next obj");//
                    C_TOOLS* hobject = new C_TOOLS(); //declRE...AND SET...
                    //
                    C_TOOLS *TOOLS_pointers[5];
                    for(int i = 0; i < 5; i++)
                    {         TOOLS_pointers[i] = new C_TOOLS("foo_pointer"); //
                    } //
                    delete(hobject); ///DELETING POINTERS...* OR &   ////
                    //delete(R);  IS REFRENCE
                    delete(o); ///const deleted even function call created,,, and in exite it deleted...
                    delete(P); //
          }
          //delete(R);  IS REFRENCE
          delete(o); ///const deleted even function call created,,, and in exite it deleted...
          delete(P);
          //--- Examples of proper use
          //new CCat;
/////
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return 0;//
}
//= == == == == == == == == == == == == == == == == == == == == == == == ==
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//| Deletes list by deleting its elements                            |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TOOLS::DestroyItems1( C_TOOLS * m_items, C_TOOLS * c_items )//C_TOOLS * m_items, C_TOOLS * c_items // C_TOOLS & c_items///need pointer variable to paas
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          static int X = 0;
          m_items = new C_TOOLS();  c_items = new C_TOOLS();///>>>>>>.looks bugy
///=====================================================================
//--- service pointer for working in the loop
          C_TOOLS *item;////>>>>its not dynamic pointer self///C_TOOLS *item;
//--- go through loop and try to delete dynamic pointers
          while(CheckPointer(m_items) != POINTER_INVALID)
          {         item = m_items;
                    //  CObject          *Next(void)                                    const { return(m_next); }///return
                    // void              Next(CObject * node)                                 { m_next = node;    } ///assaing
                    //PanelRightSideBS.UseCChart.Next();
                    //PanelRightSideBS.UseCChart.
                    //m_items = m_items.Next();///call next obj to prosseccing
                    if(CheckPointer(item) == POINTER_DYNAMIC)
                    {         Print("POINTER_DYNAMIC object<<<<< ", "item.Identifier(item)", " to be deleted By delete (item);");
                              Alert("POINTER_DYNAMIC object<<<<< ", "item.Identifier(v)", " to be deleted By delete (item);");
                              // delete (item);//
                    }
                    else
                    {         Print("Non-dynamic object<<<<< ", "item.Identifier()", " cannot be deleted By delete (item);");//
                              Alert("Non-dynamic object<<<<< ", "item.Identifier()", " cannot be deleted By delete (item);");//
                    }//
                    Sleep(500); X++;
                    if(X == 1) {X = 0; break;} //
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          C_TOOLS::CheckPointerX(  m_items, c_items );
          delete m_items; delete c_items;
//============================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;
//---
}
template<typename Typer>
void C_TOOLS::DestroyItems3( Typer * m_items, Typer * c_items )//C_TOOLS * m_items, C_TOOLS * c_items // C_TOOLS & c_items///need pointer variable to paas
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          static int X = 0;
//--- service pointer for working in the loop
          Typer *item;////>>>>its not dynamic pointer self///C_TOOLS *item;
//--- go through loop and try to delete dynamic pointers
          while(CheckPointer(m_items) != POINTER_INVALID)
          {         item = m_items;
                    //  CObject          *Next(void)                                    const { return(m_next); }///return
                    // void              Next(CObject * node)                                 { m_next = node;    } ///assaing
                    //PanelRightSideBS.UseCChart.Next();
                    //PanelRightSideBS.UseCChart.
                    //m_items = m_items.Next();///call next obj to prosseccing
                    if(CheckPointer(item) == POINTER_DYNAMIC)
                    {         Print("POINTER_DYNAMIC object<<<<< ", "item.Identifier(item)", " to be deleted By delete (item);");
                              Alert("POINTER_DYNAMIC object<<<<< ", "item.Identifier(v)", " to be deleted By delete (item);");
                              // delete (item);//
                    }
                    else
                    {         Print("Non-dynamic object<<<<< ", "item.Identifier()", " cannot be deleted By delete (item);");//
                              Alert("Non-dynamic object<<<<< ", "item.Identifier()", " cannot be deleted By delete (item);");//
                    }//
                    Sleep(500); X++;
                    if(X == 1) {X = 0; break;} //
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          C_TOOLS::CheckPointerX(  m_items, c_items );
//============================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TOOLS::DestroyItems2( C_TOOLS *  m_items, C_TOOLS *  c_items )// C_TOOLS & c_items
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
/////need Pointer type of any objects//!( C_TOOLS &  m_items, C_TOOLS &  c_items )
//
//
//--- service pointer for working in the loop
          C_TOOLS *item;
//--- go through loop and try to delete dynamic pointers
          while(CheckPointer(m_items) != POINTER_INVALID)
          {         item = m_items;
                    //  CObject          *Next(void)                                    const { return(m_next); }///return
                    // void              Next(CObject * node)                                 { m_next = node;    } ///assaing
                    //PanelRightSideBS.UseCChart.Next();
                    //PanelRightSideBS.UseCChart.
                    //m_items = m_items.Next();///call next obj to prosseccing
                    if(CheckPointer(item) == POINTER_DYNAMIC)
                    {         Print("POINTER_DYNAMIC object ", "item.Identifier()", " to be deleted By delete (item);");
                              Alert("POINTER_DYNAMIC object ", "item.Identifier()", " to be deleted By delete (item);");
                              // delete (item);//
                    }
                    else
                    {         Print("Non-dynamic object ", "item.Identifier()", " cannot be deleted By delete (item);");//
                              Alert("Non-dynamic object ", "item.Identifier()", " cannot be deleted By delete (item);");//
                    }//
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//---
}
//+------------------------------------------------------------------+void C_TOOLS::DestroyItems3( Typer * m_items, Typer * c_items )
//|                                                                  |
//+------------------------------------------------------------------+
void C_TOOLS::CheckPointerX( C_TOOLS * m_items, C_TOOLS * c_items )            //============================================
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
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
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}//
template<typename Typer2>
void C_TOOLS::CheckPointerX3( Typer2 * m_items, Typer2 * c_items )            //============================================
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
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
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}//
template<typename Typer4>
void C_TOOLS::CheckPointerX4(   Typer4 * c_items, Typer4 & c_items_Array[])///>>>gone  redefine globals Static
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
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
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}//
void C_TOOLS::CheckPointerX5(   C_TOOLS * c_items, C_TOOLS & c_items_Array[])///>>>gone  redefine globals Static
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
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
          {         // if(CheckPointer(c_items_Array[i]) == POINTER_INVALID)///c_items_Array[i]
                    {         //Print("POINTER_INVALID object<<<<< ", "item.Identifier(c_items):",i, " to be deleted -is Incorrect pointer - If an incorrect pointer is used, the program execution will be immediately terminated.");
                              Alert("POINTER_INVALID object<<<<< ", "item.Identifier(c_items):", i, " to be deleted -is Incorrect pointer -If an incorrect pointer is used, the program execution will be immediately terminated.");
                              // delete (item);//
                    }
                    // else
                    {         //Print("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items):",i, " cannot be deleted -not Incorrect pointer");//
                              Alert("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items):", i, " cannot be deleted -not Incorrect pointer"); //
                    }//
                    //============================================
                    // if(CheckPointer(c_items_Array[i]) == POINTER_DYNAMIC)///need Pointer type of any objects
                    {         //
                              //The delete() operator can and should be used only for such pointers.
                              //Print("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
                              Alert("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
                              // delete (item);//
                    }
                    //  else
                    {         //
                              //The delete() operator can and should be used only for such pointers.
                              //Print("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
                              Alert("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
                    }//
                    //============================================
                    //  if(CheckPointer(c_items_Array[i]) == POINTER_AUTOMATIC)
                    {         //
                              //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
                              //Print("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
                              Alert("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
                              // delete (item);//
                    }
                    //  else
                    {         //
                              //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
                              //Print("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
                              Alert("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
                    }//
                    //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}//
//+------------------------------------------------------------------+
//|             Class C_TOOLS::BEGIN-END                     |////OnCapitan Calls
//+------------------------------------------------------------------+
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>C_TOOLS *ToolsPointer = new C_TOOLS();///pointers //>>///making invalidate pointer>>>>DYNAMYC_POINTER
//C_TOOLS *C_TOOLS  = new C_TOOLS();///<<<<<,when pointer and pointer deleete in deiniter ..work well..
//void OnDeinit(const int reason)
//{delete C_TOOLS;}
//>>>>>>C_TOOLS C_TOOLS  = new C_TOOLS;////For this nedd delete because of undelete class object...///causeing undeleting error
//caused thinking is pointer and in deiniting cant delete and caused errors...
//>>>>>>>>>>deffrence in pointer with real object of class,,,is that pointer just copy valuse of data members...cand assain it,,,out of constructors...
//>>>>>but real one can use data members by directly accessing..not copy....
//===========================================================
//C_TOOLS C_TOOLS;
//>>>C_TOOLS *ToolsPointer2;///making invalidate pointer>>>AUTOMATIC _POINTER>>>>
//C_TOOLS ToolsV;  ToolsV = new C_TOOLS;///NOTPointer///cant play
//>>>C_TOOLS ToolsT = new C_TOOLS;///NOTPointer //>>>
//C_TOOLS ToolsA;//C_TOOLS *ToolsZ; ///>>>FUCK   pointeris working///Static making problems
///if find invalde pointer program not run
///C_TOOLS::DestroyItems1(C_TOOLS, C_TOOLS);<<<<<<,Cheaking in next Function ct_Order playing////<<<<
//C_TOOLS *ToolsAXer[10] = new C_TOOLS();
//>>>C_TOOLS  ToolsAXer1[2] ;
//>>>C_TOOLS  ToolsAXer2[] ;
//>>>C_TOOLS  *ToolsAXer4[] ;
//>>>C_TOOLS  *ToolsAXer5[3] ;
///////////////////////////////
//>>>>cheak next funtion in order
///>>>>delete ToolsAXer4[];///>>>> in deinitercan doo..
//////////////////////////////////////
//ToolsAXer2[] = new C_TOOLS() ;
//>>>C_TOOLS  ToolsAXer2[8000] = new C_TOOLS ;  declaring allowe...for creationg object need in function opratiog,
//>>>C_TOOLS  *ToolsAXer3[8000] = new C_TOOLS() ;
//>>>C_TOOLS *ToolsC[5];//>>>deinite in deiniter C_TOOLS
//>>>for(int i = 0; i < 5; i++)
//>>>{         ToolsC[i] = new C_TOOLS();
//+------------------------------------------------------------------+
//|             Class C_TOOLS::BEGIN-END                     |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
