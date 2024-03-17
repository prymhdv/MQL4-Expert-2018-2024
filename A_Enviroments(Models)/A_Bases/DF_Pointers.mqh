
class Cg_Pointers
{
public:
          Cg_Pointers(void);
          ~Cg_Pointers(void);
          //template<typename Typer2>
          ///void C_TOOLS::CheckPointerX3D( Typer2 * m_items, Typer2 * ptr_c_items );///>>>gone globals Static noot in this scope allowing
          template<typename Typer2>
          void           CheckPointerX3(   Typer2 * ptr_c_items, Typer2 & c_items_Array[]);///>>>gone globals Static    static
          //static void C_UTILITIES::CheckPointerX4(C_TOOLS * ptr_c_items, C_TOOLS & c_items_Array[]);///may not defined type before caling class...up one..
};

//>>>TOOLSA.DestroyItems1(TOOLSPointer, TOOLSPointer2);
//>>>TOOLSA.DestroyItems3( TOOLSPointer, TOOLSPointer2);
//TOOLSA.CheckPointerX4(TOOLSPointer, TOOLSAXer4);
//TOOLSA.CheckPointerX5(TOOLSPointer, TOOLSAXer4);
// InformStaticController::CheckPointerX3(TOOLSPointer,TOOLSAXer5);//TOOLSPointer2 ,TOOLSAXer5
//C_UTILITIES::CheckPointerX4(TOOLSPointer, TOOLSAXer5);
//C_UTILITIES::CheckPointerX3(TOOLSPointer, TOOLSAXer5);   //Typer2 * m_items,
template<typename Typer2>
void Cg_Pointers::CheckPointerX3(Typer2 * ptr_c_items, Typer2 & c_items_Array[])   //Typer2 * m_items,
//============================================
{         if(CheckPointer(ptr_c_items) == POINTER_INVALID)
          {         //Print("POINTER_INVALID object<<<<< ", "item.Identifier(ptr_c_items)", " to be deleted -is Incorrect pointer - If an incorrect pointer is used, the program execution will be immediately terminated.");
                    Alert("POINTER_INVALID object<<<<< ", "item.Identifier(ptr_c_items)", " to be deleted -is Incorrect pointer -If an incorrect pointer is used, the program execution will be immediately terminated.");
                    // delete (item);//
          }
          else
          {         //Print("Non-POINTER_INVALID object<<<<< ", "item.Identifier(ptr_c_items)", " cannot be deleted -not Incorrect pointer");//
                    Alert("Non-POINTER_INVALID object<<<<< ", "item.Identifier(ptr_c_items)", " cannot be deleted -not Incorrect pointer");//
          }//
          //============================================
          if(CheckPointer(ptr_c_items) == POINTER_DYNAMIC)///need Pointer type of any objects
          {         //
                    //The delete() operator can and should be used only for such pointers.
                    //Print("POINTER_DYNAMIC object<<<<< ", "item.Identifier(ptr_c_items)", " to be deleted -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
                    Alert("POINTER_DYNAMIC object<<<<< ", "item.Identifier(ptr_c_items)", " to be deleted By delete (item); -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
                    // delete (item);//
          }
          else
          {         //
                    //The delete() operator can and should be used only for such pointers.
                    //Print("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(ptr_c_items)", " cannot be deleted -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
                    Alert("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(ptr_c_items)", " cannot be deleted By delete (item); -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
          }//
          //============================================
          if(CheckPointer(ptr_c_items) == POINTER_AUTOMATIC)
          {         //
                    //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
                    //Print("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(ptr_c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
                    Alert("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(ptr_c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
                    // delete (item);//
          }
          else
          {         //
                    //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
                    //Print("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(ptr_c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
                    Alert("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(ptr_c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
          }//
          //---------------------------------------------------------------------------------------------
          for(int i = 0;  ArraySize(c_items_Array) >= i; i++)
          {         if(CheckPointer(c_items_Array[i]) == POINTER_INVALID)///c_items_Array[i]
                    {         //Print("POINTER_INVALID object<<<<< ", "item.Identifier(ptr_c_items):",i, " to be deleted -is Incorrect pointer - If an incorrect pointer is used, the program execution will be immediately terminated.");
                              Alert("POINTER_INVALID object<<<<< ", "item.Identifier(ptr_c_items):", i, " to be deleted -is Incorrect pointer -If an incorrect pointer is used, the program execution will be immediately terminated.");
                              // delete (item);//
                    }
                    else
                    {         //Print("Non-POINTER_INVALID object<<<<< ", "item.Identifier(ptr_c_items):",i, " cannot be deleted -not Incorrect pointer");//
                              Alert("Non-POINTER_INVALID object<<<<< ", "item.Identifier(ptr_c_items):", i, " cannot be deleted -not Incorrect pointer"); //
                    }//
                    //============================================
                    if(CheckPointer(c_items_Array[i]) == POINTER_DYNAMIC)///need Pointer type of any objects
                    {         //
                              //The delete() operator can and should be used only for such pointers.
                              //Print("POINTER_DYNAMIC object<<<<< ", "item.Identifier(ptr_c_items)", " to be deleted -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
                              Alert("POINTER_DYNAMIC object<<<<< ", "item.Identifier(ptr_c_items)", " to be deleted By delete (item); -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
                              // delete (item);//
                    }
                    else
                    {         //
                              //The delete() operator can and should be used only for such pointers.
                              //Print("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(ptr_c_items)", " cannot be deleted -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
                              Alert("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(ptr_c_items)", " cannot be deleted By delete (item); -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
                    }//
                    //============================================
                    if(CheckPointer(c_items_Array[i]) == POINTER_AUTOMATIC)
                    {         //
                              //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
                              //Print("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(ptr_c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
                              Alert("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(ptr_c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
                              // delete (item);//
                    }
                    else
                    {         //
                              //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
                              //Print("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(ptr_c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
                              Alert("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(ptr_c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
                    }//
                    //
          }//
}//

