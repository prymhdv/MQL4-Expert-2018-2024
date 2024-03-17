//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property  strict
//----------------------------------------- Last Trained Sample Convergenced By MSE ----------------------++
#define IsDebugNN_Neurons_Matrix_YX_CNet 0
#define XY_IsRMSE 1
#define XY_RunTimeLimit 6//secound
//#include "NetComplex.mqh"
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionXObj\VectorZObj.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix769_YX\NN_Neurons_Matrix_YX_Layer.mqh>
//+------------------------------------------------------------------+
//|   Link instances to form a fully connected neural network        |
//+------------------------------------------------------------------++
template<typename t>
double  ACCURANCY_Vector(uint Samples, VectorZObj<VectorZ<t>>  &DataSetTarget, VectorZObj<VectorZ<t>>  &DataSetResult)
{         if(0)
          {         double expected = 0;
                    double predicted = 0;
                    double error = 0;
                    for(uint i = 0; i < Samples; i++)
                    {         for(uint k = 0; k < (uint)DataSetResult[i].Total(); k++)
                              {         //--- check accuracy
                                        expected = DataSetTarget[i][k];
                                        predicted = DataSetResult[i][k];
                                        //---
                                        error += MathAbs(predicted - expected);//
                              }//
                    }//
                    if(Samples == 0) return -99999999;
                    double MAE = error / (Samples);
                    double accuracy = 100.0 - (((MAE) / (1 + 1)) * 100);//
                    return accuracy;//
          }//
          {         double accuracy = 0;
                    for(uint i = 0; i < DataSetResult.Total(); i++)
                    {         for(uint k = 0; k < (uint)DataSetResult[i].Total(); k++)
                              {         double expected = 0;
                                        double predicted = 0;
                                        double error = 0;
                                        //--- check accuracy
                                        expected = DataSetTarget[i][k];
                                        predicted = DataSetResult[i][k];
                                        //---
                                        error  = MathAbs(predicted - expected);//
                                        accuracy += 100.0 - (((error) / (1 + 1)) * 100);//
                              }//
                    }//
                    if(Samples == 0) return -99999999;
                    double accuracyMean = accuracy / Samples ;
                    return accuracyMean;//
          } //
}
template<typename t>
double  ACCURANCY_Sample(t DataSetTarget, t DataSetResult)
{         double accuracy = 0;
          t expected = 0;
          t predicted = 0;
          t error = 0;
          //--- check accuracy
          expected = DataSetTarget;
          predicted = DataSetResult;
          //---
          error  = MathAbs(predicted - expected);//
          accuracy = 100.0 - (((error) / (1 + 1)) * 100);//
          return accuracy;//
}
template<typename t>
class NN_Neurons_Matrix_YX_CNet;
template<typename t>
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
template<typename t>
class CLoss_SUM_SQUARED_ERROR : public BaseNetWorkLossFunction<t>
{
public:
          CLoss_SUM_SQUARED_ERROR(void) {};
          ~CLoss_SUM_SQUARED_ERROR(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class CLoss_MEAN_SQUARED_ERROR: public BaseNetWorkLossFunction<t>
{
public:
          CLoss_MEAN_SQUARED_ERROR(void) {};
          ~CLoss_MEAN_SQUARED_ERROR(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class CLoss_NORMALIZED_SQUARED_ERROR: public BaseNetWorkLossFunction<t>
{
public:
          CLoss_NORMALIZED_SQUARED_ERROR(void) {};
          ~CLoss_NORMALIZED_SQUARED_ERROR(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class CLoss_MINKOWSKI_ERROR: public BaseNetWorkLossFunction<t>
{
public:
          CLoss_MINKOWSKI_ERROR(void) {};
          ~CLoss_MINKOWSKI_ERROR(void) {};
//--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class CLoss_WEIGHTED_SQUARED_ERROR: public BaseNetWorkLossFunction<t>
{
public:
          CLoss_WEIGHTED_SQUARED_ERROR(void) {};
          ~CLoss_WEIGHTED_SQUARED_ERROR(void) {};
//--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class CLoss_CROSS_ENTROPY_ERROR: public BaseNetWorkLossFunction<t>
{
public:
          CLoss_CROSS_ENTROPY_ERROR(void) {};
          ~CLoss_CROSS_ENTROPY_ERROR(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//|                      BaseNetWorkOptimizer                        |
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
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

          VectorZObj<VectorZ<t>>     DataSetInput;
          VectorZObj<VectorZ<t>>     DataSetTarget; VectorZObj<VectorZ<t>>  DataSetTargetTime;
          VectorZObj<VectorZ<t>>     DataSetResult; //


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
          NN_Neurons_Matrix_YX_ActFunctions hidden;//
          NN_Neurons_Matrix_YX_ActFunctions output;
          void setBack(NN_Neurons_Matrix_YX_CNet<t> &net)
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
                    BatchSize           = net.BatchSize;
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
          double     getERORR_Net(const VectorZ<t>  & DataTarget)
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
                    //
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
          virtual void     Sim(VectorZObj<VectorZ<t>>  &finputs, VectorZObj<VectorZ<t>>  &fresults, string s) {};
          virtual void     Train() {Print("----00------BaseNetWorkOptimizer::", Name);};
          virtual bool     feedForward_Net_WeightInside( string s);
          virtual bool     feedForward_Net_WeightBefore(bool b, string s);
          virtual bool     backPropagate_Net_WeightInside( int epocheAll, int epocheAllIdx, uint sampleCount) {return false;};
          virtual bool     backPropagate_Net_WeightBefore( int epocheAll, int epocheAllIdx, uint BatchCount) {return false;};
          virtual void     getResults(VectorZObj<VectorZ<t>> &fDataSetResult);
          //+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          double calculateRMSE_Samples(VectorZObj<VectorZ<t>> &fDataSetTarget, VectorZObj<VectorZ<t>> &fDataSetResult, string s)
          {         //-----------------------------------------------------------------------------------------------------------------------
                    if (fDataSetTarget.Total() != fDataSetResult.Total())
                    {         Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample-> fDataSetTarget.Total() != fDataSetResult.Total() ",
                                    + fDataSetTarget.Total(), " : ", fDataSetResult.Total(), s); return 999999999.999;//
                    }
                    if (fDataSetTarget[0].Total() != fDataSetResult[0].Total())
                    {         Print("NN_Neurons_Matrix_YX_Run:: calculateRMSE_Sample-> fDataSetTarget[0].Total() != fDataSetResult[0].Total() ",
                                    + fDataSetTarget[0].Total(), " : ", fDataSetResult[0].Total(), s); return 999999999.999;//
                    }
                    //-----------------------------------------------------------------------------------------------------------------------
                    double mseall               = 0.0;
                    double SumErrorPower2       = 0.0; //error^2+error^2
                    //-----------------------------------------------------------------------------------------------------------------------
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___START2__");
                    for(int j = 0; j < (int)fDataSetResult.Total(); j++)//samples
                    {         double ErrorPower2 = 0.0; //error^2
                              for (int i = 0; i < (int)fDataSetTarget[j].Total(); ++i)//sampel elements
                              {         double Delta = fDataSetTarget[j][i] - fDataSetResult[j][i];
                                        SumErrorPower2 += Delta * Delta; //
                              }//
                    }
                    //-----------------------------------------------------------------------------------------------------------------------
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet calculateRMSE_Samples___END1__");
                    double MeanSumErrorPower2 = 0.0;
                    if(DataSetTarget.Total() != 0 && DataSetTarget[0].Total() != 0) {MeanSumErrorPower2 = SumErrorPower2 / (DataSetTarget.Total() * DataSetTarget[0].Total());} //DataSetResult[0].Total();
                    double RootMeanSumErrorPower2 = MeanSumErrorPower2;
                    RootMeanSumErrorPower2 = sqrt(MeanSumErrorPower2);
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
                              DataSetResult[m_SampleCurr] << (t)neuron.getNodeVal(); //
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
//|        propagate forward to get a prediction                     |&& !IsStopped()
//+------------------------------------------------------------------+
template<typename t>
bool BaseNetWorkOptimizer::feedForward_Net_WeightBefore( bool b, string s)
{         //Print("Network Net::feedForward_Net_WeightBefore...!");
          if(DataSetInput[m_SampleCurr].size() != m_topology[0])
          {         Print(s + "  Incompatible inputs! ", (string)DataSetInput[m_SampleCurr].size(), "  m_topology[ArraySize(m_topology) - 1)", (string)m_topology[0]); return false; }
          if(errorFlag)return false;
          //---
          NN_Neurons_Matrix_YX_CLayer *inputLayer = GetPointer(m_layers[0]);
          if(DataSetInput[m_SampleCurr].size() != inputLayer.Total() - 1)//--free_node
          {         Print(s + "----ddd---DataSetInput[m_SampleCurr].Total(): ", DataSetInput[m_SampleCurr].size(), "----ddd---inputLayer.Total() - 1:  ", inputLayer.Total() - 1);   ///
                    shutDown(0, s + " Invalid pointer feedForward_Net" +
                             "  <DataSetInput[m_SampleCurr].Total():inputLayer.Total() - 1>" + (string)DataSetInput[m_SampleCurr].Total() + ":" + (string)(inputLayer.Total() - 1) + "  ");   return false; }
          //---Set inp Neurons val from inputs val
          for(uint i = 0; i < (uint)DataSetInput[m_SampleCurr].size() && !IsStopped(); ++i)
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = inputLayer.At(i);
                    neuron.setNodeVal(DataSetInput[m_SampleCurr][i]); //
                    //if(b) {Print("DataSetInput[m_SampleCurr][i]: ", DataSetInput[m_SampleCurr][i], "  m_SampleCurr: ", m_SampleCurr);  } //
          }
          //---Next layer neuron set
          for(uint layerNum = 1/* secound layer */; layerNum < (uint)ArraySize(m_layers) /* all layer */ && !IsStopped(); ++layerNum)
          {         NN_Neurons_Matrix_YX_CLayer *layer     = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_YX_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    //---
                    if(0)//again normalize data before forward ---________---__FAIL____---
                    {         if(layerNum > 1)
                              {         VectorZ<t> Series;//
                                        for(int neuronNum = 0; neuronNum < layer.Total() - 1/* with out bias */ && !IsStopped(); ++neuronNum)
                                        {         NN_Neurons_Matrix_YX_CNeuron *neuron = layer[neuronNum];
                                                  Series << (t)neuron.getNodeVal();; //
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
template<typename t>
bool BaseNetWorkOptimizer::feedForward_Net_WeightInside( string s)
{         //Print("Network Net::feedForward_Net_WeightInside...!");
          if(DataSetInput[m_SampleCurr].size() != m_topology[0])
          {         Print("Incompatible inputs!", (string)DataSetInput[m_SampleCurr].size(), "  m_topology[ArraySize(m_topology) - 1)", (string)m_topology[0]); return false; }
          if(errorFlag)return false;
          //---
          NN_Neurons_Matrix_YX_CLayer *inputLayer = GetPointer(m_layers[0]);
          if(DataSetInput[m_SampleCurr].size() != inputLayer.Total() - 1)//--free_node
          {         Print(s + "----ddd---DataSetInput[m_SampleCurr].Total(): ", DataSetInput[m_SampleCurr].size(), "----ddd---inputLayer.Total() - 1:  ", inputLayer.Total() - 1);   ///
                    shutDown(0, s + " Invalid pointer feedForward_Net" +
                             "  <DataSetInput[m_SampleCurr].Total():inputLayer.Total() - 1>" + (string)DataSetInput[m_SampleCurr].Total() + ":" + (string)(inputLayer.Total() - 1) + "  ");   return false; }
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
template<typename t>
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
template<typename t>
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
                    {         //Print("*** NN_Neurons_Matrix_YX_CNet::Load>> for layerNumSave **", "  layerNumSave:", layerNumSave);
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
                                        //Print("*** NN_Neurons_Matrix_YX_CNet::Load>> for neuronNumSave >>**", "  layerNumSave:", layerNumSave, "  neuronNumSave:", neuronNumSave);
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
//|                   COptimizer_GradiantDecent                      |
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class COptimizer_GradiantDecent: public BaseNetWorkOptimizer<t>
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
template<typename t>
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
//|              COptimizer_GradiantDecent_Momentom                  |
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class COptimizer_GradiantDecent_Momentom: public BaseNetWorkOptimizer<t>
{
public:
          COptimizer_GradiantDecent_Momentom(void) {};
          ~COptimizer_GradiantDecent_Momentom(void) {};
          //--------------------------------
          virtual bool backPropagate_Net_WeightInside( int epocheAll, int epocheAllIdx, uint sampleCount);
          virtual bool backPropagate_Net_WeightBefore( int epocheAll, int epocheAllIdx, uint BatchCount);
          virtual bool backPropagate_Net_WeightBefore_Batch( int epocheAll, int epocheAllIdx, uint BatchCount);

          void Train();
          void getResults(VectorZObj<VectorZ<t>> &fDataSetResult);
          void Epocher() {};
          void Sim(VectorZObj<VectorZ<t>>  &finputs, VectorZObj<VectorZ<t>>  &fresults, string s);
          //--------------------------------

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
void COptimizer_GradiantDecent_Momentom::Sim(VectorZObj<VectorZ<t>>  &finputs, VectorZObj<VectorZ<t>>  &fresults, string s)
{         m_Samples = finputs.Total();      DataSetInput = finputs;
          if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet Sim_GradiantDecent_Momentom__START__");
          //Print("-----------COptimizer_GradiantDecent_Momentom::Sim---------------", "    NetWorkOptimizer.Name: ", Name,
          //      "--------------------------", "fresults.Total(): ", fresults.Total(), "  fresults[0].Total(): ", fresults[0].Total()); ///
          for(uint i = 0; i < m_Samples; i++)
          {         m_SampleCurr = i; //
                    feedForward_Net_WeightBefore( 1, s + "Sim_GradiantDecent_Momentom Show");
                    getResults(fresults);// Print("inputs.Total(): ",inputs.Total(),"  m_SampleCurr: ",m_SampleCurr);//
          } //_______SIM___HAS NOT TARGETS__________
          //Print("-----------COptimizer_GradiantDecent_Momentom::Sim---------------", "    NetWorkOptimizer.Name: ", Name,
          //      "--------------------------", "fresults.Total(): ", fresults.Total(), "  fresults[0].Total(): ", fresults[0].Total()); ///
          if(IsDebugNN_Neurons_Matrix_YX_CNet)Print(" NN_Neurons_Matrix_YX_CNet Sim_GradiantDecent_Momentom__END__");
          //results = GetPointer(DataSetResult); //
          //Sleep(5000);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
void COptimizer_GradiantDecent_Momentom::getResults(VectorZObj<VectorZ<t>> &fDataSetResult)
{         // Print("Network Net::getResults...!");
          if(errorFlag) { Print("------------errorFlag true-------------"); return;}
          fDataSetResult[m_SampleCurr].Clear();
          NN_Neurons_Matrix_YX_CLayer *lastLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          for(int n = 0; n < lastLayer.Total() - 1 && !IsStopped(); ++n)//>>-1 is bias
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = lastLayer[n];
                    fDataSetResult[m_SampleCurr] << (t)neuron.getNodeVal(); //
                    //if(b) { Print("Network Net::getResults...!", " val neuron.getNodeVal(): ", neuron.getNodeVal(), "  DataSetResult[m_SampleCurr][n]: ", DataSetResult[m_SampleCurr][n], "  m_SampleCurr: ", m_SampleCurr, "  lastLayer.Total() - 1: ", lastLayer.Total() - 1 );   } //
          } // 20 24 25
          //Print("Network Net::getResults...!", " fDataSetResult.Total(): ", fDataSetResult.Total(), " fDataSetResult[m_SampleCurr].Total(): ", fDataSetResult[m_SampleCurr].Total(), "  lastLayer.Total():", lastLayer.Total()); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
void COptimizer_GradiantDecent_Momentom::Train()
{         //********************************************************* Start [Triaining] *********************************************************
          if(IsDebugNN_Neurons_Matrix_YX_CNet) {Print("COptimizer_GradiantDecent_Momentom::Train()..START.! BatchSize != 0 ---");}
          //net = GetPointer(fnet); setBack();
          datetime YX_InitTime = TimeLocal();
          datetime YX_CurrTime = TimeLocal();
          YX_InitTime = TimeLocal();
          //*********************************************************
          {         for(uint j = 0;  j < m_epochs ; j++) //(j < epochs*100000) &&( (YX_CurrTime - YX_InitTime) < XY_RunTimeLimit )
                    {         //m_SampleCurr = MathRand() % m_Samples;
                              if(BatchSize == 0)
                              {         for(uint i = 0; i < m_Samples; i++)
                                        {         //******************************************************************************
                                                  //--- make the network predict the result
                                                  m_SampleCurr = i;
                                                  if(!feedForward_Net_WeightBefore( 0, "OnTraining")) return;
                                                  getResults(DataSetResult);
                                                  if(!backPropagate_Net_WeightBefore( m_epochs, 0,  1))return;
                                                  //******************************************************************************
                                        }//
                              }//
                              else
                              {         if(IsDebugNN_Neurons_Matrix_YX_CNet) {Print("COptimizer_GradiantDecent_Momentom::Train().. Epocher2..START.! BatchSize != 0 ---");}
                                        uint Packets = m_Samples / BatchSize;
                                        for(uint p = 0; p < Packets; p++)
                                        {         for(uint i = 0; i < BatchSize; i++)
                                                  {         //******************************************************************************
                                                            //--- make the network predict the result
                                                            m_SampleCurr = BatchSize * p + i;
                                                            if(IsDebugNN_Neurons_Matrix_YX_CNet)
                                                            {         Print("COptimizer_GradiantDecent_Momentom::Train()....START.! Batching ---",
                                                                            " Packets:", Packets, "  p:", p, " i", i, "   m_SampleCurr",  m_SampleCurr); }
                                                            if(!feedForward_Net_WeightBefore( 0, "OnTraining")) return;
                                                            getResults(DataSetResult);
                                                            if(!backPropagate_Net_WeightBefore( m_epochs, 0,  BatchSize))return;//
                                                            //******************************************************************************
                                                  }//
                                        }
                                        //
                              }
                              if(0)Print( "MSE_Curr_Cheack_AllSample:", (string)calculateRMSE_Samples(DataSetTarget, DataSetResult, "OnTraining calculateRMSE_Samples ")); //
                              //Print("epochs:", (string)epochs, "  ", "j:", (string)j, "  ", (string)((double)(YX_CurrTime - YX_InitTime)), "  ", (datetime)YX_InitTime, "  ", (datetime)YX_CurrTime); //
                              //******************************************************************************
                    } //
          }//
          if(IsDebugNN_Neurons_Matrix_YX_CNet) {Print("COptimizer_GradiantDecent_Momentom::Train()..START.02", "  DataSetResult.Total():", DataSetResult.Total(), "  DataSetResult[0].Total():", DataSetResult[0].Total());}
          //every epoch sample Q*H Change issue
          //********************************************************* Start [Triaining] Epoch : all sample used in training*********************************************************
          //while(MSE_Curr_Cheack_AllSample > IsMSEBreake)
          //----GRADIANT DECENT
          if(0)
          {         //Epocher(false);
                    if(XY_IsRMSE && 1)
                    {         if(1)Print( "MSE_Curr_Cheack_AllSample:", (string)calculateRMSE_Samples(DataSetTarget, DataSetResult, "OnTraining calculateRMSE_Samples ")); //
                              double MSE_Prev = 0.0;
                              uint Round = 0;
                              VectorZ<double> RMSEs; double RMSE_Mean_Prev = 0.0; double RMSE_Mean_Curr = 0.0;
                              while(calculateRMSE_Samples( DataSetTarget, DataSetResult, "OnTraining calculateRMSE_Samples ") > MinRMSE  )
                              {         //Epocher(true);
                                        RMSEs << calculateRMSE_Samples( DataSetTarget, DataSetResult, "OnTraining calculateRMSE_Samples ");
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
                                        string Soz = "Round: " + (string)Round++ + "    MSE_Sampels:" + DoubleToStr(calculateRMSE_Samples( DataSetTarget, DataSetResult, "OnTraining calculateRMSE_Samples "), 4) +
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
                                        MSE_Prev = calculateRMSE_Samples( DataSetTarget, DataSetResult, "OnTraining calculateRMSE_Samples ");; //
                              }//
                    }
                    //******************************************************************************
                    YX_CurrTime = TimeLocal();
                    //******************************************************************************
                    Print( "  Training_MSE:", DoubleToStr(calculateRMSE_Samples( DataSetTarget, DataSetResult, "OnTraining calculateRMSE_Samples "), 7)); //
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
                    double mse = calculateRMSE_Samples(DataSetTarget, DataSetResult, "OnValidation calculateRMSE_Samples");
                    Print("Training_Accuracy : ", DoubleToString(accuracy, 2) + "%", "  Training_MSE:", DoubleToStr(mse, 7)); //
                    //Print("Result       : ", TimeToStr(TrainingDataSetMatrix_Res[0].At(0)), "  ", "Result2      : ", DoubleToStr(TrainingDataSetMatrix_Res[0].At(1), 2));
                    //Print("Expected : ", TimeToStr(TrainingDataSetMatrix_Out[0].At(0)), "  ", "Expected2 : ", DoubleToStr(TrainingDataSetMatrix_Out[0].At(1), 2));        //
                    Print( "Training_OneNeuronResult2      : ", DoubleToStr(DataSetResult[0][0], 2));
                    Print( "Training_OneNeuronExpected2 : ", DoubleToStr(DataSetTarget[0][0], 2));       //
                    //
          }//
          if(IsDebugNN_Neurons_Matrix_YX_CNet) {Print("COptimizer_GradiantDecent_Momentom::Train()..END.! BatchSize != 0 ---");} }
//+------------------------------------------------------------------+
//|        propagate backwards to make the network learn             |
//+------------------------------------------------------------------+
template<typename t>
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
template<typename t>
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
//|                   COptimizer_Conjugate_Gradiant                  |
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class COptimizer_Conjugate_Gradiant: public BaseNetWorkOptimizer<t>
{
public:
          COptimizer_Conjugate_Gradiant(void) {};
          ~COptimizer_Conjugate_Gradiant(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class COptimizer_Quasi_Newton: public BaseNetWorkOptimizer<t>
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
#define IsL3x 0
//overloaded
template<typename t>
class CWeights
{
public:
          CWeights(void) {};
          ~CWeights(void) {};
          CMatirx_Vector<t>        W1, W2, W3;
          CMatirx_Vector<t>        B1, B2, B3;//
          double RMSE;
          double ACCURANCY;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//|                  COptimizer_Levenberg_Marquardt                  |
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class COptimizer_Levenberg_Marquardt: public BaseNetWorkOptimizer<t>
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
          bool  IsL3;
          bool  feedForward_Net_WeightBefore( bool b, string s);
          bool  backPropagate_Net_WeightBefore( int epocheAll, int epocheAllIdx, uint BatchCount);
          void  backPropagate_Net();
          void  Train();
          //-----------------------
          void  Sim(VectorZObj<VectorZ<t>>  &inputs, VectorZObj<VectorZ<t>>  &results, string s);
          void  TrainMatrix();
          void  TrainMatrixL3();//overloaded
          VectorZ<uint>                 layers;
          CMatirx_Vector<t>        W1, W2, W3;
          CMatirx_Vector<t>        B1, B2, B3;
          CWeights<t>                   Best_Weights;
          //
          void  feedforward(CMatirx_Vector<t> &input_net, CMatirx_Vector<t> &y1, CMatirx_Vector<t> &y2);
          void  feedforwardL3(CMatirx_Vector<t> &input_net, CMatirx_Vector<t> &y1, CMatirx_Vector<t> &y2, CMatirx_Vector<t> &y3);
          void  backpropagation(CMatirx_Vector<t> &out_net);
          //double ActivationRelu(double x) {return x;}
          //double DerivationRelu(double x) {return 1;}
          CMatirx_Vector<t> ActivationRelu(CMatirx_Vector<t> &M)
          {         CMatirx_Vector<t> out(M._rows, M._cols);
                    for(uint y = 0; y < M._rows; y++)
                    {         for(uint x = 0; x < M._cols; x++)
                              {         out.setAt(y, x, M.getAt(y, x)); //
                              }//
                    }//
                    return out;//
          }
          CMatirx_Vector<t> DerivationRelu(CMatirx_Vector<t> &M)
          {         CMatirx_Vector<t> out(M._rows, M._cols);
                    for(uint y = 0; y < M._rows; y++)
                    {         for(uint x = 0; x < M._cols; x++)
                              {         out.setAt(y, x, 1); //
                              }//
                    }//
                    return out;//
          }
          CMatirx_Vector<t> DerivationRelu(double f)
          {         CMatirx_Vector<t> out(1, 1);
                    for(uint y = 0; y < 1; y++)
                    {         for(uint x = 0; x < 1; x++)
                              {         out.setAt(y, x, 1); //
                              }//
                    }//
                    return out;//
          }
          CMatirx_Vector<t> ActivationSigmoid(CMatirx_Vector<t> &M)
          {         CMatirx_Vector<t> out(M._rows, M._cols);
                    for(uint y = 0; y < M._rows; y++)
                    {         for(uint x = 0; x < M._cols; x++)
                              {         //1.0 / (1 + exp(f * -x) )
                                        double val = 1.0 / (1.0 + exp(1.0 * -M.getAt(y, x)));
                                        out.setAt(   y, x, (t)val )    ; //
                              }//
                    }//
                    return out;//
          }
          double   DerivationReluScaler(double x) {return 1;}
          //double ActivationSigmoid(double x) {return 1 / (1 + exp(-x));}
          //double DerivationSigmoid(double x) {return x * (1 - x);}
          CMatirx_Vector<t> DerivationSigmoid(CMatirx_Vector<t> &M)
          {         CMatirx_Vector<t> out(M._rows, M._cols);
                    for(uint y = 0; y < M._rows; y++)
                    {         for(uint x = 0; x < M._cols; x++)
                              {         out.setAt(y, x, M.getAt(y, x) * (1 - M.getAt(y, x))); //
                              }//
                    }//
                    return out;//
          }
          void Draw(VectorZObj<VectorZ<t>> &times, VectorZObj<VectorZ<t>> &prices)
          {         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Draw() __Start_0.000B_", "0:", 0); //
                    //ObjectsDeleteAll(0, "Fit Point.NN");
                    if(1)
                    {         for(uint i = 0 ; i < times.Total(); i++) //sample based
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
                    else
                    {         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Draw() __Start_0.100B_", "0:", 0, "  times.Total(): ", times.Total(), "  times[0].Total(): ", times[0].Total()); //
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Draw() __Start_0.100B_", "0:", 0, "  prices.Total(): ", prices.Total(), "  prices[0].Total(): ", prices[0].Total()); //
                              for(uint i = 0 ; i < times.Total(); i++) //sample based
                              {         //if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]show result...!");
                                        for(int j = 0; j < times[0].Total(); j += 1)
                                        {         //-----------------------------------------------------------
                                                  datetime time = 0;
                                                  //if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]show result..0.!");
                                                  if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Draw() __Start_0.100B_", "0:", 0 ); //
                                                  time = (datetime)times[i][j];
                                                  //time = iTime(_Symbol, PeriodWork, gapsamples  + j);
                                                  //time = iTime(_Symbol, PeriodWork, YX_Trainingtar_index_T0 + (i * DataElementsPack) + (i * DataSamplePartsGap) - j);
                                                  //if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]show result..2.!");
                                                  if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Draw() __Start_0.200B_", "0:", 0); //
                                                  double price = prices[i][j] + 0.0;
                                                  string nameResult =  "Fit Point.NN-LM2-Training------Result:" + (string)(i) + ":" + (string)(j) + "  " + string(prices[i].Total());
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
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Draw() __Start_0.000B_END", "0:", 0); //
          }//
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
void COptimizer_Levenberg_Marquardt::Sim(VectorZObj<VectorZ<t>>  &inputs, VectorZObj<VectorZ<t>>  &results, string soz)
{         m_Samples = inputs.Total();      DataSetInput = inputs; DataSetResult = results;
          CMatirx_Vector<t> inp = MAT.Convert_VVtoMV(inputs);
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Sim() __Start_7_", "0:", 0, soz); //
          for(uint s = 0; s < inputs.Total(); s++)
          {         CMatirx_Vector<t> inputfeature = inp[s];
                    CMatirx_Vector<t> y1(1, 1);
                    CMatirx_Vector<t> y2(1, 1);
                    CMatirx_Vector<t> y3(1, 1);
                    //
                    if(IsL3x) { feedforwardL3(inputfeature, y1, y2, y3);}
                    else     { feedforward(inputfeature, y1, y2); }//
                    //
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Sim() __Start_7.1_", "0:", 0, soz); //
                    if(IsL3x)
                    {         DataSetResult[s].clear();
                              DataSetResult[s] << y3.getAt(0, 0);  }
                    else
                    {         DataSetResult[s].clear();
                              DataSetResult[s] << y2.getAt(0, 0);   }//
          }//
          results = DataSetResult;
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Sim() __Start_7_END", "0:", 0, soz); //
//ZeroMemory( W1);
//ZeroMemory( B1);
///ZeroMemory( W2);
//ZeroMemory( B2);
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
void COptimizer_Levenberg_Marquardt::TrainMatrix()
{         //return;//
          ObjectsDeleteAll(0, "Fit Point.NN-LM");
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_0_");//
          //----------------------------------------
          if(IsDebugPrintLevenberg)Print("****-----***DataSetInput.Total()", DataSetInput.Total(), "   DataSetInput[0].Total()", DataSetInput[0].Total());
          if(IsDebugPrintLevenberg)Print("****-----***DataSetTarget.Total()", DataSetTarget.Total(), "   DataSetTarget[0].Total()", DataSetTarget[0].Total());
          if(IsDebugPrintLevenberg)Print("****-----***DataSetTargetTime.Total()", DataSetTargetTime.Total(), "   DataSetTargetTime[0].Total()7", DataSetTargetTime[0].Total());
          uint n0 = DataSetInput[0].Total();  //24
          uint n1 = 5;                    //4
          uint n2 = DataSetTarget[0].Total(); //24
          layers.clear(); //---structure of network---
          layers << n0;   //---inputs--- === DataSetInput.shape(1); Fetures Count
          layers << n1;
          layers << n2;
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_1_");//
          //--------------------------------------------------------------------------------------------------
          //delete W1; delete B1; delete W2; delete B2;
          CMatirx_Vector<t> w1(layers[1], layers[0]); w1._vals.clear();
          CMatirx_Vector<t> w2(layers[2], layers[1]); w2._vals.clear();                 //-15  +15// over tershold
          for(uint i = 0; i < layers[1]*layers[0]; i++)  { t val = (t)InRange( 0, RAND_MAX_, -5, +5, rand()); w1._vals << val;}
          for(uint i = 0; i < layers[2]*layers[1]; i++)  { t val = (t)InRange( 0, RAND_MAX_, -5, +5, rand()); w2._vals << val;}
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_2_");//
          //--------------------------------------------------------------------------------------------------
          CMatirx_Vector<t> b1(layers[1], 1); b1._vals.clear();;
          CMatirx_Vector<t> b2(layers[2], 1); b2._vals.clear();;                //-500  +500// over tershold
          for(uint i = 0; i < layers[1]; i++)  { t val = (t)InRange( 0, RAND_MAX_, -5, +5, rand()); b1._vals << val;}
          for(uint i = 0; i < layers[2]; i++)  { t val = (t)InRange( 0, RAND_MAX_, -5, +5, rand()); b2._vals << val;}
          //--------------------------------------------------------------------------------------------------
          if(IsDebugPrintLevenberg)Print("*------DataSetInput.Total()", DataSetInput.Total(), "   DataSetInput[0].Total()", DataSetInput[0].Total());
          CMatirx_Vector<t> Inp = MAT.Convert_VVtoMV(DataSetInput);
          if(IsDebugPrintLevenberg)Print("*------DataSetTarget.Total()", DataSetTarget.Total(), "   DataSetTarget[0].Total()", DataSetTarget[0].Total());
          CMatirx_Vector<t> Tar = MAT.Convert_VVtoMV(DataSetTarget);
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_3.3_");//
          double        ACCURANCY       = 0;
          uint          Epochs          = 13;
          t             muAll           = (t)0.01;///m_Samples; //___BIG(GRAFIANTDECENT)____LOW(NEUTONGAUS)___beleve percent
          uint Size = (layers[1] * (layers[0] + 0)) + (layers[2] * (layers[1] + 0));//!!!!___CHEACK__BIAS___
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_3.3.0_", " Size:", Size); //
          //CMatirx_Vector<t> Jacobians               = MAT.zeros(DataSetInput.Total() * DataSetTarget[0].Total(), Size);
          CMatirx_Vector<t> Jacobians               = MAT.zeros(DataSetInput.Total(), Size);
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_3.3.0.1_");//
          //CMatirx_Vector<t> I_Weight                = MAT.eye(Size);
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_3.3.0.2_");//
          CMatirx_Vector<t> W_All                   = MAT.zeros(1, Size); //one row
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_3.3.0.3_");//
          // S1(R+1)+S2(S1+1)+SM((SM-1)+1)
          uint n_Size_Bias = (layers[1] * (layers[0] + 1)) + (layers[2] * (layers[1] + 1)) ;//!!!!___CHEACK__BIAS_EXIST__
          uint N_Size_Bias = DataSetInput.Total() * DataSetTarget[0].Total();
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_3.3.0.4_", "  N_Size_Bias* n_Size_Bias  ", N_Size_Bias * n_Size_Bias); //
          CMatirx_Vector<t> Jacobians_Bias          = MAT.zeros(N_Size_Bias, n_Size_Bias);//[120,220][5*24,220]
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_3.3.0.5_");//
          CMatirx_Vector<t> I_Bias                  = MAT.eye(n_Size_Bias );
          CMatirx_Vector<t> W_All_Bias              = MAT.zeros(1, n_Size_Bias ); //one row        MAT.zeros(DataSetTarget[0].Total(), Size_Bias );
          CMatirx_Vector<t> W_All_Bias_Best         = MAT.zeros(1, n_Size_Bias ); //one row
          CMatirx_Vector<t> W_All_Bias_Delta        = MAT.zeros(1, n_Size_Bias );
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_3.3.2_");//
          VectorZObj<CMatirx_Vector<t>>             Series_W_All_Bias;
          //-----------------------------------------------------------------------------------------------------------
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_4_");//
          W1 = w1; B1 = b1;     W2 = w2; B2 = b2;
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5_");//
          //--withbias get
          CMatirx_Vector<t> W1v         = MAT.reshape(W1, layers[1] * layers[0], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, W1v, 0, 1, 0, layers[1] * layers[0]);
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5.1_");//
          CMatirx_Vector<t> B1v         = MAT.reshape(B1, layers[1], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, B1v, 0, 1, layers[1] * layers[0], layers[1] * layers[0] + layers[1] );
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5.2_");//
          //
          CMatirx_Vector<t> W2v         = MAT.reshape(W2, layers[2] * layers[1], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, W2v, 0, 1, layers[1] * layers[0] + layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] );
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5.3_");//
          CMatirx_Vector<t> B2v         = MAT.reshape(B2, layers[2], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, B2v, 0, 1, layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] );
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5.4_");//
          //-----------------------------------------------------------------------------------------------------------
          CMatirx_Vector<t> I_Run = I_Bias;
          //return;////__No Memory leak___________
          VectorZ<double> ACCURANCY_Series;
          VectorZ<double> RMSE_Series;//  = 0.0000001;
          uint  BadResult       = 12;
          t     eta             = 0.50;
          t     alpha           = 0.50;
          t     mu              = 0.01;
          int   muCoefficient   = 5;//1.1
          //------------------------------MATRIX CALCULATION---------------------------------
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Epochs__Start_6_");//
          for(uint i = 0; i < Epochs; i++)
          {         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1_");//
                    //CMatirx_Vector<t> errorTrainSSE = MAT.zeros(DataSetInput.Total() * DataSetTarget[0].Total(), 1);
                    //CMatirx_Vector<t> errorTrainSSE = MAT.zeros(DataSetInput.Total(), DataSetTarget[0].Total());//every sample has own errors
                    CMatirx_Vector<t> errorTrainBook = MAT.zeros(DataSetTarget[0].Total(), DataSetInput.Total()); //errors has own sample
                    CMatirx_Vector<t> errorTrainSSE  = MAT.zeros(DataSetInput.Total(), 1);//every sample SSE computing
                    //errorTrainSSE.Printer("errorTrainSSE [01,05*24]      [01,05]", 0, true); //
                    CMatirx_Vector<t>    Outputs(DataSetInput.Total(), DataSetTarget[0].Total());
                    CMatirx_Vector<t>    Errors(DataSetInput.Total(), DataSetTarget[0].Total());
                    //-----------------------------------------------------------------------------------------------------------------------
                    CMatirx_Vector<t>    inputfeature;//inputfeature.Printer("    ** inputfeature  ** [01,24] ", 0, true);
                    CMatirx_Vector<t>    inputTargets;//inputTargets.Printer("    ** inputTargets  ** [01,24] ", 0, true);
                    CMatirx_Vector<t>    y1(1, n1) ;
                    CMatirx_Vector<t>    y2(1, n2);
                    //           f(w1p+b1)0
                    //        0  f(w1p+b1)0
                    //        0  f(w1p+b1)0   f(w2p+b2)0
                    //        0  f(w1p+b1)0   f(w2p+b2)0
                    //           f(w1p+b1)0
                    //FeedForward_A get SSE
                    for(uint s = 0; s < m_Samples; s++)
                    {         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.1_");//
                              inputfeature = Inp[s];
                              inputTargets = Tar[s];//[01,24
                              feedforward(inputfeature, y1, y2);//y2[24,01]
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.1.0A_", "0:", 0); //
                              DataSetResult[s].clear();
                              for(uint k = 0; k < y2.Total(); k++)
                              {         DataSetResult[s] << y2.getAt(k, 0); //
                              }//
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.2_", "0:", 0); //
                              Outputs = MAT.Seter(Outputs, y2.H(), s, s + 1, 0, y2.H().Total());
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.2.A_", "0:", 0); //
                              //inputTargets.Printer("inputTargets  [01,24]", 200, 0);
                              //y2.Printer("y2  [24,01] ", 200, 0);
                              CMatirx_Vector<t> error = (inputTargets - y2.T()) ;/// m_Samples ; //one sample elements
                              //error.Printer("error   [01,24] ", 200, true);
                              Errors = MAT.Seter(Errors, error.H(), s, s + 1, 0, error.H().Total());
                              //Print("-------------------- ------------------------");//
                              double SSE = 0;
                              for(uint L = 0; L < y2.total(); L++)
                              {         //errorTrainSSE.setAt(s * m_Samples + L, 0, error.getAt(0, L)); //invert worked
                                        //error.T()*error;//
                                        errorTrainBook.setAt(L, s, error.getAt(0, L));
                                        //
                              }
                              SSE = ((error.dot(error.T())).getAt(0, 0)); //
                              double RMSEQ = sqrt(SSE / DataSetTarget[0].Total());
                              //Print("s:", s, "  SSE: ", SSE,  "  RMSEQ: ", RMSEQ);
                              errorTrainSSE.setAt(s, 0, RMSEQ); //invert worked
                              if(0)
                              {         if(error.getAt(0, 0) < 0.01) continue;
                                        if(ACCURANCY_Sample( inputTargets.getAt(0, 0),  y2.getAt(0, 0)) > 80)continue;//
                              }//
                    }//
                    double RMSE_A = calculateRMSE_Samples(DataSetTarget, DataSetResult, "Levenberg");
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.2.0_", "0:", 0); //
                    for(uint s = 0; s < m_Samples; s++)
                    {         //Print("-------------------- ------------------------");//
                              CMatirx_Vector<t> d_f2[];         ArrayResize(d_f2, DataSetTarget[0].Total()); //(24, 1);;
                              CMatirx_Vector<t> d_f1[];         ArrayResize(d_f1, DataSetTarget[0].Total()); //(4, 1);;
                              //d_f1 = MAT.DataNormilizer(d_f1, -1, +1, SHORT_MIN, SHORT_MAX);
                              CMatirx_Vector<t> diag_d_f2[];    ArrayResize(diag_d_f2, DataSetTarget[0].Total()); //(24, 24);
                              CMatirx_Vector<t> diag_d_f1[];    ArrayResize(diag_d_f1, DataSetTarget[0].Total()); //(4, 4);
                              //CMatirx_Vector<t> MinusOneRow(24, 1, -1); //diag_d_f2 * -1;
                              CMatirx_Vector<t> SL2[];          ArrayResize(SL2, DataSetTarget[0].Total()); //(24, 1);
                              CMatirx_Vector<t> FWL2[];         ArrayResize(FWL2, DataSetTarget[0].Total()); //(4, 24);
                              CMatirx_Vector<t> SL1[];          ArrayResize(SL1, DataSetTarget[0].Total()); //(4, 1);
                              //
                              CMatirx_Vector<t> gW1[];          ArrayResize(gW1, DataSetTarget[0].Total()); //(4, 24);
                              CMatirx_Vector<t> gB1[];          ArrayResize(gB1, DataSetTarget[0].Total()); //(4, 1);
                              CMatirx_Vector<t> gW2[];          ArrayResize(gW2, DataSetTarget[0].Total()); //(24, 4);
                              CMatirx_Vector<t> gB2[];          ArrayResize(gB2, DataSetTarget[0].Total()); //(24, 1);
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.2.0.D_", "0:", 0); //
                              if(0)
                              {         //for(int u = 0; u < DataSetTarget[0].Total(); u++)
                                        //{         d_f2[u]       = DerivationRelu(y2.getAt(u, 0));
                                        //          d_f1[u]       = DerivationSigmoid(y1);
                                        //          //d_f1 = MAT.DataNormilizer(d_f1, -1, +1, SHORT_MIN, SHORT_MAX);
                                        //          diag_d_f1[u]  = MAT.diagflat(d_f1[u], true);
                                        //          //Print("-------------------- ------------------------");////d_f1 = MAT.DataNormilizer(d_f1, -1, +1, SHORT_MIN, SHORT_MAX);
                                        //          SL2[u]        = d_f2[u] * -1; //-f'
                                        //          FWL2[u]       = W2 * SL2[u].getAt(0, 0); //f'W   //1*1 . 1*4  //target is x*1  W2.Printer("W2   [24,04]", 0, true); //
                                        //          SL1[u]        = MAT.dot(FWL2[u], diag_d_f1[u]); //SL1[u].Printer("SL1 [04,01]", 600, 1); //f'WS
                                        //          //Print("-------------------- ------------------------");//
                                        //          gW1[u]        = MAT.dot(SL1[u], inputfeature);  gW1[u].Printer("gW1 [04,24]", 0, true); //
                                        //          gB1[u]        = SL1[u].T() * 0;                 gB1[u].Printer("gB1 [04,01]", 0, true); //
                                        //          gW2[u]        = MAT.dot(SL2[u].T(), y1);        gW2[u].Printer("gW2 [24,04]", 0, true); //
                                        //          gB2[u]        = SL2[u].T() * 0;                 gB2[u].Printer("gB2 [24,01]", 0, true); //
                                        //}
                              }
                              else if(1)//as book matris calc order FWtS   // 'one row has one error of 1/Q sample 1/S(M) target neuron '
                              {         //y2.Printer("y2 [24,01]", 200, true) ; //
                                        //y1.Printer("y1 [04,01]", 200, true) ; //
                                        for(int u = 0; u < DataSetTarget[0].Total(); u++)
                                        {         //out layer    S=-F';
                                                  {         d_f2[u]       = DerivationRelu(Outputs[s].getAt(0, u));                //d_f2.Printer("d_f2 [24,01]", 200, true) ; //
                                                            diag_d_f2[u]  = MAT.diagflat(d_f2[u], true);          //diag_d_f2.Printer("diag_d_f2 [24,24]", 200, true) ; //
                                                            //Print("-------------------- ------------------------");//[24,01].[24,04]=[01,04]
                                                            //SL2        = MAT.dot(MinusOneRow, diag_d_f2)    SL2.Printer("SL2 [24,01]", 0, true); //-f' 1*24*24*4
                                                            CMatirx_Vector<t> Temp(DataSetTarget[0].Total(), 1, (d_f2[u] * -1).getAt(0, 0));
                                                            //              [24,1].[1,1] =[24,1]
                                                            SL2[u]        = Temp;                       //SL2.Printer("SL2 [24,01]", 600, 0); //-f' 1*24*24*4
                                                  }
                                                  //-----------------------------------------------------
                                                  //hidden layer    S=F'*W.t()+1*S+1;
                                                  {         d_f1[u]       = DerivationSigmoid(y1);             //d_f1.Printer("d_f1 [04,01]", 200, true) ; //
                                                            diag_d_f1[u]  = MAT.diagflat(d_f1[u], true);          //diag_d_f1.Printer("diag_d_f1 [04,04]", 200, true) ; //
                                                            //                   [4,4].[4,24] =[4,24]
                                                            FWL2[u]       = MAT.dot(diag_d_f1[u], W2.T());        //W2.Printer("W2   [24,04]", 0, true); FWL2.Printer("FWL2 [04,24]", 0, true);
                                                            //                  [4,24].[24,1] =[4,1]
                                                            SL1[u]        = MAT.dot(FWL2[u], SL2[u]);                //SL1.Printer("SL1 [04,01]", 600, 0); //f'WS
                                                  }
                                                  //Print("-------------------- ------------------------"); //inputfeature.Printer("inputfeature [01,24] ", 200, true); ////
                                                  // Update Gradients of Parameters
                                                  {         gW2[u]        = MAT.dot(SL2[u], y1.T());              //gW2.Printer("gW2 [24,04]", 0, true); //
                                                            gB2[u]        = SL2[u] * 1;                           //gB2.Printer("gB2 [24,01]", 0, true); //
                                                            gW1[u]        = MAT.dot(SL1[u], inputfeature);        //gW1.Printer("gW1 [04,24]", 0, true); //
                                                            gB1[u]        = SL1[u] * 1;                           //gB1.Printer("gB1 [04,01]", 0, true); //
                                                  }//
                                        }//
                              }
                              else//as book matris calc order FWtS RMSE of targets
                              {         //y2.Printer("y2 [24,01]", 200, true) ; //
                                        //y1.Printer("y1 [04,01]", 200, true) ; //
                                        for(int u = 0; u < DataSetTarget[0].Total(); u++)
                                        {         //out layer    S=-F';
                                                  {         d_f2[u]       = DerivationRelu(Outputs[s]);               //d_f2.Printer("d_f2 [24,01]", 200, true) ; //
                                                            diag_d_f2[u]  = MAT.diagflat(d_f2[u], true);          //diag_d_f2.Printer("diag_d_f2 [24,24]", 200, true) ; //
                                                            //Print("-------------------- ------------------------");//[24,01].[24,04]=[01,04]
                                                            //SL2        = MAT.dot(MinusOneRow, diag_d_f2)    SL2.Printer("SL2 [24,01]", 0, true); //-f' 1*24*24*4
                                                            //              [24,1].[1,1] =[24,1]
                                                            SL2[u]        = d_f2[u] * -1;                         //SL2.Printer("SL2 [24,01]", 600, 0); //-f' 1*24*24*4
                                                  }
                                                  //-----------------------------------------------------
                                                  //hidden layer    S=F'*W.t()+1*S+1;
                                                  {         d_f1[u]       = DerivationSigmoid(y1);             //d_f1.Printer("d_f1 [04,01]", 200, true) ; //
                                                            diag_d_f1[u]  = MAT.diagflat(d_f1[u], true);          //diag_d_f1.Printer("diag_d_f1 [04,04]", 200, true) ; //
                                                            //                   [4,4].[4,24] =[4,24]
                                                            FWL2[u]       = MAT.dot(diag_d_f1[u], W2.T());        //W2.Printer("W2   [24,04]", 0, true); FWL2.Printer("FWL2 [04,24]", 0, true);
                                                            //                  [4,24].[24,1] =[4,1]
                                                            SL1[u]        = MAT.dot(FWL2[u], SL2[u]);                //SL1.Printer("SL1 [04,01]", 600, 0); //f'WS
                                                  }
                                                  //Print("-------------------- ------------------------"); //inputfeature.Printer("inputfeature [01,24] ", 200, true); ////
                                                  // Update Gradients of Parameters
                                                  {         gW2[u]        = MAT.dot(SL2[u], y1.T());              //gW2.Printer("gW2 [24,04]", 0, true); //
                                                            gB2[u]        = SL2[u] * 0;                           //gB2.Printer("gB2 [24,01]", 0, true); //
                                                            gW1[u]        = MAT.dot(SL1[u], inputfeature);        //gW1.Printer("gW1 [04,24]", 0, true); //
                                                            gB1[u]        = SL1[u] * 0;                           //gB1.Printer("gB1 [04,01]", 0, true); //
                                                  }//
                                        }//
                              }
                              //Print("-------------------- ------------------------");//
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3_");//
                              //--------JACOBIANS-BIAS---ToptoDown-----------
                              for(int u = 0; u < DataSetTarget[0].Total(); u++)
                              {         CMatirx_Vector<t> gW1v        = MAT.reshape(gW1[u], layers[1] * layers[0], 1);
                                        CMatirx_Vector<t> gB1v        = MAT.reshape(gB1[u], layers[1], 1);
                                        if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.1_");//
                                        Jacobians_Bias                = MAT.Seter(Jacobians_Bias, gW1v, s * DataSetTarget[0].Total() + u, s * DataSetTarget[0].Total() + u + 1, 0, layers[1] * layers[0]);
                                        if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.2_");//
                                        Jacobians_Bias                = MAT.Seter(Jacobians_Bias, gB1v, s * DataSetTarget[0].Total() + u, s * DataSetTarget[0].Total() + u + 1, layers[1] * layers[0], layers[1] * layers[0] + layers[1]);
                                        //
                                        CMatirx_Vector<t> gW2v        = MAT.reshape(gW2[u], layers[2] * layers[1], 1);
                                        CMatirx_Vector<t> gB2v        = MAT.reshape(gB2[u], layers[2], 1);
                                        if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.3_");//
                                        Jacobians_Bias                = MAT.Seter(Jacobians_Bias, gW2v, s * DataSetTarget[0].Total() + u, s * DataSetTarget[0].Total() + u + 1, layers[1] * layers[0] + layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] );
                                        if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.4_");//
                                        Jacobians_Bias                = MAT.Seter(Jacobians_Bias, gB2v, s * DataSetTarget[0].Total() + u, s * DataSetTarget[0].Total() + u + 1,  layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2]);
                                        //
                              }
                              //
                              /*
                              CMatirx_Vector<t> d_f3       = DerivationRelu(y3);
                              CMatirx_Vector<t> d_f2       = DerivationSigmoid(y2);
                              CMatirx_Vector<t> diag_d_f2  = MAT.diagflat(d_f2);
                              CMatirx_Vector<t> d_f1       = DerivationSigmoid(y1);
                              CMatirx_Vector<t> diag_d_f1  = MAT.diagflat(d_f1);
                              //
                              CMatirx_Vector<t> temp1L4  =  d_f3 * -1;
                              CMatirx_Vector<t> temp2L3  =  W3 * temp1L4.getAt(0, 0); //1*1 . 1*4  //target is x*1
                              CMatirx_Vector<t> temp3L3  =  MAT.dot(temp2L3, diag_d_f2);
                              CMatirx_Vector<t> temp4L2  =  MAT.dot(temp3L3, W2);
                              CMatirx_Vector<t> temp5L2  =  MAT.dot(temp4L2, diag_d_f1);
                              CMatirx_Vector<t> temp5TL2 =  temp5L2.T();
                              CMatirx_Vector<t> temp6L1  =  MAT.dot(temp5TL2, inputfeature);
                              //
                              CMatirx_Vector<t> gW1    = temp6L1;
                              CMatirx_Vector<t> gB1    = temp5TL2;
                              CMatirx_Vector<t> gW2    = MAT.dot(temp3L3.T(), y1);
                              CMatirx_Vector<t> gB2    = temp3L3.T();
                              CMatirx_Vector<t> gW3    = MAT.dot(temp1L4.T(), y2);;
                              CMatirx_Vector<t> gB3    = temp1L4.T();

                              */
                    } //
                    if(IsDebugPrintLevenberg)Print("------------------------------[MATRIX CALCULATION]---------------------------------");//
                    {         t eTe =  0;
                              eTe =  errorTrainSSE.T().dot(errorTrainSSE).getAt(0, 0);//____ErrorAdaptive__Make overRange____
                              //for(int x = 0; x < total; x++)
                              {         // eTe =  errorTrainSSE.T().dot(errorTrainSSE).getAt(0, x);//____ErrorAdaptive__Make overRange____
                              }
                              //errorTrainSSE.Printer("MATRIX CALCULATION errorTrainSSE [05,01]", 0, true); //
                              eTe   = MAT.InRange_( -1000000, 1000000, 0.00001, 0.10000, eTe);
                              //  mu  =  1 * muAll * eTe; //eTe;//MathAbs(ACCURANCY / 100);
                              Print("muAll:", muAll, "  mu:", mu, "  eTe:", eTe);
                              //x={-[J.t().dot(J) + mu*I].inv().dot(J.t().dot(v))}
                              CMatirx_Vector<t> JacobianCalc            = Jacobians_Bias;                                               //JacobianCalc.Printer("JacobianCalc [05,220]~[120,220]", 0, true); //
                              CMatirx_Vector<t> JacobianCalc_Mul        = JacobianCalc.T().dot(JacobianCalc);                           //JacobianCalc_Mul.Printer("JacobianCalc_Mul [220,220]", 0, true); //
                              CMatirx_Vector<t> IdentifyMu              = I_Run * mu;                                                   //IdentifyMu.Printer("IdentifyMu [220,220]", 0, true); //
                              CMatirx_Vector<t> JacobianCalcIdentifyMu  = JacobianCalc_Mul + IdentifyMu;                                //JacobianCalcIdentifyMu.Printer("JacobianCalcIdentifyMu [220,220]", 0, true); //
                              CMatirx_Vector<t> HesianInvert            = JacobianCalcIdentifyMu.invert4();                             //HesianInvert.Printer("HesianInvert [220,220]", 0, true); //
                              CMatirx_Vector<t> Gradiant                = MAT.dot(JacobianCalc.T(), errorTrainBook.V());                            //Gradiant.Printer("Gradiant [220,120].[120,1]", 0, true);
                              CMatirx_Vector<t> DeltaX                  = MAT.dot(HesianInvert, Gradiant);                                          //DeltaX.Printer("DeltaX [220,220].[220,1]", 0, true);
                              //-------------------------------------------------------------------------------------------------------------------------------------------------------1 / m_Samples  0.05
                              CMatirx_Vector<t> W_All_Bias_Rand                          = MAT.Rand(1, n_Size_Bias, -100.00005, +100.00005); //one row     DataSetTarget[0].Total()
                              W_All_Bias_Delta                                           = (W_All_Bias + (W_All_Bias_Rand * (t)0.03)).RandIn(0, +1, 0.003); // {++ +} {-+ -} low high{0 1 , 1 10}
                              t Percent = (t)( MathRand() / (32767));
                              W_All_Bias_Delta                                           = (W_All_Bias + (W_All_Bias_Rand * Percent));
                              //-------------------------------------------------------------------------------------------------------------------------------------------------------
                              //if(i < 2)                                                    W_All_Bias_Best = W_All_Bias;
                              W_All_Bias                                                 = W_All_Bias - DeltaX.T();
                              //-------------------------------------------------------------------------------------------------------------------------------------------------------
                              t RandPercent1 = (t)InRange( 0, RAND_MAX_, 0.00001, 0.25, rand());
                              t RandPercent2 = (t)(0.25 - RandPercent1);
                              CMatirx_Vector<t> W_All_Bias_temp1      = W_All_Bias         * RandPercent1;
                              CMatirx_Vector<t> W_All_Bias_temp2      = W_All_Bias_Rand    * (RandPercent2 / 1000);
                              double fxeta = (3 * eta * eta * eta + 2 * eta * eta + 1 * eta) * 0.18;
                              eta   = eta - fxeta * 0.5;;
                              eta   = 0.50;//0.50
                              //Print("********eta:", eta, "*******fxeta:", fxeta, "*********");
                              double fxAlpha = (3 * alpha * alpha * alpha + 2 * alpha * alpha + 1 * alpha) * 0.18;
                              alpha = alpha - fxAlpha * 0.5; //(-alpha*alpha*alpha); //fifty fifty bether recognized -x*x*x //(3x*x*x+2x*x+1x)*0.18//[(1+1)/1] (0,2)((MathRand() + MathRand()) / (32767))//+ (alpha * -0.50 )
                              alpha = 0.25;//0.50
                              //Print("********alpha:", alpha, "*******fxAlpha:", fxAlpha, "*********");
                              if(0)
                              {         if(RMSE_Series.peek(1) > RMSE_Series.GetMin())
                                        {         eta = 0.12; alpha = 0.88;//badresult memory best
                                                  Print("********eta:", eta, "*******fxeta:", fxeta, "*********");
                                                  Print("********alpha:", alpha, "*******fxAlpha:", fxAlpha, "*********"); //
                                        }//
                              }//
                              //W_All_Bias                                  = ((W_All_Bias * 0.50) + (W_All_Bias_Delta * 0.125) + (W_All_Bias_Best * 0.375)) * 1.00; //++
                              //W_All_Bias                                  = ((W_All_Bias * 1.00) + (W_All_Bias_Delta * 0.00)); //++
                              //------------------------------------------------------------------------------------------
                              //if(RMSE_prev > calculateRMSE_Samples( "Levenberg")) { W_All_Bias_Best     = W_All_Bias; }
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_24_", "W_All_Bias.Size():", W_All_Bias.Size()); //
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
                    }//
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------
                    //Feed Forward After Set Parameters for get RMSE
                    for(uint s = 0; s < m_Samples; s++)
                    {         inputfeature = Inp[s]; //inputfeature.Printer("inputfeature          ");
                              feedforward(inputfeature, y1, y2);
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_7.000A_", "0:", 0); //
                              DataSetResult[s].clear();
                              for(uint k = 0; k < y2.Total(); k++)
                              {         DataSetResult[s] << y2.getAt(k, 0); //
                              }//
                    }
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_27.00_", "W_All1.Size():", W1.Size()); //
                    ACCURANCY = ACCURANCY_Vector(m_Samples, DataSetTarget, DataSetResult);
                    double RMSE = calculateRMSE_Samples(DataSetTarget, DataSetResult, "Levenberg");
                    ////-------------------------------------------------------------------------------------------------------------------------------------------------------
                    if(0)
                    {         if(RMSE_A > RMSE)  {mu    = mu / muCoefficient;}   //eTe;//MathAbs(ACCURANCY / 100);
                              else               {mu    = mu * muCoefficient;} //
                              //Print("------mu Channged----");//
                    }
                    ////-------------------------------------------------------------------------------------------------------------------------------------------------------
                    bool IsReturn = false;
                    if(0)
                    {         if(RMSE_Series.GetMin() > RMSE )
                              {         Series_W_All_Bias  << W_All_Bias; //
                                        W_All_Bias_Best = W_All_Bias;//
                              }
                              if(RMSE > 3000)
                              {         Print("__EXITE_____RMSE > 3000_______");
                                        W_All_Bias = W_All_Bias_Best; IsReturn = true; //
                              }
                              if(MathAbs(RMSE - RMSE_Series.peek(1)) < 0.000001)
                              {         Print("__EXITE_____MathAbs(RMSE - RMSE_Series.peek(1)) < 0.0001_______");
                                        IsReturn = true;; //
                              }
                              if( RMSE_Series.GetMin() < RMSE)
                              {         BadResult--;
                                        if(BadResult <= 0)
                                        {         Print("__EXITE__12___BadResult <= 0_______");
                                                  IsReturn = true;; //
                                        } //
                              }//
                    }
                    RMSE_Series         << RMSE;
                    ACCURANCY_Series    << ACCURANCY;
                    //from best start dont loss best
                    {         if(0)
                              {         W1  = MAT.geter(W_All_Bias_Best, 0, 1, 0, layers[1] * layers[0], layers[1], layers[0]); //W1.Printer("W1
                                        B1  = MAT.geter(W_All_Bias_Best, 0, 1, layers[1] * layers[0], layers[1] * layers[0] + layers[1], layers[1], 1); //B1.Printer("B1                          ");
                                        if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_25_", "W_All1.Size():", W1.Size()); //
                                        W2  = MAT.geter(W_All_Bias_Best, 0, 1, layers[1] * layers[0] + layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[2], layers[1]);
                                        B2  = MAT.geter(W_All_Bias_Best, 0, 1, layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2], layers[2], 1);
                                        //
                              }
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_26.00_", "W_All1.Size():", W1.Size()); //
                              //W_All_Bias = W_All_Bias_Best; //
                              //-------------------------------------------------------------------------------------------------------------------------------------------------------
                              for(uint s = 0; s < m_Samples; s++)
                              {         inputfeature = Inp[s]; //inputfeature.Printer("inputfeature          ");
                                        feedforward(inputfeature, y1, y2);
                                        if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_27.001B_", "0:", 0); //
                                        DataSetResult[s].clear();
                                        //DataSetResult[s] << y2.getAt(0, 0); //
                                        //y2.Printer("  y2  ", 200);
                                        for(uint k = 0; k < y2.Total(); k++)
                                        {         DataSetResult[s] << y2.getAt(k, 0); //
                                        }//
                              }
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Draw() __Start_0.100B_", "0:", 0, "  DataSetTargetTime.Total(): ", DataSetTargetTime.Total(), "  DataSetTargetTime[0].Total(): ", DataSetTargetTime[0].Total()); //
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Draw() __Start_0.100B_", "0:", 0, "  DataSetResult.Total(): ", DataSetResult.Total(), "  DataSetResult[0].Total(): ", DataSetResult[0].Total()); //
                              Draw(DataSetTargetTime, DataSetResult);//
                    }
                    Print("__EPOCH__", i, "__RMSE_Series.peek():( ", RMSE_Series.peek(1), " )", "__RMSE_Series.GetMin():( ", RMSE_Series.GetMin(), "    ACCURANCY_Series.peek():( ", ACCURANCY_Series.peek(1), ")   ACCURANCY_Series.GetMin():( ", ACCURANCY_Series.GetMin(), ")   ACCURANCY_Series.GetMax():( ", ACCURANCY_Series.GetMax(), " )  __mu__", mu); //
                    if(IsReturn) { return;} //
          }
          Series_W_All_Bias.clear();
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __END__");//
          //---------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
void COptimizer_Levenberg_Marquardt::feedforward(CMatirx_Vector<t> &input_net, CMatirx_Vector<t> &y1, CMatirx_Vector<t> &y2)
{         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::feedforward __Start_0_", "0:", 0); //
          //feedForward
          if(0)
          {         CMatirx_Vector<t>  inp = input_net.T();        //inp.Printer("inp          ", 200); ////
                    CMatirx_Vector<t>  Winp = MAT.dot( W1, inp);   //Winp.Printer("Winp          ", 200); W1.Printer("W1          ", 200); //
                    CMatirx_Vector<t>  WinpB = Winp + B1;          //WinpB.Printer("WinpB          ", 200); B1.Printer("B1          ", 200); //
                    CMatirx_Vector<t>  x1 = WinpB ;                //x1.Printer("x1          ", 200); // //+ B1  1 * 2 , 2 * 1
                    //Print(InRange( -DBL_MAX/2, DBL_MAX/2, -1, +1, MathRand())); return;//-DBL_MAX, DBL_MAX>>-nan(ind)----DBL_MAX/2, DBL_MAX/2 worked
                    //x1.Printer("x1  before n        ", 500); //
                    //x1 = MAT.DataNormilizer(x1,SHORT_MIN, SHORT_MAX,-1, +1);
                    //x1.Printer("x1  after n        ", 500); //
                    y1 = ActivationSigmoid(x1);
                    CMatirx_Vector<t> Winp2     = MAT.dot(W2, y1); //W2.Printer("W2          ", 200); Winp2.Printer("Winp2          ", 200);
                    CMatirx_Vector<t> WinpB2    = Winp2 + B2;      //B2.Printer("B2          ", 200); WinpB2.Printer("WinpB2          ", 200);
                    CMatirx_Vector<t> x2        = WinpB2;;         //x2.Printer("x2          ", 200);      //  1 * 2 * 2 * 1
                    y2 = x2;                                    //y2.Printer("y2          ", 200);
          }
          else
          {         //Print("--------------------ok------------------------");//.
                    //input_net.T().Printer("feedforward input_net.T()[24,01]          ", 200, false);
                    CMatirx_Vector<t>  inp      = input_net.T() ;        //inp.Printer("inp          ", 200); ////
                    CMatirx_Vector<t>  Winp     = MAT.dot(W1, inp);      //Winp.Printer("Winp          ", 200);           W1.Printer("W1          ", 200); //
                    CMatirx_Vector<t>  WinpB1   = Winp + B1;             //WinpB1.Printer("WinpB1          ", 200);       B1.Printer("B1          ", 200); //
                    CMatirx_Vector<t>  x1       = WinpB1 ;                //x1.Printer("x1          ", 200); // //+ B1  1 * 2 , 2 * 1
                    //Print(InRange( -DBL_MAX/2, DBL_MAX/2, -1, +1, MathRand())); return;//-DBL_MAX, DBL_MAX>>-nan(ind)----DBL_MAX/2, DBL_MAX/2 worked
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::feedforward __Start_1_", "0:", 0); //
                    //x1.Printer("x1  before n        ", 500); //
                    //x1 = MAT.DataNormilizer(x1,SHORT_MIN, SHORT_MAX,-1, +1);
                    //x1.Printer("x1  after n        ", 500); //
                    //x1.Printer("feedforward x1[04,01]          ", 200, false);
                    y1 = ActivationSigmoid(x1);         //y1.Printer("y1          ", 200);
                    //y1.Printer("feedforward y1[04,01]          ", 200, false);
                    CMatirx_Vector<t> Winp2     = MAT.dot(W2, y1 );     //W2.Printer("W2          ", 200);        Winp2.Printer("Winp2          ", 200);
                    CMatirx_Vector<t> WinpB2    = Winp2 + B2;           // B2.Printer("B2          ", 200);        WinpB2.Printer("WinpB2          ", 3100);
                    CMatirx_Vector<t> x2        = WinpB2;;             //x2.Printer("x2          ", 200);      //  1 * 2 * 2 * 1
                    y2 = x2;                                        //y2.Printer("y2          ", 200);
                    //y2.Printer("feedforward y2[24,01]          ", 200, false);//
                    //Sleep(10000);//
          } //
          //Print("--------------------------------------------");//
          //
          /*
          uint n0 = DataSetInput[0].Total();  //24
          uint n1 = 4 * 1;                    //4
          uint n2 = DataSetTarget[0].Total(); //24

          CMatirx_Vector<t> w1(layers[1], layers[0]);
          CMatirx_Vector<t> w2(layers[2], layers[1]);

          CMatirx_Vector<t> b1(layers[1], 1);
          CMatirx_Vector<t> b2(layers[2], 1);
          //-----------------------------------------------------
          CMatirx_Vector<t> w1(4, 24);
          CMatirx_Vector<t> w2(24, 4);

          CMatirx_Vector<t> b1(4, 1);
          CMatirx_Vector<t> b2(24, 1);
          */
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::feedforward __Start_3_END_", "0:", 0); //
          //
}
template<typename t>
void COptimizer_Levenberg_Marquardt::feedforwardL3(CMatirx_Vector<t> &input_net, CMatirx_Vector<t> &y1, CMatirx_Vector<t> &y2, CMatirx_Vector<t> &y3)
{         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::feedforward __Start_0_", "0:", 0); //
          //feedForward
          //L1
          CMatirx_Vector<t>        inp   = input_net.T();//
          CMatirx_Vector<t>        Winp  = MAT.dot( W1, inp);
          CMatirx_Vector<t>        WinpB = Winp + B1;
          CMatirx_Vector<t>        x1    = WinpB ; //+ B1  1 * 2 , 2 * 1
          y1 = ActivationSigmoid(x1);
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::feedforward __Start_2_", "  W2.Size():", W2.Size(), "  y1.Size():", y1.Size(), "  B2.Size():", B2.Size()); //
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::feedforward __Start_2_", "  W2._rows:", W2._rows, "  W2._cols:", W2._cols, "  y1._rows:", y1._rows, "  y1._cols:", y1._cols); //
          //L2
          CMatirx_Vector<t>        Winp2  = MAT.dot(W2, y1);
          CMatirx_Vector<t>        WinpB2 = Winp2 + B2;
          CMatirx_Vector<t>        x2     = WinpB2;; //  1 * 2 * 2 * 1
          y2 = ActivationSigmoid(x2);
          //x2.Printer("x2          ", 200); //
          CMatirx_Vector<t>        Winp3  = MAT.dot(W3, y2);
          CMatirx_Vector<t>        WinpB3 = Winp3 + B3;
          CMatirx_Vector<t>        x3     = WinpB3; //  1 * 2 * 2 * 1
          y3 = x3;
          //
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::feedforward __Start_3_END", "0:", 0); //
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
void COptimizer_Levenberg_Marquardt::TrainMatrixL3()
{         //return;//
          ObjectsDeleteAll(0, "Fit Point.NN-LM");
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_0_");//
          //----------------------------------------
          uint n0 = DataSetInput[0].Total();
          uint n1 = 8;
          uint n2 = 4;
          uint n3 = 1;
          layers.clear(); //--structure of network--
          layers << DataSetInput[0].Total(); //---inputs--- === DataSetInput.shape(1);
          layers << n1;
          layers << n2;
          layers << n3;
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_1_");//
          //--------------------------------------------------------------------------------------------------
          //delete W1; delete B1; delete W2; delete B2;
          CMatirx_Vector<t> w1(layers[1], layers[0]); w1._vals.clear();
          CMatirx_Vector<t> w2(layers[2], layers[1]); w2._vals.clear();
          CMatirx_Vector<t> w3(layers[3], layers[2]); w3._vals.clear();
          for(uint i = 0; i < layers[1]*layers[0]; i++)  { t val = (t)InRange( 0, RAND_MAX_, -5, 5, rand()); w1._vals << val;} if(IsDebugPrintLevenberg) {Print(" W_All",  "   W1.getAt(0, 0): ", w1.getAt(0, 0), "  InRange: ", InRange( 0, RAND_MAX_, -1, 1, rand()));}
          for(uint i = 0; i < layers[2]*layers[1]; i++)  { t val = (t)InRange( 0, RAND_MAX_, -5, 5, rand()); w2._vals << val;} if(IsDebugPrintLevenberg) {Print(" W_All",  "   W2.getAt(0, 0): ", w2.getAt(0, 0), "  InRange: ", InRange( 0, RAND_MAX_, -1, 1, rand()) );}
          for(uint i = 0; i < layers[3]*layers[2]; i++)  { t val = (t)InRange( 0, RAND_MAX_, -5, 5, rand()); w3._vals << val;} if(IsDebugPrintLevenberg) {Print(" W_All",  "   W2.getAt(0, 0): ", w3.getAt(0, 0), "  InRange: ", InRange( 0, RAND_MAX_, -1, 1, rand()) );}
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_2_");//
          //--------------------------------------------------------------------------------------------------
          CMatirx_Vector<t> b1(layers[1], 1); b1._vals.clear();;
          CMatirx_Vector<t> b2(layers[2], 1); b2._vals.clear();;
          CMatirx_Vector<t> b3(layers[3], 1); b3._vals.clear();;
          for(uint i = 0; i < layers[1]; i++)  { t val = (t)InRange( 0, RAND_MAX_, -5, 5, rand()); b1._vals << val;} if(IsDebugPrintLevenberg) {Print(" W_All",  "   B1.getAt(0, 0): ", b1.getAt(0, 0), "  InRange: ", InRange( 0, RAND_MAX_, -1, 1, rand()));}
          for(uint i = 0; i < layers[2]; i++)  { t val = (t)InRange( 0, RAND_MAX_, -5, 5, rand()); b2._vals << val;} if(IsDebugPrintLevenberg) {Print(" W_All",  "   B2.getAt(0, 0): ", b2.getAt(0, 0), "  InRange: ", InRange( 0, RAND_MAX_, -1, 1, rand()) );}
          for(uint i = 0; i < layers[3]; i++)  { t val = (t)InRange( 0, RAND_MAX_, -5, 5, rand()); b3._vals << val;} if(IsDebugPrintLevenberg) {Print(" W_All",  "   B2.getAt(0, 0): ", b3.getAt(0, 0), "  InRange: ", InRange( 0, RAND_MAX_, -1, 1, rand()) );}
          //--------------------------------------------------------------------------------------------------
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_3_");//
          CMatirx_Vector<t> Inp = MAT.Convert_VVtoMV(DataSetInput);
          CMatirx_Vector<t> Tar = MAT.Convert_VVtoMV(DataSetTarget );
          uint Epochs = 100;
          double                        muAll                   = 0.1;///m_Samples; //___BIG(GRAFIANTDECENT)____LOW(NEUTONGAUS)___beleve percent
          uint Size = layers[1] * layers[0] + layers[2] * layers[1] + layers[3] * layers[2];
          CMatirx_Vector<t> Jacobians               = MAT.zeros(DataSetInput.Total(), Size);
          CMatirx_Vector<t> I_Weight                = MAT.eye(Size);
          CMatirx_Vector<t> W_All                   = MAT.zeros(1, Size); //one row
          //
          uint Size_Bias = Size + layers[1] + layers[2] + layers[3];
          CMatirx_Vector<t> Jacobians_Bias          = MAT.zeros(DataSetInput.Total(), Size_Bias);
          CMatirx_Vector<t> I_Bias                  = MAT.eye(Size_Bias );
          CMatirx_Vector<t> W_All_Bias              = MAT.zeros(1, Size_Bias ); //one row
          CMatirx_Vector<t> W_All_Bias_Best         = MAT.zeros(1, Size_Bias ); //one row
          CMatirx_Vector<t> W_All_Bias_Delta        = MAT.zeros(1, Size_Bias );
          //-----------------------------------------------------------------------------------------------------------
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_4_");//
          //
          //CMatirx_Vector<t>        W1v = MAT.reshape(W1, layers[1] * layers[0], 1);
          //W_All                                         = MAT.Seter(W_All, W1v, 0, 1, 0, layers[1] * layers[0]);
          //if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_4_", "W_All1.Size():", W_All.Size()); //
          ////
          //CMatirx_Vector<t>        W2v = MAT.reshape(W2, layers[2] * layers[1], 1);
          //W_All                                         = MAT.Seter(W_All, W2v, 0, 1, layers[1] * layers[0], layers[1] * layers[0] + layers[2] * layers[1] );
          //if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_5_", "W_All2.Size():", W_All.Size()); //
          //-----------------------------------------------------------------------------------------------------------
          W1 = w1; B1 = b1;     W2 = w2; B2 = b2;       W3 = w3; B3 = b3;
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_5_");//
          //--withbias get
          CMatirx_Vector<t> W1v     = MAT.reshape(W1, layers[1] * layers[0], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, W1v, 0, 1, 0, layers[1] * layers[0]);
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_5.1_");//
          CMatirx_Vector<t> B1v     = MAT.reshape(B1, layers[1], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, B1v, 0, 1, layers[1] * layers[0], layers[1] * layers[0] + layers[1] );
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_5.2_");//
          //
          CMatirx_Vector<t> W2v     = MAT.reshape(W2, layers[2] * layers[1], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, W2v, 0, 1, layers[1] * layers[0] + layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] );
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_5.3_");//
          CMatirx_Vector<t> B2v     = MAT.reshape(B2, layers[2], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, B2v, 0, 1, layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] );
          //
          CMatirx_Vector<t> W3v     = MAT.reshape(W3, layers[3] * layers[2], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, W3v, 0, 1, layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] + layers[3] * layers[2] );
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_5.3_");//
          CMatirx_Vector<t> B3v     = MAT.reshape(B3, layers[3], 1);
          W_All_Bias                    = MAT.Seter(W_All_Bias, B3v, 0, 1,  layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] + layers[3] * layers[2],  layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] + layers[3] * layers[2] + layers[3] );
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_5.4_");//
          //-----------------------------------------------------------------------------------------------------------
          CMatirx_Vector<t> I_Run = I_Bias;
          //return;////__No Memory leak___________
          double RMSE_prev = 0;
          //------------------------------MATRIX CALCULATION---------------------------------
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_6_");//
          for(uint i = 0; i < Epochs; i++)
          {         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_6.1_");//
                    CMatirx_Vector<t> errorTrainSSE = MAT.zeros(DataSetInput.Total(), 1);
                    for(uint s = 0; s < m_Samples; s++)
                    {         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_6.1.1_");//
                              CMatirx_Vector<t>    inputfeature = Inp[s];
                              CMatirx_Vector<t>    inputTargets = Tar[s];
                              CMatirx_Vector<t>    y1(1, n1) ;
                              CMatirx_Vector<t>    y2(1, n2);
                              CMatirx_Vector<t>    y3(1, n3);
                              //           f(w1p+b1)0
                              //        0  f(w1p+b1)0
                              //        0  f(w1p+b1)0   f(w2p+b2)0
                              //        0  f(w1p+b1)0
                              //           f(w1p+b1)0
                              feedforwardL3(inputfeature, y1, y2, y3);
                              //
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_6.1.2_", "0:", 0); //
                              CMatirx_Vector<t> error = (inputTargets - y3) ;/// m_Samples ; //
                              errorTrainSSE.setAt(s, 0, error.getAt(0, 0));//invert worked
                              //-------------------------------------------------------------
                              CMatirx_Vector<t> d_f3        = DerivationRelu(y3);
                              CMatirx_Vector<t> d_f2        = DerivationSigmoid(y2);
                              //y2.Printer("y2          ", 200); //
                              //d_f2.Printer("d_f2          ", 200); //
                              CMatirx_Vector<t> diag_d_f2   = MAT.diagflat(d_f2, true);
                              //diag_d_f2.Printer("diag_d_f2          ", 200); //
                              CMatirx_Vector<t> d_f1        = DerivationSigmoid(y1); //d_f1 = MAT.DataNormilizer(d_f1, -1, +1, SHORT_MIN, SHORT_MAX);
                              CMatirx_Vector<t> diag_d_f1   = MAT.diagflat(d_f1, true);
                              //y1.Printer("y1          ", 200); //
                              //d_f1.Printer("d_f1          ", 200); //
                              //diag_d_f1.Printer("diag_d_f1          ", 200); //
                              // return;//
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_6.1.2.0_", "0:", 0); //
                              //--------------------------------------------------------------
                              CMatirx_Vector<t> SenceL4     = d_f3 * -1; //-f'
                              //SenceL4.Printer("SenceL4          ", 200); //
                              //
                              CMatirx_Vector<t> FWL3        = W3 * SenceL4.getAt(0, 0); //f'W   //1*1 . 1*4  //target is x*1
                              //W3.Printer("W3          ", 200); //
                              CMatirx_Vector<t> SenceL3     = MAT.dot(FWL3, diag_d_f2); //f'WS
                              //FWL3.Printer("FWL3          ", 200); //
                              //diag_d_f2.Printer("diag_d_f2          ", 200); //
                              //SenceL3.Printer("SenceL3          ", 200); //
                              //
                              CMatirx_Vector<t> FWL2        = MAT.dot(SenceL3, W2); //f'W   //1*1 . 1*4  //target is x*1
                              //FWL2.Printer("FWL2          ", 200); //
                              //W2.Printer("W2          ", 200); //
                              CMatirx_Vector<t> SenceL2     = MAT.dot(FWL2, diag_d_f1); //f'WS
                              //SenceL2.Printer("SenceL2          ", 200); //
                              //diag_d_f1.Printer("diag_d_f1          ", 200); //
                              //return;////EventKillTimer();// ExpertRemove();
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_6.1.2.1_", "0:", 0); //
                              //------------------------------------------------------------
                              CMatirx_Vector<t> gW1         = MAT.dot(SenceL2.T(), inputfeature);
                              CMatirx_Vector<t> gB1         = SenceL2.T() * 1;
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_6.1.2.1.0_", "0:", 0); //
                              CMatirx_Vector<t> gW2         = MAT.dot(SenceL3.T(), y1.T());
                              CMatirx_Vector<t> gB2         = SenceL3.T() * 1;
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_6.1.2.1.2_", "0:", 0); //
                              CMatirx_Vector<t> gW3         = MAT.dot(SenceL4.T(), y2.T());
                              CMatirx_Vector<t> gB3         = SenceL4.T() * 1;
                              //------------------------------------------------------------
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_6.1.3_");//
                              //--------JACOBIANS-BIAS---ToptoDown-----------
                              CMatirx_Vector<t> gW1v        = MAT.reshape(gW1, layers[1] * layers[0], 1);
                              CMatirx_Vector<t> gB1v        = MAT.reshape(gB1, layers[1], 1);
                              //Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.1_");//
                              Jacobians_Bias                     = MAT.Seter(Jacobians_Bias, gW1v, s, s + 1, 0, layers[1] * layers[0]);
                              //Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.2_");//
                              Jacobians_Bias                     = MAT.Seter(Jacobians_Bias, gB1v, s, s + 1, layers[1] * layers[0], layers[1] * layers[0] + layers[1]);
                              //
                              CMatirx_Vector<t> gW2v        = MAT.reshape(gW2, layers[2] * layers[1], 1);
                              CMatirx_Vector<t> gB2v        = MAT.reshape(gB2, layers[2], 1);
                              //Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.3_");//
                              Jacobians_Bias                     = MAT.Seter(Jacobians_Bias, gW2v, s, s + 1, layers[1] * layers[0] + layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] );
                              //Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.4_");//
                              Jacobians_Bias                     = MAT.Seter(Jacobians_Bias, gB2v, s, s + 1,  layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2]);
                              //
                              CMatirx_Vector<t> gW3v        = MAT.reshape(gW3, layers[3] * layers[2], 1);
                              CMatirx_Vector<t> gB3v        = MAT.reshape(gB3, layers[3], 1);
                              //Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.3_");//
                              Jacobians_Bias                     = MAT.Seter(Jacobians_Bias, gW3v, s, s + 1, layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] + layers[3] * layers[2] );
                              //Print("COptimizer_Levenberg_Marquardt::TrainMatrix() __Start_6.1.3.4_");//
                              Jacobians_Bias                     = MAT.Seter(Jacobians_Bias, gB3v, s, s + 1, layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] + layers[3] * layers[2], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] + layers[3] * layers[2] + layers[3]);
                              //
                              /*
                              CMatirx_Vector<t> d_f3       = DerivationRelu(y3);
                              CMatirx_Vector<t> d_f2       = DerivationSigmoid(y2);
                              CMatirx_Vector<t> diag_d_f2  = MAT.diagflat(d_f2);
                              CMatirx_Vector<t> d_f1       = DerivationSigmoid(y1);
                              CMatirx_Vector<t> diag_d_f1  = MAT.diagflat(d_f1);
                              //
                              CMatirx_Vector<t> temp1L4  =  d_f3 * -1;
                              CMatirx_Vector<t> temp2L3  =  W3 * temp1L4.getAt(0, 0); //1*1 . 1*4  //target is x*1
                              CMatirx_Vector<t> temp3L3  =  MAT.dot(temp2L3, diag_d_f2);
                              //
                              CMatirx_Vector<t> temp4L2  =  MAT.dot(temp3L3, W2);
                              CMatirx_Vector<t> temp5L2  =  MAT.dot(temp4L2, diag_d_f1);
                              //
                              CMatirx_Vector<t> gW1    = MAT.dot(temp5L2.T(), inputfeature);
                              CMatirx_Vector<t> gB1    = temp5L2.T();
                              CMatirx_Vector<t> gW2    = MAT.dot(temp3L3.T(), y1);
                              CMatirx_Vector<t> gB2    = temp3L3.T();
                              CMatirx_Vector<t> gW3    = MAT.dot(temp1L4.T(), y2);;
                              CMatirx_Vector<t> gB3    = temp1L4.T();

                              */
                    } //
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_6.2_");//
                    //------------------------------MATRIX CALCULATION---------------------------------
                    t eTe =  errorTrainSSE.T().dot(errorTrainSSE).getAt(0, 0);//____ErrorAdaptive__Make overRange____
                    t mu  =  (t)(1 * muAll) ;
                    Print("muAll:", muAll, "  mu:", mu, "  eTe:", eTe);
                    CMatirx_Vector<t> JacobianCalc            = Jacobians_Bias;                                               if(IsDebugPrintLevenberg)Print(" JacobianCalc", "  mu:", mu);//
                    CMatirx_Vector<t> JacobianCalc_tran       = JacobianCalc.T();                                             if(IsDebugPrintLevenberg)Print(" JacobianCalc_tran");//
                    CMatirx_Vector<t> JacobianCalc_Mul        = JacobianCalc_tran.multiply(JacobianCalc);                     if(IsDebugPrintLevenberg)Print(" JacobianCalc_Mul");
                    CMatirx_Vector<t> IdentifyMu              = I_Run * mu;                                                   if(IsDebugPrintLevenberg)Print(" Identify * Mu"); //
                    CMatirx_Vector<t> JacobianCalcIdentifyMu  = JacobianCalc_Mul + IdentifyMu;                                if(IsDebugPrintLevenberg)Print(" JacobianCalc + IdentifyMu");//
                    CMatirx_Vector<t> HesianInvert            = JacobianCalcIdentifyMu.invert2();                             if(IsDebugPrintLevenberg)Print(" HesianInvert");//
                    CMatirx_Vector<t> HesianJacobianT         = MAT.dot(HesianInvert, JacobianCalc_tran);                     if(IsDebugPrintLevenberg)Print(" HesianJacobianT");//
                    CMatirx_Vector<t> HesianJacobianTError    = MAT.dot(HesianJacobianT, errorTrainSSE);                         if(IsDebugPrintLevenberg)Print(" HesianJacobianTError");//
                    //HesianJacobianTError.Printer("HesianJacobianTError          ");
                    //errorTrainSSE;
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------1 / m_Samples  0.05
                    if(IsDebugPrintLevenberg)Print(" W_All_Bias",  " before hessian W_All_Bias.getAt(0,0):", W_All_Bias.getAt(0, 0), "  HesianJacobianTError.T().getAt(0,0):", HesianJacobianTError.T().getAt(0, 0)); //
                    CMatirx_Vector<t> W_All_Bias_Rand                      = MAT.Rand(1, Size_Bias, -0.00005, +0.00005); //one row
                    W_All_Bias_Delta                                           = W_All_Bias * 1;
                    //if(i < 2)                                                    W_All_Bias_Best = W_All_Bias;
                    W_All_Bias                                                 = W_All_Bias - HesianJacobianTError.T();
                    t RandPercent1 = (t)InRange( 0, RAND_MAX_, 0.00001, 0.25, rand());
                    t RandPercent2 = (t)(0.25 - RandPercent1);
                    CMatirx_Vector<t> W_All_Bias_temp1      = W_All_Bias         * RandPercent1;
                    CMatirx_Vector<t> W_All_Bias_temp2      = W_All_Bias_Rand    * (RandPercent2 / 1000);
                    t eta   = 0.50;
                    t alpha = 0.50;
                    W_All_Bias                                  = ((W_All_Bias * eta) + (W_All_Bias_Delta * alpha));//++
                    //------------------------------------------------------------------------------------------
                    //if(RMSE_prev > calculateRMSE_Samples( "Levenberg")) { W_All_Bias_Best     = W_All_Bias; }
                    //W_All_Bias.Printer("W_All_Bias  Setupdate                        ");
                    //HesianJacobianTError.T().Printer("HesianJacobianTError.T()  ");
                    if(IsDebugPrintLevenberg)Print(" W_All",  "  W_All_Bias.getAt(0,0):", W_All_Bias.getAt(0, 0)); //
                    if(IsDebugPrintLevenberg)Print(" W_All",  " affter hessian W_All_Bias.getAt(0,0):", W_All_Bias.getAt(0, 0)); //
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_24_", "W_All_Bias.Size():", W_All_Bias.Size()); //
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
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_25_", "W_All1.Size():", W1.Size()); //
                    W2  = MAT.geter(W_All_Bias, 0, 1, layers[1] * layers[0] + layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[2], layers[1]);
                    //W2.Printer("W2          ", 200); //
                    B2  = MAT.geter(W_All_Bias, 0, 1, layers[1] * layers[0] + layers[1] + layers[2] * layers[1], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2], layers[2], 1);
                    //
                    W3  = MAT.geter(W_All_Bias, 0, 1, layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] + layers[3] * layers[2], layers[3], layers[2]);
                    //W2.Printer("W2          ", 200); //
                    B3  = MAT.geter(W_All_Bias, 0, 1, layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] + layers[3] * layers[2], layers[1] * layers[0] + layers[1] + layers[2] * layers[1] + layers[2] + layers[3] * layers[2] + layers[3], layers[3], 1);
                    //B2.Printer("B2          ", 200); //
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_26.00_", "W_All1.Size():", W1.Size()); //
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------
                    for(uint s = 0; s < m_Samples; s++)
                    {         CMatirx_Vector<t> inputfeature = Inp[s];
                              //inputfeature.Printer("inputfeature          ");
                              CMatirx_Vector<t> y1(1, n1);
                              CMatirx_Vector<t> y2(1, n2);
                              CMatirx_Vector<t> y3(1, n2);
                              //
                              feedforwardL3(inputfeature, y1, y2, y3);
                              //
                              if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_27.1_", "0:", 0); //
                              DataSetResult[s].clear();
                              DataSetResult[s] << y3.getAt(0, 0); //
                              //y2.Printer("y2          ", 200); //
                              //inputfeature;//
                              //y1;//
                              //y2;//
                    }
                    if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __Start_27.02_", "W_All1.Size():", W1.Size()); //
                    //
                    Draw(DataSetTargetTime, DataSetResult);//
                    double RMSE = calculateRMSE_Samples(DataSetTarget, DataSetResult, "Levenberg"); RMSE_prev = RMSE;
                    Print("__EPOCH__", i, "__RMSE:( ", RMSE, " )__mu__", mu); //
          }
          if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::TrainMatrixL3() __END__");//
          //---------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
void COptimizer_Levenberg_Marquardt::backpropagation(CMatirx_Vector<t> &out_net)
{         //backpropagation
}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
void COptimizer_Levenberg_Marquardt::Train()
{         if(IsDebugPrintLevenberg)Print("COptimizer_Levenberg_Marquardt::Train() __Start__");//
          Print("----88------COptimizer_Levenberg_Marquardt::", Name);
          if(IsL3x)      {TrainMatrixL3();}//IsL3
          else          {TrainMatrix();}
          return;
          return;//
}
//+------------------------------------------------------------------+
//|        propagate forward to get a prediction                     |&& !IsStopped()
//+------------------------------------------------------------------+
template<typename t>
bool COptimizer_Levenberg_Marquardt::feedForward_Net_WeightBefore( bool b, string s)
{         //Print("Network Net::feedForward_Net_WeightBefore...!");
          if(DataSetInput[m_SampleCurr].size() != m_topology[0])
          {         Print(s + "  Incompatible inputs! ", (string)DataSetInput[m_SampleCurr].size(), "  m_topology[ArraySize(m_topology) - 1)", (string)m_topology[0]); return false; }
          if(errorFlag)return false;
          //---
          NN_Neurons_Matrix_YX_CLayer *inputLayer = GetPointer(m_layers[0]);
          if(DataSetInput[m_SampleCurr].size() != inputLayer.Total() - 1)//--free_node
          {         Print(s + "----ddd---DataSetInput[m_SampleCurr].Total(): ", DataSetInput[m_SampleCurr].size(), "----ddd---inputLayer.Total() - 1:  ", inputLayer.Total() - 1);  ///
                    shutDown(0, s + " Invalid pointer feedForward_Net" +
                             "  <DataSetInput[m_SampleCurr].Total():inputLayer.Total() - 1>" + (string)DataSetInput[m_SampleCurr].Total() + ":" + (string)(inputLayer.Total() - 1) + "  ");   return false; }
          //---Set inp Neurons val from inputs val
          for(uint i = 0; i < (uint)DataSetInput[m_SampleCurr].size() && !IsStopped(); ++i)
          {         NN_Neurons_Matrix_YX_CNeuron *neuron = inputLayer.At(i);
                    neuron.setNodeVal(DataSetInput[m_SampleCurr][i]); //
                    //if(b) {Print("DataSetInput[m_SampleCurr][i]: ", DataSetInput[m_SampleCurr][i], "  m_SampleCurr: ", m_SampleCurr);  } //
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
template<typename t>
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
template<typename t>
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
template<typename t>
class COptimizer_Stochastic_Gradiant_Decent: public BaseNetWorkOptimizer<t>
{
public:
          COptimizer_Stochastic_Gradiant_Decent(void) {};
          ~COptimizer_Stochastic_Gradiant_Decent(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class COptimizer_Adaptive_Momentom_Estimation: public BaseNetWorkOptimizer<t>
{
public:
          COptimizer_Adaptive_Momentom_Estimation(void) {};
          ~COptimizer_Adaptive_Momentom_Estimation(void) {};
          //--------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
class COptimizer_Convolutional: public BaseNetWorkOptimizer<t>
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
template<typename t>
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

          void Set_DataSet(uint DataSetSamples, VectorZObj<VectorZ<t>>  &inputs,   VectorZObj<VectorZ<t>> &targets, VectorZObj<VectorZ<t>> &results,   VectorZObj<VectorZ<t>> &targetsTime )
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
                    {         case  _GRADIENT_DESCENT:                  { NetWorkOptimizer =  new COptimizer_GradiantDecent<t>();               Name = "_GRADIENT_DESCENT_";                    } break;
                              case  _GRADIENT_DESCENT_MOMENTOM:         { NetWorkOptimizer =  new COptimizer_GradiantDecent_Momentom<t>();      Name = "_GRADIENT_DESCENT_MOMENTOM_";           } break;
                              case  _CONJUGATE_GRADIENT:                { NetWorkOptimizer =  new COptimizer_Conjugate_Gradiant<t>();           Name = "_CONJUGATE_GRADIENT_";                  } break;
                              case  _QUASI_NEWTON_METHOD:               { NetWorkOptimizer =  new COptimizer_Quasi_Newton<t>();                 Name = "_QUASI_NEWTON_METHOD_";                 } break;
                              case  _LEVENBERG_MARQUARDT_ALGORITHM:     { NetWorkOptimizer =  new COptimizer_Levenberg_Marquardt<t>();          Name = "_LEVENBERG_MARQUARDT_ALGORITHM_";       } break;
                              case  _STOCHASTIC_GRADIENT_DESCENT:       { NetWorkOptimizer =  new COptimizer_Stochastic_Gradiant_Decent<t>();   Name = "_STOCHASTIC_GRADIENT_DESCENT_";         } break;
                              case  _ADAPTIVE_MOMENT_ESTIMATION:        { NetWorkOptimizer =  new COptimizer_Adaptive_Momentom_Estimation<t>(); Name = "_ADAPTIVE_MOMENT_ESTIMATION_";          } break;
                              case  _CONVOLUTIONAL:                     { NetWorkOptimizer =  new COptimizer_Convolutional<t>();                Name = "_CONVOLUTIONAL_";                       } break;
                              default:                                    break;//
                    } //_SUM_SQUARED_ERROR, _MEAN_SQUARED_ERROR, _NORMALIZED_SQUARED_ERROR, _MINKOWSKI_ERROR, _WEIGHTED_SQUARED_ERROR, _CROSS_ENTROPY_ERROR
                    switch(m_lossMethod)
                    {         case  _SUM_SQUARED_ERROR:                 { NetWorkLossFunction = new  CLoss_SUM_SQUARED_ERROR<t>() ;                   }        break;
                              case  _MEAN_SQUARED_ERROR:                { NetWorkLossFunction = new  CLoss_MEAN_SQUARED_ERROR<t>();                   }        break;
                              case  _NORMALIZED_SQUARED_ERROR:          { NetWorkLossFunction = new  CLoss_NORMALIZED_SQUARED_ERROR<t>();             }        break;
                              case  _MINKOWSKI_ERROR:                   { NetWorkLossFunction = new  CLoss_MINKOWSKI_ERROR<t>();                      }        break;
                              case  _WEIGHTED_SQUARED_ERROR:            { NetWorkLossFunction = new  CLoss_WEIGHTED_SQUARED_ERROR<t>();               }        break;
                              case  _CROSS_ENTROPY_ERROR:               { NetWorkLossFunction = new  CLoss_CROSS_ENTROPY_ERROR<t>();                  }        break;
                              default:                                    break;//
                    } //
                    NetWorkOptimizer.setBack(this);//
                    //Print("NetWorkOptimizer.Name: ", NetWorkOptimizer.Name); //
                    if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training]Network Initilazing Set_Build_Network END ...!"); //
          }
          template <typename custom> //Shut down the network when required
          custom           shutDown(custom exit_code, string msg = NULL) { Print(msg, ". Shutting down...");  errorFlag = true;  ArrayFree(m_layers);  ArrayFree(m_topology);  return exit_code; }
          t def;
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          VectorZObj<VectorZ<t>>     DataSetInput;
          VectorZObj<VectorZ<t>>     DataSetTarget; VectorZObj<VectorZ<t>>     DataSetTargetTime;
          VectorZObj<VectorZ<t>>     DataSetResult; //
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
          OptimizationMethod_                   m_optimizationMethod;
          BaseNetWorkOptimizer<t>              *NetWorkOptimizer;
          LossMethod_                           m_lossMethod;
          BaseNetWorkLossFunction<t>           *NetWorkLossFunction;
          //---


          void  Trainer() { Train2(); /* NetWorkOptimizer.Train(this);*/  }
          void  Simer(VectorZObj<VectorZ<t>>  &finputs, VectorZObj<VectorZ<t>>  &fresults, string s)
          {         Print("-----------NN_Neurons_Matrix_YX_CNet::Simer---------------", "    NetWorkOptimizer.Name: ", NetWorkOptimizer.Name,
                          "--------------------------", "fresults.Total(): ", fresults.Total(), "  fresults[0].Total(): ", fresults[0].Total()); ///
                    NetWorkOptimizer.Sim(finputs, fresults, s);
                    Print("--------------------------", "    NetWorkOptimizer.Name: ", NetWorkOptimizer.Name, "--------------------------"); ///
          };

          void  setData(VectorZObj<VectorZ<t>> &inputs, VectorZObj<VectorZ<t>> &targets, VectorZObj<VectorZ<t>> &results)
          {         DataSetInput = inputs;               DataSetTarget = targets;         DataSetResult = results; }
          //--- methods for working with files
          bool             Save(int &file_handle, int n) {return false;};
          bool             Load(int &file_handle, int n) {return false;};

          void  Train2();
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
                              DataSetResult[m_SampleCurr] << (t)neuron.getNodeVal(); //
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
template<typename t>
double NN_Neurons_Matrix_YX_CNet::m_recentAverageSmoothingFactor = 100.0;
//+------------------------------------------------------------------+
template<typename t>
void NN_Neurons_Matrix_YX_CNet::Train2()
{         //********************************************************* Start [Triaining] *********************************************************
          if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training][Network] Train2.START..!");
          datetime YX_InitTime = TimeLocal();
          datetime YX_CurrTime = TimeLocal();
          YX_InitTime = TimeLocal();
          //every epoch sample Q*H Change issue
          //********************************************************* Start [Triaining] Epoch : all sample used in training*********************************************************
          if(IsDebugNN_Neurons_Matrix_YX_CNet) {Print("IsDebugNN_Neurons_Matrix_YX_CNet --- Train2()  ---");}
          //Print( "001  DataSetResult.Total():", DataSetResult.Total(), "   DataSetResult[0].Total():", DataSetResult[0].Total(), "  DataSetTarget.Total():", DataSetTarget.Total(), "   DataSetTarget[0].Total():", DataSetTarget[0].Total());
          if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training][Network] Epocher2..START.!");
          //-------------------------------
          if(m_optimizationMethod == _GRADIENT_DESCENT)              { NetWorkOptimizer.Train(); Print("NN_Neurons_Matrix_YX_CNet::", Name, "    NetWorkOptimizer.Name", NetWorkOptimizer.Name);}
          if(m_optimizationMethod == _GRADIENT_DESCENT_MOMENTOM)     { NetWorkOptimizer.Train(); Print("NN_Neurons_Matrix_YX_CNet::", Name, "    NetWorkOptimizer.Name", NetWorkOptimizer.Name);}
          if(m_optimizationMethod == _LEVENBERG_MARQUARDT_ALGORITHM) { NetWorkOptimizer.Train(); Print("NN_Neurons_Matrix_YX_CNet::", Name, "    NetWorkOptimizer.Name", NetWorkOptimizer.Name);}
          DataSetResult = NetWorkOptimizer.DataSetResult;//
          if(IsDebugNN_Neurons_Matrix_YX_CNet)Print("[Training][Network] Epocher2..END.!");//
          if(XY_IsRMSE && 0)
          {         if(1)Print( "MSE_Curr_Cheack_AllSample:", (string)calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ")); //
                    double MSE_Prev = 0.0;
                    uint Round = 0;
                    VectorZ<double> RMSEs; double RMSE_Mean_Prev = 0.000000001; double RMSE_Mean_Curr = 0.0;
                    while(calculateRMSE_Samples( "OnTraining calculateRMSE_Samples ") > MinRMSE  )
                    {         //Epocher2();
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
                              if(Round > 0)Speed_MSE = RMSEs.back(1) / RMSEs.Mean(); //
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
          {         double expected  = 0;
                    double predicted = 0;
                    double error     = 0;
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
