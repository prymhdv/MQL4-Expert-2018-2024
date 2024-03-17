//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix769\NN_Neurons_Matrix_Base.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|                  Neuron Object                                   |
//|                                                                  |
//+------------------------------------------------------------------+
class NN_Neurons_Matrix_CLayer;
class NN_Neurons_Matrix_CNeuron: public CObject_MQL4
{
private:
          NN_Neurons_Matrix_ActFunctions     m_Activation;
          //--- activation functions //n=pw+b        RectiLinear activation   e = 2.718281828
          static double         Activation_reLU(double x)                       {return fmax(0.0, x);  } ////{if (x < 0) return(0); else return(x);}RELU solves the vanishing gradient problem that the sigmoid and TanH suffer (we'll see what this is all about in the article on backpropagation).
          static double         Activation_sigmoid(double x)                    {return  1.0 / (1 + exp(1 * -x)); } //1.0 / (1 + MathPow(2.71828, -x));   //--- range(0.0,1.0) //This function is better to be used in classification problems, especially, in classifying one class or two classes only.
          static double         Activation_Sigmoidsymmetric(double x)           {return 2.0 / (1.0 + exp(-x)) - 1.0;}
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
          static double         Derivative_Sigmoidsymmetric(double x)            {return 2.0 * (1.0 - Activation_sigmoid(x) * Activation_sigmoid(x)); }


          static double         Derivative_reLU(double x)                        {if(x < 0.0) return 0.0; if(x > 0.0)return 1.0; return 0.1; }  // {if(x < 0.0) return 0.0; if(x > 0.0)return 1.0; return 0.1; } return 1.0; return x;!! RectiLinear derivative
          static double         Derivative_Saturate(double n)
          {         double lower_threshold = 0.1; double upper_threshold = 0.9;
                    if (n < lower_threshold)            {         return 0.0; }
                    else if (n > upper_threshold)       {         return 1.0; }
                    else { return (n - lower_threshold) / (upper_threshold - lower_threshold); } //
          };
          //---

protected:
          NN_Neurons_Matrix_SConnection        outputWeights[];  //--each neuron vector weight to other Layer neurons
          //---neuron data
          double           m_nodeVal;                           //S*R=R*S      //---double variable that is node value of neuron!//---i change to vector dataset  {0,1,2,3,4,5,6,7,8,9,10
          uint             m_myIndex;
          double           m_gradient;
          double           m_net;
          double           MulPointWP;
          double           m_nodeBiasPrev;  //--neuron not has inside bias
          double           m_nodeBias;
          //--- learning
          double           eta;    ///  eta  ==learningrate 0~1
          double           alpha;  ///  alpha==lmomentum 0~n     adjust local minimum steps for gradiant
          //------------------------------------------------------------------------------------------------
          //virtual double   activationFcn(double n);//--'NN_Neurons_Matrix_CNeuron::activationFcn' - cannot access protected member function         NN_Scaler_Base.mqh  693       56
          //virtual double   activationDerivative(double n);
          //---
          template <typename Layer> //Sum this neuron's contribution to next layer errors
          double        sumDOW(const Layer &nextLayer) const
          {         double sum = 0.0;
                    for(int n = 0; n < nextLayer.Total() - 1 /* with out bias */ && !IsStopped(); ++n)
                    {         const NN_Neurons_Matrix_CNeuron *neuron = nextLayer.At(n);
                              sum += outputWeights[n].weight * neuron.m_gradient; } return sum;//11-12 hagan nndesign book
          }


public:   //---neuron data
          //NN_Neurons_Matrix_SConnection *getoutputWeights(int idx, string f, int l)  { /*Print(f, l);*/ Print(f, l, " ", ArraySize(outputWeights));  return outputWeights[idx];}
          virtual double   activationFcn(double n, double no);               //--'NN_Neurons_Matrix_CNeuron::activationFcn' - cannot access protected member function         NN_Scaler_Base.mqh  693       56
          virtual double   activationDerivative(double n);                   //'m_Activation' - access to non-static member or function     NN_Neurons_Matrix_Neuron.mqh  143       18
          int              getSizeoutputWeights() {return ArraySize(outputWeights);}
          //NN_Neurons_Matrix_SConnection  *getoutputWeights(int i) {return outputWeights[i];};

public:   //constructors
          NN_Neurons_Matrix_CNeuron(uint numOutputs,
                                    uint myIndex,
                                    NN_Neurons_Matrix_ActFunctions squashFunc = NNNM_Sigmoid, double LearningRate = 0.15, double Momentom = 0.5
                                   )//  eta = LearningRate;          alpha = Momentom;
          {         ArrayResize(outputWeights, numOutputs);
                    //for(uint i = 0; i < numOutputs; i++) { outputWeights[i] = new NN_Neurons_Matrix_SConnection();}
                    m_myIndex = myIndex; m_Activation = squashFunc; // //--- initialize activation function type
                    eta = LearningRate;          alpha = Momentom;//
                    m_nodeBias = (float)rand() / (INT_MAX); //
          }
          NN_Neurons_Matrix_CNeuron() {};
          ~NN_Neurons_Matrix_CNeuron() {for(int i = 0; i < getSizeoutputWeights(); i++) { /*delete outputWeights[i];*/}};


          void             setNodeVal(double   val)     { m_nodeVal = val;  }
          double           getNodeVal()const            { return m_nodeVal; }

          //void             setNodeIndex(double  val)     { m_myIndex = val; } //--neuron not has inside bias
          double           getNodeIndex()const           { return m_myIndex;}

          double           getNodegradient()const        { return m_gradient; }

          double           getNodeNet()const             { return m_net; }

          void             setNodeMulPointWP(double val) { MulPointWP = val;  }
          double           getNodeMulPointWP()const      { return MulPointWP; }

          void             setNodeBias(double val) { m_nodeBias = val;  }
          double           getNodeBias()const      { return m_nodeBias; }
          //---
          template <typename Layer>
          void feedForward_Neuron(const Layer &prevLayer) //Propagate forward with reference to the previous layer
          {         double sum = 0.0;
                    for(int n = 0; n < prevLayer.Total() - 1/*with out bias  [0< prevLayer.Total() - 1]*/ && !IsStopped(); ++n) //where bias is neuronself minus one
                    {         NN_Neurons_Matrix_CNeuron *prevLayerneuron = prevLayer.At(n);
                              sum += prevLayerneuron.getNodeVal() * prevLayerneuron.outputWeights[m_myIndex].weight ; //
                    }
                    m_net = sum;
                    m_nodeVal = activationFcn(m_net, 0.0);  //+ getNodeBias()
                    //----------
                    if(true /* n == prevLayer.Total() */ /* need bias node of layer*/)
                    {         //this is layer bias neuron!
                              //Print("neuronMax:", (string)prevLayer.Total());
                              m_net = getNodeBias() + sum;
                              m_nodeVal = activationFcn(/* bias */m_net, 0.0); //+ getNodeBias()
                    } //
                    /*
                    //+------------------------------------------------------------------+
                    //|      Propagate forward with reference to the previous layer      |
                    //+------------------------------------------------------------------+
                    template <typename Layer>
                    void CNeuron::feedForward(const Layer &prevLayer) {
                    double sum = 0.0;
                    for(int n = 0; n < prevLayer.Total() && !IsStopped(); ++n) // all with bias neuron
                    {
                    CNeuron *neuron = prevLayer.At(n);
                    sum += neuron.getNodeVal() * neuron.outputWeights[m_myIndex].weight;
                    }
                    m_nodeVal = activationFunction(sum);
                    }
                    */
          }
          void calcOutputGradients(double targetVal) { double delta = targetVal - m_nodeVal;   m_gradient = delta * activationDerivative(m_nodeVal); } //calculate output gradients differently
          void calcOutputGradients2(double targetVal) { double delta = targetVal - m_nodeVal;   m_gradient = -2 * delta * activationDerivative(m_nodeVal); }//sensiviti
          //---
          template <typename Layer> //Calculate hidden neuron gradients referencing next layer
          void calcHiddenGradients(const Layer &nextLayer) { double dow = sumDOW(nextLayer);  m_gradient = dow * activationDerivative(m_nodeVal); }
          template <typename Layer> //Calculate hidden neuron gradients referencing next layer
          void calcHiddenGradients2(const Layer &nextLayer) { double dow = sumDOW(nextLayer);  m_gradient = -2 * dow * activationDerivative(m_nodeVal); } //sensiviti
          //---
          template <typename Layer> //update weights that connect to this neuron, from prev layer//even update bias neuron
          void updateInputWeights(Layer &prevLayer, double m_error, double f_recentAverageError, int idxLayer, int idxNueron)
          {         for(int n = 0; n < prevLayer.Total() - 1 /*with out bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *prevLayerneuron = prevLayer.At(n);
                              {         const double oldDelta = prevLayerneuron.outputWeights[m_myIndex].deltaWeight;//oldDelta = prevLayerneuron.outputWeights[m_myIndex].deltaWeight;
                                        double newDelta = (eta * prevLayerneuron.getNodeVal() * /* next layer */ m_gradient + alpha * oldDelta);
                                        //---
                                        prevLayerneuron.outputWeights[m_myIndex].deltaWeight = newDelta;
                                        prevLayerneuron.outputWeights[m_myIndex].weight += newDelta; //
                              }  //
                    } //
                    //Print("-------------Neuron:");//
                    /*
                    //+------------------------------------------------------------------+
                    //|      update weights that connect to this neuron, from prev layer |
                    //+------------------------------------------------------------------+
                    template <typename Layer>
                    void CNeuron::updateInputWeights(Layer & prevLayer)
                    {         for(int n = 0; n < prevLayer.Total() && !IsStopped(); ++n)// all with bias neuron
                              {         CNeuron *neuron = prevLayer.At(n);
                                        const double oldDelta = neuron.outputWeights[m_myIndex].deltaWeight;
                                        double newDelta = eta * neuron.getNodeVal() * m_gradient +   alpha * oldDelta;
                                        //---
                                        neuron.outputWeights[m_myIndex].deltaWeight = newDelta;
                                        neuron.outputWeights[m_myIndex].weight += newDelta; } }
                    */
          }
          template <typename Layer>
          void updateInputWeights2(Layer &prevLayer, double m_error, double f_recentAverageError, int idxLayer, int idxNueron)
          {         for(int n = 0; n < prevLayer.Total() - 1 /*with out bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *prevLayerneuron = prevLayer.At(n);
                              {         const double oldDelta = prevLayerneuron.outputWeights[m_myIndex].deltaWeight;//oldDelta = prevLayerneuron.outputWeights[m_myIndex].deltaWeight;
                                        double newDelta = 0;//
                                        newDelta = ( alpha * oldDelta) - ((1 - alpha) * eta * m_gradient * prevLayerneuron.getNodeVal());//not good... littl numbers
                                        //---
                                        prevLayerneuron.outputWeights[m_myIndex].deltaWeight = newDelta;
                                        prevLayerneuron.outputWeights[m_myIndex].weight -= newDelta; //
                                        //Print(" prevLayerneuron.outputWeights[m_myIndex].weight:", prevLayerneuron.outputWeights[m_myIndex].weight);//
                              }  //
                    } //
                    //Print("-------------Neuron:");//
          }
          template <typename Layer>
          void updateInputWeights_Levenberg_Marquardt(Layer &prevLayer, double m_error, double f_recentAverageError, int idxLayer, int idxNueron)
          {         for(int n = 0; n < prevLayer.Total() - 1 /*with out bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *prevLayerneuron = prevLayer.At(n);
                              {         const double oldDelta = prevLayerneuron.outputWeights[m_myIndex].deltaWeight;//oldDelta = prevLayerneuron.outputWeights[m_myIndex].deltaWeight;
                                        double newDelta = (eta * prevLayerneuron.getNodeVal() * m_gradient + alpha * oldDelta);
                                        //---
                                        prevLayerneuron.outputWeights[m_myIndex].deltaWeight = newDelta;
                                        prevLayerneuron.outputWeights[m_myIndex].weight += newDelta; //
                              }  //
                    } //
          }
          template <typename Layer>
          void updateBias(Layer &prevLayer, int layerNum, int nidx)
          {         //Print("layerNum:", (string)layerNum, "   NeuronNum:", (string)nidx, "  m_nodeBias:", DoubleToStr(m_nodeBias, 2), "   ArraySize(nidx):", (string)ArraySize(outputWeights)); //
                    //--------- [ b = n-aw ][ n = aw+b ] s*1==s*r
                    //PreviuLayerNeuron update
                    for(int n = 0; n < prevLayer.Total() - 1 /*with out bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *prevLayerneuron = prevLayer.At(n);
                              const double oldDelta = prevLayerneuron.m_nodeBiasPrev;
                              double newDelta = (eta * m_gradient + alpha * oldDelta);
                              prevLayerneuron.m_nodeBiasPrev  = newDelta;
                              prevLayerneuron.m_nodeBias     += newDelta; //
                    }//
          }
          template <typename Layer>
          void updateBias2(Layer &prevLayer, int layerNum, int nidx)
          {         //Print("layerNum:", (string)layerNum, "   NeuronNum:", (string)nidx, "  m_nodeBias:", DoubleToStr(m_nodeBias, 2), "   ArraySize(nidx):", (string)ArraySize(outputWeights)); //
                    //--------- [ b = n-aw ][ n = aw+b ] s*1==s*r
                    //PreviuLayerNeuron update
                    for(int n = 0; n < prevLayer.Total() - 1 /*with out bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *prevLayerneuron = prevLayer.At(n);
                              const double oldDelta = prevLayerneuron.m_nodeBiasPrev;
                              double newDelta = (alpha * oldDelta) - ((1 - alpha) * eta * m_gradient );
                              prevLayerneuron.m_nodeBiasPrev  = newDelta;
                              prevLayerneuron.m_nodeBias     -= newDelta; //
                              //Print(" prevLayerneuron.m_nodeBias:", prevLayerneuron.m_nodeBias);//
                    }//
          }

          template <typename Layer>
          void updateBias_Levenberg_Marquardt(Layer &prevLayer, int layerNum, int nidx)
          {         //Print("layerNum:", (string)layerNum, "   NeuronNum:", (string)nidx, "  m_nodeBias:", DoubleToStr(m_nodeBias, 2), "   ArraySize(nidx):", (string)ArraySize(outputWeights)); //
                    //--------- [ b = n-aw ][ n = aw+b ] s*1==s*r
                    //PreviuLayerNeuron update
                    for(int n = 0; n < prevLayer.Total() - 1 /*with out bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_CNeuron *prevLayerneuron = prevLayer.At(n);
                              const double oldDelta = prevLayerneuron.m_nodeBiasPrev;
                              double newDelta = (eta * m_gradient + alpha * oldDelta);
                              prevLayerneuron.m_nodeBiasPrev  = newDelta;
                              prevLayerneuron.m_nodeBias     += newDelta; //
                    }//
          }
          //--- methods for working with files
          virtual void     Save(int &file_handle);
          virtual void     Load(int &file_handle);
          //
};
//double NN_Neurons_Matrix_CNeuron::eta = 0.15;  // Net learning rate
//double NN_Neurons_Matrix_CNeuron::alpha = 0.5; // Momentum
//+------------------------------------------------------------------+
//|          initiate connection weights save                        |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_CNeuron::Save(int &file_handle)
{         //Print("*** NN_Neurons_Matrix_CNeuron::Save **");
          if(file_handle == INVALID_HANDLE)   return;
          //--- write activation type
          FileWriteInteger(file_handle, m_Activation);
          //--- write alpha and eta values
          FileWriteDouble(file_handle, eta);
          FileWriteDouble(file_handle, alpha);
          FileWriteDouble(file_handle, m_nodeBias);
          //---
          for(int i = 0; i < ArraySize(outputWeights) && !IsStopped(); ++i) outputWeights[i].Save(file_handle);//
}
//+------------------------------------------------------------------+
//|           load neuron values from file                           |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_CNeuron::Load(int &file_handle)
{         //Print("*** NN_Neurons_Matrix_CNeuron::Load **");
          if(file_handle == INVALID_HANDLE) return;
          //--- load activation type
          m_Activation   = (NN_Neurons_Matrix_ActFunctions)FileReadInteger(file_handle);
          //--- load eta and alpha values
          eta   = FileReadDouble(file_handle);
          alpha = FileReadDouble(file_handle); //NN_Neurons_Matrix_CNeuron::alpha
          m_nodeBias = FileReadDouble(file_handle);
          //---
          for(int i = 0; i < ArraySize(outputWeights); i++) outputWeights[i].Load(file_handle);//_______NEXT LOAD outputWeights______
}
//+------------------------------------------------------------------+
//|           activate with appropriate function                     |//Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
//+------------------------------------------------------------------+
double NN_Neurons_Matrix_CNeuron::activationFcn(double n, double no)
{         switch(m_Activation)
          {         case  NNNM_ReLU:                    return Activation_reLU(n);              break;
                    case  NNNM_Sigmoid:                 return Activation_sigmoid(n);           break;
                    case  NNNM_SigmoidSymetric:         return Activation_Sigmoidsymmetric(n);  break;
                    case  NNNM_SoftMax:                 {double nn[3] = {1, 2, 3 }; Activation_softMax(nn);      return ArrayMinimum(nn);}  break;
                    case  NNNM_TanH:                    return Activation_tanH(n);              break;
                    case  NNNM_CosH:                    return Activation_cosH(n);              break;
                    case  NNNM_HyperTan:                return Activation_HyperTan(n);          break;
                    case  NNNM_HardLimit:               return Activation_HardLimit(n);         break;
                    case  NNNM_HardLimitSymetric:       return Activation_HardLimitSymetric(n); break;
                    case  NNNM_Saturate:                return Activation_Saturate(n);          break;
                    case  NNNM_SaturateSymetic:         return Activation_SaturateSymetic(n);   break;
                    case  NNNM_posline:                 return Activation_posline(n);           break;
                    case  NNNM_Competive:               return Activation_Competive(n, no);         break;
                    default:                            return Activation_sigmoid(n);//
          } //
}
//+------------------------------------------------------------------+
//|             derive with appropriate function                     |
//+------------------------------------------------------------------+
double NN_Neurons_Matrix_CNeuron::activationDerivative(double n)
{         switch(m_Activation)
          {         case NNNM_ReLU:             return Derivative_reLU(n);              break;
                    case NNNM_TanH:             return Derivative_tanH(n);              break;
                    case NNNM_Sigmoid:          return Derivative_sigmoid(n);           break;
                    case NNNM_SigmoidSymetric:  return Derivative_Sigmoidsymmetric(n);  break;
                    case NNNM_Saturate:         return Derivative_Saturate(n);          break;
                    default:                    return Derivative_sigmoid(n);           break; //
          } //
}
//+------------------------------------------------------------------+
//|           SoftMax activation                                     |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_CNeuron::Activation_softMax(double &vector[])///x is vector in cpp or double array
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
