//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Tree.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_Decition.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+protected
template<typename t,typename t2>
class CDSTree_decition: public CDSTree
{
protected:
          CDSTreeNode_decition<t,t2>        *m_root_node_decition;        // root node of the tree
          bool                  resultValue;
public:
          CDSTree_decition(void): m_root_node_decition(NULL) { Comt=sizeof(t); Comt2=sizeof(t2);};
          CDSTree_decition(t T1,t2 T2): m_root_node_decition(NULL) { Comt=T1; Comt2=T2;};
          
          ~ CDSTree_decition(void) {Clear();}; //
          //------------------------------------------------
          bool  Is_Trade_tBuy_fSell;
          t  Comt;
          t2 Comt2;
          //------------------------------------------------
          void Clear(void) /* Method of cleaning the tree*/
          {         if(CheckPointer(m_root_node_decition) == POINTER_DYNAMIC) delete m_root_node_decition;
                    m_root_node_decition = NULL;//
          }
          //+------------------------------------------------------------------+
          //| Method of adding a node to the tree                              |
          //+------------------------------------------------------------------+
          CDSTreeNode_decition<t,t2>  * Insert(CDSTreeNode_decition<t,t2> *ptr_new_node)/*insert node to tree*/
          {         if(false)
                    {         CDSTreeNode_decition<t,t2> *ptr_p_node;
                              CDSTreeNode_decition<t,t2> *ptr_result = m_root_node_decition;
                              if(!CheckPointer(ptr_new_node))return(NULL);    //--- check
                              if(ptr_result != NULL)                          //--- add if root node not null else newnode is root
                              {         ptr_p_node = NULL;
                                        ptr_result = m_root_node_decition;
                                        while(ptr_result != NULL && ptr_result.Compare(ptr_new_node) != 0) { ptr_p_node = ptr_result; ptr_result = ptr_result.GetNext(ptr_new_node); }////!!!!!!!! what?
                                        if(ptr_result != NULL) return(ptr_result);
                                        if(ptr_p_node.Compare(ptr_new_node) > 0) ptr_p_node.Left(ptr_new_node);
                                        else                             ptr_p_node.Right(ptr_new_node);
                                        ptr_new_node.Parent(ptr_p_node);
                                        Balance(ptr_p_node); //
                              }
                              else {m_root_node_decition = ptr_new_node;}
                              return(ptr_result);////--- ptr_result
                    }//--------------------------------------------------------
                    //--if else branching
                    //if(sizeof(ptr_new_node.Value) == bool)
                    {         //
                              CDSTreeNode_decition<t,t2> *ptr_p_node;
                              CDSTreeNode_decition<t,t2> *ptr_result = m_root_node_decition;
                              if(!CheckPointer(ptr_new_node))return(NULL);    //--- check
                              if(ptr_result != NULL)
                              {         /*branching if else enums*/
                                        ptr_p_node = NULL;
                                        ptr_result = m_root_node_decition;
                                        //
                                        while(ptr_result != NULL && ptr_result.Compare(ptr_new_node) != 0) { ptr_p_node = ptr_result; ptr_result = ptr_result.GetNext(ptr_new_node); }////!!!!!!!! what?
                                        if(ptr_result != NULL) return(ptr_result);
                                        //
                                        if(true) //--set before
                                        {         if(ptr_p_node.Compare(ptr_new_node) > 0) ptr_p_node.Left(ptr_new_node);  //--ptr_new_node.Value
                                                  else if(false)                   ptr_p_node.Left2(ptr_new_node);//
                                                  else if(false)                   ptr_p_node.Left3(ptr_new_node);//
                                                  else if(false)                   ptr_p_node.Left4(ptr_new_node);//
                                                  else if(false)                   ptr_p_node.Right(ptr_new_node);//
                                                  else if(false)                   ptr_p_node.Right2(ptr_new_node);//
                                                  else if(false)                   ptr_p_node.Right3(ptr_new_node);//
                                                  else if(false)                   ptr_p_node.Right4(ptr_new_node);//
                                        }
                                        ptr_new_node.Parent(ptr_p_node);//
                              }
                              else {m_root_node_decition = ptr_new_node;}
                              return(ptr_result);////--- ptr_result
                              //
                    }//
          } //
          string Define_Signal()
          {         Is_Trade_tBuy_fSell = Calc_Signal_decition();
                    if(Is_Trade_tBuy_fSell) {return "buy";}
                    else {return "sell";}//
                    return "waite";// never run
                    //
          }
          bool Calc_Signal_decition()
          {
                    {         //Action to calc TRACE BOOL STATE FROM ROOT
                              if(m_root_node_decition.ID < 0)return false;//;
                              {         m_root_node_decition.ID--;
                                         Alert("m_root_node_decition.ID:",m_root_node_decition.ID);
                                        if(!CheckPointer(m_root_node_decition)) return(false); //--when is delete or null    
                                        resultValue = (m_root_node_decition.Left().Value);//m_root_node_decition.Left().Left().Value
                                        //
                                        if(m_root_node_decition.Left().Value)        {resultValue = true;}
                                        else if(m_root_node_decition.Right().Value)  {resultValue = true;}
                                        else                                         {resultValue = false;}
                                        //
                                      
                                        //---if(resultValue)Calc_Signal_decition();// no need yet
                                        return(resultValue); //
                              }
                              return true;//
                    }
                    //
                    return false;//
          }
          //----
};
//+------------------------------------------------------------------+
