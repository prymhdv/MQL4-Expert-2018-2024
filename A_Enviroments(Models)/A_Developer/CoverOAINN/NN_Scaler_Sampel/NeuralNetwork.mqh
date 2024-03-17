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
#include <Arrays\ArrayDouble.mqh>
#include <Arrays\ArrayInt.mqh>
#include <Arrays\ArrayObj.mqh>
//+------------------------------------------------------------------+
//|                connections container                             |
//+------------------------------------------------------------------+
struct SConnection {
public:
    double           weight, deltaWeight;
private:
    float            randWeight(void);
public:
                     SConnection(void);

};
//+------------------------------------------------------------------+
//|          initialize new connections with random values           |
//+------------------------------------------------------------------+
SConnection::SConnection(void) {
    weight = randWeight();
    deltaWeight = 0.0;
}
//+------------------------------------------------------------------+
//|          random weight generator                                 |
//+------------------------------------------------------------------+
float SConnection::randWeight(void) {
    return (float)rand() / (INT_MAX);
}
//+------------------------------------------------------------------+
//|           Neuron object structure                                |
//+------------------------------------------------------------------+
class CNeuron: public CObject {
protected:
    SConnection      outputWeights[];
    double           m_nodeVal;
    uint             m_myIndex;
    double           m_gradient;
    static double    eta, alpha;
    static double    activationFunction(double x);
    static double    activationDerivative(double x);
    //---
    template <typename Layer>
    double           sumDOW(const Layer &nextLayer) const;
public:
                     CNeuron(uint numOutputs, uint myIndex);
//---
    void             setNodeVal(double val) {
        m_nodeVal = val;
    }
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
};

double CNeuron::eta = 0.15; // Net learning rate
double CNeuron::alpha = 0.5; // Momentum

//+------------------------------------------------------------------+
//|            tahn activation function                              |
//+------------------------------------------------------------------+
double CNeuron::activationFunction(double x) {
//--- range(-1.0,1.0)
    return tanh(x);
}

//+------------------------------------------------------------------+
//|             derivative of the activation function                |
//+------------------------------------------------------------------+
double CNeuron::activationDerivative(double x) {
    return 1.0 - x * x;
}

//+------------------------------------------------------------------+
//|      CNeuron constructor                                       |
//+------------------------------------------------------------------+
CNeuron::CNeuron(uint  numOutputs, uint myIndex) {
    ArrayResize(outputWeights, numOutputs);
    m_myIndex = myIndex;
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
//|   Create our Layer definition. Will replace template definitions |
//+------------------------------------------------------------------+
class CLayer: public CArrayObj {
protected:
    uint             iOutputs;
public:
                     CLayer(uint numOutputs) {
        iOutputs = numOutputs;
    }
};






//+------------------------------------------------------------------+
//|   Link instances to form a fully connected neural network        |
//+------------------------------------------------------------------+
class CNet: public CObject {
private:
    CArrayObj        m_layers;
    double           m_error;
    double           m_recentAverageError;
    static double    m_recentAverageSmoothingFactor;
public:
                     CNet(const CArrayInt &topology);
//---
    void             feedForward(const CArrayDouble &inputVals);
    void             backProp(const CArrayDouble &targetVal);
    void             getResults(CArrayDouble &resultVals) const;
    double           getRecentAverageError(void);
};
//--- average our error over this number of training samples
double CNet::m_recentAverageSmoothingFactor = 100.0;

//+------------------------------------------------------------------+
//|   Create the network with the given configuration                |
//+------------------------------------------------------------------+
CNet::CNet(const CArrayInt &topology) {
    uint numLayers = topology.Total();
    for(uint layerNum = 0; layerNum < numLayers && !IsStopped(); ++layerNum) {
        uint numOutputs = (layerNum == topology.Total() - 1) ? 0 : topology.At(layerNum + 1);
        //--- create a layer
        CLayer *layer = new CLayer(numOutputs);
        m_layers.Add(layer);
        //---
        for(int neuronNum = 0; neuronNum <= topology.At(layerNum) && !IsStopped(); ++neuronNum) {
            CNeuron *neuron = new CNeuron(numOutputs, neuronNum);
            if(neuron == NULL)
                return;
            //---
            if(neuronNum < topology.At(layerNum))
                Print("Made a neuron!");
            else Print("Made a bias neuron!");
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
    return m_recentAverageError;
}

//+------------------------------------------------------------------+
//|        collect predicted results from output nodes               |
//+------------------------------------------------------------------+
void CNet::getResults(CArrayDouble &resultVals)const {
    resultVals.Clear();
    const CLayer *lastLayer = m_layers.At(m_layers.Total() - 1);
    for(int n = 0; n < lastLayer.Total() - 1 && !IsStopped(); ++n) {
        CNeuron *neuron = lastLayer.At(n);
        resultVals.Add(neuron.getNodeVal());
    }
}

//+------------------------------------------------------------------+
//|        propagate forward to get a prediction                     |
//+------------------------------------------------------------------+
void CNet::feedForward(const CArrayDouble &inputVals) {
    const CLayer *inputLayer = m_layers.At(0);
    if(inputVals.Total() != inputLayer.Total() - 1)
        return;
//---
    for(int i = 0; i < inputVals.Total() && !IsStopped(); ++i) {
        CNeuron *neuron = inputLayer.At(i);
        neuron.setNodeVal(inputVals.At(i));
    }
//---
    for(int layerNum = 1; layerNum < m_layers.Total() && !IsStopped(); ++layerNum) {
        CLayer *layer = m_layers.At(layerNum);
        CLayer *prevLayer = m_layers.At(layerNum - 1);
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
    const CLayer *outputLayer = m_layers.At(m_layers.Total() - 1);
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
    for(int layerNum = m_layers.Total() - 2; layerNum > 0 && !IsStopped(); --layerNum) {
        CLayer *hiddenLayer = m_layers.At(layerNum);
        CLayer *nextLayer = m_layers.At(layerNum + 1);
        //---
        for(int n = 0; n < hiddenLayer.Total() && !IsStopped(); ++n) {
            CNeuron *neuron = hiddenLayer.At(n);
            neuron.calcHiddenGradients(nextLayer);
        }
    }
//--- make neurons update connections feeding to them
    for(int layerNum = m_layers.Total() - 1; layerNum > 0 && !IsStopped(); --layerNum) {
        CLayer *layer = m_layers.At(layerNum);
        CLayer *prevLayer = m_layers.At(layerNum - 1);
        //---
        for(int n = 0; n < layer.Total() - 1 && !IsStopped(); ++n) {
            CNeuron *neuron = layer.At(n);
            neuron.updateInputWeights(prevLayer);
        }
    }
}
//+------------------------------------------------------------------+
