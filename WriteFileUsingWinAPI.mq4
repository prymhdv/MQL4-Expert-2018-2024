#property copyright "Copyright © 2010, sangmane"
#property link      "steven00@fastmail.fm"
#property show_inputs

#import "kernel32.dll"

#define GENERIC_READ	0x80000000
#define GENERIC_WRITE	0x40000000
#define FILE_SHARE_READ			0x00000001
#define FILE_SHARE_WRITE		0x00000002
#define FILE_SHARE_DELETE		0x00000004
#define CREATE_NEW	1
#define CREATE_ALWAYS	2
#define OPEN_EXISTING	3
#define OPEN_ALWAYS	4
#define INVALID_HANDLE -1

int CreateFileA(
      string   FileName,
      int      DesiredAccess,
      int      dwShareMode,
      int      lpSecurityAttributes,
      int      dwCreationDistribution,
      int      dwFlagsAndAttributes,
      int      hTemplateFile
);   
                    
bool WriteFile(
      int      hFile,
      string   Buffer,
      int      nNumberOfBytesToWrite,
      int&     lpNumberOfBytesWritten[],
      int      lpOverlapped
);         
   
bool CloseHandle(
      int   hObject
);
                    
#import

extern string FileName = "D:\\WriteFileUsingWinAPI.txt";

int start()
  {
    int hFile = CreateFileA(FileName,GENERIC_WRITE,FILE_SHARE_READ,0,CREATE_ALWAYS,0,0);    
    if(hFile!=INVALID_HANDLE)
    {
      Print("File created.");
      int BytesWritten[1];
      BytesWritten[0]=0;
      string Buffer="Testing write outside MT4 directory\r\nSecond Line\r\nThird Line";
      int FileLength = StringLen(Buffer);      
      WriteFile(hFile,Buffer,FileLength,BytesWritten,0);
      if(FileLength==BytesWritten[0]) 
        Print("File written successfully.");
      else
        Print("Write Failed");
      CloseHandle(hFile);
    }
    else
      Print("Create File Failed",hFile);
    return(0);
  }
//+------------------------------------------------------------------+