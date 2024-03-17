//+------------------------------------------------------------------+
//| This software is being issued under the GNU license. Please      |
//| refer to the online description of the license terms or find a   |
//| copy in the project files' resource text file, in MetaEditor5    |
//| public project > ULTIMATE_AI Project <                           |
//+------------------------------------------------------------------+
//|           First written by: Nelson Wanyama                       |
//|                           : ngaira14nelson@gmail.com             |
//|                           : https://www.mql5.com/en/users/_nelson|
//|           Discussion link : https://www.mql5.com/en/forum/338341 |
//+------------------------------------------------------------------+
//--- include external libraries
#include <Arrays\ArrayDouble.mqh>
#include <Graphics\Graphic.mqh>
#include <Arrays\ArrayObj.mqh>
#include <Arrays\ArrayInt.mqh>
#include <Math\Stat\Math.mqh>
//+------------------------------------------------------------------+
//|           enumerate activation functions                         |
//+------------------------------------------------------------------+
enum ActFunctions {
    ReLU,
    TanH,
    Sigmoid
};
//+------------------------------------------------------------------+
//|                connections container                             |
//+------------------------------------------------------------------+
struct SConnection {
public:
    double           weight, deltaWeight;
public:
                     SConnection(void);
    //--- working with files
    void             Save(int &file_handle);
    void             Load(int &file_handle);

};
//+------------------------------------------------------------------+
//|             save weights to a file                               |
//+------------------------------------------------------------------+
void SConnection::Save(int &file_handle) {
    if(file_handle == INVALID_HANDLE)
        return;
//---
    FileWriteDouble(file_handle, weight);
    FileWriteDouble(file_handle, deltaWeight);
}
//+------------------------------------------------------------------+
//|              read weights from a file                            |
//+------------------------------------------------------------------+
void SConnection::Load(int &file_handle) {
    if(file_handle == INVALID_HANDLE)
        return;
//---
    weight = FileReadDouble(file_handle);
    deltaWeight = FileReadDouble(file_handle);
}
//+------------------------------------------------------------------+
//|          initialize new connections with random values           |
//+------------------------------------------------------------------+
SConnection::SConnection(void) {
    weight = MathRandomNonZero();
    deltaWeight = 0.0;
}
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|                  Neuron Object                                   |
//|                                                                  |
//+------------------------------------------------------------------+
class CNeuron: public CObject {
private:
    ActFunctions     myActivation;
//--- activation functions
    static double    tanH(double x);
    static double    sigmoid(double x);
    static double    reLU(double x);
//--- derivatives
    static double    tanHDerivative(double x);
    static double    sigmoidDerivative(double x);
    static double    reLUDerivative(double x);
    //---
protected:
    SConnection      outputWeights[];
    //---
    double           m_nodeVal;
    uint             m_myIndex;
    double           m_gradient;
    static double    eta, alpha;
    virtual double   activationFunction(double x);
    virtual double   activationDerivative(double x);
    //---
    template <typename Layer>
    double           sumDOW(const Layer &nextLayer) const;
    //---
public:
                     CNeuron(uint numOutputs, uint myIndex, ActFunctions squashFunc = Sigmoid);
//---
    void             setNodeVal(double val) {
        m_nodeVal = val;
    }
    //---
    double           getNodeVal(void)const {
        return m_nodeVal;
    }
//---
    template <typename Layer>
    void             feedForward(const Layer &prevLayer);
    void             calcOutputGradients(double targetVal);
//---
    template <typename Layer>
    void             calcHiddenGradients(const Layer &nextLayer);
//---
    template <typename Layer>
    void             updateInputWeights(Layer &prevLayer);
//--- methods for working with files
    virtual void     Save(int &file_handle);
    virtual void     Load(int &file_handle);
};

double CNeuron::eta = 0.15; // Net learning rate
double CNeuron::alpha = 0.5; // Momentum
//+------------------------------------------------------------------+
//|          initiate connection weights save                        |
//+------------------------------------------------------------------+
void CNeuron::Save(int &file_handle) {
    if(file_handle == INVALID_HANDLE)
        return;
//--- write activation type
    FileWriteInteger(file_handle, myActivation);
//--- write alpha and eta values
    FileWriteDouble(file_handle, eta);
    FileWriteDouble(file_handle, alpha);
//---
    for(int i = 0; i < ArraySize(outputWeights) && !IsStopped(); ++i)
        outputWeights[i].Save(file_handle);
}
//+------------------------------------------------------------------+
//|           load neuron values from file                           |
//+------------------------------------------------------------------+
void CNeuron::Load(int &file_handle) {
    if(file_handle == INVALID_HANDLE)
        return;
//--- load activation type
    myActivation = (ActFunctions)FileReadInteger(file_handle);
//--- load eta and alpha values
    CNeuron::eta = FileReadDouble(file_handle);
    CNeuron::alpha = FileReadDouble(file_handle);
//---
    for(int i = 0; i < ArraySize(outputWeights); i++)
        outputWeights[i].Load(file_handle);
}

//+------------------------------------------------------------------+
//|           activate with appropriate function                     |
//+------------------------------------------------------------------+
double CNeuron::activationFunction(double x) {
    switch(myActivation) {
    case  ReLU:
        return reLU(x);
        break;
//---
    case TanH:
        return tanH(x);
        break;
//---
    default:
        return sigmoid(x);
    }
}

//+------------------------------------------------------------------+
//|             derive with appropriate function                     |
//+------------------------------------------------------------------+
double CNeuron::activationDerivative(double x) {
    switch(myActivation) {
    case  ReLU:
        return reLUDerivative(x);
        break;
//---
    case TanH:
        return tanHDerivative(x);
        break;
//---
    default:
        return sigmoidDerivative(x);
        break;
    }
}
//+------------------------------------------------------------------+
//|      CNeuron constructor                                         |
//+------------------------------------------------------------------+
CNeuron::CNeuron(uint  numOutputs, uint myIndex, ActFunctions squashFunc = Sigmoid) {
    ArrayResize(outputWeights, numOutputs);
    m_myIndex = myIndex;
//--- initialize activation function type
    myActivation = squashFunc;
}

//+------------------------------------------------------------------+
//|      Propagate forward with reference to the previous layer      |
//+------------------------------------------------------------------+
template <typename Layer>
void CNeuron::feedForward(const Layer &prevLayer) {
    double sum = 0.0;
    for(int n = 0; n < prevLayer.Total() && !IsStopped(); ++n) {
        CNeuron *neuron = prevLayer.At(n);
        sum += neuron.getNodeVal() *
               neuron.outputWeights[m_myIndex].weight;
    }
    m_nodeVal = activationFunction(sum);
}

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

//+------------------------------------------------------------------+
//|      Calculate hidden neuron gradients referencing next layer    |
//+------------------------------------------------------------------+
template <typename Layer>
void CNeuron::calcHiddenGradients(const Layer&nextLayer) {
    double dow = sumDOW(nextLayer);
    m_gradient = dow * activationDerivative(m_nodeVal);
}

//+------------------------------------------------------------------+
//|           calculate output gradients differently                 |
//+------------------------------------------------------------------+
void CNeuron::calcOutputGradients(double targetVal) {
    double delta = targetVal - m_nodeVal;
    m_gradient = delta * activationDerivative(m_nodeVal);
}

//+------------------------------------------------------------------+
//|      update weights that connect to this neuron, from prev layer |
//+------------------------------------------------------------------+
template <typename Layer>
void CNeuron::updateInputWeights(Layer &prevLayer) {
    for(int n = 0; n < prevLayer.Total() && !IsStopped(); ++n) {
        CNeuron *neuron = prevLayer.At(n);
        const double oldDelta = neuron.outputWeights[m_myIndex].deltaWeight;
        double newDelta = eta * neuron.getNodeVal() * m_gradient +
                          alpha * oldDelta;
        //---
        neuron.outputWeights[m_myIndex].deltaWeight = newDelta;
        neuron.outputWeights[m_myIndex].weight += newDelta;
    }
}
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|                  ACTIVATION FUNCTIONS                            |
//|                                                                  |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|            tahn activation function                              |
//+------------------------------------------------------------------+
double CNeuron::tanH(double x) {
//--- range(-1.0,1.0)
    return tanh(x);
}

//+------------------------------------------------------------------+
//|             derivative of tanH activation function               |
//+------------------------------------------------------------------+
double CNeuron::tanHDerivative(double x) {
    return 1.0 / MathPow(cosh(x), 2);
}

//+------------------------------------------------------------------+
//|           sigmoid activation                                     |
//+------------------------------------------------------------------+
double CNeuron::sigmoid(double x) {
    return 1.0 / (1 + exp(-x));
}

//+------------------------------------------------------------------+
//|             sigmoid derivative                                   |
//+------------------------------------------------------------------+
double CNeuron::sigmoidDerivative(double x) {
    return x * (1.0 - x);
}

//+------------------------------------------------------------------+
//|             RectiLinear activation                               |
//+------------------------------------------------------------------+
double CNeuron::reLU(double x) {
    return fmax(0.0, x);
}

//+------------------------------------------------------------------+
//|             RectiLinear derivative                               |
//+------------------------------------------------------------------+
double CNeuron::reLUDerivative(double x) {
    if(x < 0.0)
        return 0.0;
//---
    return 1.0;
}

//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|               NEURONS CONTAINER >> CLAYER                        |
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|   Create our Layer definition. Will replace template definitions |
//+------------------------------------------------------------------+
class CLayer: public CArrayObj {
private:
    uint             iOutputs;
    ActFunctions     activationFunction;
    //---
public:
//--- working with custom activation functions
    void             setActivation(const ActFunctions func = Sigmoid);
    ActFunctions     getActivation(void);
    //--- methods for working with files
    virtual void     Save(int &file_handle);
    virtual void     Load(int &file_handle);
};

//+------------------------------------------------------------------+
//|          initiate saving to a file handle                        |
//+------------------------------------------------------------------+
void CLayer::Save(int &file_handle) {
//--- check file_handle
    if(file_handle == INVALID_HANDLE)
        return;
//--- check if there is data to store
    if(m_data_total == 0)
        return;
//---loop and save
    for(int i = 0; i < m_data_total; i++) {
        CNeuron *n = m_data[i];
        if(CheckPointer(n) == POINTER_INVALID)
            break;
        //---
        n.Save(file_handle);
    }
}
//+------------------------------------------------------------------+
//|          load data from a file handle                            |
//+------------------------------------------------------------------+
void CLayer::Load(int &file_handle) {
//--- check handle
    if(file_handle == INVALID_HANDLE)
        return;
//--- check if neurons are present
    if(m_data_total == 0)
        return;
//---loop and load
    for(int i = 0; i < m_data_total; i++) {
        CNeuron *n = m_data[i];
        if(CheckPointer(n) == POINTER_INVALID)
            break;
        n.Load(file_handle);
    }
}
//+------------------------------------------------------------------+
//|          set activation function for this layer                  |
//+------------------------------------------------------------------+
void CLayer::setActivation(const ActFunctions func = Sigmoid) {
    activationFunction = func;
}

//+------------------------------------------------------------------+
//|          get the set activation for this layer                   |
//+------------------------------------------------------------------+
ActFunctions CLayer::getActivation(void) {
    return activationFunction;
}
//+------------------------------------------------------------------+
//|   Link instances to form a fully connected neural network        |
//+------------------------------------------------------------------+
class CNet: public CObject {
private:
    double           m_error;
    CLayer           m_layers[];
    bool             errorFlag;
    double           m_recentAverageError;
    static double    m_recentAverageSmoothingFactor;
public:
                     CNet(const CArrayInt &topology, const ActFunctions hidden = TanH, const ActFunctions output = TanH);
//---
    virtual void     feedForward(const CArrayDouble &inputVals);
    virtual void     backProp(const CArrayDouble &targetVal);
    virtual void     getResults(CArrayDouble &resultVals) const;
    virtual double   getRecentAverageError(void);
    //--- visibe network topology
    int              m_topology[];
    //--- methods for working with files
    bool             Save(int &file_handle);
    bool             Load(int &file_handle);
    //---
    template <typename custom>
    custom           shutDown(custom exit_code, string msg = NULL);
};

//+------------------------------------------------------------------+
//|       Shut down the network when required                        |
//+------------------------------------------------------------------+
template <typename custom>
custom CNet::shutDown(custom exit_code, string msg = NULL) {
    Print(msg, ". Shutting down...");
    errorFlag = true;
//---
    ArrayFree(m_layers);
    ArrayFree(m_topology);
//---
    return exit_code;
}

//+------------------------------------------------------------------+
//|        Save the network for future use                           |
//+------------------------------------------------------------------+
bool CNet::Save(int &file_handle) {
    if(file_handle == INVALID_HANDLE)
        return false;
//---
    if(FileWriteArray(file_handle, m_topology) <= 0)
        shutDown(false, "Error saving network");
//---
    for(int i = 0; i < ArraySize(m_layers); i++)
        m_layers[i].Save(file_handle);
//---
    uchar successFlag[];
    StringToCharArray("Saved successfully!", successFlag);
//---
    if(FileWriteArray(file_handle, successFlag) <= 0)
        Print("Error: Partial save");
//---
    FileClose(file_handle);
//---
    return true;
}

//+------------------------------------------------------------------+
//|        Load the network from a file                              |
//+------------------------------------------------------------------+
bool CNet::Load(int &file_handle) {
    if(file_handle == INVALID_HANDLE)
        return false;
//---
    if(FileReadArray(file_handle, m_topology) <= 0)
        return shutDown(false, "Error loading network configuration");
//---
//---
    errorFlag = false;
    uint numLayers = ArraySize(m_topology);
//--- create layers
    ArrayResize(m_layers, numLayers);
    for(uint layerNum = 0; layerNum < numLayers && !IsStopped(); ++layerNum) {
        uint numOutputs = (layerNum == numLayers - 1) ? 0 : m_topology[layerNum + 1];
        //--- shorten layer pointer
        CLayer *layer = GetPointer(m_layers[layerNum]);
        //--- create neurons and give them layer activation functions
        for(int neuronNum = 0; neuronNum <= m_topology[layerNum] && !IsStopped(); ++neuronNum) {
            CNeuron *neuron = new CNeuron(numOutputs, neuronNum);
            if(neuron == NULL) {
                shutDown("Neuron creation error");
                break;
            }
            //--- store pointer to neuron
            layer.Add(neuron);
            //--- bias neuron value
            if(neuronNum == m_topology[layerNum])
                neuron.setNodeVal(1.0);
        }
    }
//---
//---
    for(int i = 0; i < ArraySize(m_layers); i++)
        m_layers[i].Load(file_handle);
//---
    uchar successFlag[];
    if(FileReadArray(file_handle, successFlag) > 0)
        if(CharArrayToString(successFlag) == "Saved successfully!")
            Print("Network loaded successfully.");
        else return shutDown(false, "Load network error");
//---
    return true;
}
//--- average our error over this number of training samples
double CNet::m_recentAverageSmoothingFactor = 100.0;

//+------------------------------------------------------------------+
//|   Create the network with the given configuration                |
//+------------------------------------------------------------------+
CNet::CNet(const CArrayInt &topology, const ActFunctions hidden = TanH, const ActFunctions output = TanH) {
    errorFlag = false;
    uint numLayers = topology.Total();
//--- create layers
    ArrayResize(m_layers, numLayers);
    for(uint layerNum = 0; layerNum < numLayers && !IsStopped(); ++layerNum) {
        uint numOutputs = (layerNum == topology.Total() - 1) ? 0 : topology.At(layerNum + 1);
        //--- shorten layer pointer
        CLayer *layer = GetPointer(m_layers[layerNum]);
        //--- set type of activation function
        if(layerNum != numLayers - 1)
            layer.setActivation(hidden);
        else layer.setActivation(output);
        //--- create neurons and give them layer activation functions
        for(int neuronNum = 0; neuronNum <= topology.At(layerNum) && !IsStopped(); ++neuronNum) {
            CNeuron *neuron = new CNeuron(numOutputs, neuronNum, layer.getActivation());
            if(neuron == NULL) {
                shutDown("Neuron creation error");
                break;
            }
            //---
            layer.Add(neuron);
            //---
            if(neuronNum == topology.At(layerNum))
                neuron.setNodeVal(1.0);
        }
    }
}
//+------------------------------------------------------------------+
//|    getter method of a private variable value                     |
//+------------------------------------------------------------------+
double CNet::getRecentAverageError(void) {
    if(errorFlag)
        return 0.0;
    return m_recentAverageError;
}

//+------------------------------------------------------------------+
//|        collect predicted results from output nodes               |
//+------------------------------------------------------------------+
void CNet::getResults(CArrayDouble &resultVals)const {
    if(errorFlag)
        return;
//---
    resultVals.Clear();
    CLayer *lastLayer = GetPointer(m_layers[ArraySize(m_layers) - 1]);
    for(int n = 0; n < lastLayer.Total() - 1 && !IsStopped(); ++n) {
        CNeuron *neuron = lastLayer.At(n);
        resultVals.Add(neuron.getNodeVal());
    }
//---
}

//+------------------------------------------------------------------+
//|        propagate forward to get a prediction                     |
//+------------------------------------------------------------------+
void CNet::feedForward(const CArrayDouble &inputVals) {
    if(errorFlag)
        return;
//---
    CLayer *inputLayer = GetPointer(m_layers[0]);
    if(inputVals.Total() != inputLayer.Total() - 1) {
        shutDown(0, "Invalid pointer");
        return;
    }
//---
    for(int i = 0; i < inputVals.Total() && !IsStopped(); ++i) {
        CNeuron *neuron = inputLayer.At(i);
        neuron.setNodeVal(inputVals.At(i));
    }
//---
    for(int layerNum = 1; layerNum < ArraySize(m_layers) && !IsStopped(); ++layerNum) {
        CLayer *layer = GetPointer(m_layers[layerNum]);
        CLayer *prevLayer = GetPointer(m_layers[layerNum - 1]);
        //---
        for(int n = 0; n < layer.Total() - 1 && !IsStopped(); ++n) {
            CNeuron *neuron = layer.At(n);
            neuron.feedForward(prevLayer);
        }
    }
}
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
        for(int n = 0; n < layer.Total() - 1 && !IsStopped(); ++n) {
            CNeuron *neuron = layer.At(n);
            neuron.updateInputWeights(prevLayer);
        }
    }
}
//+------------------------------------------------------------------+
