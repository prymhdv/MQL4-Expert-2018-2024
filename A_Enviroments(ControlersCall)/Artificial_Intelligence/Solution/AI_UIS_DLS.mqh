/*//-----Depth-Limited Search  Implementation
--------------------------------------------------------------------------------------
#include <stdio.h>
#include "graph.h"
#include "stack"
//-----------------
#define A 0
#define B 1
#define C 2
#define D 3
#define E 4
#define F 5
#define G 6
#define H 7
int init_graph(graph_t *g_P){addEdge(g_p,A,B,1);     addEdge(g_p,A,C,1);     addEdge(g_p,B,D,1);     addEdge(g_p,C,E,1);     addEdge(g_p,C,F,1);     addEdge(g_p,D,G,1);     addEdge(g_p,D,H,1);     return 0;}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void dls(graph_t * g_p,int root ,int goal,int limit)
{
int node ,depth, to;
stack_t *s_p,*sd_p;
s_p = createStack(10);
sd_p = createStack(10);
//--
pushStack(s_p,root);
pushStack(sd_p,0);
//--
while(!isEmptyStack(s_p)
  {
   node = popStack(s_p);
   depth = popStack(sd_p);
   printf("%d(depth %d)\n",node,depth);
   if(node == goal)break;
   if(depth<limit){
   for(to=g_p-> node-1;to>0;to--) {if(getEdge(g_p,node,to)){pushStack(s_p,to);pushStack(sd_p,depth+1);}}
                  }//
  }
   destroyStack(s_p);destroyStack(sd_p); return;
 }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
 int main()
 {
 graph_t *g_p;
 g_p = createGraph(8);
 init_graph(g_p);
 dls(g_p,0,5,2);
 destroyGraph(g_p);
 return 0;//
 }
--------------------------------------------------------------------------------------*/
//+------------------------------------------------------------------+
