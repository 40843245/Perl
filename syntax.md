# Perl
## syntax
### variable 
> [!NOTE]
> A variable is defined iff its it is first assigned.

> [!NOTE]
> To access a variable, it must start with `$` sign and followed by a varible name. Like variable in PHP.
>
> Such as
>
> `$x=10`

A variable must start with identifier.

An identifier must 
+ consist of uppercase alphabet, lowercase alphabet, digit, and underscore.
+ start with uppercase alphabet and lowercase alphabet.
+ NOT be a keyword.

> [!NOTE]
> A variable is case-sensitive. Such as `Var1` and `var1` are NOT same variables.

+ Example 1:

```
$x=10;
```

It will define a variable whose name is `x` and assign the value `10` into the variable `x`.

#### declaring variables
> [!NOTE]
> In Perl, it will make a mistake that access a variable without (or before) defining it.

> [!CAUTION]
> By default, Perl does NOT use strict mode. In non-strict mode, some errors will be thrown instead ignoring.
>
> Based on this, to ensure all errors that will be thrown, use `strict` mode at begin through the statement `use strict;`.
>
> See [strict mode](#strict-mode)

##### declaring global variables
> [!NOTE]
> By default, it declares a global variable. To declare a local variable, use `my` keyword before the variable.

+ Example 1: in non-strict mode.

```
$x=10;
$y=20;
print("The value of x:");
print("\n");
print($x1);
print("The value of y:");
print("\n");
print($y);
```

will output

```
The value of x:
The value of y:
20
```

***NOT***

throwing an error.

+ Example 2: in strict mode.

```
use strict;
my $x=10;
$y=20;
print("The value of x:");
print("\n");
print($x1);
print("The value of y:");
print("\n");
print($y);
```

will throw a runtime error in ideone[^1]

![image](https://github.com/user-attachments/assets/d9250a33-b053-4c43-8be4-ef8ee514a466)

+ Example 3:

```
use strict;
$x=10;
$y=20;
print("The value of x:");
print("\n");
print($x1);
print("The value of y:");
print("\n");
print($y);
```

will throw a runtime error in ideone[^1]

![image](https://github.com/user-attachments/assets/d36501d5-2620-4f95-a109-a3c77db213f3)

See [block section](#block).

#### declaring local variables
To declare a local variable, use keyword `my` before the variable.

See [block section](#block).

### assignment 

+ Example 1:
  
```
$x=10;
```

It will define a variable whose name is `x` and assign the value `10` into the variable `x`.

### block 
A block is made up of statements wrapped in curly braces `{}`.

> [!NOTE]
> Any variable declared inside a block has its own scope.

+ Example 1:

```
{
     $a = 1;
     $a = $a + 1;
     print($a);
}
```

will output 

```
2
```

> [!CAUTION]
> Assignment into a variable in a block will override the value of a variable in outer scope if they have same variable name. (See Example 2.)

+ Example 2:

```
$a = "Hello";
{
     $a = 1; # override the value of `$a` on outer scope since the variable `$a` is declared globally.
     $a = $a + 1;
     print($a);
     print("\n");
}

print($a); # someone may think it will print "Hello". However, it prints 2.
print("\n");
```

will output

```
2
2
```

+ Example 3:

```
$a = "Hello";
{
     my $a = 1; # NOT override the value of `$a` on outer scope since the variable `$a` is declared locally with `my` keyword.
     $a = $a + 1;
     print($a);
     print("\n");
}

print($a); # someone may think it will print "Hello". However, it prints 2.
print("\n");
```

will output

```
2
Hello
```


### expression
> [!NOTE]
> In Perl, an expression refers anything that returns a value.
>
> Such as
>
> `$x+10`

> [!NOTE]
> One expression can consist of one or many expressions.
> 

+ Example 1:

```
$x=10;
$y=$x+5;
```

In the statement `$y=$x+5;`,`$x+5` will return `$x` plus `5`. Thus, `$x+5` is an expression.

### statement

> [!NOTE]
> In Perl, a statement refers the smallest unit that will be executed.
>
> A statement can consist of one expression or one expression with assignment operator. (See [`Perl`->`syntax`->`assginment`](#assignment) section).

> [!IMPORTANT]
> A statement must end with a semicolon `;`. Like it in PHP.

+ Example 1:

```
$x=10;
```

It is a statement. 

+ Example 2:

```
$x=10;
$y=$x+5;
```

`$y=$x+5;` is also a statement. 

First, it access the value of variable whose name is `x`. Then it plus `5`. Finally, it assignment the value into the variable whose name is `y`.

### print 
#### print() function
Use `print()` function to print the value of an expression.

> [!CAUTION]
> The `print()` function does NOT print a new line after print the value.
>
> To print a new line after print the value, please first concatenate the value and new line (`"\n"`) then use `print()` function. Or simply call `print("\n")` after using `print()` function.

+ Example 1:

```
print("Hello World");
print("This is Perl");
```

will output

```
Hello WorldThis is Perl
```

***NOT***

```
Hello World
This is Perl
```

+ Example 2:

```
print("Hello World");
print("\n");
print("This is Perl");
print("\n");
```

will output

```
Hello World
This is Perl
```

+ Example 3:

```
print("Hello World");
print("\n");
print("This is Perl");
print("\n");
```

will output

```
Hello World
This is Perl
```

> [!NOTE]
> Other style of `print` function is NOT to wrapp the value for print with `()`.
>
> Such as
>
> ```
> print("Hello World");
> ```
>
> is equivalent to
>
> ```
> print "Hello World" ;
> ```

> [!CAUTION]
> There are **NO** built-in function `println()`.

Wrong Example:

+ Wrong Example 1:

![image](https://github.com/user-attachments/assets/430d419a-80ec-46f9-9401-7048a4b46a88)

+ Wrong Example 2:

![image](https://github.com/user-attachments/assets/fbb3001b-5bef-4269-b872-54fa2981c282)

### comment
#### single line comment
A single line comment must start with `#`.

+ Example 1:

```
# This is a single line comment
```

will output nothing in Perl.

+ Example 2:

```
print "Hello World\n"; # is equivalent to print("Hello World\n");
```

will output

```
Hello World
```

#### multi-line comment
A multi-line comment must start with a line `=begin comment` and ends with a line `=cut`

+ Example 1:

```
print "Hello World\n";

=begin comment
This is all part of multiline comment.
You can use as many lines as you like
These comments will be ignored by the 
compiler until the next =cut is encountered.
=cut

print "This is Perl\n";
```

will output

```
Hello World
This is Perl
```

### data type
#### string
A string can be wrapped with double quote `""` or single quote `''`.

However, they are NOT equivalent. (See Example 1.)

+ Example 1:

```
$a = "Hello";
$b = 'Hello';
$c = 2;
print($a);
print("\n");
print($b);
print('\n');
print(c);
print("\n");
```

will output

```
Hello
Hello\n
```

##### concatenation of two strings
A dot `.` indicates string concatenation between two strings. Like it in PHP.

+ Example 1:

```
$color = "red";
print "Your favorite color is " .$color ."\n";
```

will output

```
Your favorite color is red
```

##### repetive of a string

+ Example 1:

```
print "a message " x 4, "\n";
```

will output

```
a message a message a message a message 
```

##### embeding a variable in string
Like it in PHP. One can embed a variable in string directly through typing `$` symbol followed by the variable name such as `"$amount"`.

+ Example 1:

```
use strict;
use warnings;

my $amount = 20;
my $s = "The amount is $amount\n";
print($s);
```

will output

```
The amount is 20
```

##### get length of string

+ Example 1:

```
my $s = "This is a string\n";
print(length($s),"\n"); #17
```

will output

```
17
```

##### get uppercase of string

+ Example 1:

```
my $s = "Change cases of a string\n";
print("To upper case:\n");
print(uc($s),"\n");
```

will output

```
To upper case:
CHANGE CASES OF A STRING
```

+ Example 2:

```
my $s = "Change cases of a string\n";
print("To lower case:\n");
print(lc($s),"\n");
```

will output

```
To lower case:
change cases of a string
```

##### search for a substring inside a string

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my $s = "Learning Perl is easy\n";
my $sub = "Perl";
my $p = index($s,$sub); # rindex($s,$sub);
print(qq\The substring "$sub" found at position "$p" in string "$s"\,"\n");
```

will output

```
The substring "Perl" found at position "9" in string "Learning Perl is easy
"
```

##### change substring in string

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;
# extract substring
my $s = "Green is my favorite color";
my $color = substr($s, 0, 5);# Green
my $end = substr($s, -5); # color

print($end,":",$color,"\n");

# replace substring
substr($s, 0, 5, "Red"); #Red is my favorite color
print($s,"\n");
```

will output

```
color:Green
Red is my favorite color
```

#### numeric
##### addition
See [division](#division)

##### subtraction
See [division](#division)

##### multiplication
See [division](#division)

##### division

+ Example 1:
  
```
use warnings;
use strict;

print 10 + 20, "\n"; # 30
print 20 - 10, "\n"; # 10

print 10 * 20, "\n"; # 200
print 20 / 10, "\n"; # 2
```

will output

```
30
10
200
2
```

##### exponent

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

print 2**3, "\n"; # = 2 * 2 * 2 = 8.

print 3**4, "\n"; # = 3 * 3 * 3 * 3 = 81.
```

will output

```
8
81
```

##### modulos

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

print 4 % 2, "\n"; # 0 even
print 5 % 2, "\n"; # 1 odd
```

will output

```
0
1
```

##### bitwise operator

+ Example 1:
  
```
#!/usr/bin/perl
use warnings;
use strict;

my $a = 0b0101; # 5
my $b = 0b0011; # 3

my $c = $a & $b; # 0001 or 1
print $c, "\n";

$c = $a | $b; # 0111 or 7
print $c, "\n";

$c = $a ^ $b; # 0110 or 6
print $c, "\n";

$c = ~$a; # 11111111111111111111111111111010 (64bits computer) or 4294967290
print $c, "\n";

$c = $a >> 1; # 0101 shift right 1 bit, 010 or 2
print $c, "\n";

$c = $a << 1; # 0101 shift left 1 bit, 1010 or 10
print $c, "\n";
```

will output

```
 source code   close shortcuts fullscreen 
  
 input
 Output
clear the output syntax highlight
Success #stdin #stdout 0.01s 5372KB
1
7
6
18446744073709551610
2
10
```

##### comparison

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my $a = 10;
my $b = 20;

print $a <=> $b, "\n";

$b = 10;
print $a <=> $b, "\n";

$b = 5;
print $a <=> $b, "\n";
```

will output

```
-1
0
1
```

#### list
##### constructor

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

print(()); # display nothing
print("\n");
print(10,20,30); # display 102030
print("\n");
print("this", "is", "a","list"); # display: thisisalist
print("\n");
```

will output

```

102030
thisisalist
```

##### qw

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

print('red','green','blue'); # redgreenblue
print("\n");

print(qw(red green blue)); # redgreenblue
print("\n");
```

will output

```
redgreenblue
redgreenblue
```

##### auto flatten the list

If you put a list, called an internal list, inside another list, Perl automatically flattens the internal list. The following lists are the same:

```
(2,3,4,(5,6))
(2,3,4,5,6)
((2,3,4),5,6)
```

+ Example 1:

```
=begin

They are equivalent:

(2,3,4,(5,6))
(2,3,4,5,6)
((2,3,4),5,6)

=cut

@list1 = (2,3,4,(5,6));
@list2 = (2,3,4,5,6);
@list3 = ((2,3,4),5,6);

print("list1 contains:\n");
foreach(@list1)
{
	print($_."\t");
}
print("\n");

print("list2 contains:\n");
foreach(@list2)
{
	print($_."\t");
}
print("\n");

print("list3 contains:\n");
foreach(@list3)
{
	print($_."\t");
}
print("\n");
```

will output

```
list1 contains:
2       3       4       5       6
list2 contains:
2       3       4       5       6
list3 contains:
2       3       4       5       6
```

in VSC with Perl plugin.

##### access elem from the list

> [!NOTE]
> To access elem from the list with index, please wrap the index with `[]`.

> [!NOTE]
> The index of list starts from 0

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

print(
     (1,2,3)[0] # 1 first element
);
print "\n"; # new line

print(
     (1,2,3)[2] # 3 third element
);
print "\n"; # new line
```

will output

```
1
3
```

#####  list slice
To get multiple elements of a list at a time (i.e. list slice), you can put a list inside square brackets.

+ Example 1:
```
@array = (1,2,3,4,5)[0,2,3];
my $str = sprintf '[%s]' x @array, @array;
print($str);
print("\n");
```

wiil output

```
[1][3][4]
```

#### array
##### get number of elements in array
In Perl, to safely get number of elements in array, one can use `scalar` function.

+ Example 1:
  
```
my @days = qw(Mon Tue Wed Thu Fri Sat Sun);
my $count = scalar @days;
print($count, "\n");
```

will output

```
7
```

##### get the highest index in array
To safely get the highest index in array, one can use `$#`.

+ Example 1:
  
```
my @days = qw(Mon Tue Wed Thu Fri Sat Sun);
my $last = $#days;
print($last, "\n"); #" 6
```

will output

```
6
```

##### modify the element in array

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my @days = qw(Mon Tue Wed Thu Fri Sat Sun);

print("@days","\n");

$days[0] = 'Monday';

@days[1..6] = qw(Tuesday Wednesday Thursday Friday Saturday Sunday);

print("@days","\n");
```

will output

```
Mon Tue Wed Thu Fri Sat Sun
Monday Tuesday Wednesday Thursday Friday Saturday Sunday
```

##### append an element at the end in array
To append an element at the end in array, one can use `push` function.

> [!NOTE]
> When it is considered as a stack, `push` function and `pop` function is used.
>
> `push` function: append an element at the end in array.
>
> `pop` function: pop up the last element in array.

See the following example in [following section](#pop-up-the-last-element-in-array)

##### pop up the last element in array
To pop up the last element in array, one can use `pop` function.

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my @stack = (); # empty array

print("push 1 to array\n");

push(@stack,1);

print("push 2 to array\n");
push(@stack,2);

print("push 3 to array\n");
push(@stack,3);

print("The array contains:\n");

for(@stack){
	print("$_","\n");
}


my $elem = pop(@stack);
print("element: $elem\n");

$elem = pop(@stack);
print("element: $elem\n");

$elem = pop(@stack);
print("element: $elem\n");

print("The array contains:\n");

for(@stack){
	print("$_","\n");
}
```

will output

```
push 1 to array
push 2 to array
push 3 to array
The array contains:
1
2
3
element: 3
element: 2
element: 1
The array contains:
```

##### insert the element at begin in array
To insert the element at begin in array, one can use `unshift` function.

> [!NOTE]
> When it is considered as a queue, `unshift` function and `pop` function is used.
>
> `unshift` function: insert the element at begin in array.
>
> `pop` function: pop up the last element in array.

+ Example 1:

```
use warnings;
use strict;

my @queue = (); # empty queue

print("enqueue 1 to array\n");
unshift(@queue,1);

print("enqueue 2 to array\n");
unshift(@queue,2);

printf("enqueue 3 to array\n");
unshift(@queue,3);

print("The queue contains:\n");

for(@queue){
	print("$_","\n");
}

my $elem = pop(@queue);
print("element: $elem\n");

$elem = pop(@queue);
print("element: $elem\n");

$elem = pop(@queue);
print("element: $elem\n");

print("The queue contains:\n");

for(@queue){
	print("$_","\n");
}
```

will output

```
enqueue 1 to array
enqueue 2 to array
enqueue 3 to array
The queue contains:
3
2
1
element: 1
element: 2
element: 3
The queue contains:
```

##### sort in array
To sort in array, one can use `sort` function.

> [!IMPORTANT]
> The array is sorted by default sorting algorithm.
>
> The default sorting algorithm is special. Unlike it in other language.
>
> First, it treats all elements as string and then sort it by ascii ascending, by default.
>
> Based on this, if one sorts an array consist of numbers with default sorting algorithm, it will NOT sort the array from smallest number to largest number. (See Example 2.). For how to sort an array from smallest number to largest number, see Example 3.


> [!IMPORTANT]
> The array is sorted by default sortinh algorithm.
>
> To NOT use default sorting algorithm, one have to specify its own sorting algorithm which wrapped `{}`. (See Example 3.)


+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

#!/usr/bin/perl
use warnings;
use strict;

my @fruits = qw(oranges apples mango cucumber);

print("The fruit contains:\n");

for(@fruits){
	print("$_","\n");
}

my @sorted = sort @fruits;

print("The fruit contains:\n");
for(@sorted){
	print("$_","\n");
}

print("@sorted","\n"); # apples cucumber mango oranges
```

will output

```
The fruit contains:
oranges
apples
mango
cucumber
The fruit contains:
apples
cucumber
mango
oranges
apples cucumber mango oranges
```

+ Example 2:

```
use warnings;
use strict;
my @array = qw(3 2 1 4 7 6 10 15 27 100); 

print("The array contains:\n");
for(@array){
	print("$_","\n");
}

@array = sort @array; 
# @array = sort {$a <=> $b} @array; 

print("The array contains:\n");
for(@array){
	print("$_","\n");
}
```

will output

```
The array contains:
1
10
100
15
2
27
3
4
6
7
```

Sorting  default sorting algorithm, 

+ Example 3:

```
use warnings;
use strict;
my @array = qw(3 2 1 4 7 6 10 15 27 100); 

print("The array contains:\n");
for(@array){
	print("$_","\n");
}

# @array = sort @array; 
@array = sort {$a <=> $b} @array; 

print("The array contains:\n");
for(@array){
	print("$_","\n");
}
```

will output

```
The array contains:
3
2
1
4
7
6
10
15
27
100
The array contains:
1
2
3
4
6
7
10
15
27
100
```

### repetitive loop and conditional statement
#### repetitive loop
##### for

+ Example 1:
  
```
use warnings;
use strict;

my @array = (1..9);

print("The array contains:\n");
for(@array){
	print("$_","\n");
}
```

will output

```
1
2
3
4
5
6
7
8
9
```

> [!CAUTION]
> In each iteration of the loop, Perl creates an alias instead of a value.
>
> In other words, if you make any changes to the iterator, the changes also reflect in the elements of the array.

+ Example 2:

```
#!/usr/bin/perl
use warnings;
use strict;

my @b = (1..5);

print("Before the loop: @b \n");

for(@b){
	$_ = $_ * 2; 
}

print("After the loop: @b \n");
```

will output

```
Before the loop: 1 2 3 4 5 
After the loop: 2 4 6 8 10 
```

> [!NOTE]
> In Perl, one also can use for loop with `C-style`. (See Example 3.)

Example 3 and Example 4 give same result.

+ Example 3:

```
use warnings;
use strict;

my @c = (1..6);
for(my $i = 0; $i <= $#c; $i++){
	print("$c[$i] \n");
}
```

will output

```
1 
2 
3 
4 
5 
6 
```

+ Example 4:

```
use warnings;
use strict;

my @c = (1..6);
for (@c){
	print("$_ \n");
}
```

will output

```
1 
2 
3 
4 
5 
6 
```

##### foreach

+ Example 1:

```
use warnings;
use strict;

my @array = (1..9);

print("The array contains:\n");
foreach(@array){
	print("$_","\n");
}
```

will output 

```
The array contains:
1
2
3
4
5
6
7
8
9
```

##### declare a local variable in a loop

> [!NOTE]
> To declare a local variable in a loop, just declare the local variable between keyword for loop and `(`.
>
> See the following example.

> [!CAUTION]
> It is NOT allowed to declare a global variable in a loop. That is, the following code is NOT allowed
>
> ```
> foreach $i(@array){
> print("$i","\n");
> }
> ```

+ Example 1:

```
use warnings;
use strict;

my @array = (1..9);

print("The array contains:\n");
for my $i(@array){
	print("$i","\n");
}
```

will output

```
The array contains:
1
2
3
4
5
6
7
8
9
```

+ Example 2:

```
use warnings;
use strict;

my @array = (1..9);

print("The array contains:\n");
foreach my $i(@array){
	print("$i","\n");
}
```

will output

```
The array contains:
1
2
3
4
5
6
7
8
9
```

Wrong Examples:

+ Wrong Example 1:

```
use warnings;
use strict;

my @array = (1..9);

print("The array contains:\n");
for $i(@array){
	print("$i","\n");
}
```

will throw a runtime error in ideone[^1].

+ Wrong Example 2:

```
use warnings;
use strict;

my @array = (1..9);

print("The array contains:\n");
foreach $i(@array){
	print("$i","\n");
}
```

will throw a runtime error in ideone[^1].

##### while

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my $counter = 10;

while($counter > 0){

   print("$counter\n");

   # count down
   $counter--;

   # pause program for 1 second
   sleep(1);

   if($counter == 0){
	print("Happy New Year!\n");
   }
}
```

will output

```
10
9
8
7
6
5
4
3
2
1
Happy New Year!
```

+ Example 2:

The following code
```
#!/usr/bin/perl
use warnings;
use strict;

my $num;
my @numbers = ();

print "Enter numbers, each per line :\n";
print "ctrl-z (windows) or ctrl-d(Linux) to exit\n>";

while(my $input = <>) {
  print(">");
  chomp $input;
  $num = int($input);
  push(@numbers, $num);    
}

print "You entered: @numbers\n";
```

will give input and output

```
Enter numbers, each per line :
ctrl-z (windows) or ctrl-d(Linux) to exit
>1
>2
>3
>^Z
You entered: 1 2 3
```

in VSC with Perl plugin.

> [!NOTE]
> There are another way to express the `while` loop.

+ Example 3:

```
#!/usr/bin/perl
use warnings;
use strict;

my $i = 5;
print($i--,"\n") while($i > 0);
```

will output

```
5
4
3
2
1
```

##### do while 

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my $command;
print("Enter a command, bye to quit.\n");       

do {
  print(">");       

  # convert command to lowercase
  chomp($command = <STDIN>);  
  $command = lc($command);
  # display the command
  print("$command\n");
}while($command ne "bye");
```

will give input and output

```
Enter a command, bye to quit.
>2
2
>3
3
>4
4
>5
5
>6
6
>7
7
>^Z
Use of uninitialized value $command in chomp at CH6/ex6_1.pl line 12, <STDIN> line 6.
Use of uninitialized value $command in lc at CH6/ex6_1.pl line 13, <STDIN> line 6.

>bye
bye
```

##### do until

The following example (i.e. Example 1) will be equivalent to the Example 1 in [previous section](#do-while).

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my $command;
print("Enter a command, bye to quit.\n");       

do {
  print(">");       

  # convert command to lowercase
  chomp($command = <STDIN>);  
  $command = lc($command);
  # display the command
  print("$command\n");
}until($command eq "bye");
```

will give input and output

```
Enter a command, bye to quit.
>2
2
>e4
e4
>bye
bye
```

##### next statement

> [!NOTE]
> The `next` statement allows you to start the next iteration of the loop and skips the rest of the code below it. Like `continue` keyword in C.
>
> To use `next` statement, one have to define an additional loop block for the next statement as follows.
>
> ```
>do{
>    # do block
> {
> 	statement next;
> }
> }while(condition);
> ```
>
> or in short
>
> ```
> do{{
> statement next;
> }}while(condition);
> ```

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my @a = (1,3,2,4,6,9,8);

my $sum_even = 0;
my $num = 0;

do {{
 # get the next array element
 $num = shift(@a);	

 # skip if the  element is odd number
 next if $num % 2 == 1;

 # calculate total of even numbers
 $sum_even += $num;

}}until(!scalar @a > 0);

print("$sum_even\n");
```

will output

```
20
```

##### last statement

> [!NOTE]
> The `last` statement exits the repetitive loop immediately. It acts as `break` statement in C.
>
> To use repetitive statement with the last statement, you need to add another block to the repetitive statement like this:
>
> loop_label:{
> 	do{
>   		last if expression;
> 	}while(condition)
> }


+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my @haystack = qw(1 3 2 4 5 9 8 6 7);

my $count = scalar @haystack;
my $i = 0;
my $needle;

print("Enter a number to search (1-9):");
$needle = int(<STDIN>);

find_needle_in_haystack:{
 do {

  if($haystack[$i] == $needle){
    print("Number $needle found at position $i\n");
    # exit the loop
    last;
  }
  # next element
  $i++;
 }until($i == $count);
}
```

wiil give input and output

```
Enter a number to search (1-9):1
Number 1 found at position 0
```

##### until

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my $counter = 5;

until($counter == 0){
   print("$counter \n");
   $counter--;
}
```

will output

```
5 
4
3
2
1
```

+ Example 2:

```
#!/usr/bin/perl
use warnings;
use strict;

my $counter = 0;
my @keywords = qw(until while do for loop);

until(!scalar @keywords) {
  $counter++;
  print shift(@keywords) . "\n";

}
print("$counter elements removed!\n");
```

will output

```
until
while
do
for
loop
5 elements removed!
```

#### conditional statement

### mode
#### strict mode

> [!CAUTION]
> By default, Perl does NOT use strict mode. In non-strict mode, some errors will be thrown instead ignoring.
>
> Based on this, to ensure all errors that will be thrown, use `strict` mode at begin through the statement `use strict;`.

#### warnings mode
> [!IMPORTANT]
> Warning in Perl is the most commonly used Pragma in Perl programming and is used to catch ‘unsafe code’.
>
> A pragma is a specific module in Perl package which has the control over some functions of the compile time or Run time behavior of Perl, which is strict or warnings.
>
> Like `pragma` in C.

To enable warnings mode. Type it at begin.

```
use warnings;
```

For more information, see [warnings handling in Perl](https://www.geeksforgeeks.org/perl-warnings-and-how-to-handle-them/)

> [!WARNING]
>  The `warnings` pragma (such as `use warnings;`) was introduced in Perl 5.6 .


### re (regular expression)

Example 1 illustrates the basic matching.

+ Example 1:

```
# It illustrates the basic matching.
string =~ regex;
```

+ Example 2:

```
#!/usr/bin/perl
use warnings;
use strict;
my $s = 'Perl regular expression is powerful';
print "match found\n" if( $s =~ /ul/); # It will match the string `Perl regular expression is powerful;` does match `ul`. If it does match, it will print match found.
```

+ Example 3:

```
#!/usr/bin/perl
use warnings;
use strict;

my @words= (
	   'Perl',
	   'regular expression',
	   'is',
	   'a very powerul',
	   'feature'
	);

foreach(@words){
   print("$_ \n") if($_ !~ /er/);
}
```

will output

```
regular expression 
is
feature
```

+ Exampl 4:

```
#!/usr/bin/perl
use warnings;
use strict;

my @html = (
	   '<p>',
	   'html fragement',
	   '</p>',
	   '<br>',
	   '<span>This is a span</span>'
	);

foreach(@html){
   print("$_ \n") if($_ =~ m"/");
}
```

will output

```
</p>
<span>This is a span</span>
Press any key to continue . . .
```

+ Example 5:

```
#!/usr/bin/perl
use warnings;
use strict;

my $s = "Regular expression";
print "match\n" if $s =~ /Expression/i;
```

will output

```
match
```

+ Example 6:

```
#!/usr/bin/perl
use warnings;
use strict;

my @words = ('dog','fog','chicken');

for(@words){
   print("$_\n") if(/[dfr]og/); # matches dog, fog, and rog
}
```

will output

```
dog
fog
```

+ Example 7:

```
#!/usr/bin/perl
use warnings;
use strict;

my $time = localtime();
print $time, "\n";
print "Match found\n" if($time =~ /\d\d:\d\d:\d\d/);
```

will output

```
Sat Aug 17 14:43:48 2024
Match found
```

+ Example 8:

```
#!/usr/bin/perl
use warnings;
use strict;

my $time = localtime();
print $time, "\n";
print ("$1 \n") if($time =~ /(\d\d:\d\d:\d\d)/);
```

will output

```
Sat Aug 17 14:44:57 2024
14:44:57
```

+ Example 9:

```
#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper; 

my $text = <<END;
name: Antonio Vivaldi, period: 1678-1741
name: Andrea Zani,period: 1696-1757
name: Antonio Brioschi, period: 1725-1750
END

my %composers;

for my $line (split /\n/, $text){
    print $line, "\n";
    if($line =~ /name:\s+(\w+\s+\w+),\s+period:\s*(\d{4}\-\d{4})/){
    	$composers{$1} = $2;
    }
}

print Dumper(\%composers);
```

will output

```
name: Antonio Vivaldi, period: 1678-1741
name: Andrea Zani,period: 1696-1757
name: Antonio Brioschi, period: 1725-1750
$VAR1 = {
          'Antonio Brioschi' => '1725-1750',
          'Antonio Vivaldi' => '1678-1741'
        };
```

+ Example 10:

```
#!/usr/bin/perl
use warnings;
use strict;

my $str = 'new york city';

$str =~ s/new york/New York/;

print $str, "\n";
```

will output

```
New York city
Press any key to continue . . .
```

+ Example 11:

```
#!/usr/bin/perl
use warnings;
use strict;

my $str =  <<EOF;
new york city is beautiful. Have you ever been to new york city?;
EOF

$str =~ s/new york/New York/g;

print $str, "\n";
```

will output

```
New York city is beautiful. Have you ever been to New York city?;

Press any key to continue . . .
```

### references

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my $x = 10;

my $xr = \$x;

# change $x via $xr
$$xr = $$xr * 2;

print("$x\n"); # 20
print("$$xr \n");  # 20
print("$xr\n"); # SCALAR(0x1d2e6e4)
```

will output

```
20
20
SCALAR(0x2af297c)
```

+ Example 2:

```
#!/usr/bin/perl
use warnings;
use strict;

my @a = (1..5);
my $ar = \@a;

my $i = 0;
for(@$ar){
    print("$ar->[$i++] \n");
}
```

will output

```
1 
2
3
4
5
```

+ Example 3:


```
#!/usr/bin/perl
use warnings;
use strict;

my %months= ( Jan => 1,
	      Feb => 2,
	      Mar => 3,
	      Apr => 4,
	      May => 5,  
	      Jun => 6,
	      Jul => 7,
	      Aug => 8,
	      Sep => 9,
	      Oct => 10,
	      Nov => 11,
	      Dec => 12);

my $monthr = \%months;	   

for(keys %$monthr){
    print("$_  = $monthr->{$_}\n");
}
```

will  output

```
Sep  = 9
May  = 5
Jul  = 7
Jun  = 6
Jan  = 1
Nov  = 11
Aug  = 8
Feb  = 2
Mar  = 3
Dec  = 12
Apr  = 4
Oct  = 10
```

#### anomynous reference

+ Example 1:
  
```
#!/usr/bin/perl
use warnings;
use strict;

my $ar = [1..5];

# loop over the array elements
for(@$ar){
   print("$_  "); # 1 2 3 4 5
}

print("\n");
```

will output

```
1 2 3 4 5
```

#### symbolic references

+ Example 1:

```
#!/usr/bin/perl
use warnings;

my $foo = "bar";
$$foo = "whatever";

print $$foo , "\n"; # whatever
print $bar, "\n"; # whatever
```

#### autovivification

```
#!/usr/bin/perl
use warnings;
use strict;

my $foo->{address}->{building} = 1000;

print $foo, "\n"; # HASH(0x3bad24)
print $foo->{address}, , "\n"; # HASH(0x3bae04)
print $foo->{address}->{building},"\n"; # 1000
```

will output

```
HASH(0xf8c7ec)
HASH(0xf8ca5c)
1000
```
will output

```
Name "main::bar" used only once: possible typo at CH11/ex11_3_1.pl line 8.
whatever
whatever
```

### subroutine
#### define a subroutine
To define a subroutine, use `sub` keyword, followed by subroutine name, then followed by a wrapped by `{}` with name body.

The syntax as follows:

```
sub <subroutineName>{
	# body of the subroutine.
	<subroutineBody>
}
```

where

```
<subroutineName> := {identifier}
<subroutineBody> := {expression}+
```


#### call a subroutine

The syntax as follows:

```
&<subroutineName>;
<subroutineName>();
```

where

```
<subroutineName> is defined in above section.`
```

[define a subroutine](#define-a-subroutine)

[^1]: [ideone online IDE](https://ideone.com)

