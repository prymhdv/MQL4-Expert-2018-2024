//+------------------------------------------------------------------+
//|                    Cg_GenericChartObj_API_MYs_MQLo_MYi.mqh       |
//+------------------------------------------------------------------+
//||   ||||||||||      Cg_GenericChartObj_API_MYs_MQLo_MYi.mqh      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.CoverOG.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//+----------------------------------------------------------------------------------------------------------------+
//|Module Material Graphical Solo ~~  Line ~ Shape ~ Text ~ Bitmaps ~ Events ~ Arrows ~ Fibos ~ Ganns ~ Channels   |
//+----------------------------------------------------------------------------------------------------------------+
//+------------------------------------------------------------------+
//---- #include <ChartObjects\ChartObjectsTxtControls.mqh>
//+------------------------------------------------------------------+
template<typename GraphicalDataStruct, typename GraphicalActionClass, typename GraphicalDevClass>
class Cg_GenericChartObj_API_MYs_MQLo_MYi: public __COBFA__<GraphicalDataStruct>   //--- Factory
{
//+-------------------------------------------------------------------------------------+
//|     Cg_GenericChartObj_API_MYs_MQLo_MYi Drived From Base Claas Of __COBFA__                               ||
//|     STRUCT_OBJECT Handel DataForm GraphicalChartObj (set,get,save,load)            ||
//|                                                                                    ||
//|     Relation:                                                                      ||
//|        Cg_GenericChartObj_API_MYs_MQLo_MYi Handel DataAction Of GraphicalChartObj (Create,Move,Delete,Modify) ||
//|                                                                                    ||
//|     Connection:                                                                    ||
//|         GraphicalActionClass DataBase (set,get,Change)                                          ||
//+-------------------------------------------------------------------------------------+
          //---- GraphicalDataStruct::Set_Action_2(WhichMode, IsKey);
          //---- GraphicalDataStruct::Set_Desc_4();)
          //---- GraphicalDataStruct::Set_Color_1(clrDarkCyan);
          //---- GraphicalDataStruct::Set_Location_5((int)(397.8) +  independX + FixPadFlowX, (int)(201.6) + FixPadFlowY + independY, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
          //---- GraphicalDataStruct::Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "FlowPad.LBL_L");
          //---- GraphicalDataStruct::Set_Chart_6();
          //---- Action(Cg_GenericChartObj_API_MYs_MQLo_MYi.GraphicalDataStruct);
          //----
          //-----The Action is in parent __COBFA__ to manage requast...
          //----------------------------------------------------------------------------------------
          static uint           Total;
          string                m_name;
          //----------------------------------------------------------------------------------------
public:
          void                  Cg_GenericChartObj_API_MYs_MQLo_MYi()  {};
          void                  ~Cg_GenericChartObj_API_MYs_MQLo_MYi() {return;};

          //-----MINE----------------------------------------------------------------------------------------Need to assagn name to GDC from GAC
          // GraphicalDataStruct   /*must*/     APIsObj;
          GraphicalDataStruct      /*must*/     GDS;          //--- API Structure mine build ---//Sg_LABEL     of obj API mine build //--when generic build its cover all
          GraphicalDevClass                     GDC;          //--- API Controler mine build ---//Cg_TextsLabel
          //-----MQL----------------------------------------------------------------------------------------
          GraphicalActionClass     /*must*/     GAC;         //--- API Chart     MQL  build ---//CChartObjectButton   //---SET.GET Props not keep...
          //MQLcAPI                             MQL_cAPI;         //--- API Controler MQL  build ---//CButton::CChartObjectButton
          //--------------------------------------------------------------------------------------------
         //--off-- __COBFA__<GraphicalDataStruct>         Frame;         //--- Parent //---Maynot Drived it can used as Proxy Parted //when Drived then no need to be member
          //void                                  SetupSignal() {}
          //--------------------------------------------------------------------------------------------
          bool                          GAC_CreateCall(long ChartID_, string Name_, int SubWindow_)
          {         ////---iner layer must redefined//--noneed then
                    //if(true)     return GAC.Create(ChartID_, Name_, SubWindow_, 0, 0, 0, 0);
                    ///  else         return GAC.Create(ChartID_, Name_, SubWindow_, 0, 0);
                    return false;
                    //
          }

          //---- Copye GraphicalDataStruct{API Structure mine build} to GraphicalActionClass{MQL CChartObject}
          bool                  Copy(GraphicalDataStruct &s, GraphicalActionClass &o);
          //---GraphicalActionClass                  Copyx() { GraphicalActionClass *X = new GraphicalActionClass();   /*return GraphicalActionClass==IsAPI*/ return (X);};
          //---object of 'CChartObjectRectLabel' cannot be returned, copy constructor 'CChartObjectRectLabel::CChartObjectRectLabel(const CChartObjectRectLabel &)' not found
          //----------------------------------------------------------------------------------------
          GraphicalActionClass               Copy();
          void                  Copy3()
          {         ///-----------------------------------------------------------------------------
                    ///     Get Template Type GDS And Copy to GAC object                ///
                    ///     Where GAC ToSet?   in Action <- Attriber                        ///
                    ///     Where GDS  ToSet?   in Declaring GAC Continer               ///
                    ///     Solution #1 Set  GAC in  Action                                 ///
                    ///     ---------------------------------------------------------------      ///
                    ///     Solution #2 Keep MQL_oAPI_obj in MY_sAPI_obj GlobalVariables         ///
                    ///     Solution #2 Keep MQL_oAPI_obj in MY_sAPI_obj DataBase<txt file>      ///
                    ///     Solution #2 Keep MQL_oAPI_obj in MY_sAPI_obj DataBase<bin file>      ///
                    ///     ---------------------------------------------------------------      ///
                    ///     Solution #2 recover MQL_oAPI_obj in  GlobalVariables                 ///
                    ///     Solution #2 recover MQL_oAPI_obj in MY_sAPI_obj DataBase<txt file>   ///
                    ///     Solution #2 recover MQL_oAPI_obj in MY_sAPI_obj DataBase<bin file>   ///
                    ///-----------------------------------------------------------------------------
                    /*return GraphicalActionClass==IsAPI*/
                    //GraphicalActionClass.attribe = GDS.attribe
                    string TypeNameOfClass_CChartObjectLabel = typename(CChartObjectLabel);
                    string TypeNameOfObj_MQL_oAPI            = typename(GAC);
                    ///---off proxy of parrent,,,
                    //GraphicalActionClass MQL_oAPI_Set;
                    //MQL_oAPI_Set.X_Distance(GDS.XDISTANCE_L_02);   ///---off proxy of parrent,,,
                    //GAC.X_Distance(GDS.XDISTANCE_L_02);
                    ///---
                    //GraphicalActionClass. = GDS.;
                    //GraphicalActionClass. = GDS.;
                    //GraphicalActionClass. = GDS.;
                    //GraphicalActionClass. = GDS.;
                    //GraphicalActionClass. = GDS.;
                    //GraphicalActionClass. = GDS.;
                    //GraphicalActionClass. = GDS.;
                    //GraphicalActionClass. = GDS.;
                    //GraphicalActionClass. = GDS.;
                    //GraphicalActionClass. = GDS.;
                    //GraphicalActionClass. = GDS.;
                    //----
                    //GraphicalActionClass.back(GDS.BACK_G_00);
                    //GraphicalActionClass. = GDS.ZORDER_G_00;
                    //GraphicalActionClass. = GDS.HIDDEN_G_00;
                    //GraphicalActionClass. = GDS.SELECTED_G_00;
                    //GraphicalActionClass. = GDS.SELECTABLE_G_00;
                    //GraphicalActionClass. = GDS.TOOLTIP_G_00;
                    ////----
                    //GraphicalActionClass. = GDS.TIMEFRAMES_O_00;
                    //GraphicalActionClass. = GDS.SYMBOL_O_00;
                    //GraphicalActionClass. = GDS.CREATETIME_O_00;
                    //GraphicalActionClass. = GDS.TYPE_O_00;
                    //GraphicalActionClass. = GDS.CHART_O_00;
                    //GraphicalActionClass. = GDS.SUBWINDOW_O_00;
                    //-----
                    //return GraphicalActionClass;//
                    //--object of 'CChartObjectRectLabel' cannot be returned, copy constructor 'CChartObjectRectLabel::CChartObjectRectLabel(const CChartObjectRectLabel &)' not found
          };
          //----


};
template<typename GraphicalDataStruct, typename GraphicalActionClass, typename iobj>  //---Error 'Total' - template mismatch
uint Cg_GenericChartObj_API_MYs_MQLo_MYi::Total = 0;

//+----------------------------------------------------------------------------------------------------------------+
//|Module Material Graphical Solo ~~  Line ~ Shape ~ Text ~ Bitmaps ~ Events ~ Arrows ~ Fibos ~ Ganns ~ Channels   |
//+----------------------------------------------------------------------------------------------------------------+
