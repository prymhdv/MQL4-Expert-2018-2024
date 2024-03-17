//+------------------------------------------------------------------+
//|                                         		    Ñlass_NetMLP.mqh |
//+------------------------------------------------------------------+
#property copyright "Yurich"
//+------------------------------------------------------------------+
//| CLayerMLP class                                                  |
//+------------------------------------------------------------------+
class CLayerMLP
  {
public:
   double            weight[];       //
   double            delta[];        //
   double            step[];         //
   double            grad[];         // current epoch label
   int               sign[];         // previous epoch gradient label
   int               sizeinput;      // input vector size
   int               totalneurons;   // number of neurons in a layer
   double            out[];          // layer output
   int               totalinput;     // total number of neuron inputs
   //---
   CLayerMLP        *prev;           // link to the previous layer
   CLayerMLP        *next;           // link to the next layer
   //---
                     CLayerMLP(int c_nn,int c_nin,double c_d0,CLayerMLP *c_prev,CLayerMLP *c_next);
                    ~CLayerMLP();
   void              Calculate(double &c_inv[],int c_afunc);
  };
//+------------------------------------------------------------------+
//| CLayerMLP class constructor                                      |
//+------------------------------------------------------------------+
CLayerMLP::CLayerMLP(int c_nn,          // number of neurons in the current layer
                     int c_nin,         // input vector size
                     double c_d0,       // weight-step initial value
                     CLayerMLP *c_prev, // link to the previous layer
                     CLayerMLP *c_next) // link to the next layer
  {
   totalneurons=c_nn;
   sizeinput=c_nin;
   prev=c_prev;
   next=c_next;
   totalinput=c_nin+1;//+bias;
   int c=c_nn*totalinput;
   ArrayResize(weight,c);
   ArrayResize(step,c);
   ArrayInitialize(step,c_d0);
   ArrayResize(grad,c);
   ArrayResize(sign,c);
   ArrayInitialize(sign,1);
   ArrayResize(delta,c_nn);
   ArrayResize(out,c_nn);
//---
   for(int i=0; i<c; i++) weight[i]=0.5*((double)rand()/(double)SHORT_MAX-0.5);
  }
//+------------------------------------------------------------------+
//| CLayerMLP class destructor                                       |
//+------------------------------------------------------------------+
CLayerMLP::~CLayerMLP()
  {
   ArrayFree(weight);
   ArrayFree(step);
   ArrayFree(grad);
   ArrayFree(sign);
   ArrayFree(delta);
   ArrayFree(out);
  }
//+------------------------------------------------------------------+
//| Calculate                                                        |
//+------------------------------------------------------------------+
void CLayerMLP::Calculate(double &c_inv[],int c_afunc)
  {
   for(int i=0; i<totalneurons; i++)
     {
      double d=0;
      int n=i*totalinput;
      for(int j=0; j<sizeinput; j++) d+=weight[n+j]*c_inv[j];
      d+=weight[n+sizeinput];      //+bias
      if(c_afunc==0)
        {//sigmoid
         if(d>40) out[i]=1;
         else if(d<-40) out[i]=0;
         else out[i]=1.0/(1.0+exp(-d));
        }
      else
        {//th
         if(d>20) out[i]=1;
         else if(d<-20) out[i]=-1;
         else
           {
            d=exp(d+d);
            out[i]=(d-1.0)/(d+1.0);
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| CNetMLP class                                                    |
//+------------------------------------------------------------------+
class CNetMLP
  {
private:
   CLayerMLP        *firstlayer;     // pointer to the first layer
   CLayerMLP        *lastlayer;      // pointer to the last layer
   int               sizeinput;      // input vector size
   double            inputvector[];  // input vector copy
   int               numlayers;      // number of layers
   int               structure[];    // number of neurons by layers
   int               actfunc;        // active function type: 0-sigmoid, 1-th
   int               numberweight;   // total number of sizes
                                     // Rprop parameters
   double            d0;
   double            dmin;
   double            dmax;
   double            incfactor;
   double            decfactor;
public:
   double            mse;            // error
   int               epoch;          // number of accomplished learning cycles
   //---					
                     CNetMLP(int c_nl,int &c_sn[],int c_nin,int c_af);
                    ~CNetMLP();
   void              Calculate(double &c_in[],double &c_out[]);
   void              Learn(int c_npat,double &c_inp[],double &c_res[],int c_nep,double c_err);
   bool              Save(int c_handle);
   bool              Load(int c_handle);
protected:
   void              Calculate(double &c_in[],int c_pat=0);
   int               Sign(double x);
  };

//+------------------------------------------------------------------+
//| CNetMLP class constructor                                        |
//+------------------------------------------------------------------+
CNetMLP::CNetMLP(int c_nl,    // number of layers
                 int &c_sn[], // number of neurons at each layer
                 int c_nin,   // input vector size
                 int c_af)    // activation function type: 0-sigmoid, 1=tanh
  {
   mse=0;
   epoch=0;
   sizeinput=c_nin;
   ArrayResize(inputvector,c_nin);
   if(c_af==0) actfunc=0; else actfunc=1;
   numlayers=c_nl;
   ArrayResize(structure,c_nl);
   for(int i=0; i<c_nl; i++) structure[i]=c_sn[i];
   MathSrand((uint)TimeLocal());
//--- Rprop initial parameters
   d0=0.0125;
   dmin=0.0;
   dmax=50.0;
   incfactor=1.2;
   decfactor=0.5;
//--- creation of layers
   firstlayer=new CLayerMLP(structure[0],c_nin,d0,NULL,NULL);// first layer
   numberweight=ArraySize(firstlayer.weight);
   CLayerMLP *cl=firstlayer;
   for(int i=1; i<c_nl; i++)
     {
      cl.next=new CLayerMLP(structure[i],structure[i-1],d0,cl,NULL);
      cl=cl.next;
      numberweight+=ArraySize(cl.weight);
     }
   lastlayer=cl;
  }
//+------------------------------------------------------------------+
//| CNetMLP class destructor                                         |
//+------------------------------------------------------------------+
CNetMLP::~CNetMLP()
  {
   CLayerMLP *cl;
   ArrayFree(inputvector);
   ArrayFree(structure);
   cl=lastlayer;
   while(cl!=NULL)
     {
      cl=cl.prev;
      delete lastlayer;
      lastlayer=cl;
     }
  }
//+------------------------------------------------------------------+
//| Calculate                                                        |
//+------------------------------------------------------------------+
void CNetMLP::Calculate(double &c_in[],int c_pat=0)
  {
   CLayerMLP *cl;
   cl=firstlayer;
   if(cl==NULL) return;
   while(cl!=NULL)
     {
      if(cl.prev==NULL)
        {
         //--- first layer calculation
         if(c_pat==0) cl.Calculate(c_in,actfunc);
         else
           {
            int n=c_pat*sizeinput;
            for(int i=0; i<sizeinput; i++) inputvector[i]=c_in[n+i];
            cl.Calculate(inputvector,actfunc);
           }
        }
      else cl.Calculate(cl.prev.out,actfunc);// calculation of next layers
      cl=cl.next;
     }
  }
//+------------------------------------------------------------------+
//| Calculate                                                        |
//+------------------------------------------------------------------+
void CNetMLP::Calculate(double &c_in[],double &c_out[])
  {
  //--- calculating the whole network
   Calculate(c_in); 
   //--- rewrite the result to the output array
   for(int i=0; i<lastlayer.totalneurons; i++) c_out[i]=lastlayer.out[i];
  }
//+------------------------------------------------------------------+
//| Learn                                                            |
//+------------------------------------------------------------------+
void CNetMLP::Learn(int c_npat,       // number of teaching patterns
                    double &c_inp[],  // input data
                    double &c_res[],  // output data
                    int c_nep,        // number of learning epochs
                    double c_err)     // permissible error
  {
   CLayerMLP *cl,*tl;
   double pmse=DBL_MAX;
   int np,n,m;
   for(epoch=1; epoch<=c_nep; epoch++)
     {
      mse=0.0;
      for(int p=0; p<c_npat; p++)
        {
         Calculate(c_inp,p);
         cl=lastlayer;
         np=p*cl.totalneurons;
         for(int j=0; j<cl.totalneurons; j++)
           {
            cl.delta[j]=c_res[np+j]-cl.out[j];
            mse+=(cl.delta[j]*cl.delta[j]);
           }
         mse/=2;
         cl=lastlayer.prev;
         while(cl!=NULL)
           {
            tl=cl.next;
            for(int j=0; j<cl.totalneurons; j++)
              {
               double sum=0;
               for(int k=0; k<tl.totalneurons; k++)
                  sum+=tl.delta[k]*tl.weight[k*tl.totalinput+j];
               if(actfunc==1) cl.delta[j]=sum*(1.0-cl.out[j]*cl.out[j]);
               else         cl.delta[j]=sum*(cl.out[j]*(1.0-cl.out[j]));
              }
            cl=cl.prev;
           }
         cl=firstlayer;
         np=p*sizeinput;
         while(cl!=NULL)
           {
            tl=cl.prev;
            for(int j=0; j<cl.totalneurons; j++)
              {
               n=j*cl.totalinput;
               for(int k=0; k<cl.totalinput; k++)
                 {
                  m=n+k;
                  if(p==0) cl.grad[m]=0.0;
                  if(k==cl.sizeinput) cl.grad[m]-=cl.delta[j];
                  else if(tl!=NULL) cl.grad[m]-=cl.delta[j]*tl.out[k];
                  else  cl.grad[m]-=cl.delta[j]*c_inp[np+k];
                 }
              }
            cl=cl.next;
           }
        }
      if(mse<c_err) return;
      cl=firstlayer;
      while(cl!=NULL)
        {
         for(int j=0; j<cl.totalneurons; j++)
           {
            n=j*cl.totalinput;
            for(int k=0; k<cl.totalinput; k++)
              {
               m=n+k;
               switch(Sign(cl.grad[m]*cl.sign[m]))
                 {
                  case 1:   if(mse>pmse) cl.weight[m]-=cl.sign[m]*cl.step[m];
                  cl.step[m]=MathMax(cl.step[m]*decfactor,dmin);
                  cl.sign[m]=0;
                  break;
                  case -1: cl.step[m]=MathMin(cl.step[m]*incfactor,dmax);
                  default:   cl.sign[m]=-Sign(cl.grad[m]);
                  cl.weight[m]+=cl.sign[m]*cl.step[m];
                 }
              }
           }
         cl=cl.next;
        }
      pmse=mse;
     }
  }
//+------------------------------------------------------------------+
//| Sign                                                             |
//+------------------------------------------------------------------+
int CNetMLP::Sign(double x)
  {
   if(x<0.0) return(-1);
   else if(x>0.0) return(1);
   else return(0);
  }
//+------------------------------------------------------------------+
//| Save                                                             |
//+------------------------------------------------------------------+
bool CNetMLP::Save(int c_handle)
  {
   double wt[];
   CLayerMLP *cl=firstlayer;
   int r=0;
   ArrayResize(wt,numberweight);
   if(!FileWriteDouble(c_handle,mse)) return(false);
   FileWriteInteger(c_handle,numberweight);
   while(cl!=NULL)
     {
      for(int i=0; i<cl.totalneurons; i++)
        {
         int n=i*cl.totalinput;
         for(int j=0; j<cl.totalinput; j++) wt[r++]=cl.weight[n+j];
        }
      cl=cl.next;
     }
   FileWriteArray(c_handle,wt);
   ArrayFree(wt);
   return(true);
  }
//+------------------------------------------------------------------+
//| Load                                                             |
//+------------------------------------------------------------------+
bool CNetMLP::Load(int c_handle)
  {
   double wt[];
   CLayerMLP *cl=firstlayer;
   int r=0;
   mse=FileReadDouble(c_handle);
   int n=FileReadInteger(c_handle);
   if(n!=numberweight) return(false);
   ArrayResize(wt,numberweight);
   FileReadArray(c_handle,wt,0,numberweight);
   while(cl!=NULL)
     {
      for(int i=0; i<cl.totalneurons; i++)
        {
         n=i*cl.totalinput;
         for(int j=0; j<cl.totalinput; j++) cl.weight[n+j]=wt[r++];
        }
      cl=cl.next;
     }
   ArrayFree(wt);
   return(true);
  }
//+------------------------------------------------------------------+
