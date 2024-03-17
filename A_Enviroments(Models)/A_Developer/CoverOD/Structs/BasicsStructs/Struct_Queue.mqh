//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Advanced_Node.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
struct C_Advanced_C_Queue_Array
{
private:
          int   front, rear, SIZE ;
          t     Queue_Array[10];

public:
          C_Advanced_C_Queue_Array() { front = -1;    rear = -1; }
          C_Advanced_C_Queue_Array(int size) { front = -1;    rear = -1; SIZE = size;  ArrayResize(Queue_Array, SIZE);}
          bool isFull()
          {         if(front == 0 && rear == ArraySize(Queue_Array) - 1)   {         return true; }
                    return false;//
          }

          bool isEmpty()
          {         if(front == -1) return true;
                    else return false; //
          }

          void enQueue(t value)
          {         if(isFull()) { /*cout << endl << "Queue is full!!";*/ }
                    else         { if(front == -1) front = 0;  rear++;   Queue_Array[rear] = value;    /*cout << value << " "; */   }//
          }
          int deQueue()
          {         t value;
                    if(isEmpty())  { /*cout << "Queue is empty!!" << endl;*/ return(-1); }
                    else
                    {         value = Queue_Array[front];
                              if(front >= rear) { front = -1; rear = -1; }                      //only one element in queue
                              else              { front++; }
                              /*   cout << endl << "Deleted => " << value << " from Queue_Array";*/
                              return(value);//
                    } //
          }

          /* Function to display elements of Queue */
          void displayQueue()
          {         int i;
                    if(isEmpty()) { /*cout << endl << "Queue is Empty!!" << endl;*/ }
                    else
                    {         /* cout << endl << "Front = " << front; cout << endl << "Queue elements : ";*/
                              for(i = front; i <= rear; i++)
                              {         /*   cout << Queue_Array[i] << "\t"; cout << endl << "Rear = " << rear << endl;*/ //
                              }//
                    } //
          }
          //

          int        main()
          {         C_Advanced_C_Queue_Array myq;
                    myq.deQueue();      //deQueue
                    /*cout << "Queue created:" << endl; myq.enQueue(10);*/
                    myq.enQueue(20);
                    myq.enQueue(30);
                    myq.enQueue(40);
                    myq.enQueue(50); //enqueue 60 => queue is full
                    myq.enQueue(60);
                    myq.displayQueue();
                    //deQueue =>removes 10
                    myq.deQueue();
                    //queue after dequeue
                    myq.displayQueue();
                    return 0; //
          }
          //
          //
};
C_Advanced_C_Queue_Array<int>   C_Queue;
C_Advanced_C_Queue_Array<char>  C_Queue_2(10);
//+------------------------------------------------------------------+
