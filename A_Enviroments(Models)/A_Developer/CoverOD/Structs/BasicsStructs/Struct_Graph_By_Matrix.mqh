//+------------------------------------------------------------------+
//|                                           Graph_NodeAdvanced.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define __M 4
#define __N 4
class CDSGraph_By_Matrix
{
public:
          void CDSGraph_By_Matrix() {};
          void ~CDSGraph_By_Matrix() {};
          int main()
          {         // n is the number of vertices, // m is the number of edges
                    int n, m;
                    //cin >> n >> m;
                    n = 4; m = 4; //
                    int adjMat[__M + 1][__M + 1];
                    for (int i = 0; i < __M; i++)
                    {         int u, v;
                              //cin >> u >> v;
                              u = 5; v = 1;
                              adjMat[u][v] = 1;
                              adjMat[v][u] = 1;
                              // for a directed graph with an edge pointing from u
                              // to v,we just assign adjMat[u][v] as 1  othrts are 0
                    }//
                    return 0;//
          }//
};
//+------------------------------------------------------------------+
