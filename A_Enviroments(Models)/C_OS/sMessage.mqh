//+------------------------------------------------------------------+
//|                                                    C_MESSAGE.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+
class C_MESSAGE
{
private:

public://Constructors
          C_MESSAGE()   { RunCallFunction++;};
          ~C_MESSAGE()  {};
          //
public://Functions
          //
          void C_MESSAGE::MessagingTelegrm();

          void C_MESSAGE::Messager();
          //
          //

          //
};

//+------------------------------------------------------------------+
void C_MESSAGE::MessagingTelegrm()
{         //
          double sigEntry = 2.0232;
          double sigTp = 2.0232;
          double sigSl = 2.0232;
          static const datetime Timing = Time[0];
          datetime time[] = {0 };
          // ➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
          //H4 Bar Chart 💹21 - 03 - 07 Result: +1070pip💾
          //Week: _R4[2001]_R2[1888]_🔎PP[1818]_*S2[1748]🔎_S4[1635]*
          // TP1 1777🏃‍♂100 % 🔚(+460pip)
          // TP2 1716🏃‍♂100 % 🔚♻️(+1070pip)
          // TP3 1619🏃‍♂000 % 🔜(+2040pip)
          // 🔴@1823 👎Sl: 1875🔄(-520pip) R\R! (21 - 03 - 19)END
          // ➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
          //===================================
          //--- declare character constants
          int a = 'A';
          int b = '$';
          int c = '©';    // code 0xA9
          int d = '\xAE'; // code of the symbol ®
          //--- output print constants
          //Alert(a, b, c, d);
          //--- add a character to the string
          string test = " ";///must not Null
          ushort a1 = 0215;//using for >>>Keystroke  Alt+0215<<<
          ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //--- add a character to the stringASCII Code
          StringSetCharacter(test, 0, a1);//(ushort)//0 mean strting point
          //===================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          // Alert(Utilities.TimeFrameToString(_Period) );//out H4
          //string msg = "emoji = " + "😃";
          //"u'\U2757'  The New Signal\n --------- "
          string msg = StringFormat("U\\00002757  The New Signal\n --------- "
                                    "\nSymbol: %s"
                                    "\nTimeframe:%s"
                                    "\nType: Sell"
                                    "\nPrice: %s"
                                    "\nTake Profit: %s"
                                    "\nStop Loss: %s"
                                    "\nTime: % s",
                                    _Symbol,
                                    Utilities.TimeFrameToString((ENUM_TIMEFRAMES)_Period ),
                                    DoubleToString(sigEntry, _Digits),
                                    DoubleToString(sigTp, _Digits),
                                    DoubleToString(sigSl, _Digits),
                                    TimeToString(time[0])
                                   );//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_MESSAGE::Messager()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //comment--Print--Alert--MessageBox
          int Key = MessageBox("Hello this is from expert Creator", "Want to ChartSet ?", MB_CANCELTRYCONTINUE | MB_ICONEXCLAMATION | MB_DEFBUTTON1);
          switch (Key)
          {         case 1:  {Print("OK button has been pressed");}
                    case 2:  {Print("Cancel button has been pressed");}
                    case 3:  {Print("Abort button has been pressed");}
                    case 4:  {Print("Retry button has been pressed");}
                    case 5:  {Print("Ignore button has been pressed");}
                    case 6:  {Print("Yes button has been pressed");}
                    case 7:  {Print("No button has been pressed");}
                    case 10: {Print("Try Again button has been pressed");}
                    case 11: {Print("Continue button has been pressed");  } //--
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
          }//--
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+
