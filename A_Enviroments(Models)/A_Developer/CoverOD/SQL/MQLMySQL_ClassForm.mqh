/********************************************************************
 * MQLMySQL interface library                                       *
 ********************************************************************
 * This library uses MQLMySQL.DLL was developed as interface to con-*
 * nect to the MySQL database server.                               *
 * Note: Check expert advisor "Common" parameters to be sure that   *
 *       DLL imports are allowed.                                   *
 ********************************************************************/
/*How Handel this!*/
/*
#000 get mariadb-11.1.0-winx64.zip and unpack in mvc c++ include for reffrence of new build
#00 put dll on the lib
#0 print version that run the ddl s     otherwise it access violate for pointer that is null
#1 instal MySQL app  foem   MySQL https://www.mysql.com  open CONNECTION  set name address and user for root defaultly   and passs what you say for connncetion
#2 Open CMD inter Password you seted in application MySQL then type show databases;
#2 create schema or one has shown in cmd for the Databas value in param of conncetion
#4 correct address for terminal data path of getstring Terminal;
#5 run it... 
[MYSQL]
Host = "127.0.0.1";
User = "mt4";
Password = "mt41";
Database ="mt4";
Port     = 3306;
Socket   = "0"; // this variable must be string, but not int "0";
ClientFlag = CLIENT_MULTI_STATEMENTS; 
*/
//+------------------------------------------------------------------+#import "..\Libraries\MQLMySQL.dll"
//|                                                                  |
//+------------------------------------------------------------------+
//#import "..\libraries\MQLMySQL\MQLMySQL.dll"//2023.04.14 19:40:51.948 Access violation read to 0x00000000 in 'C:\Users\Quartz\AppData\Roaming\MetaQuotes\Terminal\63603D13555081059CD774AC70BBC63B\MQL4\libraries\MQLMySQL\MQLMySQL.dll'
//#import "Libraries\MQLMySQL\MQLMySQL.dll"  //2023.04.14 19:44:24.244          Cannot call 'MQLMySQL.dll::ReadIni', 'MQLMySQL.dll' is not loaded
//2023.04.14 19:59:11.550     Cannot call 'libraries\MQLMySQL\MQLMySQL.dll::cMySqlConnect', 'libraries\MQLMySQL\MQLMySQL.dll' is not loaded
//#import "..\Libraries\64bit\MQLMySQL.dll"
//#import "MQLMySQL.dll"
#import "..\Libraries\sqls\Worked MQL4 MYSQL win11\32bit\MQLMySQL.dll"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string cMySqlVersion();// returns version of MySqlCursor.dll library
int    cGetMySqlErrorNumber(int pConnection);// number of last error of connection
int    cGetCursorErrorNumber(int pCursorID);// number of last error of cursor
string cGetMySqlErrorDescription(int pConnection);// description of last error for connection
string cGetCursorErrorDescription(int pCursorID);// description of last error for cursor
// establish connection to MySql database server
// and return connection identifier
int    cMySqlConnect       (string pHost,       // Host name
                            string pUser,       // User
                            string pPassword,   // Password
                            string pDatabase,   // Database name
                            int    pPort,       // Port
                            string pSocket,     // Socket for Unix
                            int    pClientFlag);// Client flag
// closes connection to database
void   cMySqlDisconnect    (int pConnection);   // pConnection - database identifier (pointer to structure)
// executes non-SELECT statements
bool   cMySqlExecute       (int    pConnection, // pConnection - database identifier (pointer to structure)
                            string pQuery);     // pQuery      - SQL query for execution
// creates an cursor based on SELECT statement
// return valuse - cursor identifier
int    cMySqlCursorOpen    (int    pConnection, // pConnection - database identifier (pointer to structure)
                            string pQuery);     // pQuery      - SELECT statement for execution
// closes opened cursor
void   cMySqlCursorClose   (int pCursorID);     // pCursorID  - internal identifier of cursor
// return number of rows was selected by cursor
int    cMySqlCursorRows    (int pCursorID);     // pCursorID  - internal identifier of cursor
// fetch next row from cursor into current row buffer
// return true - if succeeded, otherwise - false
bool   cMySqlCursorFetchRow(int pCursorID);     // pCursorID  - internal identifier of cursor
// retrieves the value from current row was fetched by cursor
string cMySqlGetRowField   (int    pCursorID,   // pCursorID  - internal identifier of cursor
                            int    pField);     // pField     - number of field in SELECT clause (started from 0,1,2... e.t.c.)

//// Reads and returns the key value from standard INI-file //2023.04.14 19:44:24.244     Cannot call 'MQLMySQL.dll::ReadIni', 'MQLMySQL.dll' is not loaded
string ReadIni             (string pFileName,   // INI-filename
                            string pSection,    // name of section
                            string pKey);       // name of key
#import
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cd_MySql
{
public:
          Cd_MySql(void) {};
          ~Cd_MySql(void) {};
          //--------------------------
          bool          SQLTrace;// = false;
          datetime      MySqlLastConnect;// = 0;
          //interface variables
          int           MySqlErrorNumber;       // recent MySQL error number
          string        MySqlErrorDescription;  // error description
          // return the version of MySQLCursor.DLL
          string        VersionX()                                    { return(cMySqlVersion()); }
          int           Connect(string pHost, string pUser, string pPassword, string pDatabase, int pPort, string pSocket, int pClientFlag);
          void          Disconnect(int &pConnection);
          bool          Execute(int pConnection, string pQuery);
          //
          int           CursorOpen(int pConnection, string pQuery);
          void          CursorClose(int pCursorID);
          int           CursorRows(int pCursorID);
          bool          CursorFetchRow(int pCursorID);
          // retrieves the value from current row was fetched by cursor
          string        GetRowField(int pCursorID, int pField);
          int           GetFieldAsInt(int pCursorID, int pField)           { return (StrToInteger(GetRowField(pCursorID, pField))); }
          double        GetFieldAsDouble(int pCursorID, int pField)        { return (StrToDouble(GetRowField(pCursorID, pField))); }
          datetime      GetFieldAsDatetime(int pCursorID, int pField)      { string x = GetRowField(pCursorID, pField); StringReplace(x, "-", "."); return (StringToTime(x)); }
          string        GetFieldAsString(int pCursorID, int pField)        { return (GetRowField(pCursorID, pField)); }

          string        GetReadIni(string pFileName, string pSection, string pKey) { return ReadIni( pFileName, pSection, pKey); }
          // just to clear error buffer before any function started its functionality
private  :
          void          ClearErrors()                                      { MySqlErrorNumber = 0; MySqlErrorDescription = "No errors."; }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// Interface function MySqlConnect - make connection to MySQL database using parameter:
// pHost       - DNS name or IP-address
// pUser       - database user (f.e. root)
// pPassword   - password of user (f.e. Zok1LmVdx)
// pDatabase   - database name (f.e. metatrader)
// pPort       - TCP/IP port of database listener (f.e. 3306)
// pSocket     - unix socket (for sockets or named pipes using)
// pClientFlag - combination of the flags for features (usual 0)
// ------------------------------------------------------------------------------------
// RETURN      - database connection identifier
//               if return value = 0, check MySqlErrorNumber and MySqlErrorDescription
int Cd_MySql::Connect(string pHost, string pUser, string pPassword, string pDatabase, int pPort, string pSocket, int pClientFlag)
{         int connection;
          ClearErrors();
          // if (SQLTrace) Print ("A Connecting to Host=", pHost, ", User=", pUser, ", Database=", pDatabase, " DBID#", connection);
          connection = cMySqlConnect(pHost, pUser, pPassword, pDatabase, pPort, pSocket, pClientFlag);
          if (SQLTrace) Print ("B Connecting to Host=", pHost, ", User=", pUser, ", Database=", pDatabase, " DBID#", connection);
          if (connection == -1)
          {         MySqlErrorNumber = cGetMySqlErrorNumber(-1);
                    MySqlErrorDescription = cGetMySqlErrorDescription(-1);
                    if (SQLTrace) Print ("Connection error #", MySqlErrorNumber, " ", MySqlErrorDescription); //
          }
          else { MySqlLastConnect = TimeCurrent(); if (SQLTrace) Print ("Connected! DBID#", connection); }
          return (connection); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// Interface function MySqlDisconnect - closes connection "pConnection" to database
// When no connection was established - nothing happends
void Cd_MySql::Disconnect(int &pConnection)
{         ClearErrors();
          if (pConnection != -1)
          {         cMySqlDisconnect(pConnection);
                    if (SQLTrace) Print ("DBID#", pConnection, " disconnected");
                    pConnection = -1; //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// Interface function MySqlExecute - executes SQL query via specified connection
// pConnection - opened database connection
// pQuery      - SQL query
// ------------------------------------------------------
// RETURN      - true : when execution succeded
//             - false: when any error was raised (see MySqlErrorNumber, MySqlErrorDescription, MySqlErrorQuery)
bool Cd_MySql::Execute(int pConnection, string pQuery)
{         ClearErrors();
          if (SQLTrace) {Print ("DBID#", pConnection, ", CMD:", pQuery);}
          if (pConnection == -1)
          {         // no connection
                    MySqlErrorNumber = -2;
                    MySqlErrorDescription = "No connection to the database.";
                    if (SQLTrace) Print ("CMD>", MySqlErrorNumber, ": ", MySqlErrorDescription);
                    return (false); }
          if (!cMySqlExecute(pConnection, pQuery))
          {         MySqlErrorNumber = cGetMySqlErrorNumber(pConnection);
                    MySqlErrorDescription = cGetMySqlErrorDescription(pConnection);
                    if (SQLTrace) Print ("CMD>", MySqlErrorNumber, ": ", MySqlErrorDescription);
                    return (false); }
          return (true); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// creates an cursor based on SELECT statement
// return valuse - cursor identifier
int Cd_MySql::CursorOpen(int pConnection, string pQuery)
{         int result;
          if (SQLTrace) {Print ("DBID#", pConnection, ", QRY:", pQuery);}
          ClearErrors();
          result = cMySqlCursorOpen(pConnection, pQuery);
          if (result == -1)
          {         MySqlErrorNumber = cGetMySqlErrorNumber(pConnection);
                    MySqlErrorDescription = cGetMySqlErrorDescription(pConnection);
                    if (SQLTrace) Print ("QRY>", MySqlErrorNumber, ": ", MySqlErrorDescription); }
          return (result); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// closes opened cursor
void Cd_MySql::CursorClose(int pCursorID)
{         ClearErrors();
          cMySqlCursorClose(pCursorID);
          MySqlErrorNumber = cGetCursorErrorNumber(pCursorID);
          MySqlErrorDescription = cGetCursorErrorDescription(pCursorID);
          if (SQLTrace)
          {         if (MySqlErrorNumber != 0)
                    {         Print ("Cursor #", pCursorID, " closing error:", MySqlErrorNumber, ": ", MySqlErrorDescription); }
                    else
                    {         Print ("Cursor #", pCursorID, " closed"); }//
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// return number of rows was selected by cursor
int Cd_MySql::CursorRows(int pCursorID)
{         int result;
          result = cMySqlCursorRows(pCursorID);
          MySqlErrorNumber = cGetCursorErrorNumber(pCursorID);
          MySqlErrorDescription = cGetCursorErrorDescription(pCursorID);
          if (SQLTrace) Print ("Cursor #", pCursorID, ", rows: ", result);
          return (result);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// fetch next row from cursor into current row buffer
// return true - if succeeded, otherwise - false
bool Cd_MySql::CursorFetchRow(int pCursorID)
{         bool result;
          result = cMySqlCursorFetchRow(pCursorID);
          MySqlErrorNumber = cGetCursorErrorNumber(pCursorID);
          MySqlErrorDescription = cGetCursorErrorDescription(pCursorID);
          return (result); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// retrieves the value from current row was fetched by cursor
string Cd_MySql::GetRowField(int pCursorID, int pField)
{         string result;
          result = cMySqlGetRowField(pCursorID, pField);
          MySqlErrorNumber = cGetCursorErrorNumber(pCursorID);
          MySqlErrorDescription = cGetCursorErrorDescription(pCursorID);
          return (result); //
}
/********************************************************************
 * MySQL standard definitions                                       *
 ********************************************************************/
#define CLIENT_LONG_PASSWORD               1 /* new more secure passwords */
#define CLIENT_FOUND_ROWS                  2 /* Found instead of affected rows */
#define CLIENT_LONG_FLAG                   4 /* Get all column flags */
#define CLIENT_CONNECT_WITH_DB             8 /* One can specify db on connect */
#define CLIENT_NO_SCHEMA                  16 /* Don't allow database.table.column */
#define CLIENT_COMPRESS                   32 /* Can use compression protocol */
#define CLIENT_ODBC                       64 /* Odbc client */
#define CLIENT_LOCAL_FILES               128 /* Can use LOAD DATA LOCAL */
#define CLIENT_IGNORE_SPACE              256 /* Ignore spaces before '(' */
#define CLIENT_PROTOCOL_41               512 /* New 4.1 protocol */
#define CLIENT_INTERACTIVE              1024 /* This is an interactive client */
#define CLIENT_SSL                      2048 /* Switch to SSL after handshake */
#define CLIENT_IGNORE_SIGPIPE           4096 /* IGNORE sigpipes */
#define CLIENT_TRANSACTIONS             8192 /* Client knows about transactions */
#define CLIENT_RESERVED                16384 /* Old flag for 4.1 protocol  */
#define CLIENT_SECURE_CONNECTION       32768 /* New 4.1 authentication */
#define CLIENT_MULTI_STATEMENTS        65536 /* Enable/disable multi-stmt support */
#define CLIENT_MULTI_RESULTS          131072 /* Enable/disable multi-results */
#define CLIENT_PS_MULTI_RESULTS       262144 /* Multi-results in PS-protocol */

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
