//+------------------------------------------------------------------+
//|                                      C_AUTHORITY.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict


#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\WinUser32.mqh>

#import "user32.dll"
int GetAncestor(int, int);///The ancestor to be retrieved.///
int GetLastActivePopup(int);
int GetDlgItem(int, int);
int GetParent(int hWnd);///The ancestor to be retrieved./// just one try deep in chain
#import
//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+
class C_AUTHORITY
{
private:



public://Constructors
          void          C_AUTHORITY::C_AUTHORITY();
          void          C_AUTHORITY::~C_AUTHORITY() {/*Alert("Deinit: ", __FUNCSIG__, __LINE__); */};
public://Variables
          ///

public:///Functions
          bool          C_AUTHORITY::loginDialogIsOpen();
          void          C_AUTHORITY::closeLoginDialog();
          bool          C_AUTHORITY::auth(string login, string passwd, string server);
          void          C_AUTHORITY::string2CharsArray(string myString, char  &chars[]);
//
///
//

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_AUTHORITY::C_AUTHORITY()
{         RunCallFunction++; //
//
          if(0)
          {         if(loginDialogIsOpen()) closeLoginDialog(); // Just in case...
                    //===================================================================
                    if(auth("1894805", "PASSWORD", "FIBO-FIBO Group MT4 Demo Server"))     // Let's do it!///(auth("ACCOUNT_NUMBER", "PASSWORD", "SERVER IP/HOSTNAME"))
                    {         Print("Hooray, I found the login dialog, inserted credentials, now wait until MT4 connects :)");///
                              //Sleep(100000);
                              //
                    }
                    else
                    {         Print("Sorry, I could not even find the Login dialog... Is your MT4 older than v880 or something?"); //
                              //
                              ///
                    }//
                    //===================================================================
          }//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_AUTHORITY::loginDialogIsOpen()
{         int hwnd = WindowHandle(Symbol(), Period());///select chart win
          int hMetaTrader = -1, hLoginDialog = 0;
// Retrieve Terminal Window Handler
          while(!IsStopped())
          {         hwnd = GetParent(hwnd);///mql win id
                    if(hwnd == 0) break;
                    hMetaTrader = hwnd; }///mql win id
          //===================================================================
          hLoginDialog = GetLastActivePopup(hMetaTrader);////geting last active pop win id
          //===================================================================
          if(hLoginDialog != 0)///existed
          {         return(true); }
          else
          {         return(false); //not existed
          }//
          //===================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_AUTHORITY::closeLoginDialog()
{         int hwnd = WindowHandle(Symbol(), Period());///select chart win
          int hMetaTrader = -1, hLoginDialog = 0, hCancelButton = 0;
          //===================================================================
          // Retrieve Terminal Window Handler
          while(!IsStopped())//Checks the forced shutdown of an mql4 program.
          {         hwnd = GetParent(hwnd);///mql win id
                    if(hwnd == 0) break;///not existed
                    hMetaTrader = hwnd; //////,mql win id
                    ///
          }
          Sleep(60);
          //===================================================================
          hLoginDialog = GetLastActivePopup(hMetaTrader);////geting last active pop win id
          //===================================================================
          if(hLoginDialog != 0)///existed
          {         hCancelButton = GetDlgItem(hLoginDialog, 0x2);///selecting filds of item. cancel button. elements
                    if(hCancelButton != 0)///existed
                    {         // Click "Cancel" button in Login Dialog
                              PostMessageA(hCancelButton, 0x00F5, 0, 0); ////sending pressing button cancel..//closeLoginDialog
                    } //
          } //
          //===================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_AUTHORITY::auth(string login, string passwd, string server)
{         //=================================
          datetime s = TimeLocal();
          bool WaitingTime60Secound = TimeLocal() - s > 60;
          //Alert("#1 WaitingTime60Secound: ", WaitingTime60Secound);//
          int SystemHandle_ChartWwindow = WindowHandle(Symbol(), NULL);///select chart win
          // Alert("#2 SystemHandle_ChartWwindow: ", SystemHandle_ChartWwindow);
          int h = 0, e = 0;
          //=================================GetAncestor
          int a = GetAncestor(SystemHandle_ChartWwindow, 2/*GA_ROOT*/);//Returns the system handle of the chart window. 2 depth in parent chain///
          int hwndX = GetParent(SystemHandle_ChartWwindow);///mql win id
          //if(hwndX==a)Alert("#2 hwndX==a: ", hwndX==a,"----",hwndX,"==",a);
          int hwndXX = GetParent(hwndX); ///mql win id
          int hwndXXX = GetParent(hwndXX); ///mql win id
          //Alert("#2 hwndXXX==a: ", hwndXXX == a, "----", hwndXXX, "==", a);///(hwndXXX==a)==true/GetAncestor ///0-1-2///third depth
          //=================================PostMessageA_Windows
          int i = 0;
          bool PostMessageA_WindowsLogin = false;
          PostMessageA_WindowsLogin = (bool)PostMessageA(a, WM_COMMAND, MT4_WMCMD_Login_Win_open, 0);////sending pressing WM_COMMAND_35429  ..//Additional message-specific information.
          //Alert("#2 PostMessageA_Windows: ", PostMessageA_Windows);
          if(0)
          {         bool PostMessageA_Windows_test = (bool)PostMessageA(a, WM_COMMAND, MT4_WMCMD_Test, 0);////sending pressing WM_COMMAND_35429  ..//Additional message-specific information.
                    return false; }
          //===================================================================
          //Hexadecimal 0x57A = 1402///>>>0x57a, 0); // 1402. Pause
          //Hexadecimal 0x8A65 = 35429 ..//WM_MOUSEACTIVATE
          //WM_MOUSEACTIVATE///MOUSEEVENTF_ABSOLUTE///#define MOUSEEVENTF_ABSOLUTE           0x8000 // absolute move
          //WM_PAINT tells the window procedure that the window's client area has changed and must be repainted.
          //bool PostMessageA_WindowsX_WM_PAINT = (bool)PostMessageA(a, WM_PAINT, 10, 0);////sending pressing WM_COMMAND_35429  ..//
          //bool PostMessageA_WindowsX_WM_SIZING = (bool)PostMessageA(hwndX, WM_SIZING, -50, 0);////sending pressing WM_COMMAND_35429  ..//
          //int  PostMessageA_WindowsX_WM_SIZING_int = PostMessageA(a, WM_SIZING, 50, 50);////sending pressing WM_COMMAND_35429  ..// 0 mean false
          //Alert("#2_2 PostMessageA_WindowsX_WM_SIZING: ", PostMessageA_WindowsX_WM_SIZING);
          //Sleep(30 * 1000);
          //===================================================================
          while(e == 0)
          {         // Give us up to a minute to find the Login dialog///in not finde win
                    if(TimeLocal() - s > 60)
                    {         //
                              //
                              //Alert("#3 TimeLocal() - s > 60---", TimeLocal() - s > 60);
                              return(false); //
                              //
                              //
                    }
                    if(PostMessageA_WindowsLogin)
                    {         //===================================================================
                              h = GetLastActivePopup(a);////geting last active pop win id
                              Alert("#4 hGetLastActivePopup: ", h);
                              //===================================================================
                              e = GetDlgItem(h, 0x49d);// Select login field
                              Alert("#5 eGetDlgItem: ", e);
                              //===================================================================
                              Sleep(1); //
                    }//
          }
          if(PostMessageA_WindowsLogin)
          {
                    {         //===================================================================
                              for(i = 1; i <= 100; i++) // Press DELETE key many times in login field to remove current value
                              {         PostMessageA(e, WM_KEYDOWN, 0x2E, 1); }
                              //===================================================================
                              // Iterate over characters in "login" string and pass them to login field one by one
                              char login_chars[];
                              string2CharsArray(login, login_chars);///convert to char array
                              for(i = 0; i < ArraySize(login_chars); i++)
                              {         PostMessageA(e, WM_CHAR, login_chars[i], 0); }///
                    }
                    //===================================================================
                    {         // Select password field
                              e = GetDlgItem(h, 0x4c4);
                              for(i = 1; i <= 100; i++) // Press DELETE key many times in password field to remove current value
                              {         PostMessageA(e, WM_KEYDOWN, 0x2E, 1); }
                              //===================================================================
                              char password_chars[]; // Iterate over characters in "passwd" string and pass them to password field one by one
                              string2CharsArray(passwd, password_chars);///convert to char array
                              for(i = 0; i < ArraySize(password_chars); i++)
                              {         PostMessageA(e, WM_CHAR, password_chars[i], 0); }//
                    }
                    //===================================================================
                    {         // Select server field
                              e = GetDlgItem(h, 0x50d);
                              for(i = 1; i <= 100; i++) // Press DELETE key many times in server field to remove current value
                              {         PostMessageA(e, WM_KEYDOWN, 0x2E, 1); }
                              //===================================================================
                              char server_chars[]; // Iterate over characters in "server" string and pass them to server field one by one
                              string2CharsArray(server, server_chars);///convert to char array
                              for(i = 0; i < ArraySize(server_chars); i++)
                              {         PostMessageA(e, WM_CHAR, server_chars[i], 0); }//
                    }
                    //===================================================================
                    //>>> Sleep(10 * 1000);////two secound waiting
                    {         // Press submit button
                              e = GetDlgItem(h, 0x1);
                              SendMessageA(e, 0x00F5, 0, 0);
                              Alert("#6 Press submit button", TimeLocal() - s > 60); ///
                    }//
          }//
          //===================================================================
          //Sleep(10 * 1000);
          return(true);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
 * Iterates over string and puts each character code in array
 */
void C_AUTHORITY::string2CharsArray(string myString, char  &chars[])
{         //===================================================================
          int cnt = StringLen(myString);
          ArrayResize(chars, cnt);
          //===================================================================
          for(int i = 0; i < cnt; i++)
          {         chars[i] = (char)StringGetChar(myString, i); }//
          //===================================================================
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+
