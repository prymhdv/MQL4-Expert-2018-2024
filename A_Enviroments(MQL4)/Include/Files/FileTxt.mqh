//+------------------------------------------------------------------+
//|                                                      FileTxt.mqh |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql4.com |
//+------------------------------------------------------------------+
#include "File.mqh"
//+------------------------------------------------------------------+
//| Class CFileTxt                                                   |
//| Purpose: Class of operations with text files.                    |
//|          Derives from class CFile.                               |
//+------------------------------------------------------------------+
class CFileTxt : public CFile
{
public:
          CFileTxt(void) {};
          ~CFileTxt(void) {};
          //--- methods for working with files
          int               Open(const string file_name, const int open_flags) {         return(CFile::Open(file_name, open_flags | FILE_TXT)); } //Open the text file
          //--- methods to access data
          uint              WriteString(const string value) //Writing string to file
          {         /*//--- check handle */
                    if(m_handle != INVALID_HANDLE) return(FileWriteString(m_handle, value));
                    return(0);//--- failure
          }
          string            ReadString(void)  //| Reading string from file
          {         if(m_handle != INVALID_HANDLE) return(FileReadString(m_handle));
                    return(""); //
          } };

//+------------------------------------------------------------------+
