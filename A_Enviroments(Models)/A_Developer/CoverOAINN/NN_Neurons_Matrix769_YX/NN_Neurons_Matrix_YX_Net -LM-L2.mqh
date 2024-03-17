//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property  strict
//----------------------------------------- Last Trained Sample Convergenced By MSE ----------------------++
#define IsDebugNN_Neurons_Matrix_YX_CNet 0
#define IsRMSE 1
#define RunTimeLimit 6//secound
//#include "NetComplex.mqh"
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionXObj\VectorZObj.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix769_YX\NN_Neurons_Matrix_YX_Layer.mqh>
//+------------------------------------------------------------------+
//|   Link instances to form a fully connected neural network        |
//+------------------------------------------------------------------++
class NN_Neurons_Matrix_YX_CNet;
class BaseNetWorkLossFunction
{
public:
          BaseNetWorkLossFunction(void) {};
          ~BaseNetWorkLossFunction(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CLoss_SUM_SQUARED_ERROR : public BaseNetWorkLossFunction
{
public:
          CLoss_SUM_SQUARED_ERROR(void) {};
          ~CLoss_SUM_SQUARED_ERROR(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CLoss_MEAN_SQUARED_ERROR: public BaseNetWorkLossFunction
{
public:
          CLoss_MEAN_SQUARED_ERROR(void) {};
          ~CLoss_MEAN_SQUARED_ERROR(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CLoss_NORMALIZED_SQUARED_ERROR: public BaseNetWorkLossFunction
{
public:
          CLoss_NORMALIZED_SQUARED_ERROR(void) {};
          ~CLoss_NORMALIZED_SQUARED_ERROR(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CLoss_MINKOWSKI_ERROR: public BaseNetWorkLossFunction
{
public:
          CLoss_MINKOWSKI_ERROR(void) {};
          ~CLoss_MINKOWSKI_ERROR(void) {};
//--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CLoss_WEIGHTED_SQUARED_ERROR: public BaseNetWorkLossFunction
{
public:
          CLoss_WEIGHTED_SQUARED_ERROR(void) {};
          ~CLoss_WEIGHTED_SQUARED_ERROR(void) {};
//--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CLoss_CROSS_ENTROPY_ERROR: public BaseNetWorkLossFunction
{
public:
          CLoss_CROSS_ENTROPY_ERROR(void) {};
          ~CLoss_CROSS_ENTROPY_ERROR(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class BaseNetWorkOptimizer
{
public:
          BaseNetWorkOptimizer(void) {};
          //BaseNetWorkOptimizer() {};
          ~BaseNetWorkOptimizer(void)
          {         //delete DataSetInput;
                    //delete DataSetTarget;  delete DataSetTargetTime;
                    //delete  DataSetResult;//
          };
          string                        Name;
          //--------------------------------
          double                        m_error ;//every element has own error
          NN_Neurons_Matrix_YX_CLayer   m_layers[];
          bool                          errorFlag;
          //--- visibe network m_topology
          int                           m_topology[];
          int                           m_topologySize;
          double                        m_recentAverageError; //Network Performance in recent call or array uset to all//moving average of the error during the training process. monitoring and evaluating the progress of the training.
          double                        m_recentAverageSmoothingFactor;  ////--- average our error over this number of training samples

          VectorZObj<VectorZ<double>>     DataSetInput;
          VectorZObj<VectorZ<double>>     DataSetTarget; VectorZObj<VectorZ<double>>  DataSetTargetTime;
          VectorZObj<VectorZ<double>>     DataSetResult; //


          bool                  IsEmptyFile;
          uint                  m_Samples;
          uint                  m_SampleCurr;
          bool                  IsRandomSample;
          uint                  m_epochs;
          double                LearningRate;
          double                Momentom;
          double                RASF;//
          double                MinRMSE;//
          NN_Neurons_Matrix_YX_ActFunctions hidden;//
          NN_Neurons_Matrix_YX_ActFunctions output;
          void setBack(NN_Neurons_Matrix_YX_CNet &net)
          {         if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]Network Initilazing Set_Build_Network setBack 1...!");
                    Name                                = net.Name;
                    m_error                             = net.m_error; //
                    ArrayResize(m_layers, ArraySize(net.m_layers));
                    for(int i = 0; i < ArraySize(net.m_layers); i++) { m_layers[i] = net.m_layers[i]; }
                    errorFlag                           = net.errorFlag; // //
                    ArrayCopy(m_topology, net.m_topology); //
                    m_topologySize                      = net.m_topologySize; //
                    m_recentAverageError                = net.m_recentAverageError; //
                    m_recentAverageSmoothingFactor      = net.m_recentAverageSmoothingFactor; //
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]Network Initilazing Set_Build_Network setBack 2...!");
                    IsEmptyFile         = net.IsEmptyFile;
                    m_Samples           = net.m_Samples;
                    m_SampleCurr        = net.m_SampleCurr;
                    IsRandomSample      = net.IsRandomSample;
                    m_epochs            = net.m_epochs;
                    LearningRate        = net.LearningRate;
                    Momentom            = net.Momentom;
                    RASF                = net.RASF; //
                    MinRMSE             = net.MinRMSE; //
                    hidden              = net.hidden;//
                    output              = net.output; //
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]Network Initilazing Set_Build_Network setBack 3...!");
                    DataSetInput        = net.DataSetInput; //
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]Network Initilazing Set_Build_Network setBack 4...!");
                    DataSetTarget       = net.DataSetTarget;    DataSetTargetTime = net.DataSetTargetTime; //
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]Network Initilazing Set_Build_Network setBack 5...!");
                    DataSetResult       = net.DataSetResult; //
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]Network Initilazing Set_Build_Network setBack 6...!");
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]Network Initilazing Set_Build_Network setBack END...!");
                    return;
                    //
          }//
          bool       IsMinError;
          double     getERORR_Net(const VectorZ<double>  & DataTarget)
          {         //Print("Network Net::getERORR...!", " m_SampleCurr ", (string)m_SampleCurr);
                    NN_Neurons_Matrix_YX_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
                    m_error = 0.0;
                    for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n)
                    {         const NN_Neurons_Matrix_YX_CNeuron *neuron = outputLayer[n];
                              double delta = DataTarget[n] - neuron.getNodeVal();               m_error += delta * delta; // for all error in layer
                    }
                    //--- calculate our RMS (m_recentAverageError)
                    m_error /= outputLayer.Total() - 1; //one neuron erors mean//without bias
                    m_error = sqrt(m_error);
                    m_recentAverageError = (m_recentAverageError * m_recentAverageSmoothingFactor + m_error) / (m_recentAverageSmoothingFactor + 1.0);
                    //Print( "   m_error: ", DoubleToStr(m_error, 2), "  m_recentAverageError:", DoubleToStr(m_recentAverageError, 2), "  m_recentAverageSmoothingFactor:", (string)m_recentAverageSmoothingFactor);
                    //Sleep(500);
                    return  m_error;//
          }//



          //getter method of a private variable value
          virtual double   getRecentAverageError(void) { if(errorFlag)return 0.0; return m_recentAverageError; }
          virtual double   getLastRMSError(void) { if(errorFlag)return 0.0; return m_error; }

          //--- methods for working with files
          bool             Save(int &file_handle, int n);
          bool             Load(int &file_handle, int n);
          //---
          template <typename custom> //Shut down the network when required
          custom           shutDown(custom exit_code, string msg = NULL) { Print(msg, ". Shutting down...");  errorFlag = true;  ArrayFree(m_layers);  ArrayFree(m_topology);  return exit_code; }
          //
          void UpdateLearningRateMomentom(double val, double val2)
          {         for(int layerNum = 0; layerNum < ArraySize(m_topology) && !IsStopped(); ++layerNum)
                    {         NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNum]);
                              for(int neuronNum = 0; neuronNum <= m_topology[layerNum] && !IsStopped(); ++neuronNum)//neuronNum (<=) f_topology.At(layerNum) = mean bias
                              {         NN_Neurons_Matrix_YX_CNeuron *neuron = layer[neuronNum];
                                        if(neuron == NULL) { shutDown("Neuron creation error"); break; }
                                        neuron.setETA_Momentom( val, val2); //
                              }//
                    }//
          }
          virtual void     Sim(VectorZObj<VectorZ<double>>  &inputs, VectorZObj<VectorZ<double>>  &results, string s) {};
          virtual void     Train() {Print("----00------BaseNetWorkOptimizer::", Name);};
          virtual bool     feedForward_Net_WeightInside( string s);
          virtual bool     feedForward_Net_WeightBefore(bool b, string s);
          virtual bool     backPropagate_Net_WeightInside( int epocheAll, int epocheAllIdx, uint sampleCount) {return false;};
          virtual bool     backPropagate_Net_WeightBefore( int epocheAll, int epocheAllIdx, uint BatchCount) {return false;};
          virtual void     getResults(bool b)const;
          //+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          double calculateRMSE_Samples( string s)
          {         if (DataSetTarget[m_SampleCurr].Total() != DataSetResult[m_SampleCurr].Total())
                    {         Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample-> DataSetTarget[0].Total() != DataSetResult[0].Total() ", DataSetTarget[m_SampleCurr].Total(), " : ", DataSetResult[m_SampleCurr].Total(), s); return 999999999.999;}
                    double mseall = 0;
                    double SumErrorPower2 = 0.0; //error^2+error^2
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___START1__", "  DataSetResult.Total():", DataSetResult.Total());
                    NN_Neurons_Matrix_YX_CLayer *lastLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___START1__", "  ArraySize(m_layers) - 1:", ArraySize(m_layers) - 1);
                    if(s != "Levenberg")
                    {         for(int i = 0; i < (int)DataSetResult.Total(); i++)
                              {         DataSetResult[i].clear();
                                        if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___START3__");
                                        for(int n = 0; n < lastLayer.Total() - 1 && !IsStopped(); ++n)//>>-1 is bias
                                        {         NN_Neurons_Matrix_YX_CNeuron *neuron = lastLayer[n];
                                                  if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___START4__", "  DataSetResult.Total():", DataSetResult.Total(), "  i", i);
                                                  DataSetResult[i] << neuron.getNodeVal(); //
                                        }//
                              } //
                    }
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___START2__");
                    for(int j = 0; j < (int)DataSetResult.Total(); j++)//samples
                    {         if (DataSetTarget[j].Total() != DataSetResult[j].Total())
                              {         // Error handling for input size mismatch
                                        //throw std::runtime_error("Input vectors must have the same size.");
                                        continue;
                                        Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample-> not same size DataSetTarget[m_SampleCurr][", (string)j, "].Total() != DataSetResult[0][", (string)j, "].Total() ",
                                              DataSetTarget[j].Total(), " : ", DataSetResult[j].Total(), s); return 999999999.999;  //
                              }
                              double ErrorPower2 = 0.0; //error^2
                              for (int i = 0; i < (int)DataSetTarget[j].Total(); ++i)//sampel elements
                              {         double Delta = DataSetTarget[j][i] - DataSetResult[j][i];
                                        ErrorPower2 = Delta * Delta; //
                              }
                              SumErrorPower2 += ErrorPower2;//
                    }
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___END1__");
                    double MeanSumErrorPower2 = 0.0;
                    if(DataSetTarget.Total() != 0) {MeanSumErrorPower2 = SumErrorPower2 / DataSetTarget.Total();} //DataSetResult[0].Total();
                    else {Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample count:zero ", DataSetTarget.Total());} //
                    double RootMeanSumErrorPower2 = MeanSumErrorPower2;  RootMeanSumErrorPower2 = sqrt(MeanSumErrorPower2);
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___END2__");
                    return RootMeanSumErrorPower2; //
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          double calculateRMSE_Sample( string s)
          {         if (DataSetTarget[m_SampleCurr].Total() != DataSetResult[m_SampleCurr].Total())
                    {         Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample-> DataSetTarget[0].Total() != DataSetResult[0].Total() ", DataSetTarget[m_SampleCurr].Total(), " : ", DataSetResult[m_SampleCurr].Total()); return  999999999.999;}
                    double mseall = 0;
                    double SumErrorPower2 = 0.0; //error^2+error^2
                    NN_Neurons_Matrix_YX_CLayer *lastLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
                    DataSetResult[m_SampleCurr].clear();
                    for(int n = 0; n < lastLayer.Total() - 1 && !IsStopped(); ++n)//>>-1 is bias
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = lastLayer[n];
                              DataSetResult[m_SampleCurr] << neuron.getNodeVal(); //
                    }
                    if (DataSetTarget[m_SampleCurr].Total() != DataSetResult[m_SampleCurr].Total())
                    {         // Error handling for input size mismatch
                              //throw std::runtime_error("Input vectors must have the same size.");
                              Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample-> not same size DataSetTarget[0].Total() != DataSetResult[0].Total() ",
                                    DataSetTarget[m_SampleCurr].Total(), " : ", DataSetResult[m_SampleCurr].Total(), s); return  999999999.999; //
                              return 999999999; //
                    }
                    double ErrorPower2 = 0.0; //error^2
                    for (int i = 0; i < (int)DataSetTarget[m_SampleCurr].Total(); ++i)//where series data com total is one
                    {         double diffError = DataSetTarget[m_SampleCurr][i] - DataSetResult[m_SampleCurr][i];
                              ErrorPower2 += diffError * diffError; //
                    }
                    SumErrorPower2  = ErrorPower2;//
                    double MeanSumErrorPower2 = 0.0;
                    if(DataSetTarget[m_SampleCurr].Total() != 0) {MeanSumErrorPower2 = SumErrorPower2 / DataSetTarget[m_SampleCurr].Total();} //DataSetResult[0].Total();
                    else {Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample count:zero ", DataSetTarget[m_SampleCurr].Total());} //
                    double RootMeanSumErrorPower2 = MeanSumErrorPower2; RootMeanSumErrorPower2 = sqrt(MeanSumErrorPower2);
                    return RootMeanSumErrorPower2; //
          } //
};
//+------------------------------------------------------------------+
//|        collect DataSetTarget[0] results from output nodes               |
//+------------------------------------------------------------------+
void BaseNetWorkOptimizer::getResults(bool b)const
{         // Print("Network Net::getResults...!");
          if(errorFlag) return;
          DataSetResult[m_SampleCurr].Clear();
          NN_Neurons_Matrix_YX_CLayer *lastLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          for(int n = 0; n < lastLayer.Total() - 1 && !IsStopped(); ++n)//>>-1 is bias
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = lastLayer[n];
                    DataSetResult[m_SampleCurr] << neuron.getNodeVal(); //
                    //if(b) { Print("Network Net::getResults...!", " val neuron.getNodeVal(): ", neuron.getNodeVal(), "  DataSetResult[m_SampleCurr][n]: ", DataSetResult[m_SampleCurr][n], "  m_SampleCurr: ", m_SampleCurr, "  lastLayer.Total() - 1: ", lastLayer.Total() - 1 ); Sleep(500); } //
          } //
          //Print("Network Net::getResults...!", " Size result: ", DataSetResult[m_SampleCurr].Total());//
}
//+------------------------------------------------------------------+
//|        propagate forward to get a prediction                     |&& !IsStopped()
//+------------------------------------------------------------------+
bool BaseNetWorkOptimizer::feedForward_Net_WeightBefore( bool b, string s)
{         //Print("Network Net::feedForward_Net_WeightBefore...!");
          if(DataSetInput[m_SampleCurr].size() != m_topology[0])
          {         Print(s + "  Incompatible inputs! ", (string)DataSetInput[m_SampleCurr].size(), "  m_topology[ArraySize(m_topology) - 1)", (string)m_topology[0]); return false; }
          if(errorFlag)return false;
          //---
          NN_Neurons_Matrix_YX_CLayer *inputLayer = GetPointer(m_layers[0]);
          if(DataSetInput[m_SampleCurr].size() != inputLayer.Total() - 1)//--free_node
          {         Print(s + "----ddd---DataSetInput[m_SampleCurr].Total(): ", DataSetInput[m_SampleCurr].size(), "----ddd---inputLayer.Total() - 1:  ", inputLayer.Total() - 1); Sleep(3000); ///
                    shutDown(0, s + " Invalid pointer feedForward_Net" +
                             "  <DataSetInput[m_SampleCurr].Total():inputLayer.Total() - 1>" + (string)DataSetInput[m_SampleCurr].Total() + ":" + (string)(inputLayer.Total() - 1) + "  "); Sleep(3000); return false; }
          //---Set inp Neurons val from inputs val
          for(uint i = 0; i < (uint)DataSetInput[m_SampleCurr].size() && !IsStopped(); ++i)
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = inputLayer.At(i);
                    neuron.setNodeVal(DataSetInput[m_SampleCurr][i]); //
                    //if(b) {Print("DataSetInput[m_SampleCurr][i]: ", DataSetInput[m_SampleCurr][i], "  m_SampleCurr: ", m_SampleCurr); Sleep(2000);} //
          }
          //---Next layer neuron set
          for(uint layerNum = 1/* secound layer */; layerNum < (uint)ArraySize(m_layers) /* all layer */ && !IsStopped(); ++layerNum)
          {         NN_Neurons_Matrix_YX_CLayer *layer     = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    //---
                    if(0)//again normalize data before forward ---________---__FAIL____---
                    {         if(layerNum > 1)
                              {         VectorZ<double> Series;//
                                        for(int neuronNum = 0; neuronNum < layer.Total() - 1/* with out bias */ && !IsStopped(); ++neuronNum)
                                        {         NN_Neurons_Matrix_YX_CNeuron *neuron = layer[neuronNum];
                                                  Series << neuron.getNodeVal();; //
                                        }//
                                        for(int neuronNum = 0; neuronNum < layer.Total() - 1/* with out bias */ && !IsStopped(); ++neuronNum)
                                        {         NN_Neurons_Matrix_YX_CNeuron *neuron = layer[neuronNum];
                                                  neuron.setNodeVal(DataNormilizer(Series)[neuronNum]);; //
                                        }
                                        //
                              }//
                    }
                    //---
                    for(int neuronNum = 0; neuronNum < layer.Total() - 1/* with out bias */ && !IsStopped(); ++neuronNum)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = layer[neuronNum];
                              neuron.feedForward_Neuron(prevLayer, layerNum, neuronNum); //
                    }//
          }//
          return true; //
}
//+------------------------------------------------------------------+
//|        propagate forward to get a prediction                     |&& !IsStopped()
//+------------------------------------------------------------------+
bool BaseNetWorkOptimizer::feedForward_Net_WeightInside( string s)
{         //Print("Network Net::feedForward_Net_WeightInside...!");
          if(DataSetInput[m_SampleCurr].size() != m_topology[0])
          {         Print("Incompatible inputs!", (string)DataSetInput[m_SampleCurr].size(), "  m_topology[ArraySize(m_topology) - 1)", (string)m_topology[0]); return false; }
          if(errorFlag)return false;
          //---
          NN_Neurons_Matrix_YX_CLayer *inputLayer = GetPointer(m_layers[0]);
          if(DataSetInput[m_SampleCurr].size() != inputLayer.Total() - 1)//--free_node
          {         Print(s + "----ddd---DataSetInput[m_SampleCurr].Total(): ", DataSetInput[m_SampleCurr].size(), "----ddd---inputLayer.Total() - 1:  ", inputLayer.Total() - 1); Sleep(3000); ///
                    shutDown(0, s + " Invalid pointer feedForward_Net" +
                             "  <DataSetInput[m_SampleCurr].Total():inputLayer.Total() - 1>" + (string)DataSetInput[m_SampleCurr].Total() + ":" + (string)(inputLayer.Total() - 1) + "  "); Sleep(3000); return false; }
          //---Set inp Neurons val from inputs val
          for(uint i = 0; i < (uint)DataSetInput[m_SampleCurr].size() && !IsStopped(); ++i)
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = inputLayer.At(i); neuron.setNodeVal(DataSetInput[m_SampleCurr][i]); //
          }
          //---This layer neuron set
          if(1)
          {         for(uint layerNum = 0/* secound layer */; layerNum < (uint)ArraySize(m_layers) /* all layer */ && !IsStopped(); ++layerNum)
                    {         //---
                              if(layerNum == 0)
                              {         NN_Neurons_Matrix_YX_CLayer *layerFirst     = GetPointer(m_layers[0]);
                                        for(int neuronNum = 0; neuronNum < layerFirst.Total() - 1/* with out bias */ && !IsStopped(); ++neuronNum)
                                        {         NN_Neurons_Matrix_YX_CNeuron *neuron = layerFirst[neuronNum];//
                                                  double val = neuron.getNodeVal() * neuron.getWeigth(0, __LINE__).weight + neuron.getNodeBias();
                                                  neuron.setNodeVal(val); //
                                        } //
                              }//
                              else
                              {         NN_Neurons_Matrix_YX_CLayer *ThislayerSet     = GetPointer(m_layers[layerNum]);
                                        NN_Neurons_Matrix_YX_CLayer *prevLayerInput = GetPointer(m_layers[layerNum - 1]);
                                        //
                                        VectorZ<double> inputs;
                                        for(int neuronNum = 0; neuronNum < ThislayerSet.Total() - 1/* with out bias */ && !IsStopped(); ++neuronNum)
                                        {         //
                                                  NN_Neurons_Matrix_YX_CNeuron *neuronSet = ThislayerSet[neuronNum];
                                                  inputs.clear();
                                                  for(int i = 0; i < prevLayerInput.Total() - 1; i++)
                                                  {         NN_Neurons_Matrix_YX_CNeuron *neuronInput = prevLayerInput[i];
                                                            inputs << neuronInput.getNodeVal(); //
                                                  }
                                                  double sum = 0.0;
                                                  for(int k = 0; k < inputs.total(); k++)
                                                  {         //Print("inputs.total(): ", (string)inputs.total());
                                                            sum += inputs[k] * neuronSet.getWeigth(k, __LINE__).weight; //as wp
                                                  }
                                                  neuronSet.setNet(sum + neuronSet.getNodeBias()); //
                                                  neuronSet.setNodeVal(neuronSet.activationFcn(neuronSet.getNodeNet(), 0.0)); //
                                        } //
                              }
                              //
                    } //
          }//
          return true; //
}
//+------------------------------------------------------------------+
//|        Save the network for future use                           |
//+------------------------------------------------------------------+
bool BaseNetWorkOptimizer::Save(int &file_handle, int n)
{         if(!IsStopped())
          {         //Print("*** NN_Neurons_Matrix_YX_CNet::Save **");
                    if(file_handle == INVALID_HANDLE) {  Print("NN_Neurons_Matrix_YX_CNet::Save INVALID_HANDLE"); return false;}
                    //---
                    if(0)
                    {         uchar SartSaveFlag[];
                              StringToCharArray("Saving Started!", SartSaveFlag);
                              if(FileWriteArray(file_handle, SartSaveFlag) <= 0) {  Print("Error: StartPartial save");}//
                    }
                    //---
                    //Print((string)n + " ___SAVING___ArraySize(m_topology) ", ArraySize(m_topology));
                    if(FileWriteArray(file_handle, m_topology, 0, WHOLE_ARRAY) <= 0) //___NOT SAY ITS WRITE AMOUNT OF THAT SIZE____, 0, ArraySize(m_topology)//__BIG__ERRORR__
                    {         Print((string)n + "__NET__ArraySize(m_topology)___:", ArraySize(m_topology));
                              shutDown(false, (string)n + " m_topology FileWriteArray  Error saving network");
                              return false; }
                    //---
                    for(int i = 0; i < ArraySize(m_layers); i++)m_layers[i].Save(file_handle);
                    //---
                    uchar successFlag[];
                    StringToCharArray("Saved successfully!", successFlag);
                    //---
                    if(FileWriteArray(file_handle, successFlag, 0, StringLen("Saved successfully!")) <= 0) //___0,WHOLE_ARRAY_(makegap->StringToCharArray)__Saved successfully!__file_handle, successFlag,0,StringLen("Saved successfully!")__its correct___Make no gap in file____
                    {         Print("Error: EndPartial save"); return false;}
                    //---
          }//
          //FileClose(file_handle);
          //---
          return true; //
}
//+------------------------------------------------------------------+
//|        Load the network from a file                              |
//+------------------------------------------------------------------+
bool BaseNetWorkOptimizer::Load(int &file_handle, int n)
{         //Print("*** NN_Neurons_Matrix_YX_CNet::Load **");
          if(file_handle == INVALID_HANDLE) {Print("__NET__Load__::Load INVALID_HANDLE"); return false;}
          //Print("*** NN_Neurons_Matrix_YX_CNet::Load >>FileReadArray**");
          ResetLastError();
          //Print(n + " ArraySize(m_topology) ", ArraySize(m_topology));
          m_topologySize = ArraySize(m_topology);
          ArrayFree(m_topology); //errorr->ArrayResize(m_topology,m_topologySize);// no need
          if(FileReadArray(file_handle, m_topology, 0, m_topologySize) <= 0) ///__BIG_ERROR__ read file......when reding if not define how much array element need to read then extradeading... erroring
          {         Print("_LastError: ", ErrorDescription(_LastError), "  ", _LastError); //
                    //FileClose(file_handle);FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin");
                    return shutDown(false, "Error loading network configuration"); //
          }
          if(ArraySize(m_topology) != m_topologySize )
          {         Print((string)n + " __NET__Load__ArraySize(m_topology) != m_topologySize ", ArraySize(m_topology), " : ", m_topologySize); return false; } //
          //---
          errorFlag = false;
          uint numLayersSave = ArraySize(m_topology);
          //--- create layers
          ArrayFree(m_layers);
          ArrayResize(m_layers, numLayersSave);
          //Print(n + " __Load__ArraySize(m_layers) ", ArraySize(m_layers));
          //structure building
          if(1)
                    for(uint layerNumSave = 0; layerNumSave < numLayersSave && !IsStopped(); ++layerNumSave)
                    {         //Print("*** NN_Neurons_Matrix_YX_CNet::Load>> for layerNumSave **", "  layerNumSave:", layerNumSave); Sleep(0);
                              uint numOutputs = (layerNumSave == numLayersSave - 1) ? 0 : m_topology[layerNumSave + 1];
                              //Print(n, "  layerNumSave: ", layerNumSave,  "  numLayersSave: ", numLayersSave, " __Load__numOutputs ", numOutputs);
                              //--- shorten layer pointer
                              NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNumSave]);
                              //--- create neurons and give them layer activation functions
                              for(int neuronNumSave = 0; neuronNumSave <= m_topology[layerNumSave] && !IsStopped(); ++neuronNumSave)
                              {         if(m_topology[layerNumSave] != m_topology[layerNumSave])
                                        {         //FileClose(file_handle); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin");
                                                  Print("__NET__Load__ Network loaded unsuccessfully. m_topology Not Same with loaded"); return false;//
                                        }
                                        //Print("*** NN_Neurons_Matrix_YX_CNet::Load>> for neuronNumSave >>**", "  layerNumSave:", layerNumSave, "  neuronNumSave:", neuronNumSave); Sleep(0);
                                        uint NumInputs = 1;
                                        if(layerNumSave != 0) {NumInputs = GetPointer(m_layers[layerNumSave - 1]).Total();}
                                        NN_Neurons_Matrix_YX_CNeuron *neuron = new NN_Neurons_Matrix_YX_CNeuron(layerNumSave, layerNumSave == 0, NumInputs, numOutputs, neuronNumSave); //at load neuron activefunc is default
                                        if(neuron == NULL) { shutDown("Neuron creation error"); break; }
                                        //--- store pointer to neuron
                                        layer.Add(neuron);
                                        //--- [bias neuron] value!!!!!!!!ok bias detected
                                        if(neuronNumSave == m_topology[layerNumSave]) neuron.setNodeVal(1.0);//
                                        //Print("_______", n, "  layerNumSave: ", layerNumSave,  "  numLayersSave: ", numLayersSave, " __Load__numOutputs ", numOutputs, "  m_topology[layerNumSave]: ", m_topology[layerNumSave]); //
                              }//
                    }
          //Print(n + " __Load__ C4");
          //---
          //Print("*** NN_Neurons_Matrix_YX_CNet::Load>> m_layers[i].Load **");
          for(int i = 0; i < ArraySize(m_layers); i++) m_layers[i].Load(file_handle);//_______NEXT LOAD LAYERS______
          //---
          //Print("*** NN_Neurons_Matrix_YX_CNet::Load>> FileReadArray successFlag **");
          uchar   successFlag[];
          if(FileReadArray(file_handle, successFlag, 0, StringLen("Saved successfully!") ) > 0)/*__ERROR__DONT USE SIZEOF()__*/
                    if(CharArrayToString(successFlag) == "Saved successfully!") {/*Print("Network loaded successfully.");*/}
                    else
                    {         Print((string)n + "  Network loaded unsuccessfully(NotFull).  file..");
                              //FileClose(file_handle); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin");
                              return shutDown(false, "Load network error"); //
                    }
          //---
          //FileClose(file_handle);
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class COptimizer_GradiantDecent: public BaseNetWorkOptimizer
{
public:
          COptimizer_GradiantDecent(void) {};
          ~COptimizer_GradiantDecent(void) {};
          //--------------------------------
          bool backPropagate_Net_WeightBefore( int epocheAll, int epocheAllIdx, uint BatchCount);
          //

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool COptimizer_GradiantDecent::backPropagate_Net_WeightBefore( int epocheAll, int epocheAllIdx, uint BatchCount)
{         //Print("Network Net::backPropagate_Net_WeightBefore...!", " m_SampleCurr ", (string)m_SampleCurr);
          if(DataSetTarget[m_SampleCurr].Total() != m_topology[ArraySize(m_topology) - 1])
          {         Print("OnTraining->Incompatible DataSetTargets", "  DataSetTarget[index].Total():",
                          (string)DataSetTarget[m_SampleCurr].Total(), "  m_topology[ArraySize(m_topology) - 1)", (string)m_topology[ArraySize(m_topology) - 1]); return false; }
          if(errorFlag)return false;
          //---
          NN_Neurons_Matrix_YX_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          //**********************************************************************************************************************************
          //--- make output neurons calculate their output gradients
          for(int n = 0; n < outputLayer.Total() - 1/* withoutbias */ && !IsStopped(); ++n)//gradiant not calced for bias
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = outputLayer[n]; neuron.calcOutputGradients(DataSetTarget[m_SampleCurr][n]); }
          //**********************************************************************************************************************************
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2/* before last layer */; layerNum > 0 /* after frist layer */ && !IsStopped(); --layerNum)
          {         NN_Neurons_Matrix_YX_CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
                    //---
                    for(int n = 0; n < hiddenLayer.Total() - 1/* without app bias */ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = hiddenLayer[n];
                              neuron.calcHiddenGradients(nextLayer);//
                    } //
          }
          //**********************************************************************************************************************************
          //--- make neurons update prevLayer connections feeding to them
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 1 && !IsStopped() ; --layerNum) /* frist layer has not previulayer*/
          {         NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    //---weight and bias sample not existed
                    for(int n = 0; n < layer.Total() - 1 /* without bias */ && !IsStopped(); ++n)
                    {         //Print("-------------layer.Total():",(string)layer.Total());//
                              NN_Neurons_Matrix_YX_CNeuron *neuron = layer[n];
                              neuron.updateWeights_GradiantDecent(prevLayer, m_error, m_recentAverageError, layerNum, n, BatchCount); //
                    } //
                    //
          } //
          //____________UPDATE BIAS_____________
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 1 && !IsStopped() ; --layerNum)
          {         NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    for(int n = 0; n < layer.Total() - 1 /* without bias */ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = layer[n];
                              //if(layerNum <= ArraySize(m_layers) - 1/* without fristlayer*/)
                              neuron.updateBias_GradiantDecent(prevLayer, layerNum, n, BatchCount); // _____WITH BIAS COPY REVERSE_____
                    }//
          }
          //
          IsMinError = getERORR_Net(DataSetTarget[m_SampleCurr]) < 0.01;
          return true;//
          /*
            //+------------------------------------------------------------------+
          //|        propagate backwards to make the network learn             |
          //+------------------------------------------------------------------+
          void CNet::backPropagateagate(const CArrayDouble &DataSetTarget) {
          if(errorFlag)
          return;
          //---
          CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          m_error = 0.0;
          for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n) {
          const CNeuron *neuron = outputLayer[n];
          double delta = DataSetTarget[n] - neuron.getNodeVal();
          m_error += delta * delta;
          }
          //--- calculate our RMS (m_recentAverageError)
          m_error /= outputLayer.Total() - 1;
          m_error = sqrt(m_error);
          m_recentAverageError = (m_recentAverageError * m_recentAverageSmoothingFactor +
                            m_error) / (m_recentAverageSmoothingFactor + 1.0);
          //--- make output neurons calculate their output gradients
          for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n) {
          CNeuron *neuron = outputLayer[n];
          neuron.calcOutputGradients(DataSetTarget[n]);
          }
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2; layerNum > 0 && !IsStopped(); --layerNum) {
          CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
          CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
          //---
          for(int n = 0; n < hiddenLayer.Total() /* with app bias * /&& !IsStopped(); ++n) {
            CNeuron *neuron = hiddenLayer[n];
            neuron.calcHiddenGradients(nextLayer);
          }
          }
          //--- make neurons update connections feeding to them
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 0 && !IsStopped(); --layerNum) {
          CLayer *layer = GetPointer(m_layers[layerNum]);
          CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
          //---
          for(int n = 0; n < layer.Total() - 1 && !IsStopped(); ++n) //without bias//
          {
            CNeuron *neuron = layer[n];
            neuron.updateInputWeights(prevLayer);
          }
          }
          }
          */
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class COptimizer_GradiantDecent_Momentom: public BaseNetWorkOptimizer
{
public:
          COptimizer_GradiantDecent_Momentom(void) {};
          ~COptimizer_GradiantDecent_Momentom(void) {};
          //--------------------------------
          virtual bool backPropagate_Net_WeightInside( int epocheAll, int epocheAllIdx, uint sampleCount);
          virtual bool backPropagate_Net_WeightBefore( int epocheAll, int epocheAllIdx, uint BatchCount);
          virtual bool backPropagate_Net_WeightBefore_Batch( int epocheAll, int epocheAllIdx, uint BatchCount);

          void Train(NN_Neurons_Matrix_YX_CNet &fnet);
          void Epocher(bool fIsRandom);
          void Sim(VectorZObj<VectorZ<double>>  *inputs, VectorZObj<VectorZ<double>>  *results, string s);
          //--------------------------------

};
void COptimizer_GradiantDecent_Momentom::Sim(VectorZObj<VectorZ<double>>  *inputs, VectorZObj<VectorZ<double>>  *results, string s)
{         m_Samples = inputs.Total();      DataSetInput = inputs; DataSetResult = results;
          if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet Sim_GradiantDecent_Momentom__START__");
          for(uint i = 0; i < m_Samples; i++)
          {         m_SampleCurr = i; //
                    feedForward_Net_WeightBefore( 1, s + "Sim_GradiantDecent_Momentom Show");
                    getResults(1);// Print("inputs.Total(): ",inputs.Total(),"  m_SampleCurr: ",m_SampleCurr);//
          } //_______SIM___HAS NOT TARGETS__________
          if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet Sim_GradiantDecent_Momentom__END__");
          results = GetPointer(DataSetResult); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void COptimizer_GradiantDecent_Momentom::Train(NN_Neurons_Matrix_YX_CNet &fnet)
{         //********************************************************* Start [Triaining] *********************************************************
          //net = GetPointer(fnet); setBack();
          datetime YX_InitTime = TimeLocal();
          datetime YX_CurrTime = TimeLocal();
          YX_InitTime = TimeLocal();
          //every epoch sample Q*H Change issue
          //********************************************************* Start [Triaining] Epoch : all sample used in training*********************************************************
          //while(MSE_Curr_Cheack_AllSample > IsMSEBreake)
          //----GRADIANT DECENT
          if(1)
          {         Epocher(false);
                    if(IsRMSE && 1)
                    {         if(1)Print( "MSE_Curr_Cheack_AllSample:", (string)calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ")); //
                              double MSE_Prev = 0.0;
                              uint Round = 0;
                              VectorZ<double> RMSEs; double RMSE_Mean_Prev = 0.0; double RMSE_Mean_Curr = 0.0;
                              while(calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ") > MinRMSE  )
                              {         Epocher(true);
                                        RMSEs << calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ");
                                        RMSE_Mean_Curr = RMSEs.Mean();
                                        //if(1)Print( "MSE_Curr_Cheack_AllSample:", (string)MSE_Curr_Cheack_AllSample); //
                                        if(0)
                                        {         if( RMSEs.Mean() < RMSE_Mean_Prev)
                                                  {         LearningRate -= 0.001; Momentom -= 0.001;
                                                            if(LearningRate < 0.001)      LearningRate  = 0.15;
                                                            if(Momentom < 0.001)          Momentom      = 0.50;
                                                            UpdateLearningRateMomentom(LearningRate, Momentom);//
                                                            //m_epochs -= 3;//
                                                  } //
                                                  else
                                                  {         LearningRate += 0.001; Momentom += 0.001;
                                                            if(LearningRate > 1.001)      LearningRate  = 0.15;
                                                            if(Momentom > 1.001)          Momentom      = 0.50;
                                                            UpdateLearningRateMomentom(LearningRate, Momentom); //
                                                            //m_epochs += 3; //
                                                  }//
                                        }//
                                        // m_epochs += MSE_Prev < calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ") ? +1 : -1;
                                        string Soz = "Round: " + (string)Round++ + "    MSE_Sampels:" + DoubleToStr(calculateRMSE_Samples( "OnTraining calculateRMSE_Samples "), 4) +
                                                     "  LR:" + DoubleToStr(LearningRate, 3) + "  MO:" + DoubleToStr(Momentom, 3);
                                        ObjectDelete(0,        "Fit Point.NN" + "MSE_Sampels");
                                        ObjectCreate(0,        "Fit Point.NN" + "MSE_Sampels", OBJ_LABEL, 0, 0, 0 ); //
                                        ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels", OBJPROP_TEXT,  Soz);
                                        ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels", OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels", OBJPROP_FONTSIZE, 10);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels", OBJPROP_XDISTANCE, ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0) / 2);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels", OBJPROP_YDISTANCE, 20);
                                        ObjectSetDouble(0,     "Fit Point.NN" + "MSE_Sampels", OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels", OBJPROP_ANCHOR, ANCHOR_CENTER);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels", OBJPROP_COLOR, clrWhite); //
                                        //
                                        NN_Neurons_Matrix_YX_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
                                        NN_Neurons_Matrix_YX_CNeuron *neuron = outputLayer[0];     // neuron.getGradient()
                                        string Soz1 = "MSE_MEAN:" + DoubleToStr(RMSEs.Mean(), 3)
                                                      + "  MSE_MEAN_Diff:" + DoubleToStr(MathAbs(RMSEs.Mean() - RMSE_Mean_Prev), 3)
                                                      + "  Gradient():"    + DoubleToStr(neuron.getGradient(), 6);
                                        ObjectDelete(0,        "Fit Point.NN" + "MSE_Sampels1");
                                        ObjectCreate(0,        "Fit Point.NN" + "MSE_Sampels1", OBJ_LABEL, 0, 0, 0 ); //
                                        ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels1", OBJPROP_TEXT,  Soz1);
                                        ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels1", OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels1", OBJPROP_FONTSIZE, 10);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels1", OBJPROP_XDISTANCE, ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0) / 2);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels1", OBJPROP_YDISTANCE, 40);
                                        ObjectSetDouble(0,     "Fit Point.NN" + "MSE_Sampels1", OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels1", OBJPROP_ANCHOR, ANCHOR_CENTER);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels1", OBJPROP_COLOR, clrWhite); //
                                        //
                                        string Soz2 = "  RMSEs.GetMin():" + DoubleToStr(RMSEs.GetMin(), 6) ;
                                        ObjectDelete(0,        "Fit Point.NN" + "MSE_Sampels2");
                                        ObjectCreate(0,        "Fit Point.NN" + "MSE_Sampels2", OBJ_LABEL, 0, 0, 0 ); //
                                        ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels2", OBJPROP_TEXT,  Soz2);
                                        ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels2", OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels2", OBJPROP_FONTSIZE, 10);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels2", OBJPROP_XDISTANCE, ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0) / 2);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels2", OBJPROP_YDISTANCE, 60);
                                        ObjectSetDouble(0,     "Fit Point.NN" + "MSE_Sampels2", OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels2", OBJPROP_ANCHOR, ANCHOR_CENTER);
                                        ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels2", OBJPROP_COLOR, clrWhite); //
                                        //if(MSE_Curr_Cheack_AllSampleLast == MSE_Curr_Cheack_AllSample && RMSE_Mean_Prev == RMSEs.Mean() ) break; //|| MeanOfMSE_Mean_Curr < MSE_Curr_Cheack_AllSample
                                        double MSE_MEAN_DIFF = MathAbs(RMSEs.Mean() - RMSE_Mean_Prev);
                                        //if(MSE_MEAN_DIFF < 0.05 && MSE_Curr_Cheack_AllSample > MinRMSE) break;
                                        RMSE_Mean_Prev = RMSEs.Mean();//
                                        MSE_Prev = calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ");; //
                              }//
                    }
                    //******************************************************************************
                    YX_CurrTime = TimeLocal();
                    //******************************************************************************
                    Print( "  Training_MSE:", DoubleToStr(calculateRMSE_Samples( "OnTraining calculateRMSE_Samples "), 7)); //
          }//
          //---ACCURANCY VALIDATION
          {         double expected = 0;
                    double predicted = 0;
                    double error = 0;
                    double allresult = 0;
                    for(uint i = 0; i < m_Samples; i++)
                    {         for(uint k = 0; k < (uint)DataSetResult[i].Total(); k++)
                              {         //--- check availability of results
                                        //Print("Result : ", DoubleToString(TrainingDataSetMatrix_Res[0].At(0), 4));
                                        //Print("Expected : ", DoubleToString(TrainingDataSetMatrix_Res[0].At(0), 4));
                                        //--- check accuracy
                                        expected = DataSetTarget[i][k];
                                        predicted = DataSetResult[i][k];
                                        //---
                                        error += MathAbs(predicted - expected);//
                              }//
                    }//
                    error = error / (m_Samples * 1);
                    double accuracy = 100.0 - (((error) / (1 + 1)) * 100);//
                    double mse = calculateRMSE_Samples(  "OnValidation calculateRMSE_Samples");
                    Print("Training_Accuracy : ", DoubleToString(accuracy, 2) + "%", "  Training_MSE:", DoubleToStr(mse, 7)); //
                    //Print("Result       : ", TimeToStr(TrainingDataSetMatrix_Res[0].At(0)), "  ", "Result2      : ", DoubleToStr(TrainingDataSetMatrix_Res[0].At(1), 2));
                    //Print("Expected : ", TimeToStr(TrainingDataSetMatrix_Out[0].At(0)), "  ", "Expected2 : ", DoubleToStr(TrainingDataSetMatrix_Out[0].At(1), 2));        //
                    Print( "Training_OneNeuronResult2      : ", DoubleToStr(DataSetResult[0][0], 2));
                    Print( "Training_OneNeuronExpected2 : ", DoubleToStr(DataSetTarget[0][0], 2));       //
                    //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void COptimizer_GradiantDecent_Momentom:: Epocher(bool fIsRandom)
{         //double        rms_ErrorLine[m_Samples][];   //---save netErrors every epoche reserve epochs count
          double        rms_ErrorLine[];
          ArrayResize(rms_ErrorLine, m_Samples);
          //-------------------------------
          bool IsRandomSample_ = IsRandomSample || fIsRandom; //
          m_SampleCurr = 0;//MathRand() % m_Samples;
          //
          for(uint j = 0;  j < m_epochs ; j++) //(j < epochs*100000) &&( (YX_CurrTime - YX_InitTime) < RunTimeLimit )
          {         //for(int i = 0; i < m_Samples; i++)
                    m_SampleCurr = MathRand() % m_Samples;
                    {         //******************************************************************************
                              //--- make the network predict the result
                              if(!feedForward_Net_WeightBefore( 0, "OnTraining")) return;
                              if(!backPropagate_Net_WeightBefore( m_epochs, 0,  m_Samples))return;
                              //******************************************************************************
                              ArrayResize(rms_ErrorLine, ArraySize(rms_ErrorLine) + 1);
                              //rms_ErrorLine[index][indexrms] = getRecentAverageError();
                              rms_ErrorLine[ArraySize(rms_ErrorLine) - 1] = getRecentAverageError(); //Print("myNet[i].getRecentAverageError():", (string)myNet[i].getRecentAverageError()); //
                              // Sleep(3000);
                              while(getRecentAverageError() > 66 && 0)
                              {         feedForward_Net_WeightBefore( 0, "OnTraining");
                                        backPropagate_Net_WeightBefore( m_epochs, 0, 1);
                                        Print("-----------------------epochs:", (string)m_epochs, "  ", "j:", (string)j,
                                              "   myNet[i].getRecentAverageError(): ", DoubleToStr(getRecentAverageError(), 2), "   myNet[i].getLastRMSError(): ", DoubleToStr(getLastRMSError(), 2)); //
                                        Sleep(10);//
                              }//
                              if(1 && 0)
                              {         double MSE_Curr_Cheack_OneSample = calculateRMSE_Sample("");
                                        double MSE_Curr_Cheack_OneSampleDelta = 0.0; //
                                        //(MSE_Curr_Cheack_OneSample < IsMSEBreake) ? m_epochs -= 1 : m_epochs += 1 ;//
                                        while(calculateRMSE_Sample("") > IsMSEBreake && 1)
                                        {         //--- make the network predict the result
                                                  if(!feedForward_Net_WeightBefore( 0, "OnTraining")) return;
                                                  if(!backPropagate_Net_WeightBefore( m_epochs, 0,  m_Samples))return; //
                                                  NN_Neurons_Matrix_YX_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
                                                  NN_Neurons_Matrix_YX_CNeuron *neuron = outputLayer[0];     // neuron.getGradient()
                                                  if(1)Print(           " calculateRMSE_Sample(""):",           (string)calculateRMSE_Sample(""),
                                                                                  " outputLayer.neuron.Gradiant:",        (string)neuron.getGradient(),
                                                                                  " outputLayer.neuronVal;:",             (string)neuron.getNodeVal(),
                                                                                  " outputLayer.neuronTarget:",           (string)DataSetTarget[m_SampleCurr][0]); //
                                                  if(MSE_Curr_Cheack_OneSample == calculateRMSE_Sample(""))break; //
                                                  MSE_Curr_Cheack_OneSampleDelta =  calculateRMSE_Sample("") - MSE_Curr_Cheack_OneSampleDelta; //
                                                  if(MSE_Curr_Cheack_OneSampleDelta <= 0.001)break; //
                                        } //
                              } //
                    } //
                    //Print("epochs:", (string)epochs, "  ", "j:", (string)j, "  ", (string)((double)(YX_CurrTime - YX_InitTime)), "  ", (datetime)YX_InitTime, "  ", (datetime)YX_CurrTime); //
                    //******************************************************************************
                    if(0 && IsRandomSample_)
                    {         m_SampleCurr++;//
                              if(m_SampleCurr >= m_Samples)m_SampleCurr = 0;//
                    } //
          } //
}//

//+------------------------------------------------------------------+
//|        propagate backwards to make the network learn             |
//+------------------------------------------------------------------+
bool COptimizer_GradiantDecent_Momentom::backPropagate_Net_WeightBefore( int epocheAll, int epocheAllIdx, uint BatchCount)
{         //Print("Network Net::backPropagate_Net_WeightBefore...!", " m_SampleCurr ", (string)m_SampleCurr);
          if(DataSetTarget[m_SampleCurr].Total() != m_topology[ArraySize(m_topology) - 1])
          {         Print("OnTraining->Incompatible DataSetTargets", "  DataSetTarget[index].Total():",
                          (string)DataSetTarget[m_SampleCurr].Total(), "  m_topology[ArraySize(m_topology) - 1)", (string)m_topology[ArraySize(m_topology) - 1]); return false; }
          if(errorFlag)return false;
          //---
          if(0)
          {         NN_Neurons_Matrix_YX_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
                    if(IsMinError)return true;//
                    getERORR_Net(DataSetTarget[m_SampleCurr]);
                    if(getRecentAverageError() < 0.01 || m_error < 0.001) return true; //___NOT UPDATE WEIGHT AND BIAS___
                    //----------------------------------------------------------------------------------------------------------------------------------
                    if(0)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron0 = outputLayer[0];     //
                              double delta = DataSetTarget[m_SampleCurr][0] - neuron0.getNodeVal(); double m_gradient = -2 * delta * neuron0.activationDerivative(neuron0.getNodeVal());
                              if(MathAbs(m_gradient) < 0.001) { Print(" Minimum Gradiant Reached:", DoubleToStr(m_gradient, 6)); return true;} //___NOT UPDATE WEIGHT AND BIAS___
                    } //
          }
          NN_Neurons_Matrix_YX_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          //**********************************************************************************************************************************
          //--- make output neurons calculate their output gradients
          for(int n = 0; n < outputLayer.Total() - 1/* withoutbias */ && !IsStopped(); ++n)//gradiant not calced for bias
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = outputLayer[n]; neuron.calcOutputGradients(DataSetTarget[m_SampleCurr][n]); }
          //**********************************************************************************************************************************
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2/* before last layer */; layerNum > 0 /* after frist layer */ && !IsStopped(); --layerNum)
          {         NN_Neurons_Matrix_YX_CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
                    //---
                    for(int n = 0; n < hiddenLayer.Total() - 1/* without app bias */ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = hiddenLayer[n];
                              neuron.calcHiddenGradients(nextLayer);//
                    } //
          }
          //**********************************************************************************************************************************
          //--- make neurons update prevLayer connections feeding to them
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 1 && !IsStopped() ; --layerNum) /* frist layer has not previulayer*/
          {         NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    //---weight and bias sample not existed
                    for(int n = 0; n < layer.Total() - 1 /* without bias */ && !IsStopped(); ++n)
                    {         //Print("-------------layer.Total():",(string)layer.Total());//
                              NN_Neurons_Matrix_YX_CNeuron *neuron = layer[n];
                              neuron.updateWeights_GradiantDecent_Momentom(prevLayer, m_error, m_recentAverageError, layerNum, n, BatchCount); //
                    } //
                    //
          } //
          //____________UPDATE BIAS_____________
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 1 && !IsStopped() ; --layerNum)
          {         NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    for(int n = 0; n < layer.Total() - 1 /* without bias */ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = layer[n];
                              //if(layerNum <= ArraySize(m_layers) - 1/* without fristlayer*/)
                              neuron.updateBias_GradiantDecent_Momentom(prevLayer, layerNum, n, BatchCount); // _____WITH BIAS COPY REVERSE_____
                    }//
          }
          //
          IsMinError = getERORR_Net(DataSetTarget[m_SampleCurr]) < 0.01;
          return true;//
          /*
            //+------------------------------------------------------------------+
          //|        propagate backwards to make the network learn             |
          //+------------------------------------------------------------------+
          void CNet::backPropagateagate(const CArrayDouble &DataSetTarget) {
          if(errorFlag)
          return;
          //---
          CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          m_error = 0.0;
          for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n) {
          const CNeuron *neuron = outputLayer[n];
          double delta = DataSetTarget[n] - neuron.getNodeVal();
          m_error += delta * delta;
          }
          //--- calculate our RMS (m_recentAverageError)
          m_error /= outputLayer.Total() - 1;
          m_error = sqrt(m_error);
          m_recentAverageError = (m_recentAverageError * m_recentAverageSmoothingFactor +
                            m_error) / (m_recentAverageSmoothingFactor + 1.0);
          //--- make output neurons calculate their output gradients
          for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n) {
          CNeuron *neuron = outputLayer[n];
          neuron.calcOutputGradients(DataSetTarget[n]);
          }
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2; layerNum > 0 && !IsStopped(); --layerNum) {
          CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
          CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
          //---
          for(int n = 0; n < hiddenLayer.Total() /* with app bias * /&& !IsStopped(); ++n) {
            CNeuron *neuron = hiddenLayer[n];
            neuron.calcHiddenGradients(nextLayer);
          }
          }
          //--- make neurons update connections feeding to them
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 0 && !IsStopped(); --layerNum) {
          CLayer *layer = GetPointer(m_layers[layerNum]);
          CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
          //---
          for(int n = 0; n < layer.Total() - 1 && !IsStopped(); ++n) //without bias//
          {
            CNeuron *neuron = layer[n];
            neuron.updateInputWeights(prevLayer);
          }
          }
          }
          */
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool COptimizer_GradiantDecent_Momentom::backPropagate_Net_WeightInside( int epocheAll, int epocheAllIdx, uint sampleCount)
{         //Print("Network Net::backPropagate_Net_WeightInside...!", " m_SampleCurr ", (string)m_SampleCurr);
          if(DataSetTarget[m_SampleCurr].Total() != m_topology[ArraySize(m_topology) - 1])
          {         Print("OnTraining->Incompatible DataSetTargets", "  DataSetTarget[index].Total():",
                          (string)DataSetTarget[m_SampleCurr].Total(), "  m_topology[ArraySize(m_topology) - 1)", (string)m_topology[ArraySize(m_topology) - 1]); return false; }
          if(errorFlag)return false;
          //---
          if(IsMinError)return true;//
          NN_Neurons_Matrix_YX_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          getERORR_Net(DataSetTarget[m_SampleCurr]);
          //**********************************************************************************************************************************
          //--- make output neurons calculate their output gradients
          for(int n = 0; n < outputLayer.Total() - 1/* withoutbias */ && !IsStopped(); ++n)//gradiant not calced for bias
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = outputLayer[n]; neuron.calcOutputGradients(DataSetTarget[m_SampleCurr][n]); }
          //**********************************************************************************************************************************
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2/* before last layer */; layerNum > 0 /* after frist layer */ && !IsStopped(); --layerNum)
          {         NN_Neurons_Matrix_YX_CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
                    //---
                    for(int n = 0; n < hiddenLayer.Total()/* with bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = hiddenLayer[n];
                              neuron.calcHiddenGradientsBook(nextLayer);//
                    } //
          }
          //**********************************************************************************************************************************
          //--- make neurons update prevLayer connections feeding to them
          if(1)
          {         for(int layerNum = ArraySize(m_layers) - 1; layerNum > 1 && !IsStopped(); --layerNum)
                    {         NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNum]);
                              NN_Neurons_Matrix_YX_CLayer *prevlayer = GetPointer(m_layers[layerNum - 1]);
                              //------------
                              for(int n = 0; n < layer.Total() - 1 /* without bias */ && !IsStopped(); ++n)
                              {         //------------
                                        NN_Neurons_Matrix_YX_CNeuron *neuron = layer[n];//
                                        for(int i = 0; i <  neuron.getWeightSize(); i++)
                                        {         NN_Neurons_Matrix_YX_CNeuron *prevneuron = prevlayer[i];//
                                                  const double oldDelta = neuron.getWeigth(i, __LINE__).deltaWeight; //oldDelta = prevLayerInputneuron.outputWeights[m_myIndex].deltaWeight;
                                                  // -eta not wotk
                                                  double newDelta = (-neuron.getEta() * prevneuron.getNodeVal() * /* next layer */ neuron.getGradient() + neuron.getAlpha() * oldDelta);
                                                  //newDelta = (1 / sampleCount) * newDelta;
                                                  //---
                                                  neuron.getWeigth(i, __LINE__).deltaWeight = newDelta;
                                                  neuron.getWeigth(i, __LINE__).weight += newDelta; //
                                        }//
                              }
                              //------------
                    }//
          }//
          IsMinError = getERORR_Net(DataSetTarget[m_SampleCurr]) < 0.01;
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class COptimizer_Conjugate_Gradiant: public BaseNetWorkOptimizer
{
public:
          COptimizer_Conjugate_Gradiant(void) {};
          ~COptimizer_Conjugate_Gradiant(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class COptimizer_Quasi_Newton: public BaseNetWorkOptimizer
{
public:
          COptimizer_Quasi_Newton(void) {};
          ~COptimizer_Quasi_Newton(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define IsDebugPrintLevenberg 0
#define IsDebugPrintLevenbergExe 0
class COptimizer_Levenberg_Marquardt: public BaseNetWorkOptimizer
{
public:
          COptimizer_Levenberg_Marquardt(void)
          {};
          ~COptimizer_Levenberg_Marquardt(void)
          {         delete ErrorsQ;
                    delete Gradiants;
                    delete Hessians;
                    delete Jacobian;
                    delete ErrorsQ;
                    delete ValueQ;
                    layers.clear();//3
                    //delete W1; delete B1; delete W2; delete B2;//
          };
          //
          VectorZObj<VectorZ<double>>    *Gradiants;
          VectorZObj<VectorZ<double>>    *Hessians;
          VectorZObj<VectorZ<double>>    *Jacobian;
          VectorZObj<VectorZ<double>>    *ErrorsQ;
          VectorZObj<VectorZ<double>>    *ValueQ;
          VectorZObj<VectorZ<double>>    *ValueQin[];
          //--------------------------------
          bool  feedForward_Net_WeightBefore( bool b, string s);
          bool  backPropagate_Net_WeightBefore( int epocheAll, int epocheAllIdx, uint BatchCount);
          void  backPropagate_Net();
          void  Train();
          //-----------------------
          void  Sim(VectorZObj<VectorZ<double>>  &inputs, VectorZObj<VectorZ<double>>  &results, string s);
          void  TrainMatrix();
          VectorZ<uint>                 layers;
          CMatirx_Vector<double>        W1, W2, W3;
          CMatirx_Vector<double>        B1, B2, B3;
          //
          void  feedforward(CMatirx_Vector<double> &input_net, CMatirx_Vector<double> &y1, CMatirx_Vector<double> &y2);
          void  backpropagation(CMatirx_Vector<double> &out_net);
          //double ActivationRelu(double x) {return x;}
          //double DerivationRelu(double x) {return 1;}
          CMatirx_Vector<double>ActivationRelu(CMatirx_Vector<double> &M)
          {         CMatirx_Vector<double>out(M._rows, M._cols);
                    for(uint y = 0; y < M._rows; y++)
                    {         for(uint x = 0; x < M._cols; x++)
                              {         out.setAt(y, x, M.getAt(y, x)); //
                              }//
                    }//
                    return out;//
          }
          CMatirx_Vector<double>DerivationRelu(CMatirx_Vector<double> &M)
          {         CMatirx_Vector<double>out(M._rows, M._cols);
                    for(uint y = 0; y < M._rows; y++)
                    {         for(uint x = 0; x < M._cols; x++)
                              {         out.setAt(y, x, 1); //
                              }//
                    }//
                    return out;//
          }
          CMatirx_Vector<double>ActivationSigmoid(CMatirx_Vector<double> &M)
          {         CMatirx_Vector<double>out(M._rows, M._cols);
                    for(uint y = 0; y < M._rows; y++)
                    {         for(uint x = 0; x < M._cols; x++)
                              {         //1.0 / (1 + exp(f * -x) )
                                        double val = 1.0 / (1.0 + exp(1.0 * -M.getAt(y, x)));
                                        out.setAt(   y, x, val )    ; //
                              }//
                    }//
                    return out;//
          }
          //double ActivationSigmoid(double x) {return 1 / (1 + exp(-x));}
          //double DerivationSigmoid(double x) {return x * (1 - x);}
          CMatirx_Vector<double>DerivationSigmoid(CMatirx_Vector<double> &M)
          {         CMatirx_Vector<double>out(M._rows, M._cols);
                    for(uint y = 0; y < M._rows; y++)
                    {         for(uint x = 0; x < M._cols; x++)
                              {         out.setAt(y, x, M.getAt(y, x) * (1 - M.getAt(y, x))); //
                              }//
                    }//
                    return out;//
          }
          void Draw(VectorZObj<VectorZ<double>> &times, VectorZObj<VectorZ<double>> &prices)
          {         //ObjectsDeleteAll(0, "Fit Point.NN");
                    int nameCounterSampleResult = 0;
                    for(uint i = 0 ; i < times.Total(); i++) //sample based
                    {         //if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]show result...!");
                              for(int j = 0; j < times[0].Total(); j += 1)
                              {         //-----------------------------------------------------------
                                        datetime time = 0;
                                        //if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]show result..0.!");
                                        time = (datetime)times[i][j];
                                        //time = iTime(_Symbol, PeriodWork, gapsamples  + j);
                                        //time = iTime(_Symbol, PeriodWork, YX_Trainingtar_index_T0 + (i * DataElementsPack) + (i * DataSamplePartsGap) - j);
                                        //if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]show result..2.!");
                                        double price = prices[i][j] + 0.0;
                                        string nameResult =  "Fit Point.NN-LM-Training------Result:" + (string)(j) + ":" + (string)(i) + "  " + string(prices[i].Total());
                                        ObjectDelete(0,         nameResult);
                                        ObjectCreate(0,         nameResult, OBJ_TEXT, 0, (datetime)time, price ); //
                                        ObjectSetString(0,      nameResult, OBJPROP_TEXT, "*");
                                        ObjectSetString(0,      nameResult, OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,     nameResult, OBJPROP_FONTSIZE, 14);
                                        ObjectSetDouble(0,      nameResult, OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,     nameResult, OBJPROP_ANCHOR, 0);
                                        ObjectSetInteger(0,     nameResult, OBJPROP_COLOR, clrOrange); //
                              }//
                              //if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]show result..END.!");//
                    } //
          }//
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void COptimizer_Levenberg_Marquardt::Sim(VectorZObj<VectorZ<double>>  &inputs, VectorZObj<VectorZ<double>>  &results, string soz)
{         m_Samples = inputs.Total();      DataSetInput = inputs; DataSetResult = results;
          CMatirx_Vector<double> inp = MAT.Convert_VVtoMV(inputs);
          Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_7_", "0:", 0); //
          for(uint s = 0; s < inputs.Total(); s++)
          {         CMatirx_Vector<double>inputfeature = inp[s];
                    CMatirx_Vector<double>y1(1, 1);
                    CMatirx_Vector<double>y2(1, 1);
                    //
                    feedforward(inputfeature, y1, y2);
                    //
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_7_", "0:", 0); //
                    DataSetResult[s].clear();
                    DataSetResult[s] << y2.getAt(0, 0); //
                    //inputfeature;
                    //y1;
                    //y2;//
          }//
          results = DataSetResult;
          //ZeroMemory( W1);
          //ZeroMemory( B1);
          ///ZeroMemory( W2);
          //ZeroMemory( B2);
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void COptimizer_Levenberg_Marquardt::TrainMatrix()
{         //return;//
          ObjectsDeleteAll(0, "Fit Point.NN-LM");
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_0_");//
          //----------------------------------------
          uint n0 = DataSetInput[0].Total();
          uint n1 = 9;
          uint n2 = 1;
          layers.clear(); //--structure of network--
          layers << DataSetInput[0].Total(); //---inputs--- === DataSetInput.shape(1);
          layers << n1;
          layers << n2;
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_1_");//
          //--------------------------------------------------------------------------------------------------
          //delete W1; delete B1; delete W2; delete B2;
          CMatirx_Vector<double> w1(layers[1], layers[0]); w1._vals.clear();
          CMatirx_Vector<double> w2(layers[2], layers[1]); w2._vals.clear();
          for(uint i = 0; i < layers[1]*layers[0]; i++)  { double val = InRange( 0, RAND_MAX_, -5, 5, rand()); w1._vals << val;} if(IsDebugPrintLevenbergExe) {Print(" W_All",  "   W1.getAt(0, 0): ", w1.getAt(0, 0), "  InRange: ", InRange( 0, RAND_MAX_, -1, 1, rand()));}
          for(uint i = 0; i < layers[2]*layers[1]; i++)  { double val = InRange( 0, RAND_MAX_, -5, 5, rand()); w2._vals << val;} if(IsDebugPrintLevenbergExe) {Print(" W_All",  "   W2.getAt(0, 0): ", w2.getAt(0, 0), "  InRange: ", InRange( 0, RAND_MAX_, -1, 1, rand()) );}
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_2_");//
          //--------------------------------------------------------------------------------------------------
          CMatirx_Vector<double> b1(layers[1], 1); b1._vals.clear();;
          CMatirx_Vector<double> b2(layers[2], 1); b2._vals.clear();;
          for(uint i = 0; i < layers[1]; i++)  { double val = InRange( 0, RAND_MAX_, -5, 5, rand()); b1._vals << val;} if(IsDebugPrintLevenbergExe) {Print(" W_All",  "   B1.getAt(0, 0): ", b1.getAt(0, 0), "  InRange: ", InRange( 0, RAND_MAX_, -1, 1, rand()));}
          for(uint i = 0; i < layers[2]; i++)  { double val = InRange( 0, RAND_MAX_, -5, 5, rand()); b2._vals << val;} if(IsDebugPrintLevenbergExe) {Print(" W_All",  "   B2.getAt(0, 0): ", b2.getAt(0, 0), "  InRange: ", InRange( 0, RAND_MAX_, -1, 1, rand()) );}
          //--------------------------------------------------------------------------------------------------
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_3_");//
          CMatirx_Vector<double>Inp = MAT.Convert_VVtoMV(DataSetInput);
          CMatirx_Vector<double>Tar = MAT.Convert_VVtoMV(DataSetTarget );
          uint Epochs = 100;
          double                        muAll                   = 0.1;///m_Samples; //___BIG(GRAFIANTDECENT)____LOW(NEUTONGAUS)___beleve percent
          uint Size = layers[1] * layers[0] + layers[2] * layers[1];
          CMatirx_Vector<double>Jacobians               = MAT.zeros(DataSetInput.Total(), Size);
          CMatirx_Vector<double>I_Weight                = MAT.eye(Size);
          CMatirx_Vector<double>W_All                   = MAT.zeros(1, Size); //one row
          //
          uint Size_Bias = layers[1] * layers[0] + layers[2] * layers[1] + layers[1] + layers[2];
          CMatirx_Vector<double>Jacobians_Bias          = MAT.zeros(DataSetInput.Total(), Size_Bias );
          CMatirx_Vector<double>I_Bias                  = MAT.eye(Size_Bias );
          CMatirx_Vector<double>W_All_Bias              = MAT.zeros(1, Size_Bias ); //one row
          CMatirx_Vector<double>W_All_Bias_Best         = MAT.zeros(1, Size_Bias ); //one row
          CMatirx_Vector<double>W_All_Bias_Delta        = MAT.zeros(1, Size_Bias );
          //-----------------------------------------------------------------------------------------------------------
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_4_");//
          //
          //CMatirx_Vector<double>        W1v = MAT.reshape(W1, layers[1] * layers[0], 1);
          //W_All                                         = MAT.Seter(W_All, W1v, 0, 1, 0, layers[1] * layers[0]);
          //if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_4_", "W_All1.Size():", W_All.Size()); //
          ////
          //CMatirx_Vector<double>        W2v = MAT.reshape(W2, layers[2] * layers[1], 1);
          //W_All                                         = MAT.Seter(W_All, W2v, 0, 1, layers[1] * layers[0], layers[1] * layers[0] + layers[2] * layers[1] );
          //if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5_", "W_All2.Size():", W_All.Size()); //
          //-----------------------------------------------------------------------------------------------------------
          W1 = w1; W2 = w2; B1 = b1; B2 = b2;
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5_");//
          //--withbias get
          CMatirx_Vector<double>W1v     = MAT.reshape(W1, layers[1] * layers[0], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, W1v, 0, 1, 0, layers[1] * layers[0]);
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5.1_");//
          CMatirx_Vector<double>B1v     = MAT.reshape(B1, layers[1], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, B1v, 0, 1, layers[1] * layers[0], layers[1] * layers[0] + layers[1] );
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5.2_");//
          //
          CMatirx_Vector<double>W2v     = MAT.reshape(W2, layers[2] * layers[1], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, W2v, 0, 1, layers[1] * layers[0] + layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] );
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5.3_");//
          CMatirx_Vector<double>B2v     = MAT.reshape(B2, layers[2], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, B2v, 0, 1, layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] );
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5.4_");//
          //-----------------------------------------------------------------------------------------------------------
          CMatirx_Vector<double>I_Run = I_Bias;
          //return;////__No Memory leak___________
          double RMSE_prev = 0;
          //------------------------------MATRIX CALCULATION---------------------------------
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6_");//
          for(uint i = 0; i < Epochs; i++)
          {         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1_");//
                    CMatirx_Vector<double>errorTrain = MAT.zeros(DataSetInput.Total(), 1);
                    for(uint s = 0; s < m_Samples; s++)
                    {         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.1_");//
                              CMatirx_Vector<double>    inputfeature = Inp[s];
                              CMatirx_Vector<double>    inputTargets = Tar[s];
                              CMatirx_Vector<double>    y1(1, n1) ;
                              CMatirx_Vector<double>    y2(1, n2);
                              //           f(w1p+b1)0
                              //        0  f(w1p+b1)0
                              //        0  f(w1p+b1)0   f(w2p+b2)0
                              //        0  f(w1p+b1)0
                              //           f(w1p+b1)0
                              feedforward(inputfeature, y1, y2);
                              //
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.2_", "0:", 0); //
                              CMatirx_Vector<double>error = (inputTargets - y2) ;/// m_Samples ; //
                              errorTrain.setAt(s, 0, error.getAt(0, 0));//invert worked
                              //-------------------------------------------------------------
                              CMatirx_Vector<double>d_f2       = DerivationRelu(y2);
                              CMatirx_Vector<double>d_f1       = DerivationSigmoid(y1);
                              //d_f1 = MAT.DataNormilizer(d_f1, -1, +1, SHORT_MIN, SHORT_MAX);
                              CMatirx_Vector<double>diag_d_f1  = MAT.diagflat(d_f1);
                              //
                              CMatirx_Vector<double>SL3        = d_f2 * -1; //-f'
                              CMatirx_Vector<double>FWL2       = W2 * SL3.getAt(0, 0); //f'W   //1*1 . 1*4  //target is x*1
                              CMatirx_Vector<double>SL2        = MAT.dot(FWL2, diag_d_f1); //f'WS
                              //
                              CMatirx_Vector<double>gW1        = MAT.dot(SL2.T(), inputfeature);
                              CMatirx_Vector<double>gB1        = SL2.T() * 1;
                              CMatirx_Vector<double>gW2        = MAT.dot(SL3.T(), y1);
                              CMatirx_Vector<double>gB2        = SL3.T() * 1;
                              //------------------------------------------------------------
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3_");//
                              //--------JACOBIANS-BIAS---ToptoDown-----------
                              CMatirx_Vector<double>gW1v        = MAT.reshape(gW1, layers[1] * layers[0], 1);
                              CMatirx_Vector<double>gB1v        = MAT.reshape(gB1, layers[1], 1);
                              //Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.1_");//
                              Jacobians_Bias                     = MAT.Seter(Jacobians_Bias, gW1v, s, s + 1, 0, layers[1] * layers[0]);
                              //Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.2_");//
                              Jacobians_Bias                     = MAT.Seter(Jacobians_Bias, gB1v, s, s + 1, layers[1] * layers[0], layers[1] * layers[0] + layers[1]);
                              //
                              CMatirx_Vector<double>gW2v        = MAT.reshape(gW2, layers[2] * layers[1], 1);
                              CMatirx_Vector<double>gB2v        = MAT.reshape(gB2, layers[2], 1);
                              //Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.3_");//
                              Jacobians_Bias                     = MAT.Seter(Jacobians_Bias, gW2v, s, s + 1, layers[1] * layers[0] + layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] );
                              //Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.4_");//
                              Jacobians_Bias                     = MAT.Seter(Jacobians_Bias, gB2v, s, s + 1,  layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2]);
                              //
                              /*
                              CMatirx_Vector<double> d_f3       = DerivationRelu(y3);
                              CMatirx_Vector<double> d_f2       = DerivationSigmoid(y2);
                              CMatirx_Vector<double> diag_d_f2  = MAT.diagflat(d_f2);
                              CMatirx_Vector<double> d_f1       = DerivationSigmoid(y1);
                              CMatirx_Vector<double> diag_d_f1  = MAT.diagflat(d_f1);
                              //
                              CMatirx_Vector<double> temp1L4  =  d_f3 * -1;
                              CMatirx_Vector<double> temp2L3  =  W3 * temp1L4.getAt(0, 0); //1*1 . 1*4  //target is x*1
                              CMatirx_Vector<double> temp3L3  =  MAT.dot(temp2L3, diag_d_f2);
                              CMatirx_Vector<double> temp4L2  =  MAT.dot(temp3L3, W2);
                              CMatirx_Vector<double> temp5L2  =  MAT.dot(temp4L2, diag_d_f1);
                              CMatirx_Vector<double> temp5TL2 =  temp5L2.T();
                              CMatirx_Vector<double> temp6L1  =  MAT.dot(temp5TL2, inputfeature);
                              //
                              CMatirx_Vector<double> gW1    = temp6L1;
                              CMatirx_Vector<double> gB1    = temp5TL2;
                              CMatirx_Vector<double> gW2    = MAT.dot(temp3L3.T(), y1);
                              CMatirx_Vector<double> gB2    = temp3L3.T();
                              CMatirx_Vector<double> gW3    = MAT.dot(temp1L4.T(), y2);;
                              CMatirx_Vector<double> gB3    = temp1L4.T();

                              */
                    } //
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.2_");//
                    //------------------------------MATRIX CALCULATION---------------------------------
                    double eTe =  errorTrain.T().dot(errorTrain).getAt(0, 0);//____ErrorAdaptive__Make overRange____
                    double mu  =  1 * muAll ;
                    Print("muAll:", muAll, "  mu:", mu, "  eTe:", eTe);
                    CMatirx_Vector<double>JacobianCalc            = Jacobians_Bias;                                               if(IsDebugPrintLevenberg)Print(" JacobianCalc", "  mu:", mu);//
                    CMatirx_Vector<double>JacobianCalc_tran       = JacobianCalc.T();                                             if(IsDebugPrintLevenberg)Print(" JacobianCalc_tran");//
                    CMatirx_Vector<double>JacobianCalc_Mul        = JacobianCalc_tran.multiply(JacobianCalc);                     if(IsDebugPrintLevenberg)Print(" JacobianCalc_Mul");
                    CMatirx_Vector<double>IdentifyMu              = I_Run * mu;                                                   if(IsDebugPrintLevenberg)Print(" Identify * Mu"); //
                    CMatirx_Vector<double>JacobianCalcIdentifyMu  = JacobianCalc_Mul + IdentifyMu;                                if(IsDebugPrintLevenberg)Print(" JacobianCalc + IdentifyMu");//
                    CMatirx_Vector<double>HesianInvert            = JacobianCalcIdentifyMu.invert2();                             if(IsDebugPrintLevenberg)Print(" HesianInvert");//
                    CMatirx_Vector<double>HesianJacobianT         = MAT.dot(HesianInvert, JacobianCalc_tran);                     if(IsDebugPrintLevenberg)Print(" HesianJacobianT");//
                    CMatirx_Vector<double>HesianJacobianTError    = MAT.dot(HesianJacobianT, errorTrain);                         if(IsDebugPrintLevenberg)Print(" HesianJacobianTError");//
                    //HesianJacobianTError.Printer("HesianJacobianTError          ");
                    //errorTrain;
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------1 / m_Samples  0.05
                    if(IsDebugPrintLevenbergExe)Print(" W_All_Bias",  " before hessian W_All_Bias.getAt(0,0):", W_All_Bias.getAt(0, 0), "  HesianJacobianTError.T().getAt(0,0):", HesianJacobianTError.T().getAt(0, 0)); //
                    CMatirx_Vector<double>W_All_Bias_Rand                      = MAT.Rand(1, Size_Bias, -0.00005, +0.00005); //one row
                    W_All_Bias_Delta                                           = W_All_Bias * 1;
                    //if(i < 2)                                                    W_All_Bias_Best = W_All_Bias;
                    W_All_Bias                                                 = W_All_Bias - HesianJacobianTError.T();
                    double RandPercent1 = InRange( 0, RAND_MAX_, 0.00001, 0.25, rand());
                    double RandPercent2 = 0.25 - RandPercent1;
                    CMatirx_Vector<double>W_All_Bias_temp1      = W_All_Bias         * RandPercent1;
                    CMatirx_Vector<double>W_All_Bias_temp2      = W_All_Bias_Rand    * (RandPercent2 / 1000);
                    double eta   =0.50;
                    double alpha =0.50;
                    W_All_Bias                                  = ((W_All_Bias * eta) + (W_All_Bias_Delta * alpha));//++
                    //------------------------------------------------------------------------------------------
                    //if(RMSE_prev > calculateRMSE_Samples( "Levenberg")) { W_All_Bias_Best     = W_All_Bias; }
                    //W_All_Bias.Printer("W_All_Bias  Setupdate                        ");
                    //HesianJacobianTError.T().Printer("HesianJacobianTError.T()  ");
                    if(IsDebugPrintLevenberg)Print(" W_All",  "  W_All_Bias.getAt(0,0):", W_All_Bias.getAt(0, 0)); //
                    if(IsDebugPrintLevenbergExe)Print(" W_All",  " affter hessian W_All_Bias.getAt(0,0):", W_All_Bias.getAt(0, 0)); //
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_24_", "W_All_Bias.Size():", W_All_Bias.Size()); //
                    //
                    //W1  = MAT.geter(W_All, 0, 1, 0, layers[1] * layers[0], layers[1], layers[0]);
                    //if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_25_", "W_All1.Size():", W1.Size()); //
                    //W2  = MAT.geter(W_All, 0, 1, layers[1] * layers[0], layers[1] * layers[0] + layers[2] * layers[1], layers[2], layers[1]);
                    //if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_26_", "W_All2.Size():", W_All.Size()); //
                    //W3  = MAT.geter(W_All, 0, 1, layers[1] * layers[0] + layers[2] * layers[1], layers[1] * layers[0] + layers[2] * layers[1] +  layers[2], layers[3], layers[2]);
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------
                    //delete W1; delete B1; delete W2; delete B2;
                    //--withbias set
                    W1  = MAT.geter(W_All_Bias, 0, 1, 0, layers[1] * layers[0], layers[1], layers[0]); //W1.Printer("W1
                    //W1.Printer("W1          ", 200); //                      ");
                    B1  = MAT.geter(W_All_Bias, 0, 1, layers[1] * layers[0], layers[1] * layers[0] + layers[1], layers[1], 1); //B1.Printer("B1                          ");
                    //B1.Printer("B1          ", 200); //
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_25_", "W_All1.Size():", W1.Size()); //
                    W2  = MAT.geter(W_All_Bias, 0, 1, layers[1] * layers[0] + layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[2], layers[1]);
                    //W2.Printer("W2          ", 200); //
                    B2  = MAT.geter(W_All_Bias, 0, 1, layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2], layers[2], 1);
                    //B2.Printer("B2          ", 200); //
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_26.00_", "W_All1.Size():", W1.Size()); //
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------
                    for(uint s = 0; s < m_Samples; s++)
                    {         CMatirx_Vector<double>inputfeature = Inp[s];
                              //inputfeature.Printer("inputfeature          ");
                              CMatirx_Vector<double>y1(1, n1);
                              CMatirx_Vector<double>y2(1, n2);
                              //
                              feedforward(inputfeature, y1, y2);
                              //
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_7_", "0:", 0); //
                              DataSetResult[s].clear();
                              DataSetResult[s] << y2.getAt(0, 0); //
                              //y2.Printer("y2          ", 200); //
                              //inputfeature;//
                              //y1;//
                              //y2;//
                    }
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_27.00_", "W_All1.Size():", W1.Size()); //
                    //
                    Draw(DataSetTargetTime, DataSetResult);//
                    double RMSE = calculateRMSE_Samples( "Levenberg"); RMSE_prev = RMSE;
                    Print("__EPOCH__", i, "__RMSE:( ", RMSE, " )__mu__", mu); //
                    //Sleep(500);//
          }
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __END__");//
          //---------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void COptimizer_Levenberg_Marquardt::feedforward(CMatirx_Vector<double> &input_net, CMatirx_Vector<double> &y1, CMatirx_Vector<double> &y2)
{         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::feedforward __Start_0_", "0:", 0); //
          //feedForward
          if(IsDebugPrintLevenberg)
                    Print("COptimizer_Levenberg_Marquardt::TrainMatrix() feedforward__Start_1_", "  W1.Size():", W1.Size(),
                          "  input_net.Size():", input_net.Size(), "  B1.Size():", B1.Size()); //
          CMatirx_Vector<double>  inp = input_net.T();//
          CMatirx_Vector<double>  Winp = MAT.dot( W1, inp);
          CMatirx_Vector<double>  WinpB = Winp + B1;
          CMatirx_Vector<double>  x1 = WinpB ; //+ B1  1 * 2 , 2 * 1
          //inp;
          //Winp;
          //Print(InRange( -DBL_MAX/2, DBL_MAX/2, -1, +1, MathRand())); return;//-DBL_MAX, DBL_MAX>>-nan(ind)----DBL_MAX/2, DBL_MAX/2 worked
          //x1.Printer("x1  before n        ", 500); //
          //x1 = MAT.DataNormilizer(x1,SHORT_MIN, SHORT_MAX,-1, +1);
          //x1.Printer("x1  after n        ", 500); //
          y1 = ActivationSigmoid(x1);
          //WinpB;//
          //x1;//
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::feedforward __Start_2_", "  W2.Size():", W2.Size(), "  y1.Size():", y1.Size(), "  B2.Size():", B2.Size()); //
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::feedforward __Start_2_", "  W2._rows:", W2._rows, "  W2._cols:", W2._cols
                                                   , "  y1._rows:", y1._rows, "  y1._cols:", y1._cols); //
          CMatirx_Vector<double>Winp2 = MAT.dot( W2, y1);
          if(IsDebugPrintLevenberg)Print(  "  Winp2._rows:", Winp2._rows, "  Winp2._cols:", Winp2._cols, "  B2._rows:", B2._rows, "  B2._cols:", B2._cols);
          CMatirx_Vector<double>WinpB2 = Winp2 + B2;
          CMatirx_Vector<double>x2     = WinpB2;; //  1 * 2 * 2 * 1
          //x2.Printer("x2          ", 200); //
          y2 = x2;
          //x2;//
          //Winp2;
          //WinpB2;
          //
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::feedforward __Start_3_", "0:", 0); //
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void COptimizer_Levenberg_Marquardt::backpropagation(CMatirx_Vector<double> &out_net)
{         //backpropagation
}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void COptimizer_Levenberg_Marquardt::Train()
{         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Train() __Start__");//
          Print("----88------COptimizer_Levenberg_Marquardt::", Name);
          TrainMatrix(); return;
          return;//
}
//+------------------------------------------------------------------+
//|        propagate forward to get a prediction                     |&& !IsStopped()
//+------------------------------------------------------------------+
bool COptimizer_Levenberg_Marquardt::feedForward_Net_WeightBefore( bool b, string s)
{         //Print("Network Net::feedForward_Net_WeightBefore...!");
          if(DataSetInput[m_SampleCurr].size() != m_topology[0])
          {         Print(s + "  Incompatible inputs! ", (string)DataSetInput[m_SampleCurr].size(), "  m_topology[ArraySize(m_topology) - 1)", (string)m_topology[0]); return false; }
          if(errorFlag)return false;
          //---
          NN_Neurons_Matrix_YX_CLayer *inputLayer = GetPointer(m_layers[0]);
          if(DataSetInput[m_SampleCurr].size() != inputLayer.Total() - 1)//--free_node
          {         Print(s + "----ddd---DataSetInput[m_SampleCurr].Total(): ", DataSetInput[m_SampleCurr].size(), "----ddd---inputLayer.Total() - 1:  ", inputLayer.Total() - 1); Sleep(3000); ///
                    shutDown(0, s + " Invalid pointer feedForward_Net" +
                             "  <DataSetInput[m_SampleCurr].Total():inputLayer.Total() - 1>" + (string)DataSetInput[m_SampleCurr].Total() + ":" + (string)(inputLayer.Total() - 1) + "  "); Sleep(3000); return false; }
          //---Set inp Neurons val from inputs val
          for(uint i = 0; i < (uint)DataSetInput[m_SampleCurr].size() && !IsStopped(); ++i)
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = inputLayer.At(i);
                    neuron.setNodeVal(DataSetInput[m_SampleCurr][i]); //
                    //if(b) {Print("DataSetInput[m_SampleCurr][i]: ", DataSetInput[m_SampleCurr][i], "  m_SampleCurr: ", m_SampleCurr); Sleep(2000);} //
          }
          //---Next layer neuron set
          for(uint layerNum = 1/* secound layer */; layerNum < (uint)ArraySize(m_layers) /* all layer */ && !IsStopped(); ++layerNum)
          {         NN_Neurons_Matrix_YX_CLayer *layer     = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    //---
                    for(int neuronNum = 0; neuronNum < layer.Total() - 1/* with out bias */ && !IsStopped(); ++neuronNum)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = layer[neuronNum];
                              neuron.feedForward_Neuron(prevLayer, layerNum, neuronNum); //
                              // get sample layers values
                              //Print("ArraySize(ValueQin):",ArraySize(ValueQin),"        layerNum:",layerNum);
                              ValueQin[layerNum][m_SampleCurr] << neuron.getNodeVal();//
                    }//
          }//
          //**********************************************************************************************************************************
          // get sample out values
          NN_Neurons_Matrix_YX_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          ErrorsQ[m_SampleCurr].clear();
          for(int n = 0; n < outputLayer.Total() - 1/* withoutbias */ && !IsStopped(); ++n)//gradiant not calced for bias
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = outputLayer[n]; ValueQ[m_SampleCurr] << neuron.getNodeVal(); }
          //-------------------------------------------------------------------------------------------------------------
          // get sample error values
          for(int n = 0; n < outputLayer.Total() - 1/* withoutbias */ && !IsStopped(); ++n)//gradiant not calced for bias
          {         ErrorsQ[m_SampleCurr] << (DataSetTarget[m_SampleCurr][n] - ValueQ[m_SampleCurr][n]); }//
          //**********************************************************************************************************************************
          return true; //
}
//+------------------------------------------------------------------+
//|        propagate backwards to make the network learn             |
//+------------------------------------------------------------------+
bool COptimizer_Levenberg_Marquardt::backPropagate_Net_WeightBefore( int epocheAll, int epocheAllIdx, uint BatchCount)
{         //Print("Network Net::backPropagate_Net_WeightBefore...!", " m_SampleCurr ", (string)m_SampleCurr);
          if(DataSetTarget[m_SampleCurr].Total() != m_topology[ArraySize(m_topology) - 1])
          {         Print("OnTraining->Incompatible DataSetTargets", "  DataSetTarget[index].Total():",
                          (string)DataSetTarget[m_SampleCurr].Total(), "  m_topology[ArraySize(m_topology) - 1)", (string)m_topology[ArraySize(m_topology) - 1]); return false; }
          if(errorFlag)return false;
          //---
          NN_Neurons_Matrix_YX_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          //**********************************************************************************************************************************
          //**********************************************************************************************************************************
          //--- make output neurons calculate their output gradients
          for(int n = 0; n < outputLayer.Total() - 1/* withoutbias */ && !IsStopped(); ++n)//gradiant not calced for bias
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = outputLayer[n];
                    neuron.calcOutputGradients_Levenberg_Marquardt(DataSetTarget[m_SampleCurr][n], ValueQ[m_SampleCurr][n]); }
          //**********************************************************************************************************************************
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2/* before last layer */; layerNum > 0 /* after frist layer */ && !IsStopped(); --layerNum)
          {         NN_Neurons_Matrix_YX_CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
                    //---
                    for(int n = 0; n < hiddenLayer.Total() - 1/* without app bias */ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = hiddenLayer[n];
                              neuron.calcHiddenGradients_Levenberg_Marquardt(nextLayer, ValueQin[layerNum][m_SampleCurr][n]); //
                    } //
          }
          //**********************************************************************************************************************************
          //--- make neurons update prevLayer connections feeding to them
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 1 && !IsStopped() ; --layerNum) /* frist layer has not previulayer*/
          {         NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    //---weight and bias sample not existed
                    for(int n = 0; n < layer.Total() - 1 /* without bias */ && !IsStopped(); ++n)
                    {         //Print("-------------layer.Total():",(string)layer.Total());//
                              NN_Neurons_Matrix_YX_CNeuron *neuron = layer[n];
                              neuron.updateWeights_Levenberg_Marquardt(prevLayer, ValueQin, m_SampleCurr, m_error, m_recentAverageError, layerNum, n, BatchCount); //
                    } //
                    //
          } //
          //____________UPDATE BIAS_____________
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 1 && !IsStopped() ; --layerNum)
          {         NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    for(int n = 0; n < layer.Total() - 1 /* without bias */ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = layer[n];
                              //if(layerNum <= ArraySize(m_layers) - 1/* without fristlayer*/)
                              //neuron.updateBias_Levenberg_Marquardt(prevLayer,ValueQin,m_SampleCurr, n, BatchCount); // _____WITH BIAS COPY REVERSE_____
                    }//
          }
          //
          IsMinError = getERORR_Net(DataSetTarget[m_SampleCurr]) < 0.01;
          return true;//
          /*
            //+------------------------------------------------------------------+
          //|        propagate backwards to make the network learn             |
          //+------------------------------------------------------------------+
          void CNet::backPropagateagate(const CArrayDouble &DataSetTarget) {
          if(errorFlag)
          return;
          //---
          CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          m_error = 0.0;
          for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n) {
          const CNeuron *neuron = outputLayer[n];
          double delta = DataSetTarget[n] - neuron.getNodeVal();
          m_error += delta * delta;
          }
          //--- calculate our RMS (m_recentAverageError)
          m_error /= outputLayer.Total() - 1;
          m_error = sqrt(m_error);
          m_recentAverageError = (m_recentAverageError * m_recentAverageSmoothingFactor +
                            m_error) / (m_recentAverageSmoothingFactor + 1.0);
          //--- make output neurons calculate their output gradients
          for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n) {
          CNeuron *neuron = outputLayer[n];
          neuron.calcOutputGradients(DataSetTarget[n]);
          }
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2; layerNum > 0 && !IsStopped(); --layerNum) {
          CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
          CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
          //---
          for(int n = 0; n < hiddenLayer.Total() /* with app bias * /&& !IsStopped(); ++n) {
            CNeuron *neuron = hiddenLayer[n];
            neuron.calcHiddenGradients(nextLayer);
          }
          }
          //--- make neurons update connections feeding to them
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 0 && !IsStopped(); --layerNum) {
          CLayer *layer = GetPointer(m_layers[layerNum]);
          CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
          //---
          for(int n = 0; n < layer.Total() - 1 && !IsStopped(); ++n) //without bias//
          {
            CNeuron *neuron = layer[n];
            neuron.updateInputWeights(prevLayer);
          }
          }
          }
          */
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void COptimizer_Levenberg_Marquardt::backPropagate_Net()
{         // Define the backPropagateagation training function
          //void TrainNeuralNetwork(double inputs[][NUM_INPUTS], double outputs[][NUM_OUTPUTS], int numSamples, double & error)
          //{         for (int epoch = 0; epoch < MAX_EPOCHS; ++epoch)
          //
          //          {         // Initialize weights and biases randomly or with some other method
          //                    double lambda = 0.01;  // Initial lambda value
          //                    double prevError = DBL_MAX;  // Set to a large value initially
          //                    double prevLambda = lambda;
          //                    double mu = 10;  // Scaling factor for lambda adjustment
          //                    double error = 0.0;
          //                    NN_Neurons_Matrix_YX_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          //                    // Iterate over training samples
          //                    for (int sample = 0; sample < numSamples; ++sample)
          //                    {         // ________Forward propagation_________
          //                              // Calculate hidden layer activations
          //                              // Apply activation function to hidden layer
          //                              // Calculate output layer activations
          //                              // Apply activation function to output layer
          //                              {         // ________backPropagateagation_____________
          //                                        // Calculate output layer errors ___GRADIANT___
          //                                        // Calculate hidden layer errors ___GRADIANT___
          //                                        //**********************************************************************************************************************************
          //                                        //--- make output neurons calculate their output gradients
          //                                        for(int n = 0; n < outputLayer.Total() - 1/* withoutbias */ && !IsStopped(); ++n)//gradiant not calced for bias
          //                                        {         NN_Neurons_Matrix_YX_CNeuron *neuron = outputLayer[n]; neuron.calcOutputGradients(DataSetTarget[n]); }
          //                                        //**********************************************************************************************************************************
          //                                        //--- make hidden neurons calculate their hidden gradients
          //                                        for(int layerNum = ArraySize(m_layers) - 2/* before last layer */; layerNum > 0 /* after frist layer */ && !IsStopped(); --layerNum)
          //                                        {         NN_Neurons_Matrix_YX_CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
          //                                                  NN_Neurons_Matrix_YX_CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
          //                                                  //---
          //                                                  for(int n = 0; n < hiddenLayer.Total()/* with bias*/ && !IsStopped(); ++n)
          //                                                  {         NN_Neurons_Matrix_YX_CNeuron *neuron = hiddenLayer[n];
          //                                                            neuron.calcHiddenGradients(nextLayer); } //
          //                                        }
          //                                        //**********************************************************************************************************************************
          //                                        //-----------------------------------------------------------------------------
          //                                        // Update weights and biases
          //                                        //--- make neurons update prevLayer connections feeding to them
          //                                        for(int layerNum = ArraySize(m_layers) - 1; layerNum > 0 && !IsStopped(); --layerNum)/* frist layer has not previulayer*/
          //                                        {         NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNum]);
          //                                                  NN_Neurons_Matrix_YX_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
          //                                                  //---weight and bias sample not existed
          //                                                  for(int n = 0; n < layer.Total() - 1 /* without bias */ && !IsStopped(); ++n)
          //                                                  {         //Print("-------------layer.Total():",(string)layer.Total());//
          //                                                            NN_Neurons_Matrix_YX_CNeuron *neuron = layer[n];
          //                                                            neuron.updateInputWeights_Levenberg_Marquardt(prevLayer, m_error, m_recentAverageError, layerNum, n); //
          //                                                            if(layerNum <= ArraySize(m_layers) - 1)neuron.updateBias_Levenberg_Marquardt(prevLayer, layerNum, n); //
          //                                                  } //
          //                                                  //
          //                                        } //
          //                                        // Calculate error for the current sample
          //                                        for (int i = 0; i < outputLayer.Total() - 1; ++i)
          //                                        {         NN_Neurons_Matrix_YX_CNeuron *neuron = outputLayer[n];
          //                                                  error += 0.5 * pow(neuron.getNodeVal() - DataSetTarget.At(i), 2);
          //                                                  //
          //                                        } //
          //                              }//
          //                    }
          //                    // Perform Levenberg-Marquardt adjustment
          //                    // LevenbergMarquardt(lambda, error, prevError, prevLambda, mu);
          //                    // Define the Levenberg-Marquardt algorithm
          //                    //void LevenbergMarquardt(double& lambda, double& error, double& prevError, double& prevLambda, double& mu)
          //                    {         if (error < prevError)
          //                              {         lambda /= mu;
          //                                        prevError = error;
          //                                        prevLambda = lambda; //
          //                              }
          //                              else
          //                              {         lambda *= mu;
          //                                        error = prevError;
          //                                        lambda = prevLambda; //
          //                              } //
          //                    }
          //                    // Check for convergence //breake epoche
          //                    if (error < TARGET_ERROR) { break; } //
          //          } //
          //} //
          /*
           //void TrainNeuralNetwork(double inputs[][NUM_INPUTS], double outputs[][NUM_OUTPUTS], int numSamples, double & error)
          //{         for (int epoch = 0; epoch < MAX_EPOCHS; ++epoch)
          {         double weights[NUM_INPUTS][NUM_HIDDEN];
                    double biases[NUM_HIDDEN];
                    // Initialize weights and biases randomly or with some other method
                    double lambda = 0.01;  // Initial lambda value
                    double prevError = DBL_MAX;  // Set to a large value initially
                    double prevLambda = lambda;
                    double mu = 10;  // Scaling factor for lambda adjustment
                    double error = 0.0;
                    // Iterate over training samples
                    for (int sample = 0; sample < numSamples; ++sample)
                    {         // Forward propagation
                              double hidden[NUM_HIDDEN];
                              double output[NUM_OUTPUTS];
                              // Calculate hidden layer activations
                              for (int i = 0; i < NUM_HIDDEN; ++i)
                              {         double activation = biases[i];
                                        for (int j = 0; j < NUM_INPUTS; ++j)
                                        {         activation += inputs[sample][j] * weights[j][i]; }
                                        hidden[i] = activation;//
                              }
                              // Apply activation function to hidden layer
                              for (int i = 0; i < NUM_HIDDEN; ++i)
                              {         hidden[i] = ActivationFunction(hidden[i]); }
                              // Calculate output layer activations
                              for (int i = 0; i < NUM_OUTPUTS; ++i)
                              {         double activation = 0.0;
                                        for (int j = 0; j < NUM_HIDDEN; ++j)
                                        {         activation += hidden[j] * outputWeights[j][i]; }
                                        output[i] = activation; }
                              // Apply activation function to output layer
                              for (int i = 0; i < NUM_OUTPUTS; ++i)
                              {         output[i] = ActivationFunction(output[i]); }
                              // backPropagateagation
                              double deltaOutput[NUM_OUTPUTS];
                              double deltaHidden[NUM_HIDDEN];
                              // Calculate output layer errors
                              for (int i = 0; i < NUM_OUTPUTS; ++i)
                              {         deltaOutput[i] = (outputs[sample][i] - output[i]) * ActivationDerivative(output[i]); }
                              // Calculate hidden layer errors
                              for (int i = 0; i < NUM_HIDDEN; ++i)
                              {         double error = 0.0;
                                        for (int j = 0; j < NUM_OUTPUTS; ++j)
                                        {         error += deltaOutput[j] * outputWeights[i][j]; }
                                        deltaHidden[i] = error * ActivationDerivative(hidden[i]); }
                              // Update weights and biases
                              for (int i = 0; i < NUM_HIDDEN; ++i)
                              {         for (int j = 0; j < NUM_OUTPUTS; ++j)
                                        {         outputWeights[i][j] += LEARNING_RATE * deltaOutput[j] * hidden[i]; } }
                              for (int i = 0; i < NUM_INPUTS; ++i)
                              {         for (int j = 0; j < NUM_HIDDEN; ++j)
                                        {         weights[i][j] += LEARNING_RATE * deltaHidden[j] * inputs[sample][i]; } }
                              // Calculate error for the current sample
                              for (int i = 0; i < NUM_OUTPUTS; ++i)
                              {         error += 0.5 * pow(outputs[sample][i] - output[i], 2); } //
                    }
                    // Perform Levenberg-Marquardt adjustment
                    LevenbergMarquardt(lambda, error, prevError, prevLambda, mu);
                    // Define the Levenberg-Marquardt algorithm
                    //void LevenbergMarquardt(double& lambda, double& error, double& prevError, double& prevLambda, double& mu)
                    {         if (error < prevError)
                              {         lambda /= mu;
                                        prevError = error;
                                        prevLambda = lambda; }
                              else
                              {         lambda *= mu;
                                        error = prevError;
                                        lambda = prevLambda; } }
                    // Check for convergence
                    if (error < TARGET_ERROR)
                    {         break; } //
          } //
          //} //
          */
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class COptimizer_Stochastic_Gradiant_Decent: public BaseNetWorkOptimizer
{
public:
          COptimizer_Stochastic_Gradiant_Decent(void) {};
          ~COptimizer_Stochastic_Gradiant_Decent(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class COptimizer_Adaptive_Momentom_Estimation: public BaseNetWorkOptimizer
{
public:
          COptimizer_Adaptive_Momentom_Estimation(void) {};
          ~COptimizer_Adaptive_Momentom_Estimation(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class COptimizer_Convolutional: public BaseNetWorkOptimizer
{
public:
          COptimizer_Convolutional(void) {};
          ~COptimizer_Convolutional(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class NN_Neurons_Matrix_YX_CNet: public CObject_MQL4
{
public:
          bool       IsMinError;
          double                        m_error ;//every element has own error
          NN_Neurons_Matrix_YX_CLayer   m_layers[];
          bool                          errorFlag;
          //--- visibe network m_topology
          int                           m_topology[];
          int                           m_topologySize;
          double                        m_recentAverageError; //Network Performance in recent call or array uset to all//moving average of the error during the training process. monitoring and evaluating the progress of the training.
          static double                 m_recentAverageSmoothingFactor;  ////--- average our error over this number of training samples

public:   //Create the network with the given configuration
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          NN_Neurons_Matrix_YX_CNet() {}
          ~NN_Neurons_Matrix_YX_CNet()
          {         //          delete DataSetInput;
                    //          delete DataSetTarget;    delete DataSetTargetTime;//
                    //          delete DataSetResult;
                    delete NetWorkOptimizer;
                    delete NetWorkLossFunction;//
          }

          void Set_Methods(OptimizationMethod_ fOptimizationMethod, LossMethod_ fLossMethod) {  m_optimizationMethod = fOptimizationMethod; m_lossMethod = fLossMethod;}

          void Set_DataSet(uint DataSetSamples, VectorZObj<VectorZ<double>>  &inputs,   VectorZObj<VectorZ<double>> &targets, VectorZObj<VectorZ<double>> &results,   VectorZObj<VectorZ<double>> &targetsTime )
          {         m_Samples           = DataSetSamples;
                    DataSetInput        = inputs;
                    DataSetTarget       = targets;
                    DataSetResult       = results;
                    DataSetTargetTime   = targetsTime;   }
          //
          void Set_Topology(const CArrayInt_MQL4 &f_topology) {ArrayResize(m_topology, f_topology.Total()); for(int i = 0; i < f_topology.Total(); i++) { m_topology[i] = f_topology.At(i); } }

          void Set_TrainParams(uint fBatchSize, bool fIsRandomSample, uint fEpochs = 200, double fLearningRate = 0.15, double fMomentom = 0.5,
                               double fRASF = 100, double fMinRMSE = 0.001, double fMinRMSE_MeanLim = 0.001, double fMinRMSE_SpeedLim = 0.001, bool fIsLimRMSE = false)
          {         if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]Network Initilazing Set_TrainParams ...!");
                    BatchSize            = fBatchSize;
                    IsRandomSample       = fIsRandomSample;
                    m_epochs             = fEpochs;
                    LearningRate         = fLearningRate;
                    Momentom             = fMomentom;
                    RASF                 = fRASF;
                    MinRMSE              = fMinRMSE;
                    IsLimRMSE            = fIsLimRMSE;
                    MinRMSE_MeanLim      = fMinRMSE_MeanLim;
                    MinRMSE_SpeedLim     = fMinRMSE_SpeedLim; //
          }

          void Set_TrainActivations(const NN_Neurons_Matrix_YX_ActFunctions fhidden = NNNM_YX_TanH, const NN_Neurons_Matrix_YX_ActFunctions foutput = NNNM_YX_TanH)
          {         hidden = fhidden; output = foutput;}

          void Set_Build_Network()
          {         //------------
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]Network Initilazing Set_Build_Network ...!");
                    errorFlag = false; IsMinError = false;
                    m_recentAverageSmoothingFactor = RASF;
                    uint numLayers = ArraySize(m_topology);
                    //--- create layers
                    ArrayFree(m_layers);
                    ArrayResize(m_layers, numLayers); //Print("NN_Neurons_Matrix_YX_CNet numLayers: ", numLayers,"  ArraySize(m_layers): ",ArraySize(m_layers));
                    for(uint layerNum = 0; layerNum < numLayers && !IsStopped(); ++layerNum)
                    {         uint numOutputs = (layerNum == numLayers - 1) ? 0 : m_topology[layerNum + 1];/*the outputs neuron  hasnt weights*/
                              //--- shorten layer pointer
                              NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNum]);
                              //--- set type of activation function
                              if(layerNum != numLayers - 1) layer.setActivation(hidden);
                              else layer.setActivation(output);
                              //frist layer
                              if(layerNum == 0) layer.setActivation(NNNM_YX_Purelim);
                              uint NumInputs = 1;
                              if(layerNum != 0) {NumInputs = GetPointer(m_layers[layerNum - 1]).Total();}
                              //--- create neurons and give them layer activation functions
                              for(int neuronNum = 0; neuronNum <= m_topology[layerNum] && !IsStopped(); ++neuronNum)//neuronNum (<=) f_topology.At(layerNum) = mean bias
                              {         NN_Neurons_Matrix_YX_CNeuron *neuron = new NN_Neurons_Matrix_YX_CNeuron(layerNum, layerNum == 0, NumInputs, numOutputs, neuronNum, layer.getActivation(),
                                                            LearningRate, Momentom); // make 40% more learn in midle layers!
                                        if(neuron == NULL) { shutDown("Neuron creation error"); break; }
                                        layer.Add(neuron);
                                        //Print("layerNum:",(string)layerNum,"   neuronNum:",(string)neuronNum," ___  neuronNum:",(string)neuronNum,":  f_topology.At(layerNum):",(string)f_topology.At(layerNum));
                                        if(neuronNum == m_topology[layerNum])neuron.setNodeVal(1.0); //??1.0  //3 !=3+1 bias node...
                              }//
                    }//
                    switch(m_optimizationMethod)
                    {         case  _GRADIENT_DESCENT:                  { NetWorkOptimizer =  new COptimizer_GradiantDecent();               Name = "_GRADIENT_DESCENT_";                    } break;
                              case  _GRADIENT_DESCENT_MOMENTOM:         { NetWorkOptimizer =  new COptimizer_GradiantDecent_Momentom();      Name = "_GRADIENT_DESCENT_MOMENTOM_";           } break;
                              case  _CONJUGATE_GRADIENT:                { NetWorkOptimizer =  new COptimizer_Conjugate_Gradiant();           Name = "_CONJUGATE_GRADIENT_";                  } break;
                              case  _QUASI_NEWTON_METHOD:               { NetWorkOptimizer =  new COptimizer_Quasi_Newton();                 Name = "_QUASI_NEWTON_METHOD_";                 } break;
                              case  _LEVENBERG_MARQUARDT_ALGORITHM:     { NetWorkOptimizer =  new COptimizer_Levenberg_Marquardt();          Name = "_LEVENBERG_MARQUARDT_ALGORITHM_";       } break;
                              case  _STOCHASTIC_GRADIENT_DESCENT:       { NetWorkOptimizer =  new COptimizer_Stochastic_Gradiant_Decent();   Name = "_STOCHASTIC_GRADIENT_DESCENT_";         } break;
                              case  _ADAPTIVE_MOMENT_ESTIMATION:        { NetWorkOptimizer =  new COptimizer_Adaptive_Momentom_Estimation(); Name = "_ADAPTIVE_MOMENT_ESTIMATION_";          } break;
                              case  _CONVOLUTIONAL:                     { NetWorkOptimizer =  new COptimizer_Convolutional();                Name = "_CONVOLUTIONAL_";                       } break;
                              default:                                    break;//
                    } //_SUM_SQUARED_ERROR, _MEAN_SQUARED_ERROR, _NORMALIZED_SQUARED_ERROR, _MINKOWSKI_ERROR, _WEIGHTED_SQUARED_ERROR, _CROSS_ENTROPY_ERROR
                    switch(m_lossMethod)
                    {         case  _SUM_SQUARED_ERROR:                 { NetWorkLossFunction = new  CLoss_SUM_SQUARED_ERROR() ;                   }        break;
                              case  _MEAN_SQUARED_ERROR:                { NetWorkLossFunction = new  CLoss_MEAN_SQUARED_ERROR();                   }        break;
                              case  _NORMALIZED_SQUARED_ERROR:          { NetWorkLossFunction = new  CLoss_NORMALIZED_SQUARED_ERROR();             }        break;
                              case  _MINKOWSKI_ERROR:                   { NetWorkLossFunction = new  CLoss_MINKOWSKI_ERROR();                      }        break;
                              case  _WEIGHTED_SQUARED_ERROR:            { NetWorkLossFunction = new  CLoss_WEIGHTED_SQUARED_ERROR();               }        break;
                              case  _CROSS_ENTROPY_ERROR:               { NetWorkLossFunction = new  CLoss_CROSS_ENTROPY_ERROR();                  }        break;
                              default:                                    break;//
                    } //
                    NetWorkOptimizer.setBack(this);//
                    //Print("NetWorkOptimizer.Name: ", NetWorkOptimizer.Name); //
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]Network Initilazing Set_Build_Network END ...!"); //
          }
          template <typename custom> //Shut down the network when required
          custom           shutDown(custom exit_code, string msg = NULL) { Print(msg, ". Shutting down...");  errorFlag = true;  ArrayFree(m_layers);  ArrayFree(m_topology);  return exit_code; }

          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          VectorZObj<VectorZ<double>>     DataSetInput;
          VectorZObj<VectorZ<double>>     DataSetTarget; VectorZObj<VectorZ<double>>     DataSetTargetTime;
          VectorZObj<VectorZ<double>>     DataSetResult; //
          string                Name;
          bool                  IsEmptyFile;
          uint                  m_Samples;
          uint                  m_SampleCurr;
          uint                  BatchSize;
          bool                  IsRandomSample;
          uint                  m_epochs;
          double                LearningRate;
          double                Momentom;
          double                RASF;//
          double                MinRMSE;//
          bool                  IsLimRMSE;
          double                MinRMSE_MeanLim;//
          double                MinRMSE_SpeedLim;//
          NN_Neurons_Matrix_YX_ActFunctions hidden;//
          NN_Neurons_Matrix_YX_ActFunctions output;
          //---
          OptimizationMethod_           m_optimizationMethod;
          BaseNetWorkOptimizer          *NetWorkOptimizer;
          LossMethod_                   m_lossMethod;
          BaseNetWorkLossFunction       *NetWorkLossFunction;
          //---


          void  Trainer() { Train2(); /* NetWorkOptimizer.Train(this);*/  }
          void  Simer(VectorZObj<VectorZ<double>>  &inputs, VectorZObj<VectorZ<double>>  &results, string s) {NetWorkOptimizer.Sim(inputs, results, s);};

          void  setData(VectorZObj<VectorZ<double>> &inputs, VectorZObj<VectorZ<double>> &targets, VectorZObj<VectorZ<double>> &results)
          {         DataSetInput = inputs;               DataSetTarget = targets;         DataSetResult = results; }
          //--- methods for working with files
          bool             Save(int &file_handle, int n) {return false;};
          bool             Load(int &file_handle, int n) {return false;};

          void NN_Neurons_Matrix_YX_CNet::Train2();
          void NN_Neurons_Matrix_YX_CNet::Epocher2();//
          double calculateRMSE_Samples( string s)
          {         if (DataSetTarget[m_SampleCurr].Total() != DataSetResult[m_SampleCurr].Total())
                    {         Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample-> DataSetTarget[0].Total() != DataSetResult[0].Total() ", DataSetTarget[m_SampleCurr].Total(), " : ", DataSetResult[m_SampleCurr].Total(), s); return 999999999.999;}
                    double mseall = 0;
                    double SumErrorPower2 = 0.0; //error^2+error^2
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___START1__", "  DataSetResult.Total():", DataSetResult.Total());
                    for(int j = 0; j < (int)DataSetResult.Total(); j++)//samples
                    {         if (DataSetTarget[j].Total() != DataSetResult[j].Total())
                              {         // Error handling for input size mismatch
                                        //throw std::runtime_error("Input vectors must have the same size.");
                                        continue;
                                        Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample-> not same size DataSetTarget[m_SampleCurr][", (string)j, "].Total() != DataSetResult[0][", (string)j, "].Total() ",
                                              DataSetTarget[j].Total(), " : ", DataSetResult[j].Total(), s); return 999999999.999;  //
                              }
                              double ErrorPower2 = 0.0; //error^2
                              for (int i = 0; i < (int)DataSetTarget[j].Total(); ++i)//sampel elements
                              {         double Delta = DataSetTarget[j][i] - DataSetResult[j][i];
                                        ErrorPower2 = Delta * Delta; //
                              }
                              SumErrorPower2 += ErrorPower2;//
                    }
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___END1__");
                    double MeanSumErrorPower2 = 0.0;
                    if(DataSetTarget.Total() != 0) {MeanSumErrorPower2 = SumErrorPower2 / DataSetTarget.Total();} //DataSetResult[0].Total();
                    else {Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample count:zero ", DataSetTarget.Total());} //
                    double RootMeanSumErrorPower2 = MeanSumErrorPower2;  RootMeanSumErrorPower2 = sqrt(MeanSumErrorPower2);
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___END2__");
                    return RootMeanSumErrorPower2; //
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          double calculateRMSE_Sample( string s)
          {         if (DataSetTarget[m_SampleCurr].Total() != DataSetResult[m_SampleCurr].Total())
                    {         Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample-> DataSetTarget[0].Total() != DataSetResult[0].Total() ", DataSetTarget[m_SampleCurr].Total(), " : ", DataSetResult[m_SampleCurr].Total()); return  999999999.999;}
                    double mseall = 0;
                    double SumErrorPower2 = 0.0; //error^2+error^2
                    NN_Neurons_Matrix_YX_CLayer *lastLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
                    DataSetResult[m_SampleCurr].clear();
                    for(int n = 0; n < lastLayer.Total() - 1 && !IsStopped(); ++n)//>>-1 is bias
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = lastLayer[n];
                              DataSetResult[m_SampleCurr] << neuron.getNodeVal(); //
                    }
                    if (DataSetTarget[m_SampleCurr].Total() != DataSetResult[m_SampleCurr].Total())
                    {         // Error handling for input size mismatch
                              //throw std::runtime_error("Input vectors must have the same size.");
                              Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample-> not same size DataSetTarget[0].Total() != DataSetResult[0].Total() ",
                                    DataSetTarget[m_SampleCurr].Total(), " : ", DataSetResult[m_SampleCurr].Total(), s); return  999999999.999; //
                              return 999999999; //
                    }
                    double ErrorPower2 = 0.0; //error^2
                    for (int i = 0; i < (int)DataSetTarget[m_SampleCurr].Total(); ++i)//where series data com total is one
                    {         double diffError = DataSetTarget[m_SampleCurr][i] - DataSetResult[m_SampleCurr][i];
                              ErrorPower2 += diffError * diffError; //
                    }
                    SumErrorPower2  = ErrorPower2;//
                    double MeanSumErrorPower2 = 0.0;
                    if(DataSetTarget[m_SampleCurr].Total() != 0) {MeanSumErrorPower2 = SumErrorPower2 / DataSetTarget[m_SampleCurr].Total();} //DataSetResult[0].Total();
                    else {Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample count:zero ", DataSetTarget[m_SampleCurr].Total());} //
                    double RootMeanSumErrorPower2 = MeanSumErrorPower2; RootMeanSumErrorPower2 = sqrt(MeanSumErrorPower2);
                    return RootMeanSumErrorPower2; //
          } //
          void UpdateLearningRateMomentom(double val, double val2)
          {         for(int layerNum = 0; layerNum < ArraySize(m_topology) && !IsStopped(); ++layerNum)
                    {         NN_Neurons_Matrix_YX_CLayer *layer = GetPointer(m_layers[layerNum]);
                              for(int neuronNum = 0; neuronNum <= m_topology[layerNum] && !IsStopped(); ++neuronNum)//neuronNum (<=) f_topology.At(layerNum) = mean bias
                              {         NN_Neurons_Matrix_YX_CNeuron *neuron = layer[neuronNum];
                                        if(neuron == NULL) { shutDown("Neuron creation error"); break; }
                                        neuron.setETA_Momentom( val, val2); //
                              }//
                    }//
          }//
          //getter method of a private variable value
          virtual double   getRecentAverageError(void) { if(errorFlag)return 0.0; return m_recentAverageError; }
          virtual double   getLastRMSError(void) { if(errorFlag)return 0.0; return m_error; }//
};
double NN_Neurons_Matrix_YX_CNet::m_recentAverageSmoothingFactor = 100.0;
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_YX_CNet::Train2()
{         //********************************************************* Start [Triaining] *********************************************************
          if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training][Network] Train2...!");
          datetime YX_InitTime = TimeLocal();
          datetime YX_CurrTime = TimeLocal();
          YX_InitTime = TimeLocal();
          //every epoch sample Q*H Change issue
          //********************************************************* Start [Triaining] Epoch : all sample used in training*********************************************************
          if(IsDebugNN_Neurons_Matrix_YX_CNet) {Print("IsDebugNN_Neurons_Matrix_YX_CNet --- Train2()  ---");}
          //Print( "001  DataSetResult.Total():", DataSetResult.Total(), "   DataSetResult[0].Total():", DataSetResult[0].Total(), "  DataSetTarget.Total():", DataSetTarget.Total(), "   DataSetTarget[0].Total():", DataSetTarget[0].Total());
          Epocher2();
          if(IsRMSE && 0)
          {         if(1)Print( "MSE_Curr_Cheack_AllSample:", (string)calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ")); //
                    double MSE_Prev = 0.0;
                    uint Round = 0;
                    VectorZ<double> RMSEs; double RMSE_Mean_Prev = 0.000000001; double RMSE_Mean_Curr = 0.0;
                    while(calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ") > MinRMSE  )
                    {         Epocher2();
                              RMSEs << calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ");
                              RMSE_Mean_Curr = RMSEs.Mean();
                              //if(1)Print( "MSE_Curr_Cheack_AllSample:", (string)MSE_Curr_Cheack_AllSample); //
                              if(0)
                              {         if( RMSEs.Mean() < RMSE_Mean_Prev)
                                        {         LearningRate -= 0.001; Momentom -= 0.001;
                                                  if(LearningRate < 0.001)      LearningRate  = 0.15;
                                                  if(Momentom < 0.001)          Momentom      = 0.50;
                                                  UpdateLearningRateMomentom(LearningRate, Momentom);//
                                                  //m_epochs -= 3;//
                                        } //
                                        else
                                        {         LearningRate += 0.001; Momentom += 0.001;
                                                  if(LearningRate > 1.001)      LearningRate  = 0.15;
                                                  if(Momentom > 1.001)          Momentom      = 0.50;
                                                  UpdateLearningRateMomentom(LearningRate, Momentom); //
                                                  //m_epochs += 3; //
                                        }//
                              }//
                              // m_epochs += MSE_Prev < calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ") ? +1 : -1;
                              string Soz = "Round: " + (string)Round++ + "    MSE_Sampels:" + DoubleToStr(calculateRMSE_Samples( "OnTraining calculateRMSE_Samples "), 4) +
                                           "  LR:" + DoubleToStr(LearningRate, 3) + "  MO:" + DoubleToStr(Momentom, 3);
                              ObjectDelete(0,        "Fit Point.NN" + "MSE_Sampels");
                              ObjectCreate(0,        "Fit Point.NN" + "MSE_Sampels", OBJ_LABEL, 0, 0, 0 ); //
                              ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels", OBJPROP_TEXT,  Soz);
                              ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels", OBJPROP_FONT, "Arial");
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels", OBJPROP_FONTSIZE, 10);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels", OBJPROP_XDISTANCE, ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0) / 2);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels", OBJPROP_YDISTANCE, 20);
                              ObjectSetDouble(0,     "Fit Point.NN" + "MSE_Sampels", OBJPROP_ANGLE, 0);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels", OBJPROP_ANCHOR, ANCHOR_CENTER);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels", OBJPROP_COLOR, clrWhite); //
                              //
                              NN_Neurons_Matrix_YX_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
                              NN_Neurons_Matrix_YX_CNeuron *neuron = outputLayer[0];     // neuron.getGradient()
                              string Soz1 = "MSE_MEAN:" + DoubleToStr(RMSEs.Mean(), 3)
                                            + "  MSE_MEAN_Diff:" + DoubleToStr(MathAbs(RMSEs.Mean() - RMSE_Mean_Prev), 3)
                                            + "  Gradient():"    + DoubleToStr(neuron.getGradient(), 6);
                              ObjectDelete(0,        "Fit Point.NN" + "MSE_Sampels1");
                              ObjectCreate(0,        "Fit Point.NN" + "MSE_Sampels1", OBJ_LABEL, 0, 0, 0 ); //
                              ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels1", OBJPROP_TEXT,  Soz1);
                              ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels1", OBJPROP_FONT, "Arial");
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels1", OBJPROP_FONTSIZE, 10);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels1", OBJPROP_XDISTANCE, ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0) / 2);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels1", OBJPROP_YDISTANCE, 40);
                              ObjectSetDouble(0,     "Fit Point.NN" + "MSE_Sampels1", OBJPROP_ANGLE, 0);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels1", OBJPROP_ANCHOR, ANCHOR_CENTER);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels1", OBJPROP_COLOR, clrWhite); //
                              //
                              double MSE_MEAN_DIFF = MathAbs(RMSEs.Mean() - RMSE_Mean_Prev);
                              double Speed_MSE = 0;
                              if(Round > 0)Speed_MSE = RMSEs.back() / RMSEs.Mean(); //
                              string Soz2 = "  RMSEs.GetMin():" + DoubleToStr(RMSEs.GetMin(), 6) + "    Speed_MSE:" + DoubleToStr(Speed_MSE, 4);
                              ObjectDelete(0,        "Fit Point.NN" + "MSE_Sampels2");
                              ObjectCreate(0,        "Fit Point.NN" + "MSE_Sampels2", OBJ_LABEL, 0, 0, 0 ); //
                              ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels2", OBJPROP_TEXT,  Soz2);
                              ObjectSetString(0,     "Fit Point.NN" + "MSE_Sampels2", OBJPROP_FONT, "Arial");
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels2", OBJPROP_FONTSIZE, 10);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels2", OBJPROP_XDISTANCE, ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0) / 2);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels2", OBJPROP_YDISTANCE, 60);
                              ObjectSetDouble(0,     "Fit Point.NN" + "MSE_Sampels2", OBJPROP_ANGLE, 0);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels2", OBJPROP_ANCHOR, ANCHOR_CENTER);
                              ObjectSetInteger(0,    "Fit Point.NN" + "MSE_Sampels2", OBJPROP_COLOR, clrWhite); //
                              //if(MSE_Curr_Cheack_AllSampleLast == MSE_Curr_Cheack_AllSample && RMSE_Mean_Prev == RMSEs.Mean() ) break; //|| MeanOfMSE_Mean_Curr < MSE_Curr_Cheack_AllSample
                              //if(MSE_MEAN_DIFF < 0.05 && MSE_Curr_Cheack_AllSample > MinRMSE) break;
                              if((MSE_MEAN_DIFF < MinRMSE_MeanLim || Speed_MSE < 1.001) && 1 && IsLimRMSE) {Print("__NOT CHANGING_MEAN MSE_"); break;};
                              RMSE_Mean_Prev = RMSEs.Mean();//
                              MSE_Prev = calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ");; //
                    }//
          }
          //******************************************************************************
          YX_CurrTime = TimeLocal();
          //******************************************************************************
          Print( "00  DataSetResult.Total():", DataSetResult.Total(), "   DataSetResult[0].Total():", DataSetResult[0].Total(), "  DataSetTarget.Total():", DataSetTarget.Total(), "   DataSetTarget[0].Total():", DataSetTarget[0].Total());
          Print( "  Training_MSE:", DoubleToStr(calculateRMSE_Samples( "OnTraining calculateRMSE_Samples "), 7)); //
          //---ACCURANCY VALIDATION
          {         double expected = 0;
                    double predicted = 0;
                    double error = 0;
                    double allresult = 0;
                    Print( "B  DataSetResult.Total():", DataSetResult.Total(), "   DataSetResult[0].Total():", DataSetResult[0].Total(), "  DataSetTarget.Total():", DataSetTarget.Total(), "   DataSetTarget[0].Total():", DataSetTarget[0].Total());
                    for(uint i = 0; i < m_Samples; i++)
                    {         for(uint k = 0; k < (uint)DataSetResult[i].Total(); k++)
                              {         //--- check availability of results
                                        //Print("Result : ", DoubleToString(TrainingDataSetMatrix_Res[0].At(0), 4));
                                        //Print("Expected : ", DoubleToString(TrainingDataSetMatrix_Res[0].At(0), 4));
                                        //--- check accuracy
                                        expected = DataSetTarget[i][k];
                                        predicted = DataSetResult[i][k];
                                        //---
                                        error += MathAbs(predicted - expected);//
                              }//
                    }//
                    error = error / (m_Samples * 1);
                    double accuracy = 100.0 - (((error) / (1 + 1)) * 100);//
                    double mse = calculateRMSE_Samples(  "OnValidation calculateRMSE_Samples");
                    Print("Training_Accuracy : ", DoubleToString(accuracy, 2) + "%", "  Training_MSE:", DoubleToStr(mse, 7)); //
                    //Print( "A  DataSetResult.Total():", DataSetResult.Total(), "   DataSetResult[0].Total():", DataSetResult[0].Total(), "  DataSetTarget.Total():", DataSetTarget.Total(), "   DataSetTarget[0].Total():", DataSetTarget[0].Total());
                    //Print("Result       : ", TimeToStr(TrainingDataSetMatrix_Res[0].At(0)), "  ", "Result2      : ", DoubleToStr(TrainingDataSetMatrix_Res[0].At(1), 2));
                    //Print("Expected : ", TimeToStr(TrainingDataSetMatrix_Out[0].At(0)), "  ", "Expected2 : ", DoubleToStr(TrainingDataSetMatrix_Out[0].At(1), 2));        //
                    Print("----------------");
                    Print( "Training_OneNeuronResult2      : ", DoubleToStr(DataSetResult[0][0], 2));
                    Print("----------------");
                    Print( "Training_OneNeuronExpected2 : ", DoubleToStr(DataSetTarget[0][0], 2));       //
                    Print("----------------");
                    //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_YX_CNet::Epocher2()
{         if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training][Network] Epocher2..START.!");
          if(IsDebugNN_Neurons_Matrix_YX_CNet) {Print("IsDebugNN_Neurons_Matrix_YX_CNet --- Epocher2..START.!  ---");}
          //double        rms_ErrorLine[m_Samples][];   //---save netErrors every epoche reserve epochs count
          double        rms_ErrorLine[];
          ArrayResize(rms_ErrorLine, m_Samples);
          //-------------------------------
          if(m_optimizationMethod == _LEVENBERG_MARQUARDT_ALGORITHM) { NetWorkOptimizer.Train(); Print("NN_Neurons_Matrix_YX_CNet::", Name, "    NetWorkOptimizer.Name", NetWorkOptimizer.Name);}
          else
          {         for(uint j = 0;  j < m_epochs ; j++) //(j < epochs*100000) &&( (YX_CurrTime - YX_InitTime) < RunTimeLimit )
                    {         //m_SampleCurr = MathRand() % m_Samples;
                              if(BatchSize == 0)
                              {         for(uint i = 0; i < m_Samples; i++)
                                        {         //******************************************************************************
                                                  //--- make the network predict the result
                                                  NetWorkOptimizer.m_SampleCurr = i;
                                                  if(!NetWorkOptimizer.feedForward_Net_WeightBefore( 0, "OnTraining")) return;
                                                  if(!NetWorkOptimizer.backPropagate_Net_WeightBefore( m_epochs, 0,  1))return;
                                                  //******************************************************************************
                                        }//
                              }//
                              else
                              {         if(IsDebugNN_Neurons_Matrix_YX_CNet) {Print("IsDebugNN_Neurons_Matrix_YX_CNet --- Epocher2..START.! BatchSize != 0 ---");}
                                        uint Packets = m_Samples / BatchSize;
                                        for(uint p = 0; p < Packets; p++)
                                        {         for(uint i = 0; i < BatchSize; i++)
                                                  {         //******************************************************************************
                                                            //--- make the network predict the result
                                                            NetWorkOptimizer.m_SampleCurr = BatchSize * p + i;
                                                            if(IsDebugNN_Neurons_Matrix_YX_CNet) {Print("IsDebugNN_Neurons_Matrix_YX_CNet --- Epocher2..START.! Batching ---", " p", p, " i", i, "   NetWorkOptimizer.m_SampleCurr", NetWorkOptimizer.m_SampleCurr);}
                                                            if(!NetWorkOptimizer.feedForward_Net_WeightBefore( 0, "OnTraining")) return;
                                                            //******************************************************************************
                                                            if(!NetWorkOptimizer.backPropagate_Net_WeightBefore( m_epochs, 0,  BatchSize))return;//
                                                  }//
                                        }
                                        //
                              }
                              if(0)Print( "MSE_Curr_Cheack_AllSample:", (string)calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ")); //
                              //Print("epochs:", (string)epochs, "  ", "j:", (string)j, "  ", (string)((double)(YX_CurrTime - YX_InitTime)), "  ", (datetime)YX_InitTime, "  ", (datetime)YX_CurrTime); //
                              //******************************************************************************
                    } //
          }//
          if(IsDebugNN_Neurons_Matrix_YX_CNet) {Print("IsDebugNN_Neurons_Matrix_YX_CNet --- Epocher2..END.!  ---");}
          if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training][Network] Epocher2..END.!");//
}//
//+------------------------------------------------------------------+
