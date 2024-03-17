//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Scaler\NN_Neurons_Scaler_Base.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|                  Neuron Object                                   |
//|                                                                  |
//+------------------------------------------------------------------+
class NN_Neurons_Scaler_CNeuron: public CObject_MQL4
{
private:
          NN_Neurons_Scaler_ActFunctions     myActivation;
          //--- activation functions
          static double         Activation_reLU(double x);
          static double         Activation_sigmoid(double x);
          static void           Activation_softMax(double &vector[]);
          static double         Activation_tanH(double x);
          static double         Activation_cosH(double x);
          static double         Activation_HyperTan(double x);
          static double         Activation_Purelim(double x);
          //--- derivatives
          static double    tanHDerivative(double x);
          static double    sigmoidDerivative(double x);
          static double    reLUDerivative(double x);
          //---

protected:
          NN_Neurons_Scaler_SConnection      *outputWeights[];       //--each neuron vector weight
          uint                         CnumOutputs;
          //---neuron data
          double           m_nodeVal[];     //S*R=R*S        //---double variable that is node value of neuron!//---i change to vector dataset  {0,1,2,3,4,5,6,7,8,9,10
          uint             m_myIndex;
          double           m_gradient[];
          double           m_nodeBias;
          //------------------------------------------------------------------------------------------------
          double    eta, alpha;   ///eta==learningrate
          //------------------------------------------------------------------------------------------------
          //virtual double   activationFcn(double n);//--'NN_Neurons_Scaler_CNeuron::activationFcn' - cannot access protected member function         NN_Scaler_Base.mqh  693       56
          //virtual double   activationDerivative(double n);
          //---
          template <typename Layer>
          double           sumDOW(const Layer &nextLayer, int sizeWeights, int idx) const;
          //---
public:   //---neuron data
          double           m_nodeVal_delta;/*mine*/
          NN_Neurons_Scaler_SConnection *getoutputWeights(int idx, string f, int l) { /*Print(f, l);*/ Print(f, l, " ", ArraySize(outputWeights));  return outputWeights[idx];}
          virtual double   activationFcn(double n);//--'NN_Neurons_Scaler_CNeuron::activationFcn' - cannot access protected member function         NN_Scaler_Base.mqh  693       56
          virtual double   activationDerivative(double n);
          int              getArraySizeoutputWeights() {return ArraySize(outputWeights);}
          int              getArraySizem_nodeVal() {return ArraySize(m_nodeVal);}
public:
          NN_Neurons_Scaler_CNeuron(uint SizeInputsVector, uint numOutputs, uint myIndex, NN_Neurons_Scaler_ActFunctions squashFunc = NNNS_Sigmoid, double LearningRate = 0.15, double Momentom = 0.5);
          NN_Neurons_Scaler_CNeuron() {};
          ~NN_Neurons_Scaler_CNeuron()
          {         for(uint i = 0; i < CnumOutputs; i++)
                    {         if(outputWeights[i]) delete outputWeights[i];//
                    } //
          };
          //---
          //void             setNodeVal(double  val )     { m_nodeVal = val;  }
          //double           getNodeVal()const            { return m_nodeVal; }
          //void             setNodeBias(double  val )    { m_nodeBias = val; }
          //double           getNodeBias()const           { return m_nodeBias;}
          void             setNodeVal(int idx, double  val )   { m_nodeVal[idx] = val;  }
          double           getNodeVal(int idx)const            { return m_nodeVal[idx]; }


          //---
          template <typename Layer>
          void             feedForward_Neuron(const Layer &prevLayer, int sizeWeights, int idx);
          void             calcOutputGradients(int idx, double targetVal);
          //---
          template <typename Layer>
          void             calcHiddenGradients(const Layer &nextLayer, int sizeWeights, int idx);
          //---
          template <typename Layer>
          void             updateInputWeights(Layer &prevLayer, int sizeWeights, int idx);
          //--- methods for working with files
          virtual void     Save(int &file_handle);
          virtual void     Load(int &file_handle);
          //
};

//double NN_Neurons_Scaler_CNeuron::eta = 0.15;  // Net learning rate
//double NN_Neurons_Scaler_CNeuron::alpha = 0.5; // Momentum
//+------------------------------------------------------------------+
//|          initiate connection weights save                        |
//+------------------------------------------------------------------+
void NN_Neurons_Scaler_CNeuron::Save(int &file_handle)
{         if(file_handle == INVALID_HANDLE)   return;
          //--- write activation type
          FileWriteInteger(file_handle, myActivation);
          //--- write alpha and eta values
          FileWriteDouble(file_handle, eta);
          FileWriteDouble(file_handle, alpha);
          //---
          for(int i = 0; i < ArraySize(outputWeights) && !IsStopped(); ++i) outputWeights[i].Save(file_handle);//
}
//+------------------------------------------------------------------+
//|           load neuron values from file                           |
//+------------------------------------------------------------------+
void NN_Neurons_Scaler_CNeuron::Load(int &file_handle)
{         if(file_handle == INVALID_HANDLE) return;
          //--- load activation type
          myActivation   = (NN_Neurons_Scaler_ActFunctions)FileReadInteger(file_handle);
          //--- load eta and alpha values
          NN_Neurons_Scaler_CNeuron::eta   = FileReadDouble(file_handle);
          NN_Neurons_Scaler_CNeuron::alpha = FileReadDouble(file_handle);
          //---
          for(int i = 0; i < ArraySize(outputWeights); i++) outputWeights[i].Load(file_handle);//
}
//+------------------------------------------------------------------+
//|           activate with appropriate function                     |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNeuron::activationFcn(double n)
{         //Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
          switch(myActivation)
          {         case  NNNS_ReLU:         return Activation_reLU(n); break;
                    case  NNNS_Sigmoid:      return Activation_sigmoid(n); break;
                    case  NNNS_SoftMax:      {double nn[3] = {1, 2, 3 }; Activation_softMax(nn);      return ArrayMinimum(nn);}  break;
                    case  NNNS_TanH:         return Activation_tanH(n);  break;
                    case  NNNS_CosH:         return Activation_cosH(n);  break;
                    case  NNNS_HyperTan:     return Activation_HyperTan(n);  break;
                    case  NNNS_Purelim:      return Activation_Purelim(n);  break;
                    default:                 return Activation_sigmoid(n);//
          } //
}
//+------------------------------------------------------------------+
//|             derive with appropriate function                     |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNeuron::activationDerivative(double n)
{         switch(myActivation)
          {         case NNNS_ReLU:          return reLUDerivative(n);       break;
                    case NNNS_TanH:          return tanHDerivative(n);       break;
                    case NNNS_Sigmoid:       return sigmoidDerivative(n);    break;
                    default:                return sigmoidDerivative(n);    break; //
          } //
}
//+------------------------------------------------------------------+
//|      NN_Neurons_Scaler_CNeuron constructor                               |can hjas array of neuron
//+------------------------------------------------------------------+
NN_Neurons_Scaler_CNeuron::NN_Neurons_Scaler_CNeuron(uint SizeInputsVector, uint  numOutputs, uint myIndex, NN_Neurons_Scaler_ActFunctions squashFunc = NNNS_Sigmoid, double LearningRate = 0.15, double Momentom = 0.5)
{         CnumOutputs = numOutputs;
          ArrayResize(m_nodeVal, SizeInputsVector);
          ArrayResize(m_gradient, SizeInputsVector);
          ArrayResize(outputWeights, numOutputs);
          for(uint i = 0; i < CnumOutputs; i++)
          {         if(!outputWeights[i]) outputWeights[i] = new NN_Neurons_Scaler_SConnection();//
          }
          for(int i = 0; i < ArraySize(outputWeights); i++)
          {         ArrayResize(outputWeights[i].weight, SizeInputsVector);
                    ArrayResize(outputWeights[i].deltaWeight, SizeInputsVector); //
          }//
          m_myIndex     = myIndex;
          eta           = LearningRate;
          alpha         = Momentom;
          //--- initialize activation function type
          myActivation = squashFunc;//
}

//+------------------------------------------------------------------+
//|      Propagate forward with reference to the previous layer      |
//+------------------------------------------------------------------+prevLayer
template <typename Layer>
void NN_Neurons_Scaler_CNeuron::feedForward_Neuron(const Layer &prevLayer, int sizeWeights, int idx)
{         double sum = 0.0;
          for(int n = 0; n < prevLayer.Total() && !IsStopped(); ++n)
          {         NN_Neurons_Scaler_CNeuron *neuron_prevLayer = prevLayer.At(n);
                    //wp+b=n
                    //sum += ((neuron_prevLayer.getNodeVal() + neuron_prevLayer.m_nodeVal_delta / 2) * neuron_prevLayer.outputWeights[m_myIndex].weight); ////--prew layer neuron * weight and do activation then set current neuron value
                    for(int i = 0; i < sizeWeights; i++)
                    {         sum += (neuron_prevLayer.getNodeVal(idx) * neuron_prevLayer.outputWeights[m_myIndex].weight[i]);//
                    }//
          }
          //setNodeBias(0.40);/* mine code  neuron_nextlayer*/
          //sum += getNodeBias();   //neuron_nextlayer
          m_nodeVal[idx] = activationFcn(sum);  //neuron_nextlayer
          //m_nodeVal_delta = m_nodeVal - m_nodeVal_delta;///* mine code*/
}
//+------------------------------------------------------------------+
//|      Sum this neuron's contribution to next layer errors         |
//+------------------------------------------------------------------+
template <typename Layer>
double NN_Neurons_Scaler_CNeuron::sumDOW(const Layer &nextLayer, int sizeWeights, int idx) const
{         double sum = 0.0;
          for(int n = 0; n < nextLayer.Total() - 1 && !IsStopped(); ++n)
          {         const NN_Neurons_Scaler_CNeuron *neuron = nextLayer.At(n);
                    for(int i = 0; i < sizeWeights; i++)
                    {         sum += outputWeights[n].weight[i] * neuron.m_gradient[idx]; //
                    }//
          }
          return sum;//
}

//+------------------------------------------------------------------+
//|      Calculate hidden neuron gradients referencing next layer    |
//+------------------------------------------------------------------+
template <typename Layer>
void NN_Neurons_Scaler_CNeuron::calcHiddenGradients(const Layer&nextLayer, int sizeWeights, int idx)
{         double dow = sumDOW(nextLayer, sizeWeights, idx);
          m_gradient[idx] = dow * activationDerivative(m_nodeVal[idx]);//
}
//+------------------------------------------------------------------+
//|           calculate output gradients differently                 |
//+------------------------------------------------------------------+
void NN_Neurons_Scaler_CNeuron::calcOutputGradients(int idx, double targetVal)
{         double delta = targetVal - m_nodeVal[idx];
          m_gradient[idx] = delta * activationDerivative(m_nodeVal[idx]);//
}
//+------------------------------------------------------------------+
//|      update weights that connect to this neuron, from prev layer |
//+------------------------------------------------------------------+
template <typename Layer>
void NN_Neurons_Scaler_CNeuron::updateInputWeights(Layer &prevLayer, int sizeWeights, int idx)
{         for(int n = 0; n < prevLayer.Total() && !IsStopped(); ++n)
          {         for(int i = 0; i < sizeWeights; i++)
                    {         NN_Neurons_Scaler_CNeuron *neuron_prevLayer = prevLayer.At(n);
                              const double oldDelta     = neuron_prevLayer.outputWeights[m_myIndex].deltaWeight[i];
                              double newDelta           = eta * neuron_prevLayer.getNodeVal(idx) * m_gradient[idx] +   alpha * oldDelta;
                              //---
                              neuron_prevLayer.outputWeights[m_myIndex].deltaWeight[i] = newDelta;
                              neuron_prevLayer.outputWeights[m_myIndex].weight[i] += newDelta; //
                    } //
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |e = 2.718281828
//|                                                                  |
//|                  ACTIVATION FUNCTIONS                            |
//|                                                                  |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             RectiLinear activation                               |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNeuron::Activation_reLU(double x)
{         //--------------default
          return fmax(0.0, x);
          //--------------study
          if (x < 0) return(0);
          else return(x); //
          //RELU solves the vanishing gradient problem that the sigmoid and TanH suffer (we'll see what this is all about in the article on backpropagation).
}
//+------------------------------------------------------------------+
//|           sigmoid activation                                     |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNeuron::Activation_sigmoid(double x)
{         //--- range(0.0,1.0)
          return  1.0 / (1 + MathPow(2.71828, -x));  //1.0 / (1 + exp(-x));
          //This function is better to be used in classification problems, especially, in classifying one class or two classes only.
}
//+------------------------------------------------------------------+
//|           SoftMax activation                                     |
//+------------------------------------------------------------------+
void NN_Neurons_Scaler_CNeuron::Activation_softMax(double &vector[])///x is vector in cpp or double array
{         //--- range(0.0,1.0)
          //return  (MathPow(2.71828, x) / (MathPow(2.71828, x))  );  //1.0 / (1 + exp(-x));
          //For example, the outputs of a regression neural net are [1,3,2] if we apply the SoftMax function to this output the output now becomes [0.09003, 0.665240, 0.244728].
          //The output of this function ranges from 0 to 1.
          {         double TempArr[];
                    ArrayCopy(TempArr, vector);  ArrayFree(vector);
                    double proba = 0, sum = 0;
                    for (int j = 0; j < ArraySize(TempArr); j++)    sum += MathPow(2.71828, TempArr[j]);
                    for (int i = 0; i < ArraySize(TempArr); i++)
                    {         proba = MathPow(2.71828, TempArr[i]) / sum;
                              vector[i] = proba; //
                    }
                    ArrayFree(TempArr); //
          } //
}
//+------------------------------------------------------------------+
//|            tahn activation function                              |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNeuron::Activation_tanH(double x)
{         //--- range(-1.0,1.0)
          return ((MathPow(2.71828, x) - MathPow(2.71828, -x)) / (MathPow(2.71828, x) + MathPow(2.71828, -x)));
          //return (1 - exp(-2 * x)) / (1 + exp(-2 * x)); //----recurecive error!!!!!!!! C library function - tanh()
          //This Function better be used in multiclass classification neural nets
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNeuron::Activation_HyperTan(double x)
{         //if(x < -20.0) return -1.0; // approximation is correct to 30 decimals
          //else if(x > 20.0) return 1.0;
          //else return MathTanh(x); //Use explicit formula for MQL4 (1-exp(-2*x))/(1+exp(-2*x))
          return 9999; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNeuron::Activation_cosH(double x) ///!!!i inplant demo
{         //--- range(-1.0,1.0).
          //Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
          //return Activation_cosH(x); //
          return (1 + exp(-2 * x)) / 2 * exp(-1 * x);// or (exp(2 * x)+1) / 2 * exp(1 * x);     or (exp(x)+exp(-1*x)) / 2;
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNeuron::Activation_Purelim(double n) ///!!!i inplant demo
{         return (n); //n=pw+b
}
//+------------------------------------------------------------------+
//|             derivative of tanH activation function               |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNeuron::tanHDerivative(double x) { return 1.0 / MathPow(Activation_cosH(x), 2); }



//+------------------------------------------------------------------+
//|             sigmoid derivative                                   |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNeuron::sigmoidDerivative(double x)
{         return x * (1.0 - x); }
//+------------------------------------------------------------------+
//|             RectiLinear derivative                               |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_CNeuron::reLUDerivative(double x)
{         if(x < 0.0)   return 0.0;
          //---
          return 1.0; //
}
//+------------------------------------------------------------------+
