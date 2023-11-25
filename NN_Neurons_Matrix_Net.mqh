//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property  strict
//#include "NetComplex.mqh"
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix\NN_Neurons_Matrix_Layer.mqh>
//+------------------------------------------------------------------+
//|   Link instances to form a fully connected neural network        |
//+------------------------------------------------------------------+
class NN_Neurons_Matrix_CNet: public CObject_MQL4
{
private:
          double                        m_error ;//every element has own error
          NN_Neurons_Matrix_CLayer      m_layers[];
          bool                          errorFlag;
          double                        m_recentAverageError;
          static double                 m_recentAverageSmoothingFactor;  ////--- average our error over this number of training samples
public:   //Create the network with the given configuration
          NN_Neurons_Matrix_CNet(const CArrayInt_MQL4 &f_topology, const NN_Neurons_Matrix_ActFunctions hidden = NNNM_TanH, const NN_Neurons_Matrix_ActFunctions output = NNNM_TanH,
                                 double fBias = 1.0, double LearningRate = 0.15, double Momentom = 0.5, double RASF = 100);
          NN_Neurons_Matrix_CNet()      {};
          ~NN_Neurons_Matrix_CNet()     {}
          bool                          IsEmptyFile;
          //---
          //---
          virtual void     feedForward_Net(const CArrayDouble_MQL4 &inputVals, string s);
          virtual void     backProp_Net(const CArrayDouble_MQL4 &targetVal);
          virtual void     getResults(CArrayDouble_MQL4 &resultVals) const;
          //getter method of a private variable value
          virtual double   getRecentAverageError(void) { if(errorFlag)return 0.0; return m_recentAverageError; }
          //--- visibe network topology
          int              m_topology[];
          //--- methods for working with files
          bool             Save(int &file_handle);
          bool             Load(int &file_handle, CArrayInt_MQL4 &fTopology);
          //---
          template <typename custom> //Shut down the network when required
          custom           shutDown(custom exit_code, string msg = NULL) { Print(msg, ". Shutting down...");  errorFlag = true;  ArrayFree(m_layers);  ArrayFree(m_topology);  return exit_code; }
          //

};
double NN_Neurons_Matrix_CNet::m_recentAverageSmoothingFactor = 100.0;
//+------------------------------------------------------------------+
//|                                                                  | /*&& !IsStopped()*/
//+------------------------------------------------------------------+
NN_Neurons_Matrix_CNet::NN_Neurons_Matrix_CNet(const CArrayInt_MQL4 &f_topology,
                    const NN_Neurons_Matrix_ActFunctions hidden = NNNM_TanH, const NN_Neurons_Matrix_ActFunctions output = NNNM_TanH,
                    double fBias = 1.0, double LearningRate = 0.15, double Momentom = 0.5, double RASF = 100)
{         //-----set m_topology for save
          ArrayFree(m_topology);
          ArrayResize(m_topology, f_topology.Total());
          for(int i = 0; i < f_topology.Total(); i++) {m_topology[i] = f_topology.At(i);}
          //------------
          errorFlag = false;
          m_recentAverageSmoothingFactor = RASF;
          uint numLayers = f_topology.Total();
          //--- create layers
          ArrayFree(m_layers);
          ArrayResize(m_layers, numLayers); //Print("NN_Neurons_Matrix_CNet numLayers: ", numLayers,"  ArraySize(m_layers): ",ArraySize(m_layers));
          for(uint layerNum = 0; layerNum < numLayers && !IsStopped(); ++layerNum)
          {         uint numOutputs = (layerNum == f_topology.Total() - 1) ? 0 : f_topology.At(layerNum + 1);/*the outputs neuron */
                    //--- shorten layer pointer
                    NN_Neurons_Matrix_CLayer *layer = GetPointer(m_layers[layerNum]);
                    //--- set type of activation function
                    if(layerNum != numLayers - 1) layer.setActivation(hidden);
                    else layer.setActivation(output);
                    //--- create neurons and give them layer activation functions
                    for(int neuronNum = 0; neuronNum <= f_topology.At(layerNum) && !IsStopped(); ++neuronNum)//neuronNum (<=) f_topology.At(layerNum) = mean bias
                    {         NN_Neurons_Matrix_CNeuron *neuron = new NN_Neurons_Matrix_CNeuron(numOutputs, neuronNum, layer.getActivation(), LearningRate, Momentom);// make 40% more learn in midle layers!
                              if(neuron == NULL) { shutDown("Neuron creation error"); break; }
                              layer.Add(neuron); 
                              //Print("layerNum:",(string)layerNum,"   neuronNum:",(string)neuronNum," ___  neuronNum:",(string)neuronNum,":  f_topology.At(layerNum):",(string)f_topology.At(layerNum));
                              if(neuronNum == f_topology.At(layerNum))neuron.setNodeVal(fBias); //??1.0  //31==31
                    }//
          }//
}
//+------------------------------------------------------------------+
//|        collect predicted results from output nodes               |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_CNet::getResults(CArrayDouble_MQL4 & resultVals)const
{         if(errorFlag) return;
          resultVals.Clear();
          NN_Neurons_Matrix_CLayer *lastLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          for(int n = 0; n < lastLayer.Total() - 1 && !IsStopped(); ++n)//>>-1 is bias
          {         NN_Neurons_Matrix_CNeuron *neuron = lastLayer.At(n);
                    resultVals.Add(neuron.getNodeVal()); //
          } //
}
//+------------------------------------------------------------------+
//|        propagate forward to get a prediction                     |&& !IsStopped()
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_CNet::feedForward_Net(const CArrayDouble_MQL4 & inputVals, string s)
{         if(errorFlag)return;
          //---
          NN_Neurons_Matrix_CLayer *inputLayer = GetPointer(m_layers[0]);
          if(inputVals.Total() != inputLayer.Total() - 1)
          {         shutDown(0, s + " Invalid pointer feedForward_Net" +
                             "  <inputVals.Total():inputLayer.Total() - 1>" + (string)inputVals.Total() + ":" + (string)(inputLayer.Total() - 1) + "  "); Sleep(1000); return; }
          //---Set inp Neurons val from inputs val
          for(int i = 0; i < inputVals.Total() && !IsStopped(); ++i) { NN_Neurons_Matrix_CNeuron *neuron = inputLayer.At(i); neuron.setNodeVal(inputVals.At(i)); }
          //---
          for(int layerNum = 1; layerNum < ArraySize(m_layers) && !IsStopped(); ++layerNum)
          {         NN_Neurons_Matrix_CLayer *layer     = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    //---
                    for(int n = 0; n < layer.Total() - 1 && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *neuron = layer.At(n); neuron.feedForward_Neuron(prevLayer);//
                    }//
          }//
}
//+------------------------------------------------------------------+
//|        propagate backwards to make the network learn             |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_CNet::backProp_Net(const CArrayDouble_MQL4 & targetVal)
{         if(errorFlag)return;
          //---
          NN_Neurons_Matrix_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          m_error = 0.0;
          for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n)
          {         const NN_Neurons_Matrix_CNeuron *neuron = outputLayer.At(n);
                    double delta = targetVal.At(n) - neuron.getNodeVal();               m_error += delta * delta; // for all error in layer
          }
          //--- calculate our RMS (m_recentAverageError)
          m_error /= outputLayer.Total() - 1; //one neuron erors mean
          m_error = sqrt(m_error);
          m_recentAverageError = (m_recentAverageError * m_recentAverageSmoothingFactor + m_error) / (m_recentAverageSmoothingFactor + 1.0);
          //**********************************************************************************************************************************
          //--- make output neurons calculate their output gradients
          for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n)
          {         NN_Neurons_Matrix_CNeuron *neuron = outputLayer.At(n); neuron.calcOutputGradients(targetVal.At(n)); }
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2; layerNum > 0 && !IsStopped(); --layerNum)
          {         NN_Neurons_Matrix_CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
                    //---
                    for(int n = 0; n < hiddenLayer.Total() && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *neuron = hiddenLayer.At(n); neuron.calcHiddenGradients(nextLayer); } //
          }
          //--- make neurons update connections feeding to them
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 0 && !IsStopped(); --layerNum)
          {         NN_Neurons_Matrix_CLayer *layer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    //---
                    for(int n = 0; n < layer.Total() - 1 /* its bias */ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *neuron = layer.At(n); neuron.updateInputWeights(prevLayer,m_recentAverageError);}//
                    //----Update bias node value no needed//updated by previuslayer inside neuron!
          }//
}

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|        Save the network for future use                           |
//+------------------------------------------------------------------+
bool NN_Neurons_Matrix_CNet::Save(int &file_handle)
{         if(!IsStopped())
          {         //Print("*** NN_Neurons_Matrix_CNet::Save **");
                    if(file_handle == INVALID_HANDLE) {FileClose(file_handle); Print("NN_Neurons_Matrix_CNet::Save INVALID_HANDLE"); return false;}
                    //---
                    if(0)
                    {         uchar SartSaveFlag[];
                              StringToCharArray("Saving Started!", SartSaveFlag);
                              if(FileWriteArray(file_handle, SartSaveFlag) <= 0) {FileClose(file_handle); Print("Error: StartPartial save");}//
                    }
                    //---
                    if(FileWriteArray(file_handle, m_topology) <= 0) {FileClose(file_handle); shutDown(false, "m_topology FileWriteArray  Error saving network");}
                    //---
                    for(int i = 0; i < ArraySize(m_layers); i++)m_layers[i].Save(file_handle);
                    //---
                    uchar successFlag[];
                    StringToCharArray("Saved successfully!", successFlag);
                    //---
                    if(FileWriteArray(file_handle, successFlag) <= 0) {FileClose(file_handle); Print("Error: EndPartial save");}
                    //---
          }//
          FileClose(file_handle);
          //---
          return true; //
}
//+------------------------------------------------------------------+
//|        Load the network from a file                              |
//+------------------------------------------------------------------+
bool NN_Neurons_Matrix_CNet::Load(int &file_handle, CArrayInt_MQL4 &fTopology)
{         //Print("*** NN_Neurons_Matrix_CNet::Load **");
          if(file_handle == INVALID_HANDLE) {Print("NN_Neurons_Matrix_CNet::Load INVALID_HANDLE"); return false;}
          if(FileSize(file_handle) == 0)    { IsEmptyFile = 0; Print("NN_Neurons_Matrix_CNet::Load FILE_EMPTY"); return false;}
          else                              { IsEmptyFile = 1; }
          if(0)
          {         uchar ExistFlag[];
                    if(FileReadArray(file_handle, ExistFlag) > 0)
                              if(CharArrayToString(ExistFlag) == "Saving Started!") {/*Print("Network loaded successfully.");*/}
                              else
                              {         Print("Network loaded unsuccessfully(Emptyfile). delete file..");
                                        //FileClose(file_handle); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin");
                                        return shutDown(false, "Load network error");//
                              }//
          }
          //Print("*** NN_Neurons_Matrix_CNet::Load >>FileReadArray**");
          ArrayFree(m_topology);
          ArrayResize(m_topology, fTopology.Total());
          ResetLastError();
          if(FileReadArray(file_handle, m_topology, 0, fTopology.Total()) <= 0)///big error reaf file......when reding if not define how much array element need to read then extradeading... erroring
          {         Print("_LastError: ", ErrorDescription(_LastError), "  ", _LastError); //
                    //FileClose(file_handle);FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin");
                    return shutDown(false, "Error loading network configuration"); }
          //---
          errorFlag = false;
          uint numLayersSave = ArraySize(m_topology);
          //--- create layers
          ArrayFree(m_layers);
          ArrayResize(m_layers, numLayersSave);
          //structure building
          if(1)
                    for(uint layerNumSave = 0; layerNumSave < numLayersSave && !IsStopped(); ++layerNumSave)
                    {         //Print("*** NN_Neurons_Matrix_CNet::Load>> for layerNumSave **", "  layerNumSave:", layerNumSave); Sleep(0);
                              uint numOutputs = (layerNumSave == numLayersSave - 1) ? 0 : m_topology[layerNumSave + 1];
                              //--- shorten layer pointer
                              NN_Neurons_Matrix_CLayer *layer = GetPointer(m_layers[layerNumSave]);
                              //--- create neurons and give them layer activation functions
                              for(int neuronNumSave = 0; neuronNumSave <= m_topology[layerNumSave] && !IsStopped(); ++neuronNumSave)
                              {         if(m_topology[layerNumSave] != fTopology.At(layerNumSave))
                                        {         FileClose(file_handle); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin");
                                                  Print("Network loaded unsuccessfully. Topology Not Same with loaded"); return false;//
                                        }
                                        //Print("*** NN_Neurons_Matrix_CNet::Load>> for neuronNumSave >>**", "  layerNumSave:", layerNumSave, "  neuronNumSave:", neuronNumSave); Sleep(0);
                                        NN_Neurons_Matrix_CNeuron *neuron = new NN_Neurons_Matrix_CNeuron(numOutputs, neuronNumSave);//at load neuron activefunc is default
                                        if(neuron == NULL) { shutDown("Neuron creation error"); break; }
                                        //--- store pointer to neuron
                                        layer.Add(neuron);
                                        //--- [bias neuron] value!!!!!!!!ok bias detected
                                        if(neuronNumSave == m_topology[layerNumSave]) neuron.setNodeVal(1.0);//
                              }//
                    }
          //---
          //---
          //Print("*** NN_Neurons_Matrix_CNet::Load>> m_layers[i].Load **");
          for(int i = 0; i < ArraySize(m_layers); i++) m_layers[i].Load(file_handle);
          //---
          //Print("*** NN_Neurons_Matrix_CNet::Load>> FileReadArray successFlag **");
          uchar successFlag[];
          if(FileReadArray(file_handle, successFlag) > 0)
                    if(CharArrayToString(successFlag) == "Saved successfully!") Print("Network loaded successfully.");
                    else
                    {         Print("Network loaded unsuccessfully(NotFull). delete file..");
                              //FileClose(file_handle); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin");
                              return shutDown(false, "Load network error"); //
                    }
          //---
          FileClose(file_handle);
          return true;//
}
//+------------------------------------------------------------------+
