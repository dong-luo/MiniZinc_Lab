var int: able;	var int: baker;	var int:charlie;	var int:dog;

constraint able > 0;
constraint baker < 7;
constraint charlie > 3;
constraint dog < able + baker;
constraint dog * 2 > able + baker + charlie;
constraint baker - charlie > able;
solve satisfy;

output ["able=", show(able), "\t baker=", show(baker), 
        "\t charlie=", show(charlie), "\n", "dog=", show(dog), "\n"];
