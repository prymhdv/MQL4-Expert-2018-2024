////+------------------------------------------------------------------+
////|                                                      ProjectName |
////|                                      Copyright 2018, CompanyName |
////|                                       http://www.companyname.net |
////+------------------------------------------------------------------+
//
//
//
//#include <iostream>
//#include <cmath>
//#include <ctime>
//#include <iomanip>
//using namespace std;
//
//double gausstoosmall = 0.000000001;  //global declaration of tolerance for pivot size
//double random(int k);
//
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//class vector
//{
//private:
//          int size;
//          double *vec;  // my vector is going to be a pointer to an array.
//          int range(int); //this is used by the indexing operator.  It makes the class more robust, by making it impossible to return a value outside the array of the objet in question.  same thing in the matrix class.
//
//public:
//          vector(int);  //vector constructor for empty vector of given length
//          vector(const double, int); //vector constructor for initialised vector
//          vector(const vector&);
//          ~vector();      //destructor
//
//          double A(int i, int j);
//          friend class matrix;
//
//          inline double& vector::operator[](int i) { return vec[range(i)];} // declare an indexing operator
//          inline int vector::getsize() { return size;}
//          vector& operator=(const vector &v);
//
//          void swap(int i, int j);
//          void vprint(vector& vc); // this is my home-made vector output function.
//          void permute(vector &v, vector &p);
//          vector index(int n); };
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//class matrix
//{
//private:
//          int numrows;
//          int numcols;
//          vector **mat;  //i.e. my matrices are pointers to vectors (so pointers to arrays of pointers to arrays.
//          int range(int);
//public:
//          matrix(int, int);   //matrix constructor for empty matrix of given size
//
//          matrix(const matrix&);
//          //~matrix();     // destructor
//          inline vector& matrix::operator [](int i) {return *mat[range(i)];}
//          inline int matrix::getrows() { return numrows;}
//          inline int matrix::getcols() { return numcols;}
//          matrix& operator=(const matrix &m);
//          double A(int i, int j); //used to initailise the vectors in parts a) and iv)
//          void A_Init(matrix &ma);
//
//          void mprint(matrix& ma);
//          void triangulate(matrix &a, vector &b, vector &x);
//          void swap(int i, int j);
//          void pivot(matrix &a, vector &b, vector &x, int h);
//          int pivotSign(matrix &m, vector &p, int i);
//          void backSubs(matrix &a, vector &b, vector &x);
//          void transpose(matrix &a, matrix &T);
//          void substitute(matrix &m, vector &v);
//          double decompose(matrix &m, vector &p);
//          matrix& identity(int n);
//          matrix inverse(matrix &m);
//          void gaussJordan(matrix &a, matrix &b);
//          void tri(matrix &a, vector &b, vector &x);
//          void inv(matrix &ma, matrix &inv); };
//
//
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int main()
//{
////part a)
//          int N; //user selects the value of N (i.e. size of square matrix A.
//          cout << "\n\nPart a)\n\nEnter the dimension you require for the NxN matrix [A].  N= ";
//          cin >> N;
//          matrix Amatrix(N, N); //create the empty vector [A]
//          Amatrix.A_Init(Amatrix);
//          cout << "\n\nMatrix [A] has been initialised as follows:\n\n";
//          Amatrix.mprint(Amatrix);  //this function prints the matrix to the monitor
//          vector Bvector(1, N); //create the vector B, using the second constructor to initialise to all ones.
//          //for (int v=0; v<Bvector.getsize(); ++v){   Bvector[v] = 1;}; //initialise B vector as vector of ones.
//          cout << "\n\nThe vector B is initialised as follows: \n\n";
//          Bvector.vprint(Bvector); //custom vector print function
//          vector X(N); //the purpose of this vector is to keep a track of which x_n value is which after row swapping has taken place.  It will be initialised to {1,2,3,4,etc...}
//          for(int i = 0; i < N; ++i) X[i] = i + 1;
//          cout << "\n\nThe vector of variables X is initialised as follows: \n\n";
//          X.vprint(X);
//          cout << "\n(Where the number indicates the subscript of the x variable within the X vector.)\n\n";
//          cout << "\n\nPress enter to perform Gaussian elimination on this system of linear equations.\n\n";
//          cin.get(); cin.get();
//          cout  << "After diagonalisation, Matrix [A] is transformed as follows:\n\n";
//          Amatrix.triangulate(Amatrix, Bvector, X);
//          Amatrix.backSubs(Amatrix, Bvector, X);
////Part i)
//          cout << "\n\nPart i)\n\nNow we set N = 3.  The matrix [A] is now defined and initialised as:\n\n";
//          cout << "set N \n";
//          cin >> N;
//          //N = 3;
//          matrix E(N, N);
//          E.A_Init(E);
//          E.mprint(E);
//          matrix Einv(N, N); //here we create an empty matrix that will become the inverse.
//          cout << "\n\nTo calculate to Inverse of matrix [A], press enter...\n";
//          cin.get();
//          E.inv(E, Einv);
//          cout << "Press enter to continue...";
////part iv)
//          cin.get();
//          cout << "\n\nPart iv)\n\nFor the special case where N = 10 , the NxN matrix C is initialised to: [C] =\n\n";
//          matrix C(10, 10);
//          C.A_Init(C); //initialise the 10x10 matrix.
//          C.mprint(C);
//          matrix Cinv(10, 10);  //create a new matrix object (empty).  This will become inverse of Cmatrix.
//          cout << "\n\nTo calculate to Inverse of matrix [C], press enter...\n";
//          cin.get();
//          C.inv(C, Cinv); //
//          cout << "Press enter to continue...";
//          cin.get();
////part ii)
//          cout << "\n\nPart ii)\n\n";
//          //for (int i=0; i<100; i++){
//          //cout << random() << endl;
//          //random(25);
//          //};
//          return 0; }
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//vector::vector(int n)
//{         size = n;
//          vec = new double [size];
//          if (!vec)
//                    cout << "ERROR\tMemory allocation failed in: vector::vector(int).\n\n"; //this makes the program more robust.
//          for (int i = 0; i < size; i++) vec[i] = 0; }
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//vector::vector(const double d, int n)
//{         size = n;
//          vec = new double [size];
//          if (!vec)
//                    cout << "ERROR\tMemory allocation failed in: vector::vector(double*, int).";
//          for (int i = 0; i < size; i++) vec[i] = d; }
//vector::~vector() {delete vec;}
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int vector::range(int i)
//{         if(i < 0 || i >= size) return -1; else return i;}
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//double vector::A(int i, int j)
//{         return (i * j) / (i + j - 1.0); }
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//void vector::vprint(vector& vc)
//{         cout << "\n\n";
//          for (int s = 0; s < vc.getsize(); ++s)
//          {         cout << "[" << vc[s] << "]\n";}; }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//void vector::swap(int i, int j)
//{         double temp = vec[range(i)];
//          vec[i] = vec[range(j)];
//          vec[j] = temp; }
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//vector& vector::operator=(const vector &v)
//{         if (size != v.size)
//          {         cout << "ERROR: Size mismatch."; return *this;}
//          for(int i = 0; i < size; ++i) vec[i] = v.vec[i];
//          return *this; }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//void permute(vector &v, vector &p)
//{         int n = v.getsize();
//          vector u(n);
//          for (int i = 0; i < n; ++i)
//                    u[i] = v[int(p[i])];
//          v = u; }
///*
//vector vector::index(int n){
//    vector v(n);
//    for (int i =0; i< n; ++i)
//        v[i] =double(i);
//    return v;
//}
//*/
//
//
//
//
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//matrix::matrix(int nrows, int ncols)        //constructor for NxM matrix
//{         numrows = nrows; numcols = ncols;
//          mat = new vector* [numrows];
//          if (!mat) cout << "ERROR:\tRow allocation failed in matrix::matrix(int, int).\n";
//          for (int i = 0; i < numrows; ++i)
//          {         mat[i] = new vector(numcols);
//                    if (!mat[i]) cout << "ERROR:\tColumn allocation failed in matrix::matrix(int, int).\n"; }; }
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int matrix::range(int i)
//{         if (i < 0 || i >= numrows) return -1; else return i;}
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//double matrix::A(int i, int j)
//{         return (i * j) / (i + j - 1.0); }
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//void matrix::mprint(matrix& ma)
//{         for (int r = 0; r < ma.getrows(); ++r)
//          {         cout << "["; for (int c = 0; c < ma.getcols(); ++c)
//                    {         cout << ma[r][c] << "\t";}
//                    cout << "]\n"; } }
//
//
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//void matrix::triangulate(matrix &a, vector &b, vector &x)  //this is the centrepiece of my class, it does gauss elimination, and prepares the matrix for backsubstitution by getting ones on the diagonals.  it also deals with vector B and the vector X of x_i variables.  Devised by me entirely.
//{         for(int j = 0; j < a.getcols() - 1; ++j)
//          {         for(int p = j + 1; p < a.getrows(); ++p)
//                    {         a.pivot(a, b, x, j);
//                              double l = (-1.0 * a[p][j]) / (a[j][j]);
//                              b[p]  += l * b[j];                      // this deals with the b vector
//                              for(int i = j; i < a.getcols(); i++)
//                              {         a[p][i] += l * a[j][i]; } } }
//          for(int k = 0; k < a.getrows(); ++k) // here we get ones on the diagonal.  I am assuming that there will be no zeros on the diagonal, which is reasonable since this can not happen in this question.
//          {         double y = a[k][k];
//                    for(int m = 0; m < a.getcols(); ++m)
//                    {         a[k][m] = (a[k][m]) / y;
//                              b[k] = (b[k]) / y;
//                              if(k > m)
//                              {         a[k][m] = fabs(a[k][m]); //this is purely cosmetic, it gets rid of minus signs on the lower diagonal entries, which are of course now zero.  If you wish to check this, just comment this line out, the program still works in exactly the same way.
//                                        if((a[k][m]) != 0 && (a[k][m]) < 0.000001) (a[k][m]) = 0; }; // likewise, this is cosmetic, it just gets rid or tiny values which remain on the lower diagonal due to rounding errors, we're talking 10exp-16 small.  You can get rid of it if you like.
//                    } } }
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//void matrix::swap(int i, int j)
//{         vector *temp = mat[range(i)];
//          mat[i] = mat[range(j)];
//          mat[j] = temp; }
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//void matrix::pivot(matrix &a, vector &b, vector &x, int h)
//{         int n = a.getrows();
//          int g = h;
//          double t = 0;
//          for (int k = h; k < n; ++k)
//          {         double elm = fabs(a[k][h]);  //finds the largest value in the column, the "pivot".
//                    if(elm > t) {t = elm; g = k;} }
//          if (g > h)
//          {         a.swap(h, g);
//                    b.swap(h, g);
//                    x.swap(h, g); //this is to swap the entries of the X vector, so that we can keep track of the solution properly.  This may not be useful in this example because x2 to xN are all zero, but in general it would be useful.
//          } }
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//void matrix::backSubs(matrix &a, vector &b, vector &x)
//{         cout << "The solution to the system of linear equations [A]*X = B, is as follows:\n\n";
//          cout << "After Gaussian Elimination with Full Pivoting, the matrix [A] = \n\n";
//          a.mprint(a);
//          cout << "\n\n, the vector B = \n";
//          b.vprint(b);
//          cout << "\n\n, and the variable vector X = \n";
//          x.vprint(x); cout << "(Where the number indicates the subscript of the x variable.)\n\nTherefore:\n\n";
//          for (int i = 0; i < a.getcols(); ++i)
//          {         cout << "x_" << x[i] << " = " << (b[i]) / a[i][i] << endl; };
//          cout << "\n(The order in which the x_i variables appear reflects their respective final order in the X vector.)\n\n"; }
///*void matrix::transpose(matrix &a, matrix &T){ //turns already initialised matrix T into the inverse of a.  couldn't call Matrix constructor within the function!  probably a bug in Visual Studio.
//    int p = T.getcols();
//    //matrix mt(p, p);
//    for( int i = 0; i< p; ++i)
//        {   for (int j = 0; j< p; ++j)
//            T[i][j] = a[j][i];
//        }
//}*/
///*void matrix::substitute(matrix &m, vector &v){
//    int n = m.getcols();
//    for ( int i = 0; i < n; ++i)
//    {   double t = v[i];
//        for (int j = 0; j < i; ++j)
//            t -= m[i][i] * v[j];
//            double diag = m[i][i];
//            if(fabs(diag) < gausstoosmall) cout << "ERROR: Diag nr zero.";
//            t /= diag;
//            v[i] = t;
//    }
//    for (int i= n-1; i >= 0; i--)
//        {   double t = v[i];
//            for (int j = i+1; j<n; j++)
//                t -= m[i][j] * v[j];
//            v[i] = t;
//        }
//
//}*/
///*ouble matrix::decompose(matrix &m, vector &p){
//    int n = m.getcols();
//    if(p.getsize() != n)
//        {cout << "ERROR:  Vector and Matrix of incompatible size."; return -1;}
//    double det =1;
//    for (int i = 0; i <n; ++i)
//    {   int sgn = pivotSign(m, p, i);
//        double piv = m[i][i];
//        det *= sgn*piv;
//        for (int j = i+1; j < n; ++j) m[i][j] /= piv;
//        for (int j = i+1; j < n; ++j)
//            if (double mult = m[j][i] != 0)
//                for (int k = i +1; k < n; ++k)
//                    m[j][k] -= mult*m[i][k];
//
//    }
//return det;
//}*/
///*int matrix::pivotSign(matrix &m, vector &p, int i){
//    int n = m.getcols(), j = i, sgn =1;
//    double t = 0;
//    for (int k = i; k < n; ++k)
//    {   double mki = fabs(m[k][i]);
//        if (mki > t) { t = mki; j = k;}
//    }
//    if (j > i)
//    {       m.swap(i, j);
//            p.swap(i, j);
//            sgn = -sgn;
//    }
//return sgn;
//}*/
//
///*matrix& matrix::identity(int n){
//   matrix m(n,n);
//   for (int i = 0; i < n; ++i)
//       {   m[i][i] = 1;
//       }
//   return m;
//}
//*/
//
///*matrix& matrix::operator=(const matrix &m){
//    if(m.numrows != numrows|| m.numcols != numcols) cout << "ERROR:  Different sizes.";
//    for (int i =0; i < numrows; ++i)
//        *mat[i] = *m.mat[i];
//    return *this;
//}*/
//void matrix::A_Init(matrix &ma)
//{         for (int r = 0; r < ma.getrows() ; ++r) //this loop initialises the matrix [A] ("Amatrix".) using the memeber function A.
//          {         for (int c = 0; c < ma.getcols() ; ++c)
//                              ma[r][c] = ma.A(r + 1, c + 1); }; }
//
//
//
///*
//matrix matrix::inverse(matrix &m){
//    int n = m.getrows();
//    vector p(n);
//    //p = p.index(n);
//    matrix t(n,n);
//        for(int i = 0; i <n; ++i)
//        {   t[i][i] = 1;
//        }
//    double det = decompose(m,p);
//    if (fabs(det) < gausstoosmall)
//        cout << "ERROR:  Determinant too small.";
//    for (int i = 0; i < n; ++i)
//    {   permute(t[i], p );
//        substitute(m, t[i]);
//
//    }
//    matrix inv(n,n);
//    t.transpose(t,inv);
//    return inv;
//}
//*/
//void matrix::gaussJordan(matrix &a, matrix &b)
//{         matrix GJ(a.getrows(), (a.getcols() * 2));
//          for(int r = 0; r < a.getrows(); ++r)
//          {         for(int c = 0; c < a.getcols(); ++c)
//                    {         GJ[r][c] = a[r][c]; }
//                    GJ[r][r + a.getcols()] = 1; }
//          vector u(GJ.getrows()); //dummy vector for pivot
//          cout << "\nThe Augmented formed by placing an NxN identity matrix to the right of our matrix is:\n";
//          GJ.mprint(GJ);  cout << "\n\n";
//          for(int j = 0; j < GJ.getcols() - 1; ++j) //triangulate leftside of composite matrix. this gets zero in every row column, below diagonal.
//          {         for(int r = j + 1; r < GJ.getrows(); ++r) //this for each individual column.
//                    {         GJ.pivot(GJ, u, u, j);
//                              double l = (-1.0 * GJ[r][j]) / (GJ[j][j]);
//                              for(int c = j; c < GJ.getcols(); c++) //this to multiply each element in the row.
//                              {         GJ[r][c] += l * GJ[j][c];
//                                        //cout << "\n\n\nj r c: l.  j is  " << j << "\tr is "<< r << "\tc is "<< c<< "\t l is " << l << "\n\n";
//                                        //GJ.mprint(GJ); //debugging script
//                              } } } //GJ.mprint(GJ);
//          for(int r = 0; r < GJ.getrows(); ++r) // here we get ones on the leading diagonal.  I am assuming that there will be no zeros on the diagonal, which is reasonable since this can not happen in this question.
//          {         double y = GJ[r][r];
//                    for(int c = 0; c < GJ.getcols(); ++c)
//                    {         GJ[r][c] = (GJ[r][c]) / y;
//                              //cout << "\n\n\n r c: y"   << "\tr is "<< r << "\tc is "<< c<< "\t y is " << y << "\n\n";
//                              //GJ.mprint(GJ);
//                              //if(k>m) {
//                              //a[k][m] = fabs(a[k][m]); //this is purely cosmetic, it gets rid of minus signs on the lower diagonal entries, which are of course now zero.  If you wish to check this, just comment this line out, the program still works in exactly the same way.
//                              //if((a[k][m])!=0 && (a[k][m])< 0.000001) (a[k][m])=0; };  // likewise, this is cosmetic, it just gets rid or tiny values which remain on the lower diagonal due to rounding errors, we're talking 10exp-16 small.  You can get rid of it if you like.
//                    } }
//          //GJ.mprint(GJ);
//          //int i = ((GJ.getcols())/2-1);
//          //int j = GJ.getrows()-2;
////cout << "\n\ni(k) & j(r)"<< i << j;
//          //cout << endl << "rows= " << GJ.getrows() << "  cols =  " << GJ.getcols() << endl;
//          for (int k = ((GJ.getcols()) / 2 - 1) ; k > 0 ; --k) //the outer column loop, this puts zeros in successive upper diag of left side of augmented matrix GJ
//          {         for(int r = GJ.getrows() - 2 + k - ((GJ.getcols()) / 2 - 1) ; r > -1 ; --r)
//                    {         double y = (GJ[r][k]);
//                              for(int c = 0 ; c < GJ.getcols() ; ++c)
//                              {         //cout << "k r c GJ[r][k]   " << k << "\t"<< r << "\t"<< c<< "\t" << GJ[r][k] << "\n\n\n";
//                                        GJ[r][c] = (GJ[r][c]) - y * (GJ[k][c]);
//                                        //GJ.mprint(GJ);
//                                        //cout << "\n\n";
//                              } } }
//          for(int r = 0; r < GJ.getrows(); r++)  //this is a clean-up routine, purely aesthetic, after the algorithmhas run, to remove near zero values form the matrix.  this makes it more legible.  small values arise as rounding errors.
//          {         for(int c = 0 ; c < GJ.getcols(); c++)
//                    {         if(GJ[r][c] < 0.000001) GJ[r][c] = 0; } }
//          cout << "After Gauss-Jordan elimination, the Reduced Row-Echelon Form of the augmented matrix is:\n\n";
//          GJ.mprint(GJ);
//          for(int r = 0; r < a.getrows(); r++)  //here we write the inverse to the second argument matrix.
//          {         for(int c = 0 ; c < a.getcols(); c++)
//                    {         b[r][c] = GJ[r][c + a.getcols()]; } } }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//void matrix::inv(matrix &ma, matrix &inv)
//{         if (ma.getcols() != inv.getcols() || ma.getrows() != inv.getrows()) //this 'if' prevents size mismatch.  This makes the program more robust.
//                    cout << "***ERROR***: Size mismatch.  Please supply an inverse with same dimensions as matrix to be inverted.";
//          gaussJordan(ma, inv);
//          cout << "Press Enter to proceed..."; cin.get();
//          cout << "\n\nTherefore the inverse of the supplied matrix is: \n\n";
//          inv.mprint(inv);  cout << endl; }
//
//
//
//
//
///*
//void matrix::tri(matrix &a, vector &b, vector &x){  //Gaussian elimination to solve [A]x = B
//
//
//for(int j = 0; j < a.getcols()-1; ++j)
//{
//    for(int r = j + 1; r < a.getrows(); ++r) //this for each individual column.
//    {   a.pivot(a, b, x, j);
//        double l = (-1.0*a[r][j])/(a[j][j]);
//        b[r]  += l*b[j];
//            for(int c=j; c< a.getcols(); c++)  //this to multiply each element in the row.
//            {
//                a[r][c] += l * a[j][c];
//
//                //cout << "\n\n\nj r c: l.  j is  " << j << "\tr is "<< r << "\tc is "<< c<< "\t l is " << l << "\n\n";
//                //GJ.mprint(GJ); //debugging script
//            }
//    }
//}   //GJ.mprint(GJ);
//    for(int r = 0; r < a.getrows(); ++r) // here we get ones on the leading diagonal.  I am assuming that there will be no zeros on the diagonal, which is reasonable since this can not happen in this question.
//    {   double y = a[r][r];
//        b[r] = (b[r])/y;
//        for(int c = 0; c < a.getcols(); ++c)
//        {
//            a[r][c] = (a[r][c])/y;
//
//            //cout << "\n\n\n r c: y"   << "\tr is "<< r << "\tc is "<< c<< "\t y is " << y << "\n\n";
//            //GJ.mprint(GJ);
//
//            //if(k>m) {
//                        //a[k][m] = fabs(a[k][m]); //this is purely cosmetic, it gets rid of minus signs on the lower diagonal entries, which are of course now zero.  If you wish to check this, just comment this line out, the program still works in exactly the same way.
//                        //if((a[k][m])!=0 && (a[k][m])< 0.000001) (a[k][m])=0; };  // likewise, this is cosmetic, it just gets rid or tiny values which remain on the lower diagonal due to rounding errors, we're talking 10exp-16 small.  You can get rid of it if you like.
//        }
//    }
//    //GJ.mprint(GJ);
//    //int i = ((GJ.getcols())/2-1);
//    //int j = GJ.getrows()-2;
////cout << "\n\ni(k) & j(r)"<< i << j;
//
//    //cout << endl << "rows= " << GJ.getrows() << "  cols =  " << GJ.getcols() << endl;
//
//    for (int k= (a.getcols()-1) ; k > 0 ; --k) //the outer column loop, this puts zeros in successive upper diag of left side of augmented matrix GJ
//    {
//        for(int r = a.getrows()-2 + k -(a.getcols()-1) ; r > -1 ; --r)
//        {double y = (a[r][k]);
//        b[r] -= y*b[r];
//            for(int c = 0 ; c < a.getcols() ; ++c)
//
//            {   cout << "k r c GJ[r][k]   " << k << "\t"<< r << "\t"<< c<< "\t" << a[r][k] << "\n\n\n";
//                a[r][c] = (a[r][c])-y*(a[k][c]);
//                a.mprint(a);
//                b.vprint(b);
//                cout << "\n\n";
//            }
//        }
//    }
//    for(int r = 0; r < a.getrows(); r++)  //this is a clean-up routine, purely aesthetic, after the algorithmhas run, to remove near zero values form the matrix.  this makes it more legible.  small values arise as rounding errors.
//    {   for(int c = 0 ; c < a.getcols(); c++)
//        {   if(a[r][c]<0.000001) a[r][c] = 0;
//        }
//    }
//
//
//
//    cout << endl;
//    a.mprint(a);
//    cout << endl;
//}*/
//double random(int k)
//{         /*long seed = long(time(NULL));
//          srand(seed);
//
//          return rand()/(RAND_MAX+1.0);
//              */
//          return 1; }
////+------------------------------------------------------------------+
