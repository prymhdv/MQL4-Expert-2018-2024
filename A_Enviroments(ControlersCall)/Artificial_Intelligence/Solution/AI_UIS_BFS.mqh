/*//-----Breadth-Frist Search  Implementation
--------------------------------------------------------------------------------------
#include <stdio.h>
#include "graph.h"
#include "queue.h"
//-----------------
#define A 0 #define B 1 #define C 2 #define D 3 #define E 4 #define F 5 #define G 6 #define H 7
int init_graph(graph_t *g_P){addEdge(g_p,A,B,1);     addEdge(g_p,A,C,1);     addEdge(g_p,B,D,1);     addEdge(g_p,C,E,1);     addEdge(g_p,C,F,1);     addEdge(g_p,D,G,1);     addEdge(g_p,D,H,1);     return 0;}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void bfs(graph_t * g_p,int root ,int goal)
{
int node , to;
queue_t *q_p,;
q_p = createQueue(10);
//--
enQueue(q_p,root);
//--
while(!isEmptyQueue(q_p)
  {
   node = deQueue(q_p);
   printf("%d\n",node);
   if(node == goal)break;
   for(to=g_p-> node-1;to>0;to--) {if(getEdge(g_p,node,to)){enQueue(q_p,to);}}//
  }
   destroyQueue(q_p);return;
 }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
 int main()
 {
 graph_t *g_p;
 g_p = createGraph(8);
 init_graph(g_p);
 bfs(g_p,0,7);
 destroyGraph(g_p);
 return 0;//
 }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
*/