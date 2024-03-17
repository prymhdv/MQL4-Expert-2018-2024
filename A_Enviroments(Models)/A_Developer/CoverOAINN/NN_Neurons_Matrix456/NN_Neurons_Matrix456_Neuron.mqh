//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix456\NN_Neurons_Matrix456_Base.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|                  Neuron Object                                   |
//|                                                                  |
//+------------------------------------------------------------------+
class NN_Neurons_Matrix456_CNeuron: public CObject_MQL4
{
private:
          NN_Neurons_Matrix456_ActFunctions     m_Activation;
          //--- activation functions //n=pw+b        RectiLinear activation   e = 2.718281828
          static double         Activation_reLU(double x)                       {return fmax(0.0, x);  } ////{if (x < 0) return(0); else return(x);}RELU solves the vanishing gradient problem that the sigmoid and TanH suffer (we'll see what this is all about in the article on backpropagation).
          static double         Activation_sigmoid(double x)                    {return  1.0 / (1 + exp(-x)); } //1.0 / (1 + MathPow(2.71828, -x));   //--- range(0.0,1.0) //This function is better to be used in classification problems, especially, in classifying one class or two classes only.
          static void           Activation_softMax(double &vector[]);
          static double         Activation_tanH(double x)                       {return ((MathPow(2.71828, x) - MathPow(2.71828, -x)) / (MathPow(2.71828, x) + MathPow(2.71828, -x)));} //--- range(-1.0,1.0)//return (1 - exp(-2 * x)) / (1 + exp(-2 * x)); //----recurecive error!!!!!!!! C library function - tanh()//This Function better be used in multiclass classification neural nets
          static double         Activation_cosH(double x)                       {return (1 + exp(-2 * x)) / 2 * exp(-1 * x);}// or (exp(2 * x)+1) / 2 * exp(1 * x); or (exp(x)+exp(-1*x)) / 2; //--- range(-1.0,1.0). //return Activation_cosH(x); //
          static double         Activation_HyperTan(double x)                   {return 9999; }// //if(x < -20.0) return -1.0; // approximation is correct to 30 decimals  //else if(x > 20.0) return 1.0;  //else return MathTanh(x); //Use explicit formula for MQL4 (1-exp(-2*x))/(1+exp(-2*x))
          static double         Activation_Purelim(double n)                    {return (n);}
          static double         Activation_HardLimit(double n)                  {return n >= 0 ? 1 : 0;};
          static double         Activation_HardLimitSymetric(double n)          {return n >= 0 ? +1 : -1;};
          static double         Activation_Saturate(double n)                   {if(n < 0)return 0; if(n > 1)return 1; if(n <= 1 && n >= 0)return n; return 0;};
          static double         Activation_SaturateSymetic(double n)            {double threshold = 1.0; if(n < -threshold)return -threshold; if(n > threshold)return threshold; if(n <= 1 && n >= -1)return n; return 0;};
          static double         Activation_posline(double n)                    {return n >= 0 ? n : 0;};
          static double         Activation_Competive(double n, double no)       {return n > no ? 1 : 0;};
          //--- derivatives
          static double         Derivative_tanH(double x)                        {return 1.0 - x * x;} //MathCosh()error //{return 1.0 / MathPow(cosh(x), 2);}
          static double         Derivative_sigmoid(double x)                     {return x * (1.0 - x); }
          static double         Derivative_reLU(double x)                        {if(x < 0.0) return 0.0; if(x > 0.0)return 1.0; return 0.1; }  // {if(x < 0.0) return 0.0; if(x > 0.0)return 1.0; return 0.1; } return 1.0; return x;!! RectiLinear derivative
          static double         Derivative_Saturate(double n)
          {         double lower_threshold = 0.1; double upper_threshold = 0.9;
                    if (n < lower_threshold)            {         return 0.0; }
                    else if (n > upper_threshold)       {         return 1.0; }
                    else { return (n - lower_threshold) / (upper_threshold - lower_threshold); } //
          };
          //---

protected:
          NN_Neurons_Matrix456_SConnection       outputWeights[];  //--each neuron vector weight to other Layer neurons
          //---neuron data
          double           m_nodeVal;                           //S*R=R*S      //---double variable that is node value of neuron!//---i change to vector dataset  {0,1,2,3,4,5,6,7,8,9,10
          uint             m_myIndex;
          double           m_gradient;
          double           m_nodeBias;
          double           m_nodeBiasDelta;
          //--- learning
          double           eta;    ///  eta  ==learningrate 0~1
          double           alpha;  ///  alpha==lmomentum 0~n     adjust local minimum steps for gradiant
          //------------------------------------------------------------------------------------------------
          //virtual double   activationFcn(double n);//--'NN_Neurons_Matrix456_CNeuron::activationFcn' - cannot access protected member function         NN_Scaler_Base.mqh  693       56
          //virtual double   activationDerivative(double n);
          //---
          template <typename Layer> //Sum this neuron's contribution to next layer errors
          double           sumDOW(const Layer &nextLayer) const
          {         double sum = 0.0;
                    for(int n = 0; n < nextLayer.Total() - 1 && !IsStopped(); ++n)
                    {         const NN_Neurons_Matrix456_CNeuron *neuron = nextLayer.At(n); sum += outputWeights[n].weight * neuron.m_gradient; } return sum;//
          }


public:   //---neuron data
          //NN_Neurons_Matrix456_SConnection *getoutputWeights(int idx, string f, int l)  { /*Print(f, l);*/ Print(f, l, " ", ArraySize(outputWeights));  return outputWeights[idx];}
          virtual double   activationFcn(double n, double no);               //--'NN_Neurons_Matrix456_CNeuron::activationFcn' - cannot access protected member function         NN_Scaler_Base.mqh  693       56
          virtual double   activationDerivative(double n);                   //'m_Activation' - access to non-static member or function     NN_Neurons_Matrix_Neuron.mqh  143       18


public:   //constructors
          NN_Neurons_Matrix456_CNeuron(uint numOutputs,
                                    uint myIndex,
                                    NN_Neurons_Matrix456_ActFunctions squashFunc = NNNM456_Sigmoid, double LearningRate = 0.15, double Momentom = 0.5
                                   )//  eta = LearningRate;          alpha = Momentom;
          {         ArrayResize(outputWeights, numOutputs); m_myIndex = myIndex; m_Activation = squashFunc; // //--- initialize activation function type
                    eta = LearningRate;          alpha = Momentom;//
          }
          NN_Neurons_Matrix456_CNeuron() {};
          ~NN_Neurons_Matrix456_CNeuron() {};


          void             setNodeVal(double   val)     { m_nodeVal = val;  }
          double           getNodeVal()const            { return m_nodeVal; }
          void             setNodeBias(double  val)     { m_nodeBias = val; }
          double           getNodeBias()const           { return m_nodeBias;}

          //---
          template <typename Layer>
          void             feedForward_Neuron(const Layer &prevLayer) //Propagate forward with reference to the previous layer
          {         double sum = 0.0;
                    for(int n = 0; n < prevLayer.Total() - 1 && !IsStopped(); ++n) //where bias is neuronself minus one
                    {         NN_Neurons_Matrix456_CNeuron *neuron = prevLayer.At(n);
                              sum += neuron.getNodeVal() * neuron.outputWeights[m_myIndex].weight ; //
                    }
                    m_nodeVal = activationFcn(sum, 0.0);  //+ getNodeBias()
          }
          void             calcOutputGradients(double targetVal) { double delta = targetVal - m_nodeVal;   m_gradient = delta * activationDerivative(m_nodeVal); } //calculate output gradients differently

          //---
          template <typename Layer> //Calculate hidden neuron gradients referencing next layer
          void             calcHiddenGradients(const Layer &nextLayer) { double dow = sumDOW(nextLayer);  m_gradient = dow * activationDerivative(m_nodeVal); }
          //---
          template <typename Layer> //update weights that connect to this neuron, from prev layer
          void             updateInputWeights(Layer &prevLayer)
          {         for(int n = 0; n < prevLayer.Total() && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix456_CNeuron *neuron = prevLayer.At(n);
                              const double oldDelta = neuron.outputWeights[m_myIndex].deltaWeight;
                              //double newDelta = (eta * neuron.getNodeVal() * m_gradient + alpha * oldDelta);
                              double newDelta = (eta * neuron.getNodeVal() * m_gradient + alpha * oldDelta) + (sqrt(neuron.outputWeights[m_myIndex].weight) / (MathRand() + 1));
                              //---
                              neuron.outputWeights[m_myIndex].deltaWeight = newDelta;
                              neuron.outputWeights[m_myIndex].weight += newDelta; //
                              //----
                              //double oldDeltaBias = neuron.getNodeBias();double var = (MathRand() % 4)/10;
                              //double newDeltaBias = eta * m_nodeBiasDelta * m_gradient + alpha * oldDeltaBias + (var);// == 0
                              //neuron.setNodeBias(newDeltaBias); //
                    } //
          }
          //--- methods for working with files
          virtual void     Save(int &file_handle);
          virtual void     Load(int &file_handle);
          //
};
//double NN_Neurons_Matrix456_CNeuron::eta = 0.15;  // Net learning rate
//double NN_Neurons_Matrix456_CNeuron::alpha = 0.5; // Momentum
//+------------------------------------------------------------------+
//|          initiate connection weights save                        |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix456_CNeuron::Save(int &file_handle)
{         //Print("*** NN_Neurons_Matrix456_CNeuron::Save **");
          if(file_handle == INVALID_HANDLE)   return;
          //--- write activation type
          FileWriteInteger(file_handle, m_Activation);
          //--- write alpha and eta values
          FileWriteDouble(file_handle, eta);
          FileWriteDouble(file_handle, alpha);
          //---
          for(int i = 0; i < ArraySize(outputWeights) && !IsStopped(); ++i) outputWeights[i].Save(file_handle);//
}
//+------------------------------------------------------------------+
//|           load neuron values from file                           |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix456_CNeuron::Load(int &file_handle)
{         //Print("*** NN_Neurons_Matrix456_CNeuron::Load **");
          if(file_handle == INVALID_HANDLE) return;
          //--- load activation type
          m_Activation   = (NN_Neurons_Matrix456_ActFunctions)FileReadInteger(file_handle);
          //--- load eta and alpha values
          eta   = FileReadDouble(file_handle);
          alpha = FileReadDouble(file_handle); //NN_Neurons_Matrix456_CNeuron::alpha
          //---
          for(int i = 0; i < ArraySize(outputWeights); i++) outputWeights[i].Load(file_handle);//
}
//+------------------------------------------------------------------+
//|           activate with appropriate function                     |//Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
//+------------------------------------------------------------------+
double NN_Neurons_Matrix456_CNeuron::activationFcn(double n, double no)
{         switch(m_Activation)
          {         case  NNNM456_ReLU:                    return Activation_reLU(n);              break;
                    case  NNNM456_Sigmoid:                 return Activation_sigmoid(n);           break;
                    case  NNNM456_SoftMax:                 {double nn[3] = {1, 2, 3 }; Activation_softMax(nn);      return ArrayMinimum(nn);}  break;
                    case  NNNM456_TanH:                    return Activation_tanH(n);              break;
                    case  NNNM456_CosH:                    return Activation_cosH(n);              break;
                    case  NNNM456_HyperTan:                return Activation_HyperTan(n);          break;
                    case  NNNM456_HardLimit:               return Activation_HardLimit(n);         break;
                    case  NNNM456_HardLimitSymetric:       return Activation_HardLimitSymetric(n); break;
                    case  NNNM456_Saturate:                return Activation_Saturate(n);          break;
                    case  NNNM456_SaturateSymetic:         return Activation_SaturateSymetic(n);   break;
                    case  NNNM456_posline:                 return Activation_posline(n);           break;
                    case  NNNM456_Competive:               return Activation_Competive(n, no);         break;
                    default:                            return Activation_sigmoid(n);//
          } //
}
//+------------------------------------------------------------------+
//|             derive with appropriate function                     |
//+------------------------------------------------------------------+
double NN_Neurons_Matrix456_CNeuron::activationDerivative(double n)
{         switch(m_Activation)
          {         case NNNM456_ReLU:          return Derivative_reLU(n);       break;
                    case NNNM456_TanH:          return Derivative_tanH(n);       break;
                    case NNNM456_Sigmoid:       return Derivative_sigmoid(n);    break;
                    case NNNM456_Saturate:      return Derivative_Saturate(n);   break;
                    default:                 return Derivative_sigmoid(n);    break; //
          } //
}
//+------------------------------------------------------------------+
//|           SoftMax activation                                     |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix456_CNeuron::Activation_softMax(double &vector[])///x is vector in cpp or double array
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
