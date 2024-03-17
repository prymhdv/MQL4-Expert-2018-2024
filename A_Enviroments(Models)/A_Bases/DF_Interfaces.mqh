//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

struct Base_Animals_data
{         //--------------
          int    age;
          int    name;
          int    health;
          double money;
          bool IsBasic_Attacking, IsBasic_Defencing, IsBasic_Healing; //
};
interface IAnimals  //--'IAnimals' - an interface can only inherit from another interface DF_Interfaces.mqh   13        11

{         //--- The methods of the interface have public access by default
          void Sound();  // The sound produced by the animal
          void Watch();  // The Watch produced by the animal
          void Walk();   // The Walk produced by the animal
          void Attack();
          void Defence();
          void Healing();
          void Wining();
          void Lossing();

          //
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Base_IAnimals : public IAnimals
{
public:
          Base_IAnimals (void);
          ~Base_IAnimals (void);
          //
          Base_Animals_data data;
          //
          //--- The methods of the interface have public access by default
          void Sound() {string Say = "wave,wave...";};; // The sound produced by the animal
          void Watch();  // The Watch produced by the animal
          void Walk();   // The Walk produced by the animal
          void Attack();
          void Defence();
          void Healing();
          void Wining();
          void Lossing();
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cats: public Base_IAnimals
{
public:
          Cats(void);
          ~Cats(void);
          //
          //--- The methods of the interface have public access by default
          void Sound() {string Say = "miau,miau...";}; // The sound produced by the animal
          void Watch();  // The Watch produced by the animal
          void Walk();   // The Walk produced by the animal
          void Attack();
          void Defence();
          void Healing();

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Dogs: public Base_IAnimals
{
public:
          Dogs(void);
          ~Dogs(void);
          //
          //--- The methods of the interface have public access by default
          void Sound() {string Say = "hapu,hapu...";}; // The sound produced by the animal
          void Watch();  // The Watch produced by the animal
          void Walk();   // The Walk produced by the animal
          void Attack();
          void Defence();
          void Healing();

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FunctionTestAnimals()
{         Base_IAnimals CatA = new Cats();
          CatA.data.IsBasic_Attacking = true;
          CatA.Sound();
          CatA.data.money = 100.00; //
          //-------------------------------
          //--- An array of pointers to objects of the IAnimal type
          Base_IAnimals *animals[2]; IAnimals *animals_I[2];
          //--- Creating child classes of IAnimal and saving pointers to them into an array
          animals[0] = new Cats;
          animals[1] = new Dogs;
          //--- Calling the Sound() method of the basic IAnimal interface for each child
          for(int i = 0; i < ArraySize(animals); ++i)
                    animals[i].Sound();
          //--- Deleting objects
          for(int j = 0; j < ArraySize(animals); ++j)
          {         delete animals[j];
                    delete animals_I[j]; }
          //--- Execution result
//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Base_Trader_data
{         //--------------
          int    age;
          int    name;
          int    health;
          double money;
          int    Signal;
          bool   IsBasic_Acting, IsBasic_Buying, IsBasic_Selling, IsBasic_Waiting; //
};
interface ITraders  //--'IAnimals' - an interface can only inherit from another interface DF_Interfaces.mqh   13        11

{         //--- The methods of the interface have public access by default
          void Sound();  // The sound produced by the animal
          void Watch();  // The Watch produced by the animal
          void Walk();   // The Walk produced by the animal
          void Buying();
          void Selling();
          void Waiting();
          void Wining();
          void Lossing();

          //
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Base_Traders : public ITraders
{
public:
          Base_Traders (void);
          ~Base_Traders (void);
          //
          Base_Trader_data data;
          //
          //--- The methods of the interface have public access by default
          void Sound() {string Say = "wave,wave...";};; // The sound produced by the animal
          void Watch();  // The Watch produced by the animal
          void Walk();   // The Walk produced by the animal
          void Buying();
          void Selling();
          void Waiting();
          void Wining();
          void Lossing();
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Banks: public Base_Traders
{
public:
          Banks(void);
          ~Banks(void);
          //
          //--- The methods of the interface have public access by default
          void Sound() {string Say = "Banks,Banks...";}; // The sound produced by the animal
          void Watch();  // The Watch produced by the animal
          void Walk();   // The Walk produced by the animal
          void Attack();
          void Defence();
          void Healing();

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class DayTraders: public Base_Traders
{
public:
          DayTraders(void);
          ~DayTraders(void);
          //
          //--- The methods of the interface have public access by default
          void Sound() {string Say = "DayTraders,DayTraders...";}; // The sound produced by the animal
          void Watch();  // The Watch produced by the animal
          void Walk();   // The Walk produced by the animal
          void Attack();
          void Defence();
          void Healing();

};
//+------------------------------------------------------------------+
void FunctionTestTraders()
{         Base_Traders BankA = new Banks;
          BankA.data.IsBasic_Selling = true;
          BankA.Sound();
          BankA.data.money = 100.00; //
          //-------------------------------
          //--- An array of pointers to objects of the IAnimal type
          Base_Traders *Traders[2]; ITraders *Traders_I[2];
          //--- Creating child classes of IAnimal and saving pointers to them into an array
          Traders[0] = new Banks;
          Traders[1] = new DayTraders;
          //--- Calling the Sound() method of the basic IAnimal interface for each child
          for(int i = 0; i < ArraySize(Traders); ++i)
                    Traders[i].Sound();
          //--- Deleting objects
          for(int j = 0; j < ArraySize(Traders); ++j)
          {         delete Traders[j];
                    delete Traders_I[j]; }
          //--- Execution result
//
//
}
//+------------------------------------------------------------------+
