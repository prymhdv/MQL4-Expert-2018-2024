//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
template<typename t>
class CDSStack_By_List_StackNode //--self lister
{         //----------------------------
          t                                     data;  /// data
          CDSStack_By_List_StackNode*    ptr_next;  /// address //--class type expected, pointer to type 'CDSStack_By_List_StackNode' is not allowed  Data_Struct.mqh     174       44

          //---------------------------
public:
          CDSStack_By_List_StackNode *   newNode(t f_data)
          {         CDSStack_By_List_StackNode* stackNode = new CDSStack_By_List_StackNode();
                    stackNode = new CDSStack_By_List_StackNode();
                    stackNode.data = f_data;              //---'>' - operand expected        Data_Struct.mqh     180       31  // -> not allowed in mql
                    stackNode.ptr_next = NULL;
                    return stackNode;//
          }
          int isEmpty(CDSStack_By_List_StackNode * ptr_root)   { return !ptr_root; }

          void push(CDSStack_By_List_StackNode*  ptr_root, t new_data) // '*' - pointer to pointer is illegal      Data_Struct.mqh     186       55//-- CDSStack_By_List_StackNode** ptr_root
          {         CDSStack_By_List_StackNode* stackNode = newNode(new_data);
                    stackNode.ptr_next = *ptr_root;
                    *ptr_root = stackNode;
                    //--cout << new_data << endl; //
          }

          t pop(CDSStack_By_List_StackNode* ptr_root)
          {         if (isEmpty(ptr_root)) {return -1;} //--'*' - parameter conversion not allowed         Data_Struct.mqh     195       33//--not alowed
                    CDSStack_By_List_StackNode* temp = *ptr_root;
                    *ptr_root = (*ptr_root).ptr_next;
                    t popped = temp.data;
                    //-- free(temp);//--'free' - function not defined      Data_Struct.mqh     200       21
                    return popped; //
          }

          int peek(CDSStack_By_List_StackNode * ptr_root)
          {         if (isEmpty(ptr_root)) return -1;
                    return ptr_root.data;//
          }


          int main()
          {         CDSStack_By_List_StackNode* ptr_root = NULL;
                    //--cout << "Stack Push:" << endl;
                    push(ptr_root, 100); //--'&' - illegal operation use Data_Struct.mqh     214       26 //--&rootnot allowed
                    push(ptr_root, 200);
                    push(ptr_root, 300);
                    //---------------------------------------------------
                    //---------------------------------------------------
                    //--cout << "\nTop element is " << peek(ptr_root) << endl;
                    //--cout << "\nStack Pop:" << endl;
                    while(!isEmpty(ptr_root))  { /*cout << pop(&ptr_root) << endl; */ }
                    //--cout << "Top element is " << peek(ptr_root) << endl;
                    return 0; //
          }
          //
          //
          int main_525()
          {         CDSStack_By_List_StackNode<int>* ptr_root = NULL;
                    //--cout << "Stack Push:" << endl;
                    ptr_root.push(ptr_root, 100); //--'&' - illegal operation use Data_Struct.mqh     214       26 //--&rootnot allowed
                    ptr_root.push(ptr_root, 200);
                    ptr_root.push(ptr_root, 300);
                    //---------------------------------------------------
                    ptr_root.push(ptr_root, 10);
                    //---------------------------------------------------
                    //--cout << "\nTop element is " << peek(ptr_root) << endl;
                    //--cout << "\nStack Pop:" << endl;
                    while(!ptr_root.isEmpty(ptr_root))  { /*cout << pop(&ptr_root) << endl; */ }
                    //--cout << "Top element is " << peek(ptr_root) << endl;
                    return 0; //
          } };
CDSStack_By_List_StackNode<int> C_Stack_List_StackNode;
//+------------------------------------------------------------------+
