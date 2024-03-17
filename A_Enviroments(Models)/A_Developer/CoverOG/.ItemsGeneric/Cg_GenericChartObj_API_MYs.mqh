//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+
//+----------------------------------------------------------------------------------------------------------------+
//|Module Material Graphical Solo ~~  Line ~ Shape ~ Text ~ Bitmaps ~ Events ~ Arrows ~ Fibos ~ Ganns ~ Channels   |
//+----------------------------------------------------------------------------------------------------------------+

template<typename GraphicalDataStruct, typename iobj>
class Cg_GenericChartObj_API_MYs: public __COBFA__<GraphicalDataStruct>   //--- Factory
{
//+-------------------------------------------------------------------------------------+
//|     STRUCT_OBJECT Base Struct Of GraphicalChartObj                                 ||
//|     STRUCT_OBJECT Handel DataForm GraphicalChartObj (set,get,save,load)            ||
//|                                                                                    ||
//|     Relation:                                                                      ||
//|        ChartObj Handel DataAction Of GraphicalChartObj (Create,Move,Delete,Modify) ||
//|                                                                                    ||
//|     Connection:                                                                    ||
//|         GraphicalActionClass DataBase (set,get,Change)                                          ||
//+-------------------------------------------------------------------------------------+
          //----
          //---- ChartObj::GraphicalDataStruct::Set_Action_2(WhichMode, IsKey);
          //---- ChartObj::GraphicalDataStruct::Set_Desc_4();)
          //---- ChartObj::GraphicalDataStruct::Set_Color_1(clrDarkCyan);
          //---- ChartObj::GraphicalDataStruct::Set_Location_5((int)(397.8) +  independX + FixPadFlowX, (int)(201.6) + FixPadFlowY + independY, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
          //---- ChartObj::GraphicalDataStruct::Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "FlowPad.LBL_L");
          //---- ChartObj::GraphicalDataStruct::Set_Chart_6();
          //---- ChartObj::Action(ChartObj.GraphicalDataStruct);
          //----
          static uint           Total;
          string                m_name;
          //----
public:
          void                  Cg_GenericChartObj_API_MYs()  {};
          void                  ~Cg_GenericChartObj_API_MYs() {};
          //----
          GraphicalDataStruct                IsAPI;          //--- API Structure mine build ---//Sg_LABEL     of obj API mine build
          iobj                               IiAPI;          //--- API Controler mine build ---//Cg_TextsLabel
          //----non-MQL
          //GraphicalActionClass                  ChartObj::GraphicalActionClass;          //--- API Chart     MQL  build ---//CChartObjectButton
          //cobj                  ChartObj::MQLcAPI;          //--- API Controler MQL  build ---//CButton::CChartObjectButton
          //----
          __COBFA__<GraphicalDataStruct>         Frame;         //--- Parent //---Maynot Drived it can used as Proxy Parted //when Drived then no need to be member
          //----


};
template<typename GraphicalDataStruct, typename GraphicalActionClass>  //---Error 'Total' - template mismatch
uint Cg_GenericChartObj_API_MYs::Total = 0;
//+----------------------------------------------------------------------------------------------------------------+
//|Module Material Graphical Solo ~~  Line ~ Shape ~ Text ~ Bitmaps ~ Events ~ Arrows ~ Fibos ~ Ganns ~ Channels   |
//+----------------------------------------------------------------------------------------------------------------+
