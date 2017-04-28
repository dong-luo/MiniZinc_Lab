include "alldifferent.mzn";
int: N;
int: v= (pow(N,3)+N) div 2;
set of int: row = 1..N;
set of int: col = 1..N;
array[row,col] of var 1..pow(N,2): matrix;

constraint forall(r in row)
		   (sum(c in col)(matrix[r,c])=v);
constraint forall(c in col)
		   (sum(r in row)(matrix[r,c])=v);
constraint alldifferent([matrix[i,j]|i in row, j in col]);
constraint sum(r in row)(matrix[r,r])=v;
constraint sum(r in row)(matrix[r,N+1-r])=v;
solve satisfy;

