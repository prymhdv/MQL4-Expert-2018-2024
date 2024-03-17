
#ifndef int__32
#define int__32 int //--- typedef int__32 int
#endif
//
#ifndef int__64
#define int__64 uint //--- typedef int__32 int
#endif
//
#ifndef int__128
#define int__128 uint uint //--- typedef int__32 int
#endif
///
//--- create a custom function type
typedef int(*TActionX)(string, int);

struct myStruct
{         char       h;
          int        b;
          double     f; //
          TActionX   Nfunc_ptr;
          TActionX   Nf() {return Nfunc_ptr;}
          //TActionX   Nf_() {return h;}//--- 'h' - type mismatch       QUARTS_AF1.mq4      73        36
          //TActionX   Nf__() {return b;}//--- 'b' - type mismatch      QUARTS_AF1.mq4      74        37
          //--- declare a pointer to a function that accepts two int parameters
          typedef int (*TFunc)(int, int);  //---allowed
          //--- TFunc is a type, and it is possible to declare the variable pointer to the function
          TFunc      func_ptr; // pointer to the function//---allowed
          //--- declare the functions corresponding to the TFunc description
          int        sub(int x, int y) { return(x - y); } // subtract one number from another
          int        add(int x, int y) { return(x + y); } // addition of two numbers
          int        neg(int x)        { return(~x);  }  // invert bits in the variable
          //
          void       fff()
          {         //--- the func_ptr variable may store the function address to declare it later
                    //---func_ptr = sub;   Print(func_ptr(10, 5));     //'sub' - pointer to this function type is not supported yet         QUARTS_AF1.mq4      87        32
                    //---func_ptr = add;   Print(func_ptr(10, 5));     //'add' - pointer to this function type is not supported yet         QUARTS_AF1.mq4      88        32
                    //-- func_ptr = neg;   Print(func_ptr(10));   // error: neg does not have int (int,int) type      // error: two parameters needed
          }//
} m_str;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart1111()
{
#ifdef int__32
          Print("int__32 mode");
#else
          Print("Normal mode");
#endif
#ifdef int__64
          Print("int__64 mode");
#else
          Print("Normal mode");
#endif
//
          int sz = sizeof(int__64); //
          Print("sizeof(str) = ", sizeof(m_str));
          Print("sizeof(myStruct) = ", sizeof(myStruct));
//
}
//---some test
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |maximum element
//+------------------------------------------------------------------+
int largest(int &array_[], int n)
{         int i;
// Initialize maximum element
          int max = array_[0];
// Traverse array elements // from second and compare // every element with current max
          for (i = 1; i < n; i++)
          {         if (array_[i] > max) max = array_[i];}
          return max;//
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|           Handel Cpp   <typename typr, int Size>                 |
//+------------------------------------------------------------------+
template<typename Type>//---<typename typr, int Size>
class arrayType
{         Type       alfa[Size];
public:
                     arrayType(int s)   { Size = s;};
                     arrayType()        {};
                    ~arrayType()        {};
          int        Size;
          void       setSize(int s)     { Size = s;}
          int        getSize()          { return Size;}
          Type &     operator[](int i);

};