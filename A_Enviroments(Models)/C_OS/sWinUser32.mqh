//+------------------------------------------------------------------+
//|                                          C_WINUSER32.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
class C_WINUSER32
{
private:

public:
          void          C_WINUSER32::C_WINUSER32();
          void          C_WINUSER32::~C_WINUSER32();//
          bool          C_WINUSER32::Update();
          bool          C_WINUSER32::UPDATED;
//====================================================================#import "user32.dll"
          void          C_WINUSER32::WinMassanger(int hWnd = 0, int Msg = 0, int wParam = 0, int lParam = 0, int bVk = 0, int bScan = 0, int dwFlags = 0, int dwExtraInfo = 0, int dx = 0, int dy = 0, int dwData = 0);
          void          C_WINUSER32::WinUser32SendMessageA(bool key = true);
//====================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_WINUSER32::C_WINUSER32()
{         RunCallFunction++; //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_WINUSER32 Error",  __LINE__, __FUNCTION__); //
          //============================//============================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_WINUSER32::~C_WINUSER32()
{         //============================//============================
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_WINUSER32 Error",  __LINE__, __FUNCTION__); //
          //============================//============================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_WINUSER32::Update()
{         UPDATED = false;
          if(0) { WinMassanger();}
          if(0) { Sleep(5000);} //Cheak later >>>
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATED = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          if(!this.UPDATED)          {Alert("WinUser.UPDATED: ", this.UPDATED);}
          return UPDATED;//
}
//+------------------------------------------------------------------+
void C_WINUSER32::WinMassanger(int hWnd = 0, int Msg = 0, int wParam = 0, int lParam = 0, int bVk = 0,
                                int bScan = 0, int dwFlags = 0, int dwExtraInfo = 0, int dx = 0, int dy = 0, int dwData = 0)
{
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_WINUSER32 Error",  __LINE__, __FUNCTION__); //
          //============================//============================
//---- messages
          int   V_SendMessageA          = SendMessageA( hWnd, Msg, wParam, lParam);
          int   V_SendMessageW          = SendMessageW( hWnd, Msg, wParam, lParam);
          int   V_SendNotifyMessageA    = SendNotifyMessageA( hWnd, Msg, wParam, lParam);
          int   V_SendNotifyMessageW    = SendNotifyMessageW( hWnd, Msg, wParam, lParam);
          int   V_PostMessageA          = PostMessageA( hWnd, Msg, wParam, lParam);
          int   V_PostMessageW          = PostMessageW( hWnd, Msg, wParam, lParam);
          keybd_event( bVk, bScan, dwFlags, dwExtraInfo);
          mouse_event( dwFlags, dx, dy, dwData, dwExtraInfo);
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_WINUSER32 Error",  __LINE__, __FUNCTION__); //
          //============================//============================
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_WINUSER32::WinUser32SendMessageA(bool key = true)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          int arghWnd   = 5;
          int argMsg    = 5;
          int argwParam = 5;
          int arglParam = 5;
          int argSendMessageA = SendMessageA(arghWnd, argMsg, argwParam, arglParam); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
