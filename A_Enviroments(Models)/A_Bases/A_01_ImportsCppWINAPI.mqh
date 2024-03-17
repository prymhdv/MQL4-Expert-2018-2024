//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+

//=====================================================================
//With the help of import, it is easy to describe functions that are called from external DLL or compiled EX4 libraries.
//EX4 libraries are compiled ex4 files, which have the library property. Only function described with the export modifier can be imported from EX4 libraries.
//
//Please keep in mind that DLL and EX4 libraries should have different names (regardless of the directories they are located in) 
//if they are imported together. All imported functions have the scope resolution corresponding to the library's "file name".
//
//Use of several functions of the same name from different execution contexts in a program may cause ambiguity. 
//To avoid the ambiguity of function calls, always explicitly specify the function scope using the scope resolution operation.
//
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\stdlib.mqh>                                                      ///OKEY 001 ///gone Global scoping //#NOERRORRING
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\WinUser32.mqh>                                                   ///OKEY 001 ///gone Global scoping //#NOERRORRING
//=====================================================================
//
//      "wininet.dll"  windows internet API
//
//
#import "wininet.dll"
int InternetOpenW(string, int, string, string, int);
int InternetOpenUrlW( int, string, string, int, uint, int);
int InternetReadFile(int, uchar&[], int, int&);
int InternetCloseHandle(int);
#import
//=====================================================================
//
//      "user32.dll"  windows User API
//
//
#import "user32.dll"
int     MessageBoxW(int hWnd, string szText, string szCaption, int nType);
int     SendMessageW(int hWnd, int Msg, int wParam, int lParam);
#import "lib.ex4"
double  round(double value);
#import
//=====================================================================
//
//      "kernel32.dll"  windows Base kernel API
//
//
#import "kernel32.dll"
int GetLastError();  ////call from dll windows
#import "lib.ex4"
int GetLastError();  ////call from ex4 mql
#import
//==============================================================================
