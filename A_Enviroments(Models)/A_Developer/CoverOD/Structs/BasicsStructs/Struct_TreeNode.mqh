//+------------------------------------------------------------------+
//|                                             TreeNodeAdvanced.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|                                                     TreeNode.mqh |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql4.com |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Object.mqh>
//+------------------------------------------------------------------+
//| Class CDSTreeNode.                                                 |
//| Purpose: Base class of node of binary tree CTree.                |
//|          Derives from class CDSObject.                             |
//+------------------------------------------------------------------+prolog
class CDSTreeNode : public CDSObject
{
private:
          CDSTreeNode        *m_p_node;             // link to node up
          CDSTreeNode        *m_l_node;             // link to node left
          CDSTreeNode        *m_r_node;             // link to node right
          //--- variables
          int               m_balance;            // balance of node
          int               m_l_balance;          // balance of the left branch
          int               m_r_balance;          // balance of the right branch

public:
          CDSTreeNode(void) : m_p_node(NULL), m_l_node(NULL), m_r_node(NULL), m_balance(0), m_l_balance(0), m_r_balance(0) {};
          ~CDSTreeNode(void)
          {         /* delete nodes of the next level*/
                    if(m_l_node != NULL) delete m_l_node;
                    if(m_r_node != NULL) delete m_r_node;//
          };
          //--- methods of access to protected data
          CDSTreeNode*                    Parent(void)                          const   { return(m_p_node); }
          void                            Parent(CDSTreeNode *node)           { m_p_node = node; }
          CDSTreeNode*                    Left(void)                            const   { return(m_l_node); }
          void                            Left(CDSTreeNode *node)             { m_l_node = node; }
          CDSTreeNode*                    Right(void)                           const   { return(m_r_node); }
          void                            Right(CDSTreeNode *node)            { m_r_node = node; }
          int                             Balance(void)                         const   { return(m_balance);   }
          int                             BalanceL(void)                        const   { return(m_l_balance); }
          int                             BalanceR(void)                        const   { return(m_r_balance); }
          //--- method of identifying the object
          virtual int                     Type(void) const { return(0x8888); }
          //--- methods for controlling
          int                             RefreshBalance(void);
          //------------------------------------------------------------Selecting next node
          CDSTreeNode                    *GetNext(const CDSTreeNode *node) 
          {         if(Compare(node) > 0)return(m_l_node);
                    /* result*/   return(m_r_node); //
          }
          //------------------------------------------------------------
          //--- methods for working with files
          bool                            SaveNode(const int file_handle);
          bool                            LoadNode(const int file_handle, CDSTreeNode *main);

protected:
          //--- method for creating an instance of class
          virtual CDSTreeNode *CreateSample(void) { return(NULL); }//
};
//+------------------------------------------------------------------+
//| Calculating the balance of the node                              |
//+------------------------------------------------------------------+
int CDSTreeNode::RefreshBalance(void)
{         //--- calculate the balance of the left branch
          if(m_l_node == NULL)  m_l_balance = 0;
          else                  m_l_balance = m_l_node.RefreshBalance();
          //--- calculate the balance of the right branch
          if(m_r_node == NULL)  m_r_balance = 0;
          else                  m_r_balance = m_r_node.RefreshBalance();
          //--- calculate the balance of the node
          if(m_r_balance > m_l_balance) m_balance = m_r_balance + 1;
          else                          m_balance = m_l_balance + 1;
          //--- result
          return(m_balance); //
}
//+------------------------------------------------------------------+
//| Writing node data to file                                        |
//+------------------------------------------------------------------+
bool CDSTreeNode::SaveNode(const int file_handle)  //---this is for defining where to save
{         bool result = true;
          //--- check
          if(file_handle == INVALID_HANDLE) return(false);
          //--- write left node (if it is available)
          if(m_l_node != NULL)
          {         FileWriteInteger(file_handle, 'L', SHORT_VALUE);
                    result &= m_l_node.SaveNode(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          //------------------------------------------------------------inorder save
          //--- write data of current node
          result &= Save(file_handle);//--------------------------------------------------is virtual mean drived last class save load act//---this fuction is run from last driven function object....!!!!!
          //------------------------------------------------------------
          //--- write right node (if it is available)
          if(m_r_node != NULL)
          {         FileWriteInteger(file_handle, 'R', SHORT_VALUE);
                    result &= m_r_node.SaveNode(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);
          //--- successful
          return(true); //
}
//+------------------------------------------------------------------+
//| Reading node data from file                                      |
//+------------------------------------------------------------------+
bool CDSTreeNode::LoadNode(const int file_handle, CDSTreeNode *main)
{         bool       result = true;
          short      s_val;
          CDSTreeNode *node;
          //--- check
          if(file_handle == INVALID_HANDLE) return(false);
          //--- read directions----------------------------------------detect left or right on file
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE);
          if(s_val == 'L')
          {         //--- read left node (if there is data)
                    node = CreateSample();//----------------------------------------------its again run from dived class obj
                    if(node == NULL)  return(false);
                    m_l_node = node;
                    node.Parent(main);
                    result &= node.LoadNode(file_handle, node); //
          }
          //-------------------------------- Inorder load
          //--- read data of current node
          result &= Load(file_handle);
          //--------------------------------
          //--- read directions
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE);
          if(s_val == 'R')
          {         //--- read right node (if there is data)
                    node = CreateSample();
                    if(node == NULL)   return(false);
                    m_r_node = node;
                    node.Parent(main);
                    result &= node.LoadNode(file_handle, node); //
          }
          //--- result
          return(result);//
}
//+------------------------------------------------------------------+
