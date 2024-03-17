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
#include "NeuralNetwork.mqh"
//+------------------------------------------------------------------+
//|   Process network procedures                                     |
//+------------------------------------------------------------------+
class CNetwork: public CObject_MQL4 {
protected:
private:
    virtual void     MinMaxScaller(void);
public:
                     CNetwork(CArrayDouble_MQL4 &dataSet, CArrayDouble_MQL4 &controlSet, bool willPlot = false);
    //--- result generation methods
    double           computeResult(CArrayDouble_MQL4 &data, int epochs);
    void             computeResults(CArrayDouble_MQL4 &data, int epochs);
    //--- data visualizations
    void             plot(int sleepSeconds = 100);
    //--- working with sessions
    bool             Save(string file_name, bool common = false);
    bool             Load(string file_name, bool common = false);
};
//+------------------------------------------------------------------+
