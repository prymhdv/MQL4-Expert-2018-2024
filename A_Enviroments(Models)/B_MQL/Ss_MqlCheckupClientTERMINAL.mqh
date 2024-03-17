//+------------------------------------------------------------------+
//|                                        Ss_MqlCheckupClientTERMINAL.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
class Ss_MqlCheckupClientTERMINAL
{

          /*
          * Client Terminal Properties
          * Information about the client terminal can be obtained by two functions: TerminalInfoInteger() and TerminalInfoString().
          * For parameters, these functions accept values from ENUM_TERMINAL_INFO_INTEGER and ENUM_TERMINAL_INFO_STRING respectively.
          *
          *
          * TerminalInfoInteger()
          * TerminalInfoString()
          * ===========================================================================================================================================
          * ENUM_TERMINAL_INFO_INTEGER                                                                                                                |
          * Identifier                            Description                                                                                    Type |
          * ===========================================================================================================================================
          * TERMINAL_BUILD                        The client terminal build number                                                                int
          * TERMINAL_COMMUNITY_ACCOUNT            The flag indicates the presence of MQL5.community authorization data in the terminal            bool
          * TERMINAL_COMMUNITY_CONNECTION         Connection to MQL5.community                                                                    bool
          * TERMINAL_CONNECTED                    Connection to a trade server                                                                    bool
          * TERMINAL_DLLS_ALLOWED                 Permission to use DLL                                                                           bool
          * TERMINAL_TRADE_ALLOWED                Permission to trade                                                                             bool
          * TERMINAL_EMAIL_ENABLED                Permission to send e-mails using SMTP-server and login, specified in the terminal settings      bool
          * TERMINAL_FTP_ENABLED                  Permission to send reports using FTP-server and login, specified in the terminal settings       bool
          * TERMINAL_NOTIFICATIONS_ENABLED        Permission to send notifications to smartphone                                                  bool
          * TERMINAL_MAXBARS                      The maximal bars count on the chart                                                             int
          * TERMINAL_MQID                         The flag indicates the presence of MetaQuotes ID data to send Push notifications                bool
          * TERMINAL_CODEPAGE                     Number of the code page of the language installed in the client terminal                        int
          * TERMINAL_CPU_CORES                    The number of CPU cores in the system                                                           int
          * TERMINAL_DISK_SPACE                   Free disk space for the MQL4\Files folder of the terminal, Mb                                   int
          * TERMINAL_MEMORY_PHYSICAL              Physical memory in the system, Mb                                                               int
          * TERMINAL_MEMORY_TOTAL                 Memory available to the process of the terminal , Mb                                            int
          * TERMINAL_MEMORY_AVAILABLE             Free memory of the terminal process, Mb                                                         int
          * TERMINAL_MEMORY_USED                  Memory used by the terminal , Mb                                                                int
          * TERMINAL_SCREEN_DPI                   The resolution of information display on the screen is
                                                  measured as number of Dots in a line per Inch (DPI).
                                                  Knowing the parameter value, you can set the size of graphical objects so
                                                  that they look the same on monitors with different resolution characteristics.                  int
          * TERMINAL_PING_LAST                    The last known value of a ping to a trade server in microseconds.
                                                  One second comprises of one million microseconds                                                int
          * ===========================================================================================================================================
          * Key identifier                        Description                                                                                    Type |
          * ===========================================================================================================================================
          * TERMINAL_KEYSTATE_LEFT                State of the "Left arrow" key                                                                   int
          * TERMINAL_KEYSTATE_UP                  State of the "Up arrow" key                                                                     int
          * TERMINAL_KEYSTATE_RIGHT               State of the "Right arrow" key                                                                  int
          * TERMINAL_KEYSTATE_DOWN                State of the "Down arrow" key                                                                   int
          * TERMINAL_KEYSTATE_SHIFT               State of the "Shift" key                                                                        int
          * TERMINAL_KEYSTATE_CONTROL             State of the "Ctrl" key                                                                         int
          * TERMINAL_KEYSTATE_MENU                State of the "Windows" key                                                                      int
          * TERMINAL_KEYSTATE_CAPSLOCK            State of the "CapsLock" key                                                                     int
          * TERMINAL_KEYSTATE_NUMLOCK             State of the "NumLock" key                                                                      int
          * TERMINAL_KEYSTATE_SCRLOCK             State of the "ScrollLock" key                                                                   int
          * TERMINAL_KEYSTATE_ENTER               State of the "Enter" key                                                                        int
          * TERMINAL_KEYSTATE_INSERT              State of the "Insert" key                                                                       int
          * TERMINAL_KEYSTATE_DELETE              State of the "Delete" key                                                                       int
          * TERMINAL_KEYSTATE_HOME                State of the "Home" key                                                                         int
          * TERMINAL_KEYSTATE_END                 State of the "End" key                                                                          int
          * TERMINAL_KEYSTATE_TAB                 State of the "Tab" key                                                                          int
          * TERMINAL_KEYSTATE_PAGEUP              State of the "PageUp" key                                                                       int
          * TERMINAL_KEYSTATE_PAGEDOWN            State of the "PageDown" key                                                                     int
          * TERMINAL_KEYSTATE_ESCAPE              State of the "Escape" key                                                                       int
          *
          *
          * ===========================================================================================================================================
          * ENUM_TERMINAL_INFO_DOUBLE  MQL5                                                                                                           |
          * Key identifier                        Description                                                                                    Type |
          * ===========================================================================================================================================
          * TERMINAL_COMMUNITY_BALANCE            Balance in MQL5.community                                                                     double
          * ===========================================================================================================================================
          *
          * ===========================================================================================================================================
          * ENUM_TERMINAL_INFO_STRING                                                                                                                 |
          * Key identifier                        Description                                                                                    Type |
          * ===========================================================================================================================================
          * TERMINAL_LANGUAGE                     Language of the terminal                                                                      string
          * TERMINAL_COMPANY                      Company name                                                                                  string
          * TERMINAL_NAME                         Terminal name                                                                                 string
          * TERMINAL_PATH                         Folder from which the terminal is started                                                     string
          * TERMINAL_DATA_PATH                    Folder in which terminal data are stored                                                      string
          * TERMINAL_COMMONDATA_PATH              Common path for all of the terminals installed on a computer                                  string
          * ===========================================================================================================================================
          *
          *
          *
          *
          */
//====================================================================
private:
//====================================================================
public:
          void          Ss_MqlCheckupClientTERMINAL();
          //void          Ss_MqlCheckupClientTERMINAL::~Ss_MqlCheckupClientTERMINAL() { /*Alert("Deinit: ", __FUNCSIG__);*/};
          void          ~Ss_MqlCheckupClientTERMINAL() {RunCallFunction--; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ss_MqlCheckupClientTERMINAL-Error",  __LINE__, __FUNCTION__); }
          bool          Update();
          bool          UPDATED;
//====================================================================
          int           BUILD;
          int           CODEPAGE;
          bool          COMMUNITY_ACCOUNT;
          bool          COMMUNITY_CONNECTION;
          bool          CONNECTED;
          int           CPU_CORES;
          int           DISK_SPACE;
          bool          DLLS_ALLOWED;
          bool          EMAIL_ENABLED;
          bool          FTP_ENABLED;
          //===================================
          int           KEYSTATE_CAPSLOCK;
          int           KEYSTATE_CONTROL;
          int           KEYSTATE_DELETE;
          int           KEYSTATE_DOWN;
          int           KEYSTATE_END;
          int           KEYSTATE_ENTER;
          int           KEYSTATE_ESCAPE;
          int           KEYSTATE_HOME;
          int           KEYSTATE_INSERT;
          int           KEYSTATE_LEFT;
          int           KEYSTATE_MENU;
          int           KEYSTATE_NUMLOCK;
          int           KEYSTATE_PAGEDOWN;
          int           KEYSTATE_PAGEUP;
          int           KEYSTATE_RIGHT;
          int           KEYSTATE_SCRLOCK;
          int           KEYSTATE_SHIFT;
          int           KEYSTATE_TAB;
          int           KEYSTATE_UP;
          //===================================
          int           MAXBARS;
          int           MEMORY_AVAILABLE;
          int           MEMORY_PHYSICAL;
          int           MEMORY_TOTAL;
          int           MEMORY_USED;
          bool          MQID;
          bool          NOTIFICATIONS_ENABLED;
          int           OPENCL_SUPPORT;
          int           PING_LAST;                  /*Desc*/ string PING_LASTdesc; string fPING_LASTdesc();  //--there be mone lag--need functional return
          int           SCREEN_DPI;
          bool          TRADE_ALLOWED;
          int           VPS;
          int           X64;
          //=================================================================
          string        COMMONDATA_PATH;
          string        COMPANY;
          string        DATA_PATH;
          string        LANGUAGE;
          string        NAME;
          string        PATH;
//====================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ss_MqlCheckupClientTERMINAL::Ss_MqlCheckupClientTERMINAL()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          RunCallFunction++;//=========================================================|
          Update(); //
           
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool   Ss_MqlCheckupClientTERMINAL::Update()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          UPDATED = false;
//=================================================================
          BUILD                 = TerminalInfoInteger(TERMINAL_BUILD);//
          CODEPAGE              = TerminalInfoInteger(TERMINAL_CODEPAGE);//
          COMMUNITY_ACCOUNT     = TerminalInfoInteger(TERMINAL_COMMUNITY_ACCOUNT);//
          COMMUNITY_CONNECTION  = TerminalInfoInteger(TERMINAL_COMMUNITY_CONNECTION);//
          CONNECTED             = TerminalInfoInteger(TERMINAL_CONNECTED) == IsConnected(); //
          CPU_CORES             = TerminalInfoInteger(TERMINAL_CPU_CORES);//
          DISK_SPACE            = TerminalInfoInteger(TERMINAL_DISK_SPACE);//
          DLLS_ALLOWED          = TerminalInfoInteger(TERMINAL_DLLS_ALLOWED);//
          EMAIL_ENABLED         = TerminalInfoInteger(TERMINAL_EMAIL_ENABLED);//
          FTP_ENABLED           = TerminalInfoInteger(TERMINAL_FTP_ENABLED);//
          //===============================================================
          KEYSTATE_CAPSLOCK     = TerminalInfoInteger(TERMINAL_KEYSTATE_CAPSLOCK);//
          KEYSTATE_CONTROL      = TerminalInfoInteger(TERMINAL_KEYSTATE_CONTROL);//
          KEYSTATE_DELETE       = TerminalInfoInteger(TERMINAL_KEYSTATE_DELETE);//
          KEYSTATE_DOWN         = TerminalInfoInteger(TERMINAL_KEYSTATE_DOWN);//
          KEYSTATE_END          = TerminalInfoInteger(TERMINAL_KEYSTATE_END);//
          KEYSTATE_ENTER        = TerminalInfoInteger(TERMINAL_KEYSTATE_ENTER);//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          // KEYSTATE_ESCAPE       = TerminalInfoInteger(TERMINAL_KEYSTATE_ESCAPE);//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          KEYSTATE_HOME         = TerminalInfoInteger(TERMINAL_KEYSTATE_HOME);//
          KEYSTATE_INSERT       = TerminalInfoInteger(TERMINAL_KEYSTATE_INSERT);//
          KEYSTATE_LEFT         = TerminalInfoInteger(TERMINAL_KEYSTATE_LEFT);//
          KEYSTATE_MENU         = TerminalInfoInteger(TERMINAL_KEYSTATE_MENU);//
          KEYSTATE_NUMLOCK      = TerminalInfoInteger(TERMINAL_KEYSTATE_NUMLOCK);//
          KEYSTATE_PAGEDOWN     = TerminalInfoInteger(TERMINAL_KEYSTATE_PAGEDOWN);//
          KEYSTATE_PAGEUP       = TerminalInfoInteger(TERMINAL_KEYSTATE_PAGEUP);//
          KEYSTATE_RIGHT        = TerminalInfoInteger(TERMINAL_KEYSTATE_RIGHT);//
          KEYSTATE_SCRLOCK      = TerminalInfoInteger(TERMINAL_KEYSTATE_SCRLOCK);//
          KEYSTATE_SHIFT        = TerminalInfoInteger(TERMINAL_KEYSTATE_SHIFT);//
          KEYSTATE_TAB          = TerminalInfoInteger(TERMINAL_KEYSTATE_TAB);//
          KEYSTATE_UP           = TerminalInfoInteger(TERMINAL_KEYSTATE_UP);//
          //===============================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          MAXBARS               = TerminalInfoInteger(TERMINAL_MAXBARS);//
          MEMORY_AVAILABLE      = TerminalInfoInteger(TERMINAL_MEMORY_AVAILABLE);//
          MEMORY_PHYSICAL       = TerminalInfoInteger(TERMINAL_MEMORY_PHYSICAL);//
          MEMORY_TOTAL          = TerminalInfoInteger(TERMINAL_MEMORY_TOTAL);//
          MEMORY_USED           = TerminalInfoInteger(TERMINAL_MEMORY_USED);//
          MQID                  = TerminalInfoInteger(TERMINAL_MQID);//
          NOTIFICATIONS_ENABLED = TerminalInfoInteger(TERMINAL_NOTIFICATIONS_ENABLED);//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          //OPENCL_SUPPORT        = TerminalInfoInteger(TERMINAL_OPENCL_SUPPORT);//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          PING_LAST             = TerminalInfoInteger(TERMINAL_PING_LAST);//
          SCREEN_DPI            = TerminalInfoInteger(TERMINAL_SCREEN_DPI);//
          TRADE_ALLOWED         = TerminalInfoInteger(TERMINAL_TRADE_ALLOWED);//
          VPS                   = TerminalInfoInteger(TERMINAL_VPS);//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          //X64                   = TerminalInfoInteger(TERMINAL_X64);//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          //=================================================================
          COMMONDATA_PATH       = TerminalInfoString(TERMINAL_COMMONDATA_PATH);
          COMPANY               = TerminalInfoString(TERMINAL_COMPANY);
          DATA_PATH             = TerminalInfoString(TERMINAL_DATA_PATH);
          LANGUAGE              = TerminalInfoString(TERMINAL_LANGUAGE);
          NAME                  = TerminalInfoString(TERMINAL_NAME);
          PATH                  = TerminalInfoString(TERMINAL_PATH);
          //=================================================================.
          PING_LASTdesc = CONNECTED ? DoubleToString(PING_LAST / 1000, 2) + " ms" : "NC"; /*SetText*/
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATED = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          if(!this.UPDATED)         {Alert("DevCheckupTerminal.UPDATED: ", this.UPDATED);}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          return UPDATED ; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string fPING_LASTdesc()
{         return /*CONNECTED*/TerminalInfoInteger(TERMINAL_CONNECTED) ? DoubleToString(/*PING_LAST*/TerminalInfoInteger(TERMINAL_PING_LAST) / 1000, 2) + " ms" : "NC"; /*SetText*/
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
