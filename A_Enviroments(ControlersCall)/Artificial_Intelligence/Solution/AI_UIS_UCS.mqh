/*//-----Uniform-Cost Search  Implementation
--------------------------------------------------------------------------------------
#include <stdio.h>
#include "graph.h"
#include "pqueue.h"
//-----------------
#define A 0 #define B 1 #define C 2 #define D 3 #define E 4 
int init_graph(graph_t *g_P){addEdge(g_p,A,B,5);     addEdge(g_p,A,C,1);     addEdge(g_p,A,D,2);     addEdge(g_p,B,E,1);     addEdge(g_p,C,E,7);     addEdge(g_p,D,E,5); return 0;}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ucs(graph_t * g_p,int root ,int goal)
{
        int node ,cost, child_cost,to;
        pqueue_t *q_p,;
        q_p = createPQueue(7);
        //--
        enPQueue(q_p,root,0);
        //--
        while(!isEmptyPQueue(q_p)
          {
           dePQueue(q_p,&node,&cost);
           if(node == goal){ printf("cost %d\n",cost); return}
           for(to=g_p-> node-1;to>0;to--) {
           child_cost = getEdge(g_p,node,to);
           if(child_cost){enPQueue(q_p,to,(child_cost+cost));}}//
          }
           destroyPQueue(q_p);return;
 }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
 int main()
 {
         graph_t *g_p;
         g_p = createGraph(6);
         init_graph(g_p);
         ucs(g_p,A,E);
         destroyGraph(g_p);
         return 0;//
 }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
*/