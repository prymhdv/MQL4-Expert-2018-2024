//+------------------------------------------------------------------+
//|                                                      C_MOUSE.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

//=====================For simplicity I defined these types before the function definition. The end result is:
//#define LPCTSTR string
//#define HWND int
//#define UINT uint
//#define MB_ICONERROR 0x00000010
//#import  "user32.dll"
//      int MessageBoxW(HWND hWnd, LPCTSTR lpText, LPCTSTR lpCaption, UINT uType);
//==================================================================================
/////#property strict
struct RECT
{         int Left;   // x position of upper-left corner
          int Top;    // y position of upper-left corner
          int Right;  // x position of lower-right corner
          int Bottom; // y position of lower-right corner
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct strPOINT//  bool  GetCursorPos(POINT &lpPoint);/// bool  SetCursorPos(int x,int y);
{         int posX;   // x position
          int posY;   // y position
};
//
////------------------------------------

//
#define NAMEPoint   "TMP_EDIT_FOCUS"////define caused error over prossessing
#define XPoint      50////No ned ()
#define YPoint      50
#define WIDTHPoint  300
#define HEIGHTPoint 20
//==================================================================================
//#import
///#include <winuser.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\WinUser32.mqh>



//========================
//user32::MessageBoxW(WindowHandle(Symbol(), Period()),"We have encountered an error","Initialization Failed",MB_ICONERROR);
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//+------------------------------------------------------------------+
//|             Class C_MOUSE     BEGIN-END                          |
//+------------------------------------------------------------------+
//namespace
//#import "user32.dll"
//   bool     SetCursorPos(int X, int Y);  //...wrong
//   bool     GetCursorPos(int X, int Y); //bool GetCursorPosXY = GetCursorPos(XGetCursorPos, YGetCursorPos);//...wrong
//#import

#import "user32.dll"
int     GetKeyState(int nVirtKey);///keyboard Key State
void    mouse_event(int dwFlags, int dx, int dy, int dwData, int dwExtraInfo);
bool    GetCursorPos(strPOINT & lpPoint); ///....cuurrect //POINT   lpPoint;//lpPoint.posX//lpPoint.posY//bool GetCursorPosXY2 = GetCursorPos( lpPoint); ///....cuurrect//Alert("lpPoint.posX:", lpPoint.posX, "//-lpPoint.posY:", lpPoint.posY, "==//", GetCursorPosXY2);
bool    SetCursorPos(int x, int y); ////......
bool    GetWindowRect(int hWnd, RECT & lpRect); ///.....
int     GetSystemMetrics(int nIndex);
int     SwapMouseButton(int fSwap);
#import

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_MOUSE
{
//=========================================================================
///bool GetCursorPos(LPPOINT lpPoint);///return x and y of mouse///
//=========================================================================
//#define VK_LBUTTON 0x01
//#define VK_RBUTTON 0x02
//---- mouse_event routines
//#define MOUSEEVENTF_MOVE               0x0001 // mouse move
//#define MOUSEEVENTF_LEFTDOWN           0x0002 // left button down
//#define MOUSEEVENTF_LEFTUP             0x0004 // left button up
//#define MOUSEEVENTF_RIGHTDOWN          0x0008 // right button down
//#define MOUSEEVENTF_RIGHTUP            0x0010 // right button up
//#define MOUSEEVENTF_MIDDLEDOWN         0x0020 // middle button down
//#define MOUSEEVENTF_MIDDLEUP           0x0040 // middle button up
//#define MOUSEEVENTF_WHEEL              0x0800 // wheel button rolled
//#define MOUSEEVENTF_ABSOLUTE           0x8000 // absolute move
//================================================================
//#define WM_MOUSEACTIVATE               0x0021
//-----------------------------------------------------------------
//mi[0].inputUnion.mi.dwFlags = MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_MOVE;
//    //mi[1].inputUnion.mi.dwFlags = MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_LEFTDOWN;
//    //mi[2].inputUnion.mi.dwFlags = MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_LEFTUP;
//    mi[1].inputUnion.mi.dwFlags = MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_MIDDLEDOWN;
//    mi[2].inputUnion.mi.dwFlags = MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_MIDDLEUP;
//==========================================================
//public const int MOUSEEVENTF_MOVE = 0x0001; /* mouse move */
//public const int MOUSEEVENTF_LEFTDOWN = 0x0002; /* left button down */
//public const int MOUSEEVENTF_LEFTUP = 0x0004; /* left button up */
//public const int MOUSEEVENTF_RIGHTDOWN = 0x0008; /* right button down */
//public const int MOUSEEVENTF_RIGHTUP = 0x0010; /* right button up */
//public const int MOUSEEVENTF_MIDDLEDOWN = 0x0020; /* middle button down */
//public const int MOUSEEVENTF_MIDDLEUP = 0x0040; /* middle button up */
//public const int MOUSEEVENTF_XDOWN = 0x0080; /* x button down */
//public const int MOUSEEVENTF_XUP = 0x0100; /* x button down */
//public const int MOUSEEVENTF_WHEEL = 0x0800; /* wheel button rolled */
//public const int MOUSEEVENTF_HWHEEL = 0x01000; /* hwheel button rolled */
//public const int MOUSEEVENTF_MOVE_NOCOALESCE = 0x2000; /* do not coalesce mouse moves */
//public const int MOUSEEVENTF_VIRTUALDESK = 0x4000; /* map to entire virtual desktop */
//public const int MOUSEEVENTF_ABSOLUTE = 0x8000; /* absolute move */

//==========================================================
//---- Window Messages
//#define WM_MOUSEFIRST                  0x0200
//#define WM_MOUSEMOVE                   0x0200
//#define WM_LBUTTONDOWN                 0x0201
//#define WM_LBUTTONUP                   0x0202   ////BINGOOO...Left Botoom realased...
//#define WM_LBUTTONDBLCLK               0x0203
//#define WM_RBUTTONDOWN                 0x0204
//#define WM_RBUTTONUP                   0x0205
//#define WM_RBUTTONDBLCLK               0x0206
//#define WM_MBUTTONDOWN                 0x0207
//#define WM_MBUTTONUP                   0x0208
//#define WM_MBUTTONDBLCLK               0x0209
//==========================================================
//---- AnimateWindow() Commands
//#define AW_HOR_POSITIVE                0x00000001
//#define AW_HOR_NEGATIVE                0x00000002
//#define AW_VER_POSITIVE                0x00000004
//#define AW_VER_NEGATIVE                0x00000008
//#define AW_CENTER                      0x00000010
//#define AW_HIDE                        0x00010000
//#define AW_ACTIVATE                    0x00020000
//#define AW_SLIDE                       0x00040000
//#define AW_BLEND                       0x00080000
//==============================
////---- GetWindow() Constants
//#define GW_HWNDFIRST                   0
//#define GW_HWNDLAST                    1
//#define GW_HWNDNEXT                    2
//#define GW_HWNDPREV                    3
//#define GW_OWNER                       4
//#define GW_CHILD                       5

//==========================================================
///bool SwapMouseButton(bool fSwap);
///int ShowCursor(bool bShow);
//==========================================================
#define PosX
#define PosY
//-----------------------------------------------------------------

private:

public://Constructors
          C_MOUSE::C_MOUSE();
          C_MOUSE::~C_MOUSE();
          bool  C_MOUSE::IS_MousePress ;//
          //================================================
public://cordinte date member
          strPOINT         lpPoint;//lpPoint.posX//lpPoint.posY////Mouse.POINT.posX//Mouse.POINT.posY///

          long          C_MOUSE::UsemouseX;
          double        C_MOUSE::UsemouseY;
          string        C_MOUSE::UsemouseButtons;
          //================================================

          //================================================
public://Data Member
          int           C_MOUSE::dwFlags;
          int           C_MOUSE::dx;
          int           C_MOUSE::dy;
          int           C_MOUSE::dwData;
          int           C_MOUSE::dwExtraInfo;
          //---------------------
          int           C_MOUSE::mouse_x ;
          int           C_MOUSE::mouse_y ;
          int           C_MOUSE::mouse_windowssub ;
          datetime      C_MOUSE::mouse_datetime ;
          double        C_MOUSE::mouse_price ;
          //====================================
public://Data Key Member
          bool          C_MOUSE::KeyBotton_PressRightClick;
          bool          C_MOUSE::KeyBotton_PressLeftClick;
          bool          C_MOUSE::KeyBotton_PressMiddleClick;
          bool          C_MOUSE::KeyBotton_RotadeWHEEL;
public://Data Key Member ClickingCount
          int           C_MOUSE::KeyBotton_PressRightClick_Count;
          int           C_MOUSE::KeyBotton_PressLeftClick_Count;
          int           C_MOUSE::KeyBotton_PressMiddleClick_Count;
          int           C_MOUSE::KeyBotton_RotadeWHEEL_Count;

          //====================================
public://Functions
          //mouse_event(MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_LEFTDOWN, point.x, point.y, 0, 0);
          ///mouse_event(int dwFlags, int dx, int dy, int dwData, int dwExtraInfo);
          //mouse_event(MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_MOVE, point.x, point.y, 0, 0);
          //mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
          //mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
          bool          C_MOUSE::PressRightClick();
          bool          C_MOUSE::PressLeftClick();
          bool          C_MOUSE::PressMiddleClick();
          bool          C_MOUSE::RotadeWHEEL(int MoveWheel = 0);
          /// MouseClick()
          //kernel32::Sleep();
          // if( KeyDown(VK_LBUTTON)
          bool          C_MOUSE::ScanPreesKeys(const int id = 0);
          //Number of virtual key nVirtKey;//
          bool          C_MOUSE::KeyDown( int nVirtKey ) { if( GetKeyState(nVirtKey) > 1000 )return( true ); return( false ); }
          ///is pressed or not///Mouse.KeyDown(VK_LBUTTON);
          //===========================================
          int           C_MOUSE::CrosshairswithTwoadditionalLines();//// +/- X pips away
          ////------------------------------------------------------------------------
          //======================================Non-client Mouse Messages
          ///Mose Messnger.....///WM_LBUTTONUP
          ///Responding to Mouse Clicks
          //Message              Meaning
          //WM_LBUTTONDOWN      Left button down
          //WM_LBUTTONUP        Left button up
          //WM_MBUTTONDOWN      Middle button down
          //WM_MBUTTONUP        Middle button up
          //WM_RBUTTONDOWN      Right button down
          //WM_RBUTTONUP        Right button up
          //WM_XBUTTONDOWN      XBUTTON1 or XBUTTON2 down
          //WM_XBUTTONUP        XBUTTON1 or XBUTTON2 up
          //=============================================
//          Additional Flags
//          The wParam parameter contains a bitwise OR of flags, indicating the state of the other mouse buttons plus the SHIFT and CTRL keys.
//
//          ADDITIONAL FLAGS
//          Flag      Meaning
//          MK_CONTROL          The CTRL key is down.
//          MK_LBUTTON          The left mouse button is down.
//          MK_MBUTTON          The middle mouse button is down.
//          MK_RBUTTON          The right mouse button is down.
//          MK_SHIFT  The SHIFT key is down.
//          MK_XBUTTON1         The XBUTTON1 button is down.
//          MK_XBUTTON2         The XBUTTON2 button is down.
//====================================================================================
          int           C_MOUSE::MouseMassageKernel();
          /////////////////===========================================================
          //mouse_event( Mouse.dwFlags = MOUSEEVENTF_LEFTUP, Mouse.dx, Mouse.dy, 0, 0);/////Relase left Click'
          //===========================================================================

};
int KeyBotton_PressRightClicK_Count = 0;///even frist cliking...//not countingup befor chech
int KeyBotton_PressLeftClicK_Count = 0;
int KeyBotton_PressMiddleClicK_Count = 0;
int KeyBotton_RotadeWHEEL_Count = 0;
////
//void Left_Click(const long x, const long y)
//{
//    mouse_event(MOUSEEVENTF_LEFTDOWN, x, y, 0, 0);
//    mouse_event(MOUSEEVENTF_LEFTUP,x,y,0,0);
//}
//void Right_Click(const long x, const long y)
//{
//    mouse_event(MOUSEEVENTF_RIGHTDOWN, x, y, 0, 0);
//    mouse_event(MOUSEEVENTF_RIGHTUP, x, y, 0, 0);
//}
//mouse_event(MOUSEEVENTF_RIGHTDOWN | MOUSEEVENTF_RIGHTUP, x, y, 0, 0);
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_MOUSE::C_MOUSE()
{         RunCallFunction++;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-KeyboardController-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          IS_MousePress = false;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-KeyboardController-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_MOUSE::~C_MOUSE()
{         //
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-KeyboardController-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_MOUSE::PressRightClick()
{
///
          dwFlags = WM_MOUSEACTIVATE ;
          dwData = MOUSEEVENTF_RIGHTDOWN;
          dwExtraInfo = 0;
///
          //mouse_event( dwFlags, dx, dy, dwData, dwExtraInfo);
          ///mouse_event( dwFlags, dx, dy, dwData, dwExtraInfo);
          ////>>>>>>>>>>>>>>>...instate use Costume Event....mouse keys
          /////---------------------------------------------------------
          mouse_event( dwFlags = MOUSEEVENTF_RIGHTUP, dx, dy, 0, 0);/////Relase left Click'
          mouse_event( dwFlags = MOUSEEVENTF_RIGHTDOWN, dx, dy, 0, 0);////Push  left Click'
          mouse_event( dwFlags = MOUSEEVENTF_RIGHTUP, dx, dy, 0, 0);/////Relase left Click'
          return true;
///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_MOUSE::PressLeftClick()
{
///
///
/////---------------------------------------------------------
          mouse_event( dwFlags = MOUSEEVENTF_LEFTUP, dx, dy, 0, 0);/////Relase left Click'
          mouse_event( dwFlags = MOUSEEVENTF_LEFTDOWN, dx, dy, 0, 0);////Push  left Click'
          mouse_event( dwFlags = MOUSEEVENTF_LEFTUP, dx, dy, 0, 0);/////Relase left Click'
          KeyBotton_PressLeftClicK_Count++;
          if(this.KeyBotton_PressLeftClick_Count > 3)this.KeyBotton_PressLeftClick_Count = 0;
///
          return true; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_MOUSE::PressMiddleClick()//Up+//ScrollDown-////
{
///
          /////---------------------------------------------------------
          mouse_event( dwFlags = MOUSEEVENTF_MIDDLEUP, dx, dy, 0, 0);/////Relase left Click'
          mouse_event( dwFlags = MOUSEEVENTF_MIDDLEDOWN, dx, dy, 0, 0);////Push  left Click'
          mouse_event( dwFlags = MOUSEEVENTF_MIDDLEUP, dx, dy, 0, 0);/////Relase left Click'
///>>>>the kernelll errorss..ned cheak
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_MOUSE::RotadeWHEEL(int MoveWheel = 0) //Up+//ScrollDown-////
{
//Private Declare Sub mouse_event Lib "user32" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)
//Private Const WHEEL_DELTA = 120
//Private Const MOUSEEVENTF_WHEEL = &H80
//Public Sub WheelTest()
//    Call mouse_event(MOUSEEVENTF_WHEEL, 0, 0, WHEEL_DELTA, 0)
//End Sub
/////[DllImport("user32.dll")]
//static extern void mouse_event(uint dwFlags, int dx, int dy, uint dwData,int dwExtraInfo);
#define WHEEL_DELTA 120
          if(MoveWheel > 0)mouse_event( dwFlags = MOUSEEVENTF_WHEEL, dx, dy, dwData = MoveWheel, 0); /////Relase left Click'
          if(MoveWheel < 0)mouse_event( dwFlags = MOUSEEVENTF_WHEEL, dx, dy, dwData = MoveWheel, 0); /////Relase left Click'///dwData += -MoveWheel
          if(MoveWheel == 0)mouse_event( dwFlags = MOUSEEVENTF_WHEEL, dx, dy, dwData = 0, 0); /////Relase left Click'
          ///
          ///
          //mouse_event(MOUSEEVENTF_WHEEL, 0, 0, DWORD(-WHEEL_DELTA), 0);
          //  mouse_event(MOUSEEVENTF_WHEEL, 0, 0, 100, 0);
          ///
          return true; //
}
int C_MOUSE::CrosshairswithTwoadditionalLines()//// +/- X pips away

{
//----
          int distance = 200;
          double   drop_price = WindowPriceOnDropped();
          datetime drop_time  = WindowTimeOnDropped();
          ObjectDelete("Dropped price line1");
          ObjectDelete("Dropped price line2");
          ObjectDelete("Dropped price line3");
          ObjectDelete("Dropped time line");
          //----
          ObjectCreate("Dropped price line1", OBJ_HLINE, 0, drop_time, drop_price + (distance * Point));
          ObjectCreate("Dropped price line2", OBJ_HLINE, 0, drop_time, drop_price - (distance * Point));
          ObjectCreate("Dropped price line3", OBJ_HLINE, 0, drop_time, drop_price);
          ObjectCreate("Dropped time line", OBJ_VLINE, 0, drop_time, 0);
//----
          return(0); ///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#import "user32.dll"
void  WndProc();
#import
int C_MOUSE::MouseMassageKernel()
{         ///
          //LRESULT CALLBACK
          //WndProc();
          //WndProc(_In_ HWND hWnd, _In_ UINT msg, _In_ WPARAM wParam, _In_ LPARAM lParam)
          //{         POINT pt;
          //          switch (msg)
          //          {         case WM_LBUTTONDOWN:
          //                    {         pt.x = GET_X_LPARAM(lParam);
          //                              pt.y = GET_Y_LPARAM(lParam); ///
          //                              //
          //                    } break; ///
          //                    default: return DefWindowProc(hWnd, msg, wParam, lParam);///
          //                              ///
          //          }          //
          //}
          return 0; ///
}
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//+------------------------------------------------------------------+
//|             Class C_MOUSE     BEGIN-END                  |
//+------------------------------------------------------------------+
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
////======================================================================================================

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStartS()
{         //string NAME = "";
          // int X = 0; int Y = 0; int WIDTH = 0; int HEIGHT = 0;
          ObjectDelete(0, NAMEPoint);
          ResetLastError();
          if(!ObjectCreate(0, NAMEPoint, OBJ_EDIT, 0, 0, 0))
          {         Print(__FUNCTION__, ": failed to create \"Edit\" object! Error code = ", GetLastError()); return; }
          ObjectSetInteger(0, NAMEPoint, OBJPROP_XDISTANCE, XPoint);
          ObjectSetInteger(0, NAMEPoint, OBJPROP_YDISTANCE, YPoint);
          ObjectSetInteger(0, NAMEPoint, OBJPROP_XSIZE, WIDTHPoint);
          ObjectSetInteger(0, NAMEPoint, OBJPROP_YSIZE, HEIGHTPoint);
          ObjectSetInteger(0, NAMEPoint, OBJPROP_HIDDEN, false);
          ObjectSetString(0, NAMEPoint, OBJPROP_TEXT, "Object Edit with focus after creating");
        
          MouseClick(int ((2 * XPoint + WIDTHPoint) / 2), int((2 * YPoint + HEIGHTPoint) / 2));//--- Simulate a click inside the OBJ_EDIT to get focus
          Sleep(10000); // Wait for 10 seconds//---
          MouseClick(0, 0);//--- Simulate a click outside (Left-Top corner of chart) the OBJ_EDIT to lose focus
     
          ObjectSetString(0, NAMEPoint, OBJPROP_TEXT, "In 10 seconds the object Edit will be deleted");
          //ChartRedraw();
          Sleep(10000); // Wait for 10 seconds
          ObjectDelete(0, NAMEPoint);
          
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void MouseClick(const int x, const int y)
{         Sleep(50);
          strPOINT clickPoint = ConvertXY(x, y);
          mouse_event(0x8007, clickPoint.posX, clickPoint.posY, 0, 0);
          Sleep(50); //
          ///---------------------
          strPOINT currentPoint;
          GetCursorPos(currentPoint);
          //POINT clickPoint = ConvertXY(x, y);
          mouse_event(0x8007, clickPoint.posX, clickPoint.posY, 0, 0);
          SetCursorPos(currentPoint.posX, currentPoint.posY);
          Sleep(50); //
          ///
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
strPOINT ConvertXY(const int x, const int y)
{         strPOINT AbsolutePoint;
          RECT  WndRect;
          int BorderX = 5, BorderY = 5;
          int screenX = GetSystemMetrics(0);
          int screenY = GetSystemMetrics(1);
          GetWindowRect(WindowHandle(_Symbol, _Period), WndRect);
          AbsolutePoint.posX = int ((x + WndRect.Left + BorderX) * 65535 / screenX);
          AbsolutePoint.posY = int ((y + WndRect.Top + BorderY) * 65535 / screenY);
          return(AbsolutePoint); //
}
////+------------------------------------------------------------------+
void DoMouseClick(int Cursor_Position_X, int Cursor_Position_Y)///public void DoMouseClick() cn acceeessing all
{         //user curent cursor position
          DoMouseClick(Cursor_Position_X, Cursor_Position_Y); }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DoMouseClick2(int x, int y)
{         mouse_event(MOUSEEVENTF_LEFTDOWN | MOUSEEVENTF_LEFTUP, x, y, 0, 0); }
//+------------------------------------------------------------------+
/*
mouse_event function (winuser.h)
12/05/2018
5 minutes to read
The mouse_event function synthesizes mouse motion and button clicks.

Note  This function has been superseded. Use SendInput instead.

Syntax
C++

Copy
void mouse_event(
  DWORD     dwFlags,
  DWORD     dx,
  DWORD     dy,
  DWORD     dwData,
  ULONG_PTR dwExtraInfo
);
Parameters
dwFlags

Type: DWORD

Controls various aspects of mouse motion and button clicking. This parameter can be certain combinations of the following values.

PARAMETERS
Value     Meaning
MOUSEEVENTF_ABSOLUTE
0x8000
The dx and dy parameters contain normalized absolute coordinates. If not set, those parameters contain relative data: the change in position since the last reported position. This flag can be set, or not set, regardless of what kind of mouse or mouse-like device, if any, is connected to the system. For further information about relative mouse motion, see the following Remarks section.
MOUSEEVENTF_LEFTDOWN
0x0002
The left button is down.
MOUSEEVENTF_LEFTUP
0x0004
The left button is up.
MOUSEEVENTF_MIDDLEDOWN
0x0020
The middle button is down.
MOUSEEVENTF_MIDDLEUP
0x0040
The middle button is up.
MOUSEEVENTF_MOVE
0x0001
Movement occurred.
MOUSEEVENTF_RIGHTDOWN
0x0008
The right button is down.
MOUSEEVENTF_RIGHTUP
0x0010
The right button is up.
MOUSEEVENTF_WHEEL
0x0800
The wheel has been moved, if the mouse has a wheel. The amount of movement is specified in dwData
MOUSEEVENTF_XDOWN
0x0080
An X button was pressed.
MOUSEEVENTF_XUP
0x0100
An X button was released.
MOUSEEVENTF_WHEEL
0x0800
The wheel button is rotated.
MOUSEEVENTF_HWHEEL
0x01000
The wheel button is tilted.

The values that specify mouse button status are set to indicate changes in status, not ongoing conditions. For example, if the left mouse button is pressed and held down, MOUSEEVENTF_LEFTDOWN is set when the left button is first pressed, but not for subsequent motions. Similarly, MOUSEEVENTF_LEFTUP is set only when the button is first released.

You cannot specify both MOUSEEVENTF_WHEEL and either MOUSEEVENTF_XDOWN or MOUSEEVENTF_XUP simultaneously in the dwFlags parameter, because they both require use of the dwData field.

dx

Type: DWORD

The mouse's absolute position along the x-axis or its amount of motion since the last mouse event was generated, depending on the setting of MOUSEEVENTF_ABSOLUTE. Absolute data is specified as the mouse's actual x-coordinate; relative data is specified as the number of mickeys moved. A mickey is the amount that a mouse has to move for it to report that it has moved.

dy

Type: DWORD

The mouse's absolute position along the y-axis or its amount of motion since the last mouse event was generated, depending on the setting of MOUSEEVENTF_ABSOLUTE. Absolute data is specified as the mouse's actual y-coordinate; relative data is specified as the number of mickeys moved.

dwData

Type: DWORD

If dwFlags contains MOUSEEVENTF_WHEEL, then dwData specifies the amount of wheel movement. A positive value indicates that the wheel was rotated forward, away from the user; a negative value indicates that the wheel was rotated backward, toward the user. One wheel click is defined as WHEEL_DELTA, which is 120.

If dwFlags contains MOUSEEVENTF_HWHEEL, then dwData specifies the amount of wheel movement. A positive value indicates that the wheel was tilted to the right; a negative value indicates that the wheel was tilted to the left.

If dwFlags contains MOUSEEVENTF_XDOWN or MOUSEEVENTF_XUP, then dwData specifies which X buttons were pressed or released. This value may be any combination of the following flags.

If dwFlags is not MOUSEEVENTF_WHEEL, MOUSEEVENTF_XDOWN, or MOUSEEVENTF_XUP, then dwData should be zero.*/

////+------------------------------------------------------------------+
//dwExtraInfo
//
//Type: ULONG_PTR
//
//An additional value associated with the mouse event. An application calls GetMessageExtraInfo to obtain this extra information.
//+------------------------------------------------------------------+
