//+------------------------------------------------------------------+
//|                                                   MyTreeNode.mq5 |
//|                        Copyright 2010, MetaQuotes Software Corp. |
//|                                       https://www.metaquotes.net/|
//+------------------------------------------------------------------+
#property copyright "2010, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode.mqh>
//+------------------------------------------------------------------+
//| Describe CDSTreeNode_ExtendNode class derived from CDSTreeNode.         |
//+------------------------------------------------------------------+
//| Class CDSTreeNode_ExtendNode.                                    |
//| Purpose: Class of element of a binary tree.                      |
//|             Descendant of class CDSTreeNode.                     |
//+------------------------------------------------------------------+  Tree(save)__>CDSTreeNode_ExtendNode(SaveNode)(driven with self obj)(always have how saveing loading)__>CDSTreeNode_ExtendNode(Save)
class CDSTreeNode_ExtendNode : public CDSTreeNode
{
protected:
          //--- user's data
          long              m_long;            // key field of long type
          double            m_double;          // custom variable of double type
          string            m_string;          // custom variable of string type
          datetime          m_datetime;        // custom variable of datetime type

public:
          CDSTreeNode_ExtendNode();
          //--- methods of accessing user's data
          long              GetLong(void)                { return(m_long); }
          void              SetLong(long value)          { m_long = value;  }
          double            GetDouble(void)              { return(m_double); }
          void              SetDouble(double value)      { m_double = value;  }
          string            GetString(void)              { return(m_string); }
          void              SetString(string value)      { m_string = value;  }
          datetime          GetDateTime(void)            { return(m_datetime); }
          void              SetDateTime(datetime value)  { m_datetime = value;  }
          //--- methods for working with files
          virtual bool      Save(const int file_handle);
          virtual bool      Load(const int file_handle);
protected:
          virtual int       Compare(const CDSObject *node, int mode);
          //--- method of creating class instances
          virtual CDSTreeNode* CreateSample();//
};
//+------------------------------------------------------------------+
//| CDSTreeNode_ExtendNode class constructor.                                   |
//| INPUT:  none.                                                    |
//| OUTPUT: none.                                                    |
//| REMARK: none.                                                    |
//+------------------------------------------------------------------+
void CDSTreeNode_ExtendNode::CDSTreeNode_ExtendNode()
{         //--- initialization of user's data
          m_long        = 0;
          m_double      = 0.0;
          m_string      = "";
          m_datetime    = 0;//
}
//+------------------------------------------------------------------+
//| Comparison with another tree node by the specified algorithm.    |
//| INPUT:  node - tree element to compare,                          |
//|         mode - identifier of comparison algorithm.               |
//| OUTPUT: result of comparison (>0,0,<0).                          |
//| REMARK: none.                                                    |
//+------------------------------------------------------------------+
int CDSTreeNode_ExtendNode::Compare(const CDSObject *node, int mode)
{         //--- mode parameter is ignored, because tree construction algorithm is the only one
          int res = 0;
          //--- explicit type casting
          const CDSTreeNode_ExtendNode *n = node;
          res = (int)(m_long - n.m_long);
          //---
          return(res); //
}
//+------------------------------------------------------------------+
//| Creation of a new class instance.                                |
//| INPUT:  none.                                                    |
//| OUTPUT: pointer to a new instance of CDSTreeNode_ExtendNode class.          |
//| REMARK: none.                                                    |
//+------------------------------------------------------------------+
CDSTreeNode* CDSTreeNode_ExtendNode::CreateSample()
{         CDSTreeNode_ExtendNode *result = new CDSTreeNode_ExtendNode;
          //---
          return(result); //
}
//+------------------------------------------------------------------+
//| Write tree node data to a file.                                  |
//| INPUT:  file_handle -handle of a file pre-opened for writing.    |
//| OUTPUT: true if OK, otherwise false.                             |
//| REMARK: none.                                                    ||FILE_BIN must defined
//+------------------------------------------------------------------+
bool CDSTreeNode_ExtendNode::Save(const int file_handle)//----its act \where its place is defined///
{         uint i = 0, len;
          //--- checks
          if(file_handle < 0) return(false);
          //--- writing user data
          //--- writing custom variable of long type
          if( FileWriteLong(file_handle, m_long) != sizeof(long))             { Print("FileWriteLong m_long :"); return(false);}
          //--- writing custom variable of double type
          if(FileWriteDouble(file_handle, m_double) != sizeof(double))       { Print("FileWriteDouble m_double"); return(false);}
          //--- writing custom variable of string type
          len = StringLen(m_string);
          //--- write string length
          if(FileWriteInteger(file_handle, len, INT_VALUE) != INT_VALUE)     { Print("FileWriteInteger len"); return(false);}
          //--- write the string
          if(len != 0 && FileWriteString(file_handle, m_string, len) != len) { Print("FileWriteString m_string"); return(false);}
          //--- writing custom variable of datetime type
          if(FileWriteLong(file_handle, m_datetime) != sizeof(long))         { Print("FileWriteLong m_datetime"); return(false);}
          //---
          return(true);//
}
//+------------------------------------------------------------------+
//| Read tree node data from a file.                                 |
//| INPUT:  file_handle -handle of a file pre-opened for reading.    |
//| OUTPUT: true if OK, otherwise false.                             |
//| REMARK: none.                                                    |
//+------------------------------------------------------------------+
bool CDSTreeNode_ExtendNode::Load(const int file_handle)
{         uint i = 0, len;
          //--- checks
          if(file_handle < 0) return(false);
          //--- reading
          if(FileIsEnding(file_handle)) return(false);
          //--- reading custom variable of char type
          //--- reading custom variable of long type
          m_long = FileReadLong(file_handle);
          //--- reading custom variable of double type
          m_double = FileReadDouble(file_handle);
          //--- reading custom variable of string type
          //--- read the string length
          len = FileReadInteger(file_handle, INT_VALUE);
          //--- read the string
          if(len != 0) m_string = FileReadString(file_handle, len);
          else       m_string = "";
          //--- reading custom variable of datetime type
          m_datetime = (datetime)FileReadLong(file_handle);
          //---
          return(true);//
}
//+------------------------------------------------------------------+
