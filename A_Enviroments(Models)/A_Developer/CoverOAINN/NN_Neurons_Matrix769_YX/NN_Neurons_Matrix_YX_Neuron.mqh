//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix769_YX\NN_Neurons_Matrix_YX_Base.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\MatrixVector.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|                  Neuron Object                                   |
//|                                                                  |
//+------------------------------------------------------------------+
class NN_Neurons_Matrix_YX_CLayer;
class NN_Neurons_Matrix_YX_CNeuron: public CObject_MQL4
{

public:   //constructors
          NN_Neurons_Matrix_YX_CNeuron(uint layerIdx, bool IsFristLayer, uint numInputs, uint numOutputs,
                                       uint fm_Index,
                                       NN_Neurons_Matrix_YX_ActFunctions squashFunc = NNNM_YX_Sigmoid, double LearningRate = 0.15, double Momentom = 0.5
                                      )//  eta = LearningRate;          alpha = Momentom;
          {         ArrayResize(outputWeights, numOutputs);
                    for(uint i = 0; i < numOutputs; i++) { outputWeights[i] = new NN_Neurons_Matrix_YX_SConnection(IsFristLayer);}
                    ArrayResize(outputWeightsCalcHiden, numOutputs);
                    for(uint i = 0; i < numOutputs; i++) { outputWeightsCalcHiden[i] = new NN_Neurons_Matrix_YX_SConnection(IsFristLayer);}
                    ArrayResize(Weights, numInputs);
                    if(numInputs == 0 || IsFristLayer) { ArrayFree(Weights); ArrayResize(Weights, 1);}
                    for(int i = 0; i < ArraySize(Weights); i++)  { Weights[i]       = new NN_Neurons_Matrix_YX_SConnection(IsFristLayer);}
                    //
                    m_Index = fm_Index;
                    m_layerIdx = layerIdx;
                    m_Activation = squashFunc; // //--- initialize activation function type
                    eta = LearningRate;          alpha = Momentom;//
                    m_nodeBias = 0;  //____PLUS NET_______
                    //m_nodeBias = (double)(rand() / (RAND_MAX_)); //
                    //Print("m_nodeBias:", (string)m_nodeBias, "   ", (rand() / (RAND_MAX_)));
                    if(IsFristLayer) {         m_nodeBias = 0; }
                    //
          }
          NN_Neurons_Matrix_YX_CNeuron() {};
          ~NN_Neurons_Matrix_YX_CNeuron()
          {         for(int i = 0; i < getSizeoutputWeights(); i++) {  delete outputWeights[i]; }
                    for(int i = 0; i < ArraySize(Weights); i++) {  delete Weights[i]; }
                    //
          };

public:
          NN_Neurons_Matrix_YX_ActFunctions     m_Activation;
          //--- activation functions //n=pw+b        RectiLinear activation   e = 2.718281828
          double         Activation_reLU(double x)                       {return fmax(0.0, x);  } ////{if (x < 0) return(0); else return(x);}RELU solves the vanishing gradient problem that the sigmoid and TanH suffer (we'll see what this is all about in the article on backpropagation).
          double         Activation_posline(double n)                    {return n >= 0 ? n : 0;};
          double         Activation_Purelim(double x)                    {return x;}
          //
          static double  Activation_sigmoid(double x, double f = 1.00/*{4 -4}*/)    {return  1.0 / (1 + exp(f * -x) ); } //exp(f * -x) / (1 + MathPow(2.71828, -x));MathPow(2.71828,f * -x) MathPow(0.000000071828,f * -x)  //--- range(0.0,1.0) //This function is better to be used in classification problems, especially, in classifying one class or two classes only.
          double         Activation_Sigmoidsymmetric(double x)           {return 2.0 / (1.0 + exp(-x)) - 1.0;}
          void           Activation_softMax(double &vector[]);
          double         Activation_tanH(double x)                       {return ((MathPow(2.71828, x) - MathPow(2.71828, -x)) / (MathPow(2.71828, x) + MathPow(2.71828, -x)));} //--- range(-1.0,1.0)//return (1 - exp(-2 * x)) / (1 + exp(-2 * x)); //----recurecive error!!!!!!!! C library function - tanh()//This Function better be used in multiclass classification neural nets
          double         Activation_cosH(double x)                       {return (1 + exp(-2 * x)) / 2 * exp(-1 * x);}// or (exp(2 * x)+1) / 2 * exp(1 * x); or (exp(x)+exp(-1*x)) / 2; //--- range(-1.0,1.0). //return Activation_cosH(x); //
          double         Activation_HyperTan(double x)                   {return 9999; }// //if(x < -20.0) return -1.0; // approximation is correct to 30 decimals  //else if(x > 20.0) return 1.0;  //else return MathTanh(x); //Use explicit formula for MQL4 (1-exp(-2*x))/(1+exp(-2*x))

          double         Activation_HardLimit(double n)                  {return n >= 0 ? 1 : 0;};
          double         Activation_HardLimitSymetric(double n)          {return n >= 0 ? +1 : -1;};
          double         Activation_Saturate(double n)                   {if(n < 0)return 0; if(n > 1)return 1; if(n <= 1 && n >= 0)return n; return 0;};
          double         Activation_SaturateSymetic(double n)            {double threshold = 1.0; if(n < -threshold)return -threshold; if(n > threshold)return threshold; if(n <= 1 && n >= -1)return n; return 0;};

          double         Activation_Competive(double n, double no)       {return n > no ? 1 : 0;};
          //--- ____________________________________________________derivatives_________________________________________________________
          double         Derivative_tanH(double x)                        {return 1.0 - x * x;} //MathCosh()error //{return 1.0 / MathPow(cosh(x), 2);}
          static double  Derivative_sigmoid(double x)                     {return (x * (1 - x));} //where x is a not n ///return  x  * (1.0 - x );  ///return (m_Val - m_Val * m_Val);   (1 - x * x)
          static double  Derivative_sigmoid2(double x)                    {return (Activation_sigmoid(x) * (1 - Activation_sigmoid(x)));} //where x is a not n ///return  x  * (1.0 - x );  ///return (m_Val - m_Val * m_Val);   (1 - x * x)

          double         Derivative_Sigmoidsymmetric(double x)            {return 2.0 * (1.0 - x * x); }
          //
          double         Derivative_reLU(double x)                        {if(x < 0.0) return 0.0; if(x > 0.0)return 1.0; return 0.0;}  // {if(x < 0.0) return 0.0; if(x > 0.0)return 1.0; return 0.1; } return 1.0; return x;!! RectiLinear derivative
          double         Derivative_Purelim(double x)                     {return 1.0;}
          double         Derivative_posline(double x)                     {return 1.0;}
          //
          double         Derivative_Saturate(double n)
          {         double lower_threshold = 0.1; double upper_threshold = 0.9;
                    if (n < lower_threshold)            {         return 0.0; }
                    else if (n > upper_threshold)       {         return 1.0; }
                    else { return (n - lower_threshold) / (upper_threshold - lower_threshold); } //
          };
          //---

protected:
          NN_Neurons_Matrix_YX_SConnection        *outputWeights[];  //--each neuron vector weight to other Layer neurons
          NN_Neurons_Matrix_YX_SConnection        *outputWeightsCalcHiden[];
          NN_Neurons_Matrix_YX_SConnection        *Weights[];
          double                                  Inputs[];
          double                                  Ourput;
          //---neuron data
          double           m_Val;                           //S*R=R*S      //---double variable that is node value of neuron!//---i change to vector dataset  {0,1,2,3,4,5,6,7,8,9,10
          uint             m_Index;
          uint             m_layerIdx;

          double           m_gradient;         ///IS SOME VARIBLE OF FDEVIRATION
          double           m_gradientPrev;
          double           m_Net;
          double           MulPointWP;
          double           m_nodeBiasPrev;  //--neuron not has inside bias
          double           m_nodeBias;

          //--- learning
          double           eta;    ///  eta  ==learningrate 0~1
          double           alpha;  ///  alpha==lmomentum 0~n     adjust local minimum steps for gradiant

          double           Derivative;      ///IS CHANGE OF STATE Lim0
          double           m_Hessian;       ///IS GRADIANT OF GRADIANT
          double           m_Jakobian[];
          //------------------------------------------------------------------------------------------------
          //virtual double   activationFcn(double n);//--'NN_Neurons_Matrix_YX_CNeuron::activationFcn' - cannot access protected member function         NN_Scaler_Base.mqh  693       56
          //virtual double   activationDerivative(double n);
          //---
          template <typename Layer> //Sum this neuron's contribution to next layer errors
          double        sumDOW(const Layer &nextLayer) const
          {         double sum = 0.0;
                    //---   weights before layer
                    if(1)
                    {         for(int n = 0; n < nextLayer.Total() - 1 /* with out bias */ && !IsStopped(); ++n)
                              {         const NN_Neurons_Matrix_YX_CNeuron *neuron = nextLayer.At(n);
                                        sum += outputWeights[n].weight/*hidden layer*/ * neuron.getGradient()/*next layer*/;//
                                        outputWeightsCalcHiden[n].weight = outputWeights[n].weight/*hidden layer*/ * neuron.getGradient()/*next layer*/; //
                              } //
                    }
                    //
                    return sum; //11-12 hagan nndesign book
                    /*
                    //+------------------------------------------------------------------+
                    //|      Sum this neuron's contribution to next layer errors         |
                    //+------------------------------------------------------------------+
                    template <typename Layer>
                    double CNeuron::sumDOW(const Layer &nextLayer) const {
                    double sum = 0.0;
                    for(int n = 0; n < nextLayer.Total() - 1 && !IsStopped(); ++n) {
                    const CNeuron *neuron = nextLayer.At(n);
                    sum += outputWeights[n].weight * neuron.m_gradient;
                    }
                    return sum;
                    }
                    */
          }
          template <typename Layer> //Sum this neuron's contribution to next layer errors
          double        sumDOWBook(const Layer &nextLayer) const
          {         double sum = 0.0;
                    //--- book weights inside layer
                    if(1)
                    {         sum = 0.0;
                              for(int n = 0; n < nextLayer.Total() - 1 /* with out bias */ && !IsStopped(); ++n)
                              {         const NN_Neurons_Matrix_YX_CNeuron *neuron = nextLayer.At(n);
                                        sum += neuron.getWeigth(m_Index, __LINE__).weight * neuron.getGradient(); //
                              }//
                    }
                    //
                    return sum; //11-12 hagan nndesign book
          }


public:   //---neuron data
          //NN_Neurons_Matrix_SConnection *getoutputWeights(int idx, string f, int l)  { /*Print(f, l);*/ Print(f, l, " ", ArraySize(outputWeights));  return outputWeights[idx];}
          virtual double   activationFcn(double n, double no);               //--'NN_Neurons_Matrix_YX_CNeuron::activationFcn' - cannot access protected member function         NN_Scaler_Base.mqh  693       56
          virtual double   activationDerivative(double n);                   //'m_Activation' - access to non-static member or function     NN_Neurons_Matrix_Neuron.mqh  143       18
          int              getSizeoutputWeights() {return ArraySize(outputWeights);}
          //NN_Neurons_Matrix_SConnection  *getoutputWeights(int i) {return outputWeights[i];};
          void             setETA_Momentom(double val, double val2)   { eta = val;  alpha = val2; }

          void             setNodeVal(double val)        { m_Val = val;  }
          double           getNodeVal()const             { return m_Val; }

          //void             setNodeIndex(double  val)     { m_Index = val; } //--neuron not has inside bias
          double           getNodeIndex()const           { return m_Index;}

          double           getGradient()const            { return m_gradient; }
          double           getAlpha()const               { return alpha; }
          double           getEta()const                 { return eta; }

          double           getNodeNet()const             { return m_Net; }
          void             setNet(double val)            { m_Net = val;  }

          void             setNodeMulPointWP(double val) { MulPointWP = val;  }
          double           getNodeMulPointWP()const      { return MulPointWP; }

          void             setNodeBias(double val)      { m_nodeBias = val; }
          double           getNodeBias()const           { return m_nodeBias; }
          NN_Neurons_Matrix_YX_SConnection              *getWeigth(int i, int line)const
          {         //Print("size:", (string)ArraySize(Weights), "       i:", (string)i, "       line:", (string)line);
                    return Weights[i]; }
          int getWeightSize()const  { return ArraySize(Weights);}
          int getoutputWeightsSize()const  { return ArraySize(outputWeights);}
          //---
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          template <typename Layer>
          void feedForward_Neuron(const Layer &prevLayerInput, uint layerNum, int neuronNum ) //Propagate forward with reference to the previous layer
          {         //--- A=F(N=WP+B)
                    double sum = 0.0;
                    for(int n = 0; n < prevLayerInput.Total() - 1 /* without app bias neuron*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = prevLayerInput[n];
                              sum += neuron.getNodeVal() * neuron.outputWeights[m_Index].weight; //
                    }
                    m_Net = sum + getNodeBias() ;  //__________NET NOT PLUS_____MUST SET_______
                    m_Val = activationFcn(m_Net);  //+ getNodeBias()
                    //Print("getNodeBias():", (string)getNodeBias(), "     m_Net:", (string)m_Net, "       layerNum:", (string)layerNum, "       neuronNum:", (string)neuronNum, "     m_Val:", (string)m_Val); Sleep(200);
                    /*
                    //+------------------------------------------------------------------+newWP.Plus(Weights_matrix.multiply(neuron.getNodeVal().transpose())); //
                    //|      Propagate forward with reference to the previous layer      |
                    //+------------------------------------------------------------------+
                    template <typename Layer>
                    void CNeuron::feedForward(const Layer &prevLayerInput) {
                    double sum = 0.0;
                    for(int n = 0; n < prevLayerInput.Total()/* with bias neuron* / && !IsStopped(); ++n) // all with bias neuron
                    {
                    [W].[P]'+[B]=[N] A = F([N])
                    [W].[P]'+[B]=[N] A = F([N])
                    [1 2 3].[1 2 3]'=[14]+[b]
                    CNeuron *neuron = prevLayerInput.At(n);
                    sum += neuron.getNodeVal() * neuron.outputWeights[m_Index].weight;
                    }
                    m_Val = activationFunction(sum);
                    }
                    */
          }
          template <typename Layer>
          void feedForward_NeuronSelf(const Layer &prevLayerInput, uint layerNum, int neuronNum ) //Propagate forward with reference to the previous layer
          {         //--- A=F(N=WP+B)
                    double sum = 0.0;
                    for(int n = 0; n < prevLayerInput.Total() - 1 && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *neuron = prevLayerInput[n];
                              sum += neuron.getNodeVal() * Weights[n].weight;// as WP
                    }
                    m_Net = sum + getNodeBias();
                    m_Val = activationFcn(m_Net, 0.0);  //+ getNodeBias()
                    //Print("getNodeBias():", (string)getNodeBias(), "     m_Net:", (string)m_Net, "       layerNum:", (string)layerNum, "       neuronNum:", (string)neuronNum, "     m_Val:", (string)m_Val); Sleep(200);
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          void calcOutputGradients(double targetVal) //-2ef'(n)a not work [-2 *]         _________F(x)=e^2______________
          {         double delta = targetVal - m_Val;     Derivative = activationDerivative(m_Val);
                    m_gradient =   2 * -1  * delta * Derivative;
                    //if(m_gradientPrev == m_gradient) {m_gradient = (MathRand() % 50)/100; }//
                    m_gradientPrev = m_gradient;
                    m_Hessian  = activationDerivative(m_gradient);
                    //m_gradient =m_Hessian;
                    //Print("-------------m_gradient val:", (string)m_gradient,  "        targetVal val:", (string)targetVal,
                    //      "     m_Val val:", (string)m_Val, "   delta val:", (string)delta,
                    //      "     activationDerivative(m_Val) val:", (string)activationDerivative(m_Val) ); //
                    //Sleep(100);//
                    /*
                    //+------------------------------------------------------------------+
                    //|           calculate output gradients differently                 |
                    //+------------------------------------------------------------------+
                    void CNeuron::calcOutputGradients(double targetVal) {
                    double delta = targetVal - m_nodeVal;
                    m_gradient = delta * activationDerivative(m_nodeVal);
                    }
                    */
          } //calculate output gradients differently
          //---
          template <typename Layer> //Calculate hidden neuron gradients referencing next layer
          void calcHiddenGradients(const Layer &nextLayer)              //[-2 *]
          {         double dow = sumDOW(nextLayer)/*hidden layer*/;
                    Derivative = activationDerivative(m_Val);
                    m_gradient =  dow * Derivative ;
                    m_Hessian  = activationDerivative(m_gradient);
                    //m_gradient =m_Hessian;
                    //m_gradient = -2 * outputWeightsCalcHiden[n] * activationDerivative(m_Val) ;
                    //Print("dow:", (string)dow, "     m_Val:", (string)m_Val, "   activationDerivative(m_Val):", (string)activationDerivative(m_Val),
                    //      "   m_gradient:", (string)m_gradient);
                    //Sleep(800);
                    //
                    /*
                    //+------------------------------------------------------------------+
                    //|      Calculate hidden neuron gradients referencing next layer    |
                    //+------------------------------------------------------------------+
                    template <typename Layer>
                    void CNeuron::calcHiddenGradients(const Layer&nextLayer) {
                    double dow = sumDOW(nextLayer);
                    m_gradient = dow * activationDerivative(m_nodeVal);
                    }
                    */
          } //m_Val==f(net)
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          void calcOutputGradients_Levenberg_Marquardt(double targetVal, double fValueQ) //-2ef'(n)a not work [-2 *]         _________F(x)=e^2______________
          {         double delta = targetVal - fValueQ;     Derivative = activationDerivative(fValueQ);
                    m_gradient =  Derivative * delta ;
                    Print("-------------m_gradient val:", (string)m_gradient,  "        targetVal val:", (string)targetVal,
                          "     fValueQ:", (string)fValueQ, "   delta val:", (string)delta,
                          "     activationDerivative(fValueQ) val:", (string)activationDerivative(fValueQ) ); //
                    Sleep(1400);//
                    /*
                    //+------------------------------------------------------------------+
                    //|           calculate output gradients differently                 |
                    //+------------------------------------------------------------------+
                    void CNeuron::calcOutputGradients(double targetVal) {
                    double delta = targetVal - m_nodeVal;
                    m_gradient = delta * activationDerivative(m_nodeVal);
                    }
                    */
          }
          template <typename Layer> //Calculate hidden neuron gradients referencing next layer
          void calcHiddenGradients_Levenberg_Marquardt(const Layer &nextLayer, double fValueQin)              //[-2 *]
          {         double dow = sumDOW(nextLayer)/*hidden layer*/;
                    Derivative = activationDerivative(fValueQin);
                    m_gradient =  dow * Derivative ;
                    m_Hessian  = activationDerivative(m_gradient);
                    //m_gradient =m_Hessian;
                    //m_gradient = -2 * outputWeightsCalcHiden[n] * activationDerivative(m_Val) ;
                    Print("dow:", (string)dow, "     fValueQin:", (string)fValueQin, "   activationDerivative(fValueQin):", (string)activationDerivative(fValueQin),
                          "   m_gradient:", (string)m_gradient);
                    Sleep(1800);
                    //
                    /*
                    //+------------------------------------------------------------------+
                    //|      Calculate hidden neuron gradients referencing next layer    |
                    //+------------------------------------------------------------------+
                    template <typename Layer>
                    void CNeuron::calcHiddenGradients(const Layer&nextLayer) {
                    double dow = sumDOW(nextLayer);
                    m_gradient = dow * activationDerivative(m_nodeVal);
                    }
                    */
          }
          //---
          template <typename Layer> //Calculate hidden neuron gradients referencing next layer
          void calcHiddenGradientsBook(const Layer &nextLayer)
          {         double dow = sumDOWBook(nextLayer)/*hidden layer*/;     m_gradient = -2 * dow * activationDerivative(m_Net) ;
                    //m_gradient = -2 * outputWeightsCalcHiden[n] * activationDerivative(m_Val) ;
                    //Print("dow:", (string)dow, "     m_Val:", (string)m_Val, "   activationDerivative(m_Val):", (string)activationDerivative(m_Val),
                    //      "   m_gradient:", (string)m_gradient);
                    //Sleep(800);
                    //
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          template <typename Layer> //update weights that connect to this neuron, from prev layer//even update bias neuron
          void updateWeights_GradiantDecent(Layer &prevLayerInput, double m_error, double f_recentAverageError, int idxLayer, int idxNueron, uint BatchCount)
          {         for(int n = 0; n < prevLayerInput.Total() - 1 /*with out bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *prevLayerInputneuron = prevLayerInput.At(n);
                              //Print("-------------Neuron val:", (string)prevLayerInputneuron.getNodeVal()); //
                              {         const double oldDelta = prevLayerInputneuron.outputWeights[m_Index].deltaWeight;//oldDelta = prevLayerInputneuron.outputWeights[m_Index].deltaWeight;
                                        // -eta not wotk
                                        double newDelta = ((eta / BatchCount) * prevLayerInputneuron.getNodeVal() * /* next layer */ m_gradient );
                                        //newDelta = (1 / sampleCount) * newDelta;
                                        //---
                                        prevLayerInputneuron.outputWeights[m_Index].deltaWeight = newDelta;
                                        prevLayerInputneuron.outputWeights[m_Index].weight += newDelta; //
                                        //if(idxLayer == 2)Print("prevLayerInputneuron.getNodeVal():", (string)prevLayerInputneuron.getNodeVal(), "   m_gradient:", (string)m_gradient); //
                              }  //
                    } //
                    //Print("-------------Neuron:");//
                    /*
                    //+------------------------------------------------------------------+
                    //|      update weights that connect to this neuron, from prev layer |
                    //+------------------------------------------------------------------+
                    template <typename Layer>
                    void CNeuron::updateWeights(Layer & prevLayerInput)
                    {         for(int n = 0; n < prevLayerInput.Total() && !IsStopped(); ++n)// all with bias neuron
                              {         CNeuron *neuron = prevLayerInput.At(n);
                                        const double oldDelta = neuron.outputWeights[m_Index].deltaWeight;
                                        double newDelta = eta * neuron.getNodeVal() * m_gradient +   alpha * oldDelta;
                                        //---
                                        neuron.outputWeights[m_Index].deltaWeight = newDelta;
                                        neuron.outputWeights[m_Index].weight += newDelta; } }
                    */
          }

          template <typename Layer>
          void updateBias_GradiantDecent(Layer &prevLayerInput, int layerNum, int nidx, uint BatchCount)
          {         //Print("layerNum:", (string)layerNum, "   NeuronNum:", (string)nidx, "  m_nodeBias:", DoubleToStr(m_nodeBias, 2), "   ArraySize(nidx):", (string)ArraySize(outputWeights)); //
                    //--------- [ b = n-aw ][ n = aw+b ] s*1==s*r
                    //PreviuLayerNeuron update
                    if(0)//_______WHY____PREVLAYER UPDATE WHERE BIAS INSIDE OUTPUTLAYER___________>>>!
                    {         for(int n = 0; n < prevLayerInput.Total() - 1 /*with out bias*/ && !IsStopped(); ++n)
                              {         NN_Neurons_Matrix_YX_CNeuron *prevLayerInputneuron = prevLayerInput[n];
                                        const double oldDelta = prevLayerInputneuron.m_nodeBiasPrev;
                                        // -eta not wotk
                                        double newDelta = ((eta / BatchCount)  * m_gradient);//_________MOMEMTOM NOT EFECT COPY RESERCVE_______
                                        //newDelta = (1 / sampleCount) * newDelta;
                                        prevLayerInputneuron.m_nodeBiasPrev  = newDelta;
                                        prevLayerInputneuron.m_nodeBias     += newDelta; //
                              }//
                    }//
                    if(1)
                    {         const double oldDelta =  m_nodeBiasPrev;
                              // -eta not wotk
                              double newDelta = ((eta / BatchCount)  * m_gradient + alpha * oldDelta); //    _________MOMEMTOM NOT EFECT COPY RESERCVE_______
                              //newDelta = (1 / sampleCount) * newDelta;
                              m_nodeBiasPrev  = newDelta;
                              m_nodeBias     += newDelta; //
                    }//
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          template <typename Layer> //update weights that connect to this neuron, from prev layer//even update bias neuron
          void updateWeights_GradiantDecent_Momentom(Layer &prevLayerInput, double m_error, double f_recentAverageError, int idxLayer, int idxNueron, uint BatchCount)
          {         for(int n = 0; n < prevLayerInput.Total() - 1 /*with out bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *prevLayerInputneuron = prevLayerInput.At(n);
                              //Print("-------------Neuron val:", (string)prevLayerInputneuron.getNodeVal()); //
                              {         const double oldDelta = prevLayerInputneuron.outputWeights[m_Index].deltaWeight;//oldDelta = prevLayerInputneuron.outputWeights[m_Index].deltaWeight;
                                        // -eta not wotk
                                        double newDelta = ((-1 * eta / BatchCount) * prevLayerInputneuron.getNodeVal() * /* next layer */ m_gradient + alpha * oldDelta);
                                        //newDelta = (1 / sampleCount) * newDelta;
                                        //---
                                        prevLayerInputneuron.outputWeights[m_Index].deltaWeight = newDelta;
                                        prevLayerInputneuron.outputWeights[m_Index].weight += newDelta; //
                                        //if(idxLayer == 2)Print("prevLayerInputneuron.getNodeVal():", (string)prevLayerInputneuron.getNodeVal(), "   m_gradient:", (string)m_gradient); //
                              }  //
                    } //
                    //Print("-------------Neuron:");//
                    /*
                    //+------------------------------------------------------------------+
                    //|      update weights that connect to this neuron, from prev layer |
                    //+------------------------------------------------------------------+
                    template <typename Layer>
                    void CNeuron::updateWeights(Layer & prevLayerInput)
                    {         for(int n = 0; n < prevLayerInput.Total() && !IsStopped(); ++n)// all with bias neuron
                              {         CNeuron *neuron = prevLayerInput.At(n);
                                        const double oldDelta = neuron.outputWeights[m_Index].deltaWeight;
                                        double newDelta = eta * neuron.getNodeVal() * m_gradient +   alpha * oldDelta;
                                        //---
                                        neuron.outputWeights[m_Index].deltaWeight = newDelta;
                                        neuron.outputWeights[m_Index].weight += newDelta; } }
                    */
          }

          template <typename Layer>
          void updateBias_GradiantDecent_Momentom(Layer &prevLayerInput, int layerNum, int nidx, uint BatchCount)
          {         //Print("layerNum:", (string)layerNum, "   NeuronNum:", (string)nidx, "  m_nodeBias:", DoubleToStr(m_nodeBias, 2), "   ArraySize(nidx):", (string)ArraySize(outputWeights)); //
                    //--------- [ b = n-aw ][ n = aw+b ] s*1==s*r
                    if(1)
                    {         const double oldDelta =  m_nodeBiasPrev;
                              // -eta not wotk
                              double newDelta = ((-1 * eta / BatchCount)  * m_gradient + alpha * oldDelta); //    _________MOMEMTOM NOT EFECT COPY RESERCVE_______
                              //newDelta = (1 / sampleCount) * newDelta;
                              m_nodeBiasPrev  = newDelta;
                              m_nodeBias     += newDelta; //
                    }//
                    /*
                     //PreviuLayerNeuron update
                    if(0)//_______WHY____PREVLAYER UPDATE WHERE BIAS INSIDE OUTPUTLAYER___________>>>!
                    {         for(int n = 0; n < prevLayerInput.Total() - 1 /*with out bias * / && !IsStopped(); ++n)
                              {         NN_Neurons_Matrix_YX_CNeuron *prevLayerInputneuron = prevLayerInput[n];
                                        const double oldDelta = prevLayerInputneuron.m_nodeBiasPrev;
                                        // -eta not wotk
                                        double newDelta = ((eta / BatchCount)  * m_gradient) + alpha * oldDelta;  //   _________MOMEMTOM NOT EFECT COPY RESERCVE_______
                                        //newDelta = (1 / sampleCount) * newDelta;
                                        prevLayerInputneuron.m_nodeBiasPrev  = newDelta;
                                        prevLayerInputneuron.m_nodeBias     += newDelta; //
                              }//
                    }//
                    */
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          template <typename Layer>
          void updateWeights_Levenberg_Marquardt(Layer &prevLayerInput, VectorZObj<VectorZ<double>>    *&ValueQin[], uint m_SampleCurr, double m_error, double f_recentAverageError, int idxLayer, int idxNueron, uint BatchCount)
          {         for(int n = 0; n < prevLayerInput.Total() - 1 /*with out bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *prevLayerInputneuron = prevLayerInput.At(n);
                              {         const double oldDelta = prevLayerInputneuron.outputWeights[m_Index].deltaWeight;//oldDelta = prevLayerInputneuron.outputWeights[m_Index].deltaWeight;
                                        double newDelta = (eta * ValueQin[m_layerIdx - 1][m_SampleCurr][n] * m_gradient + alpha * oldDelta); //
                                        Print("m_gradient:", m_gradient); //
                                        //---
                                        prevLayerInputneuron.outputWeights[m_Index].deltaWeight = newDelta;
                                        prevLayerInputneuron.outputWeights[m_Index].weight += newDelta; //
                              }  //
                    } //
          }
          template <typename Layer>
          void updateBias_Levenberg_Marquardt(Layer &prevLayerInput, int layerNum, int nidx, uint BatchCount)
          {         //Print("layerNum:", (string)layerNum, "   NeuronNum:", (string)nidx, "  m_nodeBias:", DoubleToStr(m_nodeBias, 2), "   ArraySize(nidx):", (string)ArraySize(outputWeights)); //
                    //--------- [ b = n-aw ][ n = aw+b ] s*1==s*r
                    //PreviuLayerNeuron update
                    for(int n = 0; n < prevLayerInput.Total() - 1 /*with out bias*/ && !IsStopped(); ++n)
                    {         NN_Neurons_Matrix_YX_CNeuron *prevLayerInputneuron = prevLayerInput.At(n);
                              const double oldDelta = prevLayerInputneuron.m_nodeBiasPrev;
                              double newDelta = (eta * m_gradient + alpha * oldDelta); // + alpha * oldDelta
                              prevLayerInputneuron.m_nodeBiasPrev  = newDelta;
                              prevLayerInputneuron.m_nodeBias     += newDelta; //
                    }//
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          //--- methods for working with files
          virtual void     Save(int &file_handle);
          virtual void     Load(int &file_handle);
          //
};
//double NN_Neurons_Matrix_YX_CNeuron::eta = 0.15;  // Net learning rate
//double NN_Neurons_Matrix_YX_CNeuron::alpha = 0.5; // Momentum
//+------------------------------------------------------------------+
//|          initiate connection weights save                        |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_YX_CNeuron::Save(int &file_handle)
{         //Print("*** NN_Neurons_Matrix_YX_CNeuron::Save **");
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
void NN_Neurons_Matrix_YX_CNeuron::Load(int &file_handle)
{         //Print("*** NN_Neurons_Matrix_YX_CNeuron::Load **");
          if(file_handle == INVALID_HANDLE) return;
          //--- load activation type
          m_Activation   = (NN_Neurons_Matrix_YX_ActFunctions)FileReadInteger(file_handle);
          //--- load eta and alpha values
          eta   = FileReadDouble(file_handle);
          alpha = FileReadDouble(file_handle); //NN_Neurons_Matrix_YX_CNeuron::alpha
          m_nodeBias = FileReadDouble(file_handle);
          //---
          for(int i = 0; i < ArraySize(outputWeights); i++) outputWeights[i].Load(file_handle);//_______NEXT LOAD outputWeights______
}
//+------------------------------------------------------------------+
//|           activate with appropriate function                     |//Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
//+------------------------------------------------------------------+
double NN_Neurons_Matrix_YX_CNeuron::activationFcn(double n, double no = 0.0)
{         switch(m_Activation)
          {         case  NNNM_YX_ReLU:                    return Activation_reLU(n);              break;
                    case  NNNM_YX_posline:                 return Activation_posline(n);           break;
                    case  NNNM_YX_Purelim:                 return Activation_Purelim(n);           break;
                    case  NNNM_YX_Sigmoid:                 return Activation_sigmoid(n);           break;
                    case  NNNM_YX_SigmoidSymetric:         return Activation_Sigmoidsymmetric(n);  break;
                    case  NNNM_YX_SoftMax:                 {double nn[3] = {1, 2, 3 }; Activation_softMax(nn);      return ArrayMinimum(nn);}  break;
                    case  NNNM_YX_TanH:                    return Activation_tanH(n);              break;
                    case  NNNM_YX_CosH:                    return Activation_cosH(n);              break;
                    case  NNNM_YX_HyperTan:                return Activation_HyperTan(n);          break;
                    case  NNNM_YX_HardLimit:               return Activation_HardLimit(n);         break;
                    case  NNNM_YX_HardLimitSymetric:       return Activation_HardLimitSymetric(n); break;
                    case  NNNM_YX_Saturate:                return Activation_Saturate(n);          break;
                    case  NNNM_YX_SaturateSymetic:         return Activation_SaturateSymetic(n);   break;
                    case  NNNM_YX_Competive:               return Activation_Competive(n, no);         break;
                    default:                            return Activation_sigmoid(n);//
          } //
}
//+------------------------------------------------------------------+
//|             derive with appropriate function                     |
//+------------------------------------------------------------------+
double NN_Neurons_Matrix_YX_CNeuron::activationDerivative(double n)
{         switch(m_Activation)
          {         case NNNM_YX_ReLU:             return Derivative_reLU(n);              break;
                    case NNNM_YX_Purelim:          return Derivative_Purelim(n);           break;
                    case NNNM_YX_posline:          return Derivative_posline(n);           break;
                    case NNNM_YX_TanH:             return Derivative_tanH(n);              break;
                    case NNNM_YX_Sigmoid:          return Derivative_sigmoid(n);           break;
                    case NNNM_YX_SigmoidSymetric:  return Derivative_Sigmoidsymmetric(n);  break;
                    case NNNM_YX_Saturate:         return Derivative_Saturate(n);          break;
                    default:                       return Derivative_sigmoid(n);           break; //
          } //
}
//+------------------------------------------------------------------+
//|           SoftMax activation                                     |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_YX_CNeuron::Activation_softMax(double &vector[])///x is vector in cpp or double array
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
