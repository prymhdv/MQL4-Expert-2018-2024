//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
// stores adjacency list items
class CDSGraph_By_AdjListNode
{
public:
          void CDSGraph_By_AdjListNode() {};
          void ~CDSGraph_By_AdjListNode() {};
          int val, cost;
          CDSGraph_By_AdjListNode* ptr_next; // as list
};
// structure to store Edges
struct CDSGraph_Edge { int start_ver, end_ver, weight; };