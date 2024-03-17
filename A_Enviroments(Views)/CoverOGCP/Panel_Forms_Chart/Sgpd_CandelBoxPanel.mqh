//+------------------------------------------------------------------+
//||   ||||||||||                 Sgpdg_CandelBoxPanel.mqh          ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct Sgpd_CandelBoxPanel
{         //----------------------------------------------------------
          Cg_TextsButton        BTN_CandelBox,                    BTN_CandelBoxFill,      BTN_CandelBoxFillResetCount,    BTN_CandelBoxUp,        BTN_CandelBoxDown,
                                //----------------------------------------------------------
                                BTN_CandelBoxKeyClear,
                                BTN_CandelBoxKeyPERIOD_M1,
                                BTN_CandelBoxKeyPERIOD_M5,
                                BTN_CandelBoxKeyPERIOD_M15,
                                BTN_CandelBoxKeyPERIOD_M30,
                                BTN_CandelBoxKeyPERIOD_H1,
                                BTN_CandelBoxKeyPERIOD_H4,
                                BTN_CandelBoxKeyPERIOD_D1,
                                BTN_CandelBoxKeyPERIOD_W1,
                                BTN_CandelBoxKeyPERIOD_MN1;
          //----------------------------------------------------------
          Cg_TextsLabel         LBL_CandelBoxCount;
          //C_TextEdit          EDT_;
          //----------------------------------------------------------

          //----------------------------------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sgpdg_CandelBoxPanel
{         //----------------------------------------------------------
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>
          //----------------------------------------------------------
          BTN_CandelBox,        BTN_CandelBoxFill,      BTN_CandelBoxFillResetCount,    BTN_CandelBoxUp,        BTN_CandelBoxDown,
                                //----------------------------------------------------------
                                BTN_CandelBoxKeyClear,
                                BTN_CandelBoxKeyPERIOD_M1,
                                BTN_CandelBoxKeyPERIOD_M5,
                                BTN_CandelBoxKeyPERIOD_M15,
                                BTN_CandelBoxKeyPERIOD_M30,
                                BTN_CandelBoxKeyPERIOD_H1,
                                BTN_CandelBoxKeyPERIOD_H4,
                                BTN_CandelBoxKeyPERIOD_D1,
                                BTN_CandelBoxKeyPERIOD_W1,
                                BTN_CandelBoxKeyPERIOD_MN1;
          //----------------------------------------------------------
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL, CChartObjectLabel, Cg_TextsLabel> LBL_CandelBoxCount;
          //----------------------------------------------------------
};
//+------------------------------------------------------------------+
//||   ||||||||||                 Sgpdg_CandelBoxPanel.mqh          ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
