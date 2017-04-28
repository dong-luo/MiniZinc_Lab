enum person = {A, B, C, D, E, F};
array[person] of var 1..2: floor;
array[person] of var 1..3: roomNumber;

constraint floor[A] = 2;
constraint floor[B] = 1;
constraint roomNumber[A] == roomNumber[B];
constraint roomNumber[E] < roomNumber[F];
constraint floor[B] = floor[D];
constraint abs(roomNumber[B] - roomNumber[D]) = 1;
constraint floor[C] = floor[F];
constraint abs(roomNumber[C] - roomNumber[F]) = 1;
constraint forall(a,b in person where a!=b) 
		   (floor[a]!=floor[b] \/ roomNumber[a]!=roomNumber[b]);
solve satisfy;

output [show(p) ++ if fix(floor[p]) == 1 then ": L" else ": U" endif ++ show(roomNumber[p]) ++ "\n" |
			p in person];
