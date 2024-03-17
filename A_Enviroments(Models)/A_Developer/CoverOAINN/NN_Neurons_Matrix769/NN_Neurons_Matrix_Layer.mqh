//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix769\NN_Neurons_Matrix_Neuron.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|               NEURONS CONTAINER >> CLAYER                        |
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|   Create our Layer definition. Will replace template definitions |
//+------------------------------------------------------------------+
class NN_Neurons_Matrix_CLayer: public CArrayObj_MQL4 //----array of object make layer
{
public:
          uint                                  iOutputs;
          NN_Neurons_Matrix_ActFunctions        activationFunction;
          //---
public:
          //--- working with custom activation functions
          void                                  setActivation(const NN_Neurons_Matrix_ActFunctions func = NNNM_Sigmoid) { activationFunction = func; } //set activation function for this layer
          NN_Neurons_Matrix_ActFunctions        getActivation(void) { return activationFunction; } //get the set activation for this layer


          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          //--- methods for working with files
          virtual void     Save(int &file_handle)  /*initiate saving to a file handle*/
          {         //Print("*** NN_Neurons_Matrix_CLayer::Save **","  m_data_total:",m_data_total);
                    //--- check file_handle
                    if(file_handle == INVALID_HANDLE)  return;
                    //--- check if there is data to store
                    if(m_data_total == 0)     return;
                    //---loop and save
                    for(int i = 0; i < m_data_total; i++)
                    {         NN_Neurons_Matrix_CNeuron *n = m_data[i];  //--as Pointer of Cobject   ///NN_Neurons_Matrix_CNeuron driven from Cobject
                              if(CheckPointer(n) == POINTER_INVALID)  break; //---not maloced pointer
                              //---
                              n.Save(file_handle); //
                    } //
          }
          virtual void     Load(int &file_handle)  /*load data from a file handle */
          {         //Print("*** NN_Neurons_Matrix_CLayer::Load **","  m_data_total:",m_data_total);
                    //--- check handle
                    if(file_handle == INVALID_HANDLE)return;
                    //--- check if neurons are present
                    if(m_data_total == 0) return;
                    //---loop and load
                    for(int i = 0; i < m_data_total; i++)
                    {         NN_Neurons_Matrix_CNeuron *n = m_data[i];
                              if(CheckPointer(n) == POINTER_INVALID)break;
                              n.Load(file_handle); ////_______NEXT LOAD NEURONS______
                    } //
          } //
          ////+------------------------------------------------------------------+
          ////| Access to data in the specified position                         |
          ////+------------------------------------------------------------------+
          //NN_Neurons_Matrix_CLayer *NN_Neurons_Matrix_CLayer::At(const int index) const
          //{         //--- check
          //          if(index < 0 || index >= m_data_total)   return(NULL);
          //          //--- result
          //          return(m_data[index]); //
          //}
          //------------------------------------------
};
//+------------------------------------------------------------------+
