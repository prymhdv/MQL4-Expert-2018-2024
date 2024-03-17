//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
enum E_ACTOR_FEELING
{         ULTAR_HAPPY,
          SUPER_HAPPY,
          HAPPY,
          NORMAL,
          SAD,
          SUPER_SAD,
          ULTAR_SAD

};
struct S_ACTOR_TARGETS
{

          S_ACTOR_TARGETS(void) {};
          ~S_ACTOR_TARGETS(void) {};
          //---------------------------
          double WINProfite;
          double LOOSProfit;


};
struct S_ACTOR_DATAS
{

          S_ACTOR_DATAS(void) {};
          ~S_ACTOR_DATAS(void) {};
          //---------------------------
          double Balance;
          double Equity;
          double Risk;
          S_ACTOR_TARGETS TARGET;
          E_ACTOR_FEELING ACTOR_FEELING;



};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_ACTOR_
{
public:
          C_ACTOR_(void) {INIT();};
          ~C_ACTOR_(void) {};
          //------------------------------------------
          S_ACTOR_DATAS ACTOR_DATAS;

          void  Update()
          {         //-----------------------------
                    //LOAD MEMORY
                    //ACT I      UPDATE ENVIROMENT
                    //ACT II     UPDATE END              POSITION SELL BUY
                    //ACT III    UPDATE START            POSITION SELL BUY
                    //ACT IV     UPDATE MODIFICATION     POSITION SELL BUY
                    //-----------------------------
                    //ACT II     UPDATE Virtual Trade END              POSITION SELL BUY
                    //ACT III    UPDATE Virtual Trade START            POSITION SELL BUY
                    //ACT IV     UPDATE Virtual Trade MODIFICATION     POSITION SELL BUY
                    //SAVE MEMMORY
                    //-----------------------------
          }
          //
          void INIT() {}; //
};
//+------------------------------------------------------------------+
