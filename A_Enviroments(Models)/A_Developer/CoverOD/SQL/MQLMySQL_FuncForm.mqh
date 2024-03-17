/********************************************************************
 * MQLMySQL interface library                                       *
 ********************************************************************
 * This library uses MQLMySQL.DLL was developed as interface to con-*
 * nect to the MySQL database server.                               *
 * Note: Check expert advisor "Common" parameters to be sure that   *
 *       DLL imports are allowed.                                   *
 ********************************************************************/
bool SQLTrace = true;
datetime MySqlLastConnect=0;
/*
#   Printing version very well..
instal mysql application on windows  !!! may not need
'''
Same here. If it helps, I have no problem with the sample script that is provided. But when i try to run the code in an EA in OnTick() this is when i get the error.
Has anyone figured this issue out?
//

OK guys, I figured it out...at least for why it was happening to me. It was because I had the wrong (non-existent) table name in my select statement! 
It also may have happened because at one point I had the table name the same as the database name so I change the table name in my database (and updated the select statement to match of course),
 so watch out for that too! I wish the error message were a little more specific, but oh well.


First of all, make sure that you have dll loaded (no error 126 or so), then set the socket = ""; but not NULL
Next, the library has variable  SQLTrace you can set to true and see the logs of errors. 
Depends on logs you see, you would be able to check MySQL documentation for solving issue.
*/
//#import "..\Libraries\MQLMySQL.dll"
//#import "libmysql.dll"
//
//mysql_fetch_row
//
//
//
//#import
//#import "Libraries\sqls\MQLMySQL\32bit\MQLMySQL.dll"
//#import "MQLMySQL.dll" //C:\Windows\Sytem32
//#import "..\Libraries\sqls\MQL4 MySQL for new MQL4\Libraries\2023 04 15\MQLMySQL.dll"
//#import "..\\Libraries\\sqls\MQL4 MySQL for new MQL4\\Libraries\\2023 04 15\\MQLMySQL.dll"
//#import "MQLMySQL.dll"/////----when not existed --->>> 2023.04.15 18:31:41.643	Cannot call 'MQLMySQL.dll::cMySqlConnect', 'MQLMySQL.dll' is not loaded 
#import "Libraries\sqls\Worked MQL4 MYSQL win11\32bit\MQLMySQL.dll"///----when all both existed --->>>2023.04.15 18:34:40.788	Access violation read to 0x00000000 in 'C:\Users\Quartz\AppData\Roaming\MetaQuotes\Terminal\63603D13555081059CD774AC70BBC63B\MQL4\Libraries\MQLMySQL.dll'
string  cMySqlVersion ();
int     cGetMySqlErrorNumber(int pConnection);
int     cGetCursorErrorNumber(int pCursorID);
string  cGetMySqlErrorDescription(int pConnection);
string  cGetCursorErrorDescription(int pCursorID);
int      cMySqlConnect      (string pHost, string pUser, string pPassword, string pDatabase, int    pPort, string pSocket, int pClientFlag); 
void    cMySqlDisconnect    (int pConnection);   
bool    cMySqlExecute       (int    pConnection, string pQuery);      
int     cMySqlCursorOpen    (int    pConnection, string pQuery);      
void    cMySqlCursorClose   (int pCursorID);     
int     cMySqlCursorRows    (int pCursorID);     
bool    cMySqlCursorFetchRow(int pCursorID);     
string  cMySqlGetRowField   (int    pCursorID, int    pField);      
int     cMySqlRowsAffected  (int pConnection);      
string  ReadIni             (string pFileName, string pSection, string pKey);    
#import

//interface variables
int    MySqlErrorNumber;       // recent MySQL error number
string MySqlErrorDescription;  // error description

// return the version of MySQLCursor.DLL
string MySqlVersion()
{
 return(cMySqlVersion());
}

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
int MySqlConnect(string pHost, string pUser, string pPassword, string pDatabase, int pPort, string pSocket, int pClientFlag)
{
 int connection;
 ClearErrors();
 connection = cMySqlConnect(pHost, pUser, pPassword, pDatabase, pPort, pSocket, pClientFlag);

 if (SQLTrace) Print ("Connecting to Host=", pHost, ", User=", pUser, ", Database=", pDatabase, " DBID#", connection);

 if (connection == -1)
    {
     MySqlErrorNumber = cGetMySqlErrorNumber(-1);
     MySqlErrorDescription = cGetMySqlErrorDescription(-1);
     if (SQLTrace) Print ("Connection error #",MySqlErrorNumber," ",MySqlErrorDescription);
    }
 else
    {
     MySqlLastConnect = TimeCurrent();
     if (SQLTrace) Print ("Connected! DBID#",connection);
    }
 
 // SET UTF8 CHARSET FOR CONNECTION
 if (!MySqlExecute(connection, "SET NAMES UTF8"))
    {
     MySqlErrorNumber = cGetMySqlErrorNumber(-1);
     MySqlErrorDescription = cGetMySqlErrorDescription(-1);
     if (SQLTrace) Print ("'SET NAMES UTF8' error #",MySqlErrorNumber," ",MySqlErrorDescription);
    }
 
 return (connection);
}

// Interface function MySqlDisconnect - closes connection "pConnection" to database
// When no connection was established - nothing happends
void MySqlDisconnect(int &pConnection)
{
 ClearErrors();
 if (pConnection != -1) 
    {
     cMySqlDisconnect(pConnection);
     if (SQLTrace) Print ("DBID#",pConnection," disconnected");
     pConnection = -1;
    }
}

// Interface function MySqlExecute - executes SQL query via specified connection
// pConnection - opened database connection
// pQuery      - SQL query
// ------------------------------------------------------
// RETURN      - true : when execution succeded
//             - false: when any error was raised (see MySqlErrorNumber, MySqlErrorDescription, MySqlErrorQuery)
bool MySqlExecute(int pConnection, string pQuery)
{
 ClearErrors();
 if (SQLTrace) {Print ("DBID#",pConnection,", CMD:",pQuery);}
 if (pConnection == -1) 
    {
     // no connection
     MySqlErrorNumber = -2;
     MySqlErrorDescription = "No connection to the database.";
     if (SQLTrace) Print ("CMD>",MySqlErrorNumber, ": ", MySqlErrorDescription);
     return (false);
    }
 
 if (!cMySqlExecute(pConnection, pQuery))
    {
     MySqlErrorNumber = cGetMySqlErrorNumber(pConnection);
     MySqlErrorDescription = cGetMySqlErrorDescription(pConnection);
     if (SQLTrace) Print ("CMD>",MySqlErrorNumber, ": ", MySqlErrorDescription);
     return (false);
    }
 return (true);
}

// creates an cursor based on SELECT statement
// return valuse - cursor identifier
int MySqlCursorOpen(int pConnection, string pQuery)
{
 int result;
 if (SQLTrace) {Print ("DBID#",pConnection,", QRY:",pQuery);}
 ClearErrors();
 result = cMySqlCursorOpen(pConnection, pQuery);
 if (result == -1)
    {
     MySqlErrorNumber = cGetMySqlErrorNumber(pConnection);
     MySqlErrorDescription = cGetMySqlErrorDescription(pConnection);
     if (SQLTrace) Print ("QRY>",MySqlErrorNumber, ": ", MySqlErrorDescription);
    }
 return (result);
}

// closes opened cursor
void MySqlCursorClose(int pCursorID)
{
 ClearErrors();
 cMySqlCursorClose(pCursorID);
 MySqlErrorNumber = cGetCursorErrorNumber(pCursorID);
 MySqlErrorDescription = cGetCursorErrorDescription(pCursorID);
 if (SQLTrace) 
    {
     if (MySqlErrorNumber!=0)
        {
         Print ("Cursor #",pCursorID," closing error:", MySqlErrorNumber, ": ", MySqlErrorDescription);
        }
     else 
        {
         Print ("Cursor #",pCursorID," closed");
        }
    }
}

// return number of rows was selected by cursor
int MySqlCursorRows(int pCursorID)
{
 int result;
 result = cMySqlCursorRows(pCursorID);
 MySqlErrorNumber = cGetCursorErrorNumber(pCursorID);
 MySqlErrorDescription = cGetCursorErrorDescription(pCursorID);
 if (SQLTrace) Print ("Cursor #",pCursorID,", rows: ",result);
 return (result);
}

// fetch next row from cursor into current row buffer
// return true - if succeeded, otherwise - false
bool MySqlCursorFetchRow(int pCursorID)
{
 bool result;
 result = cMySqlCursorFetchRow(pCursorID);
 MySqlErrorNumber = cGetCursorErrorNumber(pCursorID);
 MySqlErrorDescription = cGetCursorErrorDescription(pCursorID);
 return (result); 
}

// retrieves the value from current row was fetched by cursor
string MySqlGetRowField(int pCursorID, int pField)
{
 string result;
 result = cMySqlGetRowField(pCursorID, pField);
 MySqlErrorNumber = cGetCursorErrorNumber(pCursorID);
 MySqlErrorDescription = cGetCursorErrorDescription(pCursorID);
 return (result);
}

int MySqlGetFieldAsInt(int pCursorID, int pField)
{
 return (StrToInteger(MySqlGetRowField(pCursorID, pField)));
}

double MySqlGetFieldAsDouble(int pCursorID, int pField)
{
 return (StrToDouble(MySqlGetRowField(pCursorID, pField)));
}

datetime MySqlGetFieldAsDatetime(int pCursorID, int pField)
{
 string x = MySqlGetRowField(pCursorID, pField);
 StringReplace(x,"-",".");
 return (StringToTime(x));
}

string MySqlGetFieldAsString(int pCursorID, int pField)
{
 return (MySqlGetRowField(pCursorID, pField));
}

// just to clear error buffer before any function started its functionality
void ClearErrors()
{
 MySqlErrorNumber = 0;
 MySqlErrorDescription = "No errors.";
}

int MySqlRowsAffected  (int pConnection)
{
 return (cMySqlRowsAffected(pConnection));
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

