//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
//=====================================================================
//#define ChartChanged()( ChartPeriod(0) != FristChart)// bool ChartChanged = (ChartPeriod(0) != FristChart);ChartChanged()
#define MUL(a1, b1) ((a1)*(b1))
#define SELF(a)     (a)
#define SQUARE(a)   (a*a)
#define QUBE(a)     (a*a*a)   //--- a= 5 ==> 3*QUBE(a)+ 2*SQUARE(a)+6*SELF(a) +17
#define CUBE(b)     (b*b*b)
#define AREA(l, b)  (l * b)
//-----------------------------------------------------------------------
#define SWAP(a, b,tmp) { tmp = b; b = a; a = tmp; }
//
#define SWAP2(a, b) do {                         \
    auto tmp = (b);                             \
    (b) = (a);                                  \
    (a) = tmp;                                  \
  } while (false)
//======================================================================
#define __CNT__(__line__)                                               \
          static int __LINE__GLOBAL = 0;                                \
          static int __LINE__PREV   = 0;                                \
          if(__LINE__PREV!=__line__) __LINE__PREV=__line__;             \
          if(__line__ > __LINE__GLOBAL) {return __LINE__GLOBAL++;}      \
          return 0;


#define __CNT2__ ++__CNT2__///--skep  not confirmed

#define __CNT3__(__line__,b)                                            \  //not work
         static int buffer[10];                                         \
         static int cnt=0;                                              \
         if(b) {ArrayResize(buffer,1);cnt=0; return 0; }                \
         buffer[++cnt] = __line__;                                      \
         ArrayResize(buffer,cnt);                                       \
         return ArraySize(buffer)

//======================================================================
#define TOSTR(x) #x+" "
// ======================================================================
//  debug.mqh
#define Counterexr(a)  if(__LINE__>a) return 10; else return a;
// ======================================================================
#ifdef _DEBUG_
bool _impl_is_debug_mode_on_ = true;
#else
bool _impl_is_debug_mode_on_ = false;
#endif
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define LOG(text)  Print(__FILE__,"(",__LINE__,") :",text)   // one parameter - 'text' 
#define _IN    CIn _in; _in.In(__FILE__, __LINE__, __FUNCTION__)
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetDebugMode(bool onn  = true) { _impl_is_debug_mode_on = onn; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define NIL(p)    (CheckPointer(p)==POINTER_INVALID)
//
#define GRATER(a,b) (a>b)
#define LOWER(a,b)  (a<b)
#define EQUAL(a,b)  (a==b)
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define MIN(a,b)   ((a) < (b) ? (a) : (b))
#define MAX(a,b)   ((a) > (b) ? (a) : (b))
#define MAX3(a,b,c) (MAX(a,b) > MAX(a,c) ? MAX(a,b) : MAX(a,c))
#define MIN3(a,b,c) (MIN(a,b) < MIN(a,c) ? MIN(a,b) : MIN(a,c))
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsDebug() { return _impl_is_debug_mode_on; }



#define ERROR_CODE(A) A
#define ERROR(text, ERROR_CODE) if (IsDebug()) Print("Error: ", __FUNCTION__,"(", __LINE__, ") ", text, " ", ERROR_CODE, " : ", ErrorDescription(ERROR_CODE))

#define DCHECK(A) if (IsDebug() && !(A)) Alert(__FUNCTION__ + "(" + (string)__LINE__ + ")")
#define DCHECK_EQ(A, B) if (IsDebug()) DCHECK(A == B)
#define DEBUG_LOG(text) if (IsDebug()) Print(__FILE__,"(",__LINE__,") : ",text)

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void testIFDEF()
{
#ifdef TestMode
          Print("Test mode");
#else
          Print("Normal mode");
#endif
}
//////////////////////
void inita()
{         int a = 1, b = 2, x = 3, y = 4, z = 5, tmp = 0;
          //-- SWAP(a, b);
          SWAP(x < y ? x : y, z, tmp); //--'tmp' - variable already defined A_01_Macros.mqh     82        11
          SWAP(a, b, tmp);
          //--------------------------------
          //
}
//==============================================================================
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
