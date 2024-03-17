//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property  strict
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Scaler\NN_Neurons_Scaler_Layer.mqh>
//+------------------------------------------------------------------+
//|   Link instances to form a fully connected neural network        |
//+------------------------------------------------------------------+
class NN_Neurons_Scaler_CNet: public CObject_MQL4
{
private:
          double           m_error[];//every element has own error
          NN_Neurons_Scaler_CLayer *m_layers[];
          bool             errorFlag;
          double           m_recentAverageError;
          static double    m_recentAverageSmoothingFactor2;
          double           m_recentAverageSmoothingFactor;
public:
          NN_Neurons_Scaler_CNet(const CArrayInt_MQL4 &topology, uint inptElements, const NN_Neurons_Scaler_ActFunctions hidden = NNNS_TanH, const NN_Neurons_Scaler_ActFunctions output = NNNS_TanH,
                                 double LearningRate = 0.15, double Momentom = 0.5, double RASF = 100);
          NN_Neurons_Scaler_CNet();
          ~NN_Neurons_Scaler_CNet()
          {         for(int i = 0; i < ArraySize(m_layers); i++)
                    {         if(m_layers[i])  delete m_layers[i]; //
                    };//
          }
          //---
          virtual void     feedForward_NetSingleinput(const CArrayDouble_MQL4 &inputVals[], string FNC, int Lin);
          virtual void     feedForward_Net(const CArrayDouble_MQL4 &inputVals, string FNC, int Lin, int idx); //matrixinput
          virtual void     backProp_Net(const CArrayDouble_MQL4 &targetVal, int idx);
          virtual void     getResults(CArrayDouble_MQL4 &resultVals, uint idx) const;
          virtual double   getRecentAverageError(void);
          //--- visibe network topology
          int              m_topology[];
          //--- methods for working with files
          bool             Save(int &file_handle);
          bool             Load(int &file_handle);
          //---
          template <typename custom>
          custom           shutDown(custom exit_code, string msg = NULL); //
          NN_Neurons_Scaler_CLayer *getLayer(int idx) {return m_layers[idx];}
          //
};
//+------------------------------------------------------------------+
//|       Shut down the network when required                        |
//+------------------------------------------------------------------+
template <typename custom>
custom NN_Neurons_Scaler_CNet::shutDown(custom exit_code, string msg = NULL)
{         Print(msg, ". Shutting down...");
          errorFlag = true;
          //---
          ArrayFree(m_layers);
          ArrayFree(m_topology);
          //---
          return exit_code; //
}

//--- average our error over this number of training samples
//double NN_Neurons_Scaler_CNet::m_recentAverageSmoothingFactor = 100.0;

//+------------------------------------------------------------------+
//|   Create the network with the given configuration                |
//+------------------------------------------------------------------+
NN_Neurons_Scaler_CNet::NN_Neurons_Scaler_CNet()
{         //
}
//+------------------------------------------------------------------+
//|                                                                  | /*&& !IsStopped()*/
//+------------------------------------------------------------------+
NN_Neurons_Scaler_CNet::NN_Neurons_Scaler_CNet(const CArrayInt_MQL4 &topology, uint inptElements, const NN_Neurons_Scaler_ActFunctions hidden = NNNS_TanH, const NN_Neurons_Scaler_ActFunctions output = NNNS_TanH, double LearningRate = 0.15, double Momentom = 0.5, double RASF = 100)
{         errorFlag = false;
          m_recentAverageSmoothingFactor = RASF;
          uint numLayers = topology.Total(); //Print("topology.Total(): ", (string)topology.Total()); // Graph layers
          //--- create layers
          ArrayResize(m_layers, numLayers);
          ArrayResize(m_error, inptElements);
          for(uint i = 0; i < numLayers; i++)
          {         if(!m_layers[i]) m_layers[i] = new NN_Neurons_Scaler_CLayer(); }
          int neuronNum = 0; uint layerNum = 0;
          for( layerNum = 0; layerNum < numLayers /*&& !IsStopped()*/; ++layerNum)//++layerNum++ no effect//--for each layer//layer start num is 0
          {         //Print("topology.Total(): ", (string)topology.Total(), "  !IsStopped():", !IsStopped());
                    uint numOutputs = (layerNum == topology.Total() - 1) ? 0 : topology.At(layerNum + 1);//--->>at the end layer no need out put.. mean it is zero size
                    //--- shorten layer pointer
                    NN_Neurons_Scaler_CLayer *layer = GetPointer(m_layers[layerNum]);//NN_Neurons_Scaler_CLayer x=new
                    //--- set type of activation function
                    if(layerNum != numLayers - 1)       layer.setActivation(hidden);    //---set is hidden or output layer activation func
                    else                                layer.setActivation(output);
                    //--- create neurons and give them layer activation functions
                    //for(neuronNum = 0; neuronNum <= topology.At(layerNum); ++neuronNum)//errorr 2 1 1>>3 2 2
                    for(neuronNum = 0; neuronNum < topology.At(layerNum); ++neuronNum)//++neuronNum
                    {         NN_Neurons_Scaler_CNeuron *neuron = new NN_Neurons_Scaler_CNeuron( inptElements, numOutputs, neuronNum, layer.getActivation(), LearningRate, Momentom);
                              if(neuron == NULL) { shutDown("Neuron creation error"); Print("-> Neuron creation error!"); break; }
                              //---
                              layer.Add(neuron);//-----? why accept upper base type from this neuron
                              //---
                              if(neuronNum == topology.At(layerNum))
                                        for(uint i = 0; i < inptElements; i++)
                                        {         neuron.setNodeVal(i, 1.0); //
                                        }//
                    } //
                    Print("layer:", layerNum, "  Neuron:", neuronNum);
                    //Sleep(2000); } //
                    Print("-> construct network end!");
                    //
          }//
}
//+------------------------------------------------------------------+
//|    getter method of a private variable value                     |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNet::getRecentAverageError(void)
{         if(errorFlag)return 0.0; return m_recentAverageError; }
//+------------------------------------------------------------------+
//|        collect predicted results from output nodes               |
//+------------------------------------------------------------------+
void NN_Neurons_Scaler_CNet::getResults(CArrayDouble_MQL4 & resultVals, uint idx)const
{         if(errorFlag)return;
          //---
          //if(resultVals.Total() == 1000)
          //for(int i = 0; i < ArraySize(resultVals); i++)
          {         resultVals.Clear();
                    NN_Neurons_Scaler_CLayer *lastLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);//---where last layer of network
                    for(int n = 0; n < lastLayer.Total() - 1 && !IsStopped(); ++n)
                    {         NN_Neurons_Scaler_CNeuron *neuron = lastLayer.At(n);
                              resultVals.Add(neuron.getNodeVal(idx)); ////--just return
                    }//
          }//
          //---
}
//if(CheckPointer(inputLayer.At(i)) == POINTER_INVALID) { Print("Fnc:" + FNC, " Line:", (string)Lin, " idx: ", (string)i, " invaliade pointer");}; //mycode
//neuron[i] = inputLayer.At(i);
//neuron[i].setNodeVal(inputVals.At(i));////----where important ro set inputlayer nodes
//+------------------------------------------------------------------+
//|        propagate forward to get a prediction                     |&& !IsStopped()
//+------------------------------------------------------------------+
void NN_Neurons_Scaler_CNet::feedForward_Net(const CArrayDouble_MQL4 & inputVals, string FNC, int Lin, int idx)
{         // cheak existed layer total element one by input elements
          NN_Neurons_Scaler_CLayer *inputLayer = GetPointer(m_layers[0]);//---return object pointer assign pointers//----copy layer to new input// frist layer
          if(errorFlag) {Print("errorFlag:", errorFlag, "   ", __FUNCSIG__, "    inputVals.Total() != inputLayer.Total() - 1:", inputVals.Total() != inputLayer.Total() - 1); return;}
          //---
          if(1)
          {         //--assert      inputLayer.Total() - 1
                    if(inputVals.Total() != ArraySize(getLayer(0).getNeuron(idx - 1).getoutputWeights(0, __FUNCTION__, __LINE__).weight))                { shutDown(0, " feedForward net Invalid pointer S*R==R*1"); return; } //--cheack if element number are not same return
                    //
                    //NN_Neurons_Scaler_CNeuron *neuron[]; ArrayResize(neuron,inputVals.Total());
                    //--- loop for [set values of neuron] at layer Input
                    for(int o = 0; o < getLayer(0).Total(); o++)//neuron in layer input
                    {         NN_Neurons_Scaler_CNeuron *neuron = inputLayer.At(o);
                              double SumNeuron = 0.0;//scaler
                              for(int j = 0; j <  neuron.getArraySizeoutputWeights() - 1 ; j++ ) //connection in nueron input
                              {         for(int k = 0; k < ArraySize(neuron.getoutputWeights(j, __FUNCTION__, __LINE__).weight) - 1; k++) //edge in connection input
                                        {         //for(int i = 0; i < inputVals.Total() ; ++i)//element in edge input
                                                  {         SumNeuron += neuron.getoutputWeights(j, __FUNCTION__, __LINE__).weight[k] * inputVals.At(k); //
                                                  }//
                                        }//
                                        //
                              } //init neurons frist by input,etting node value of single neuron as double
                              for(int i = 0; i < inputVals.Total(); i++)
                              {         neuron.setNodeVal(i, neuron.activationFcn(SumNeuron)); //
                              }//
                    }//
          }//
          //for(int y = 0; y < inputLayer.Total()- 1; y++)
          {         //for(int i = 0; i < inputVals.Total() - 1; i++)
                    {         //NN_Neurons_Scaler_CNeuron *neuron = inputLayer.At(i);
                              //neuron.setNodeVal(inputVals.At(i));
                              //--- loop for calc values of neuron in network layers input layer until Out layer
                              for(int layerNum = 1; layerNum < ArraySize(m_layers) /*&& !IsStopped()*/; ++layerNum)//change layer
                              {         NN_Neurons_Scaler_CLayer *nextlayer     = GetPointer(m_layers[layerNum]);      //--secound layer of hiddens or outputs
                                        NN_Neurons_Scaler_CLayer *prevLayer     = GetPointer(m_layers[layerNum - 1]);  //--frist is inputlayer as zero level
                                        //---
                                        for(int n = 0; n < nextlayer.Total() - 1 /*&& !IsStopped()*/; ++n)               //change neuron        //  where in network at last layer outs neuron ordrsseted
                                        {         NN_Neurons_Scaler_CNeuron *neuron_nextlayer = nextlayer.At(n);  ////---! layer at type is CObject_MQL4
                                                  neuron_nextlayer.feedForward_Neuron(prevLayer, inputVals.Total(), idx); /*set node value by prevlayer*/ //not recursive callll whats the stop control?  the feedForward  is from NN_Neurons_Scaler_CNeuron
                                        } //
                              } //
                    }//
          }//
}
//+------------------------------------------------------------------+
//|        propagate backwards to make the network learn             |  //Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
//+------------------------------------------------------------------+
void NN_Neurons_Scaler_CNet::backProp_Net(const CArrayDouble_MQL4 & targetVal, int idx)
{         //for(int i = 0; i < targetVal.Total(); i++)//for out side algo
          if(errorFlag) {Print("errorFlag:", errorFlag, "   ", __FUNCSIG__); return;}
          //---
          //Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
          NN_Neurons_Scaler_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          //-------------------------------------------------------------------------------
          //--- calculate our SquareError
          //for(int i = 0; i < targetVal.Total(); i++)//for out side algo
          m_error[idx] = 0.0;
          //-------------------------------------------------------------------------------
          for(int n = 0; n < outputLayer.Total() - 1 /*&& !IsStopped()*/; ++n)//--last layer setting
          {
                    {         const NN_Neurons_Scaler_CNeuron *neuron_outputLayer = outputLayer.At(n);
                              double delta = targetVal.At(n) - neuron_outputLayer.getNodeVal(idx);
                              m_error[idx] += delta * delta;//SquareError
                    }//
          }
          //--- calculate our RMS (m_recentAverageError)  ---------------\\
          m_error[idx] /= outputLayer.Total() - 1; //MeanSquareError //dive to output neurons count
          m_error[idx] = sqrt(m_error[idx]); //radicalMeanSquareError
          m_recentAverageError = (m_recentAverageError * m_recentAverageSmoothingFactor + m_error[idx]) / (m_recentAverageSmoothingFactor + 1.0);
          //-------------------------------------------------------------------------------
          //--- make output neurons calculate their output Gradients
          for(int n = 0; n < outputLayer.Total() - 1 /*&& !IsStopped()*/; ++n)
          {         NN_Neurons_Scaler_CNeuron *neuron_outputLayer = outputLayer.At(n);
                    neuron_outputLayer.calcOutputGradients(idx, targetVal.At(n)); //
          }
          //-------------------------------------------------------------------------------
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2; layerNum > 0 /*&& !IsStopped()*/; --layerNum)
          {         NN_Neurons_Scaler_CLayer *hiddenLayer = GetPointer(m_layers[layerNum]); ///where minus 2 at start index attention
                    NN_Neurons_Scaler_CLayer *nextLayer   = GetPointer(m_layers[layerNum + 1]);
                    //---
                    for(int n = 0; n < hiddenLayer.Total() /*&& !IsStopped()*/; ++n)
                    {         NN_Neurons_Scaler_CNeuron *neuron_hiddenLayer = hiddenLayer.At(n);
                              neuron_hiddenLayer.calcHiddenGradients(nextLayer, targetVal.Total(), idx); //
                    } //
          }
          //--- make neurons update connections feeding to them
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 0 /*&& !IsStopped()*/; --layerNum)
          {         NN_Neurons_Scaler_CLayer *layer_hidden = GetPointer(m_layers[layerNum]);//hidenlayer
                    NN_Neurons_Scaler_CLayer *prevLayer_beforehidenlayer = GetPointer(m_layers[layerNum - 1]);//beforehidenlayer///arrow is right to left
                    //---
                    for(int n = 0; n < layer_hidden.Total() - 1 /*&& !IsStopped()*/; ++n)
                    {         NN_Neurons_Scaler_CNeuron *neuron_layer_hidden = layer_hidden.At(n);
                              neuron_layer_hidden.updateInputWeights(prevLayer_beforehidenlayer, targetVal.Total(), idx); //
                    } //
          }//
          //--add delta to neuronsall/*mine code to remmember lasts*/
          if(0)
          {         for(int layerNum = ArraySize(m_layers) - 1; layerNum > 0 /*&& !IsStopped()*/; --layerNum)
                    {         NN_Neurons_Scaler_CLayer *layerSelected = GetPointer(m_layers[layerNum]);//hidenlayer
                              for(int n = 0; n < layerSelected.Total() - 1 /*&& !IsStopped()*/; ++n)
                              {         NN_Neurons_Scaler_CNeuron *neuron_layer_Selected = layerSelected.At(n);
                                        neuron_layer_Selected.m_nodeVal_delta = neuron_layer_Selected.getNodeVal(idx); //
                              }//
                    }//
          }//
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|        Save the network for future use                           |
//+------------------------------------------------------------------+
bool NN_Neurons_Scaler_CNet::Save(int &file_handle)
{
//  if(file_handle == INVALID_HANDLE)
//                    return false;
//          //---
//          if(FileWriteArray(file_handle, m_topology) <= 0)
//                    shutDown(false, "Error saving network");
//          //---
//          for(int i = 0; i < ArraySize(m_layers); i++)
//                    m_layers[i].Save(file_handle);
//          //---
//          uchar successFlag[];
//          StringToCharArray("Saved successfully!", successFlag);
//          //---
//          if(FileWriteArray(file_handle, successFlag) <= 0)
//                    Print("Error: Partial save");
//          //---
//          FileClose(file_handle);
//          //---
//
          return true;
//
}
//+------------------------------------------------------------------+
//|        Load the network from a file                              |
//+------------------------------------------------------------------+
bool NN_Neurons_Scaler_CNet::Load(int &file_handle)
{
//  if(file_handle == INVALID_HANDLE)
//                    return false;
//          //---
//          if(FileReadArray(file_handle, m_topology) <= 0)
//                    return shutDown(false, "Error loading network configuration");
//          //---
//          //---
//          errorFlag = false;
//          uint numLayers = ArraySize(m_topology);
//          //--- create layers
//          ArrayResize(m_layers, numLayers);
//          for(uint layerNum = 0; layerNum < numLayers && !IsStopped(); ++layerNum)
//          {         uint numOutputs = (layerNum == numLayers - 1) ? 0 : m_topology[layerNum + 1];
//                    //--- shorten layer pointer
//                    NN_Neurons_Scaler_CLayer *layer = GetPointer(m_layers[layerNum]);
//                    //--- create neurons and give them layer activation functions
//                    for(int neuronNum = 0; neuronNum <= m_topology[layerNum] && !IsStopped(); ++neuronNum)
//                    {        //---------------------------------------------------------------------------- NN_Neurons_Scaler_CNeuron *neuron = new NN_Neurons_Scaler_CNeuron(numOutputs, neuronNum);//--normal neuron
//                              if(neuron == NULL)
//                              {         shutDown("Neuron creation error");
//                                        break; }
//                              //--- store pointer to neuron
//                              layer.Add(neuron);
//                              //--- bias neuron value
//                              if(neuronNum == m_topology[layerNum])
//                                        neuron.setNodeVal(1.0); //
//                    } //
//          }
//          //---
//          //---
//          for(int i = 0; i < ArraySize(m_layers); i++)
//                    m_layers[i].Load(file_handle);
//          //---
//          uchar successFlag[];
//          if(FileReadArray(file_handle, successFlag) > 0)
//                    if(CharArrayToString(successFlag) == "Saved successfully!")
//                              Print("Network loaded successfully.");
//                    else return shutDown(false, "Load network error");
//          //---
//
          return true;
//
}
