$Title  A Transportation Problem (TRNSPORT,SEQ=1)
  Sets
       i   supply   /1*2/
       j   demand   /1*2/ ;

 Parameters a(i)
/
1 100
2 200
/;
 Parameters b(j)
/
1 150
2 150
/;


Parameter c(i,j)
/
1.1 2
1.2 3
2.1 3
2.2 2
/

  Variables
       x(i,j)  the passengers traveling from city i to airport j
       z       the total travel cost;
Positive Variable x ;

  Equations
       cost
       supply(i)
       demand(j);

  cost ..z =e= sum((i,j), c(i,j)*x(i,j));
  supply(i).. sum(j, x(i,j)) =l= a(i) ;
  demand(j).. sum(i, x(i,j)) =g= b(j);

  Model transport /all/ ;

  Solve transport using lp minimizing z ;

  Display x.l, z.l;