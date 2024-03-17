//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

template<typename t>
class CDSStack_By_Array//--every body know stack is data struct .. no more typing  CDataStruct_
{
private:
          int    Index_top;
          bool   Flag_Overflow;
          bool   Flag_Underflow;
          bool   Flag_Assigned;
          int    SIZE;
public:
          CDSStack_By_Array() { Index_top = -1; }
          CDSStack_By_Array(int size) { Index_top = -1; SIZE = size;   ArrayResize(Stack_Array, SIZE);}
          //----------------------------------------------------------------------------------------
          t                     Stack_Array[10];
          //****************************************************************************************************************************************
          bool push(t item) //pushes element on to the stack
          {         if (Index_top >= (ArraySize(Stack_Array) - 1)) { Flag_Overflow = true;                       return false; } //--  cout << "Stack Overflow!!!";
                    else                        { Flag_Overflow = false; Stack_Array[++Index_top] = item; return Flag_Assigned = true;  } //cout << item << endl;
          }

          int  pop() //removes or pops elements out of the stack
          {         if (Index_top < 0)   { Flag_Underflow = true;  return 0; }//cout << "Stack Underflow!!";
                    else                 { Flag_Underflow = FALSE; return Stack_Array[Index_top--];  /* t item = myStack[top--];  return item;*/ }//
          }

          bool isEmpty() { return (Index_top < 0); } //check if stack is empty

          void SetSize(int size) {SIZE = size;   ArrayResize(Stack_Array, SIZE);}
          bool popAll() {while(! isEmpty()) { pop(); } return isEmpty(); } //--make index -1
          //****************************************************************************************************************************************
          int main() // main program to demonstrate stack functions
          {         CDSStack_By_Array stack;
                    //--cout << "The Stack Push " << endl;
                    //stack.push(2);
                    //stack.push(4);
                    //stack.push(6);
                    //--cout << "The Stack Pop : " << endl;
                    while(!stack.isEmpty()) { stack.pop(); } //--cout << stack.pop() << endl;
                    stack.SetSize(15);
                    return 0;//
          }
          //
};
CDSStack_By_Array<int>   Stack_Int;
CDSStack_By_Array<char>  Stack_Char(32); 
//+------------------------------------------------------------------+
