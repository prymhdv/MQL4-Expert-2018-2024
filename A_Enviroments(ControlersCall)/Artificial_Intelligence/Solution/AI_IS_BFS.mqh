/*//-----Informed Search Best-Frist Search  Implementation*/
/*--------------------------------------------------------------------------------------
void Best_fs(pqueue_t * open_pq_p,queue_t * closed_q_p)
{
                        node_t *node_p;
                        int cost;
                        //---[Enumerate the Open List]
                        while(!isEmptyPQueue(open_pq_p))
                        {         dePQueue(open_pq_p, (int*)& node_p, &cost);
                                  //---[Solution found?]
                                  if(node_p->g == 0)
                                  {         printf("Found Solution(depth %d):\n", node_p->h);
                                            emitBoard(node_p);
                                            break;//
                                  } //
                                  generateChildeNodes(open_pq_p, closed_qp, node_p); //
                        }
                        return;

}
*/
//+------------------------------------------------------------------+
