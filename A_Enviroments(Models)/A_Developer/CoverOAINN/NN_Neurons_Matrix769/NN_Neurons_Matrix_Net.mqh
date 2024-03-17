//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property  strict
//#include "NetComplex.mqh"
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix769\NN_Neurons_Matrix_Layer.mqh>
//+------------------------------------------------------------------+
//|   Link instances to form a fully connected neural network        |
//+------------------------------------------------------------------+
class NN_Neurons_Matrix_CNet: public CObject_MQL4
{
private:
          double                        m_error ;//every element has own error
          NN_Neurons_Matrix_CLayer      m_layers[];
          bool                          errorFlag;
          double                        m_recentAverageError; //Network Performance in recent call or array uset to all//moving average of the error during the training process. monitoring and evaluating the progress of the training.
          static double                 m_recentAverageSmoothingFactor;  ////--- average our error over this number of training samples
public:   //Create the network with the given configuration
          NN_Neurons_Matrix_CNet(uint DataSets, const CArrayInt_MQL4 &f_topology, const NN_Neurons_Matrix_ActFunctions hidden = NNNM_TanH, const NN_Neurons_Matrix_ActFunctions output = NNNM_TanH,
                                 double LearningRate = 0.15, double Momentom = 0.5, double RASF = 100);
          NN_Neurons_Matrix_CNet()      {};
          ~NN_Neurons_Matrix_CNet()     {}
          bool                          IsEmptyFile;
          //---
          //---
          virtual void     feedForward_Net(const CArrayDouble_MQL4 &inputVals, string s);
          virtual void     backProp_Net(const CArrayDouble_MQL4 &targetVal, int epocheAll, int epocheAllIdx);
          virtual void     getResults(CArrayDouble_MQL4 &resultVals) const;

          virtual void NN_Neurons_Matrix_CNet::backProp_Net2(const CArrayDouble_MQL4 & targetVal, int epocheAll, int epocheAllIdx);//not efect

          void             backProp_Net_Levenberg_Marquardt_Algorithm(const CArrayDouble_MQL4& targetVal);
          //getter method of a private variable value
          virtual double   getRecentAverageError(void) { if(errorFlag)return 0.0; return m_recentAverageError; }
          virtual double   getLastRMSError(void) { if(errorFlag)return 0.0; return m_error; }
          //--- visibe network topology
          int              m_topology[];
          int              m_topologySize;
          //--- methods for working with files
          bool             Save(int &file_handle, int n);
          bool             Load(int &file_handle, int n);
          //---
          template <typename custom> //Shut down the network when required
          custom           shutDown(custom exit_code, string msg = NULL) { Print(msg, ". Shutting down...");  errorFlag = true;  ArrayFree(m_layers);  ArrayFree(m_topology);  return exit_code; }
          //

};
double NN_Neurons_Matrix_CNet::m_recentAverageSmoothingFactor = 100.0;
//+------------------------------------------------------------------+
//|                                                                  | /*&& !IsStopped()*/
//+------------------------------------------------------------------+
NN_Neurons_Matrix_CNet::NN_Neurons_Matrix_CNet(uint DataSets, const CArrayInt_MQL4 &f_topology,
                    const NN_Neurons_Matrix_ActFunctions hidden = NNNM_TanH, const NN_Neurons_Matrix_ActFunctions output = NNNM_TanH,
                    double LearningRate = 0.15, double Momentom = 0.5, double RASF = 100)
{         //-----set m_topology for save
          //ArrayFree(m_topology);
          ArrayResize(m_topology, f_topology.Total()); //Print("f_topology.Total():", f_topology.Total()); //
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
                              if(neuronNum == f_topology.At(layerNum))neuron.setNodeVal(1.0); //??1.0  //31==31 not bias node...
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
          if(inputVals.Total() != inputLayer.Total() - 1)//--free_node
          {         Print(s + "----ddd---inputVals.Total(): ", inputVals.Total(), "----ddd---inputLayer.Total() - 1:  ", inputLayer.Total() - 1); Sleep(3000); ///
                    shutDown(0, s + " Invalid pointer feedForward_Net" +
                             "  <inputVals.Total():inputLayer.Total() - 1>" + (string)inputVals.Total() + ":" + (string)(inputLayer.Total() - 1) + "  "); Sleep(3000); return; }
          //---Set inp Neurons val from inputs val
          for(int i = 0; i < inputVals.Total() && !IsStopped(); ++i) { NN_Neurons_Matrix_CNeuron *neuron = inputLayer.At(i); neuron.setNodeVal(inputVals.At(i)); }
          //---
          for(int layerNum = 1/* secound layer */; layerNum < ArraySize(m_layers) /* all layer */ && !IsStopped(); ++layerNum)
          {         NN_Neurons_Matrix_CLayer *layer     = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    //---
                    for(int n = 0; n < layer.Total() - 1/* with out bias */ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *neuron = layer.At(n);
                              neuron.feedForward_Neuron(prevLayer);//
                    }//
          }//
}
//+------------------------------------------------------------------+
//|        propagate backwards to make the network learn             |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_CNet::backProp_Net(const CArrayDouble_MQL4 & targetVal, int epocheAll, int epocheAllIdx)
{         if(errorFlag)return;
          //---
          NN_Neurons_Matrix_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          {         m_error = 0.0;
                    for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n)
                    {         const NN_Neurons_Matrix_CNeuron *neuron = outputLayer.At(n);
                              double delta = targetVal.At(n) - neuron.getNodeVal();               m_error += delta * delta; // for all error in layer
                    }
                    //--- calculate our RMS (m_recentAverageError)
                    m_error /= outputLayer.Total() - 1; //one neuron erors mean//without bias
                    m_error = sqrt(m_error);
                    m_recentAverageError = (m_recentAverageError * m_recentAverageSmoothingFactor + m_error) / (m_recentAverageSmoothingFactor + 1.0);
                    //Print("epocheAll: ", (string)epocheAll, "  epocheAllIdx: ", (string)epocheAllIdx, "   m_error: ", DoubleToStr(m_error,2), "  m_recentAverageError:", DoubleToStr(m_recentAverageError,2), "  m_recentAverageSmoothingFactor:", (string)m_recentAverageSmoothingFactor);
                    //Sleep(500);
          }
          //**********************************************************************************************************************************
          //--- make output neurons calculate their output gradients
          for(int n = 0; n < outputLayer.Total() - 1/* withoutbias */ && !IsStopped(); ++n)//gradiant not calced for bias
          {         NN_Neurons_Matrix_CNeuron *neuron = outputLayer.At(n); neuron.calcOutputGradients(targetVal.At(n)); }
          //**********************************************************************************************************************************
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2/* before last layer */; layerNum > 0 /* after frist layer */ && !IsStopped(); --layerNum)
          {         NN_Neurons_Matrix_CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
                    //---
                    for(int n = 0; n < hiddenLayer.Total()/* with bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *neuron = hiddenLayer.At(n);
                              neuron.calcHiddenGradients(nextLayer); } //
          }
          //**********************************************************************************************************************************
          //--- make neurons update prevLayer connections feeding to them
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 0 && !IsStopped(); --layerNum)/* frist layer has not previulayer*/
          {         NN_Neurons_Matrix_CLayer *layer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    //---weight and bias sample not existed
                    for(int n = 0; n < layer.Total() - 1 /* without bias */ && !IsStopped(); ++n)
                    {         //Print("-------------layer.Total():",(string)layer.Total());//
                              NN_Neurons_Matrix_CNeuron *neuron = layer.At(n);
                              neuron.updateInputWeights(prevLayer, m_error, m_recentAverageError, layerNum, n); //
                              if(layerNum <= ArraySize(m_layers) - 1)neuron.updateBias(prevLayer, layerNum, n); //
                    } //
                    //
          } //
          /*
            //+------------------------------------------------------------------+
          //|        propagate backwards to make the network learn             |
          //+------------------------------------------------------------------+
          void CNet::backProp(const CArrayDouble &targetVal) {
          if(errorFlag)
          return;
          //---
          CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          m_error = 0.0;
          for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n) {
          const CNeuron *neuron = outputLayer.At(n);
          double delta = targetVal.At(n) - neuron.getNodeVal();
          m_error += delta * delta;
          }
          //--- calculate our RMS (m_recentAverageError)
          m_error /= outputLayer.Total() - 1;
          m_error = sqrt(m_error);
          m_recentAverageError = (m_recentAverageError * m_recentAverageSmoothingFactor +
                            m_error) / (m_recentAverageSmoothingFactor + 1.0);
          //--- make output neurons calculate their output gradients
          for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n) {
          CNeuron *neuron = outputLayer.At(n);
          neuron.calcOutputGradients(targetVal.At(n));
          }
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2; layerNum > 0 && !IsStopped(); --layerNum) {
          CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
          CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
          //---
          for(int n = 0; n < hiddenLayer.Total() && !IsStopped(); ++n) {
            CNeuron *neuron = hiddenLayer.At(n);
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
            CNeuron *neuron = layer.At(n);
            neuron.updateInputWeights(prevLayer);
          }
          }
          }
          */
}
//+------------------------------------------------------------------+
//|        propagate backwards to make the network learn             |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_CNet::backProp_Net2(const CArrayDouble_MQL4 & targetVal, int epocheAll, int epocheAllIdx)
{         if(errorFlag)return;
          //---
          NN_Neurons_Matrix_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
          m_error = 0.0;
          for(int n = 0; n < outputLayer.Total() - 1 && !IsStopped(); ++n)
          {         const NN_Neurons_Matrix_CNeuron *neuron = outputLayer.At(n);
                    double delta = targetVal.At(n) - neuron.getNodeVal();               m_error += delta * delta; // for all error in layer
          }
          //--- calculate our RMS (m_recentAverageError)
          m_error /= outputLayer.Total() - 1; //one neuron erors mean//without bias
          m_error = sqrt(m_error);
          m_recentAverageError = (m_recentAverageError * m_recentAverageSmoothingFactor + m_error) / (m_recentAverageSmoothingFactor + 1.0);
          //Print("epocheAll: ", (string)epocheAll, "  epocheAllIdx: ", (string)epocheAllIdx, "   m_error: ", DoubleToStr(m_error,2), "  m_recentAverageError:", DoubleToStr(m_recentAverageError,2), "  m_recentAverageSmoothingFactor:", (string)m_recentAverageSmoothingFactor);
          //Sleep(500);
          //**********************************************************************************************************************************
          //--- make output neurons calculate their output gradients
          for(int n = 0; n < outputLayer.Total() - 1/* withoutbias */ && !IsStopped(); ++n)//gradiant not calced for bias
          {         NN_Neurons_Matrix_CNeuron *neuron = outputLayer.At(n); neuron.calcOutputGradients2(targetVal.At(n)); }
          //**********************************************************************************************************************************
          //--- make hidden neurons calculate their hidden gradients
          for(int layerNum = ArraySize(m_layers) - 2/* before last layer */; layerNum > 0 /* after frist layer */ && !IsStopped(); --layerNum)
          {         NN_Neurons_Matrix_CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
                    //---
                    for(int n = 0; n < hiddenLayer.Total()/* with bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *neuron = hiddenLayer.At(n);
                              neuron.calcHiddenGradients2(nextLayer); } //
          }
          //**********************************************************************************************************************************
          //--- make neurons update prevLayer connections feeding to them
          for(int layerNum = ArraySize(m_layers) - 1; layerNum > 0 && !IsStopped(); --layerNum)/* frist layer has not previulayer*/
          {         NN_Neurons_Matrix_CLayer *layer = GetPointer(m_layers[layerNum]);
                    NN_Neurons_Matrix_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
                    //---weight and bias sample not existed
                    for(int n = 0; n < layer.Total() - 1 /* without bias */ && !IsStopped(); ++n)
                    {         //Print("-------------layer.Total():",(string)layer.Total());//
                              NN_Neurons_Matrix_CNeuron *neuron = layer.At(n);
                              neuron.updateInputWeights2(prevLayer, m_error, m_recentAverageError, layerNum, n); //
                              if(layerNum <= ArraySize(m_layers) - 1)neuron.updateBias2(prevLayer, layerNum, n); //
                    } //
                    //
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_CNet::backProp_Net_Levenberg_Marquardt_Algorithm(const CArrayDouble_MQL4& targetVal)
{         // Define the backpropagation training function
          //void TrainNeuralNetwork(double inputs[][NUM_INPUTS], double outputs[][NUM_OUTPUTS], int numSamples, double & error)
          //{         for (int epoch = 0; epoch < MAX_EPOCHS; ++epoch)
//          
//          {         // Initialize weights and biases randomly or with some other method
//                    double lambda = 0.01;  // Initial lambda value
//                    double prevError = DBL_MAX;  // Set to a large value initially
//                    double prevLambda = lambda;
//                    double mu = 10;  // Scaling factor for lambda adjustment
//                    double error = 0.0;
//                    NN_Neurons_Matrix_CLayer *outputLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
//                    // Iterate over training samples
//                    for (int sample = 0; sample < numSamples; ++sample)
//                    {         // ________Forward propagation_________
//                              // Calculate hidden layer activations
//                              // Apply activation function to hidden layer
//                              // Calculate output layer activations
//                              // Apply activation function to output layer
//                              {         // ________Backpropagation_____________
//                                        // Calculate output layer errors ___GRADIANT___
//                                        // Calculate hidden layer errors ___GRADIANT___
//                                        //**********************************************************************************************************************************
//                                        //--- make output neurons calculate their output gradients
//                                        for(int n = 0; n < outputLayer.Total() - 1/* withoutbias */ && !IsStopped(); ++n)//gradiant not calced for bias
//                                        {         NN_Neurons_Matrix_CNeuron *neuron = outputLayer.At(n); neuron.calcOutputGradients(targetVal.At(n)); }
//                                        //**********************************************************************************************************************************
//                                        //--- make hidden neurons calculate their hidden gradients
//                                        for(int layerNum = ArraySize(m_layers) - 2/* before last layer */; layerNum > 0 /* after frist layer */ && !IsStopped(); --layerNum)
//                                        {         NN_Neurons_Matrix_CLayer *hiddenLayer = GetPointer(m_layers[layerNum]);
//                                                  NN_Neurons_Matrix_CLayer *nextLayer = GetPointer(m_layers[layerNum + 1]);
//                                                  //---
//                                                  for(int n = 0; n < hiddenLayer.Total()/* with bias*/ && !IsStopped(); ++n)
//                                                  {         NN_Neurons_Matrix_CNeuron *neuron = hiddenLayer.At(n);
//                                                            neuron.calcHiddenGradients(nextLayer); } //
//                                        }
//                                        //**********************************************************************************************************************************
//                                        //-----------------------------------------------------------------------------
//                                        // Update weights and biases
//                                        //--- make neurons update prevLayer connections feeding to them
//                                        for(int layerNum = ArraySize(m_layers) - 1; layerNum > 0 && !IsStopped(); --layerNum)/* frist layer has not previulayer*/
//                                        {         NN_Neurons_Matrix_CLayer *layer = GetPointer(m_layers[layerNum]);
//                                                  NN_Neurons_Matrix_CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
//                                                  //---weight and bias sample not existed
//                                                  for(int n = 0; n < layer.Total() - 1 /* without bias */ && !IsStopped(); ++n)
//                                                  {         //Print("-------------layer.Total():",(string)layer.Total());//
//                                                            NN_Neurons_Matrix_CNeuron *neuron = layer.At(n);
//                                                            neuron.updateInputWeights_Levenberg_Marquardt(prevLayer, m_error, m_recentAverageError, layerNum, n); //
//                                                            if(layerNum <= ArraySize(m_layers) - 1)neuron.updateBias_Levenberg_Marquardt(prevLayer, layerNum, n); //
//                                                  } //
//                                                  //
//                                        } //
//                                        // Calculate error for the current sample
//                                        for (int i = 0; i < outputLayer.Total() - 1; ++i)
//                                        {         NN_Neurons_Matrix_CNeuron *neuron = outputLayer.At(n);
//                                                  error += 0.5 * pow(neuron.getNodeVal() - targetVal.At(i), 2);
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
                              // Backpropagation
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
//|        Save the network for future use                           |
//+------------------------------------------------------------------+
bool NN_Neurons_Matrix_CNet::Save(int &file_handle, int n)
{         if(!IsStopped())
          {         //Print("*** NN_Neurons_Matrix_CNet::Save **");
                    if(file_handle == INVALID_HANDLE) {  Print("NN_Neurons_Matrix_CNet::Save INVALID_HANDLE"); return false;}
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
bool NN_Neurons_Matrix_CNet::Load(int &file_handle, int n)
{         //Print("*** NN_Neurons_Matrix_CNet::Load **");
          if(file_handle == INVALID_HANDLE) {Print("__NET__Load__::Load INVALID_HANDLE"); return false;}
          //Print("*** NN_Neurons_Matrix_CNet::Load >>FileReadArray**");
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
                    {         //Print("*** NN_Neurons_Matrix_CNet::Load>> for layerNumSave **", "  layerNumSave:", layerNumSave); Sleep(0);
                              uint numOutputs = (layerNumSave == numLayersSave - 1) ? 0 : m_topology[layerNumSave + 1];
                              //Print(n, "  layerNumSave: ", layerNumSave,  "  numLayersSave: ", numLayersSave, " __Load__numOutputs ", numOutputs);
                              //--- shorten layer pointer
                              NN_Neurons_Matrix_CLayer *layer = GetPointer(m_layers[layerNumSave]);
                              //--- create neurons and give them layer activation functions
                              for(int neuronNumSave = 0; neuronNumSave <= m_topology[layerNumSave] && !IsStopped(); ++neuronNumSave)
                              {         if(m_topology[layerNumSave] != m_topology[layerNumSave])
                                        {         //FileClose(file_handle); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin");
                                                  Print("__NET__Load__ Network loaded unsuccessfully. Topology Not Same with loaded"); return false;//
                                        }
                                        //Print("*** NN_Neurons_Matrix_CNet::Load>> for neuronNumSave >>**", "  layerNumSave:", layerNumSave, "  neuronNumSave:", neuronNumSave); Sleep(0);
                                        NN_Neurons_Matrix_CNeuron *neuron = new NN_Neurons_Matrix_CNeuron(numOutputs, neuronNumSave);//at load neuron activefunc is default
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
          //Print("*** NN_Neurons_Matrix_CNet::Load>> m_layers[i].Load **");
          for(int i = 0; i < ArraySize(m_layers); i++) m_layers[i].Load(file_handle);//_______NEXT LOAD LAYERS______
          //---
          //Print("*** NN_Neurons_Matrix_CNet::Load>> FileReadArray successFlag **");
          uchar   successFlag[];
          if(FileReadArray(file_handle, successFlag, 0, StringLen("Saved successfully!") ) > 0)/*__ERROR__DONT USE SIZEOF()__*/
                    if(CharArrayToString(successFlag) == "Saved successfully!") {/*Print("Network loaded successfully.");*/}
                    else
                    {         Print((string)n + "  Network loaded unsuccessfully(NotFull). delete file..");
                              //FileClose(file_handle); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin");
                              return shutDown(false, "Load network error"); //
                    }
          //---
          //FileClose(file_handle);
          return true;//
}
//+------------------------------------------------------------------+
