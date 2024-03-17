//+------------------------------------------------------------------+
//|                                                     TreeNodeGeneric.mqh |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql4.com |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Object.mqh>
//+------------------------------------------------------------------+
//| Class CDSTreeNode_Generic.                                            |
//| Purpose: Base class of node of binary tree CTree.                |
//|          Derives from class CObject_MQL4.                        |
//+------------------------------------------------------------------+
template<typename T>
class CDSTreeNode_Generic : public CDSObject
{
private:
          T        *m_p_node;             // link to node up
          T        *m_l_node;             // link to node left
          T        *m_r_node;             // link to node right
          //--- variables
          int               m_balance;            // balance of node
          int               m_l_balance;          // balance of the left branch
          int               m_r_balance;          // balance of the right branch

public:
          CDSTreeNode_Generic(void);
          ~CDSTreeNode_Generic(void);
          //--- methods of access to protected data
          T*                    Parent(void)           const { return(m_p_node);    }
          void                  Parent(T *node)      { m_p_node = node;       }
          T*                    Left(void)             const { return(m_l_node);    }
          void                  Left(T *node)        { m_l_node = node;       }
          T*                    Right(void)            const { return(m_r_node);    }
          void                  Right(T *node)       { m_r_node = node;       }
          int               Balance(void)          const { return(m_balance);   }
          int               BalanceL(void)         const { return(m_l_balance); }
          int               BalanceR(void)         const { return(m_r_balance); }
          //--- method of identifying the object
          virtual int       Type(void) const { return(0x8888); }
          //--- methods for controlling
          int               RefreshBalance(void);
          T                 *GetNext(const T *node);
          //--- methods for working with files
          bool              SaveNode(const int file_handle);
          bool              LoadNode(const int file_handle, T *main);

protected:
          //--- method for creating an instance of class
          virtual T *CreateSample(void) { return(NULL); }///beacse of virtual... must set by drived class
};
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
template<typename T>
CDSTreeNode_Generic::CDSTreeNode_Generic(void) : m_p_node(NULL), m_l_node(NULL), m_r_node(NULL), m_balance(0), m_l_balance(0),   m_r_balance(0)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
template<typename T>
CDSTreeNode_Generic::~CDSTreeNode_Generic(void)
{         //--- delete nodes of the next level
          if(m_l_node != NULL)    delete m_l_node;
          if(m_r_node != NULL)    delete m_r_node;//
}
//+------------------------------------------------------------------+
//| Calculating the balance of the node                              |
//+------------------------------------------------------------------+
template<typename T>
int CDSTreeNode_Generic::RefreshBalance(void)
{         //--- calculate the balance of the left branch
          if(m_l_node == NULL)  m_l_balance = 0;
          else                  m_l_balance = m_l_node.RefreshBalance();
          //--- calculate the balance of the right branch
          if(m_r_node == NULL)  m_r_balance = 0;
          else                  m_r_balance = m_r_node.RefreshBalance();
          //--- calculate the balance of the node
          if(m_r_balance > m_l_balance)   m_balance = m_r_balance + 1;
          else                            m_balance = m_l_balance + 1;
          //--- result
          return(m_balance); //
}
//+------------------------------------------------------------------+
//| Selecting next node                                              |
//+------------------------------------------------------------------+
template<typename T>
T *CDSTreeNode_Generic::GetNext(const T *node)
{         if(Compare(node) > 0) //---return false mean always select m_r_node Compare is virtual
                    return(m_l_node);
          //--- result
          return(m_r_node); //
}
//+------------------------------------------------------------------+
//| Writing node data to file                                        |
//+------------------------------------------------------------------+
template<typename T>
bool CDSTreeNode_Generic::SaveNode(const int file_handle)
{         bool result = true;
          //--- check
          if(file_handle == INVALID_HANDLE)    return(false);
          //--- write left node (if it is available)
          if(m_l_node != NULL)
          {         FileWriteInteger(file_handle, 'L', SHORT_VALUE);
                    result &= m_l_node.SaveNode(file_handle); }
          else
                    FileWriteInteger(file_handle, 'X', SHORT_VALUE);
          //--- write data of current node
          result &= Save(file_handle);
          //--- write right node (if it is available)
          if(m_r_node != NULL)
          {         FileWriteInteger(file_handle, 'R', SHORT_VALUE);
                    result &= m_r_node.SaveNode(file_handle); }
          else
                    FileWriteInteger(file_handle, 'X', SHORT_VALUE);
          //--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Reading node data from file                                      |
//+------------------------------------------------------------------+
template<typename T>
bool CDSTreeNode_Generic::LoadNode(const int file_handle, T *main)
{         bool       result = true;
          short      s_val;
          T *node;
          //--- check
          if(file_handle == INVALID_HANDLE)  return(false);
          //--- read directions
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE);
          if(s_val == 'L')
          {         //--- read left node (if there is data)
                    node = CreateSample();
                    if(node == NULL)   return(false);
                    m_l_node = node;
                    node.Parent(main);
                    result &= node.LoadNode(file_handle, node); //--returning bool bitwise
          }
          //--- read data of current node
          result &= Load(file_handle);
          //--- read directions
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE);
          if(s_val == 'R')
          {         //--- read right node (if there is data)
                    node = CreateSample();
                    if(node == NULL)     return(false);
                    m_r_node = node;
                    node.Parent(main);
                    result &= node.LoadNode(file_handle, node); }
          //--- result
          return(result);//
}
//+------------------------------------------------------------------+
