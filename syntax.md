# Perl
## syntax
### overview of data type
#### basic data type
##### integer

+ Example 1:

```
$x=10;
```

##### float 

+ Example 1:

```
$fnum=1.5;
```

##### string

+ Example 1:

```
$str="string";
```

#### array or list
##### array

+ Example 1:

```
@array1= qw(1,2,3);
```

##### list

+ Example 1:

```
@list1= (1,2,3);
```

#### hash

+ Example 1:

```
%array1= (
England => 'English',
France => 'French',
Spain => 'Spanish',
China => 'Chinese',
Germany => 'German'
);
```

### variable 
> [!NOTE]
> A variable is defined iff its it is first assigned.

> [!NOTE]
> To access a variable which returns a basic data type, it must start with `$` sign and followed by a varible name. Like variable in PHP.
>
> Such as
>
> `$x=10`
>
> While, to access a variable which returns an `array`, it must start with `@`.
>
> While, to access a variable which returns an `hash`, it must start with `%`.

A variable must start with identifier.

An identifier must 
+ consist of uppercase alphabet, lowercase alphabet, digit, and underscore.
+ start with uppercase alphabet and lowercase alphabet.
+ NOT be a keyword.

To use [re (regular expression)](https://en.wikipedia.org/wiki/Regular_expression)  to define some definitions.
> [!NOTE]
> In re the character `\` escapes the special character.
>
> For example, `\+` escapes the special character `+`.
>
> and `\-` escapes the special character `-`.

The special characters in re includes

+ +
+ -
+ *
+ ^
+ \
+ {
+ }
+ [
+ ]
+ (
+ )
+ .
+ $

Before we define `identifier` with re, we define some basic data type in re first.

```
# For alphabet
{uppercase} := [A-Z]
{lowercase} := [a-z]
{alphabet} := ({uppercase}|{lowercase})

# For digit
{digit} := [0-9]
{nonzeroDigit} := [1-9]

# For some symbols
{underscore} := _
{dot} := \.
{plus} := \+ # `+`
{dash} := \- # `-`
{minus} := {dash} # `-`
{multiplication} := \* # `*`
{division} := / # `/`
{integerDivision} := // # `//`
{modulus} := % # `%`
{exponent} := \^ # `^`
{equalSign} := = # `=`
{lessThanSign} := < # `<`
{greaterThanSign} := > # `>`
{exclamationSign} := ! # `!`
{questionSign} := \? # `?`
{tildeSign} := ~ # `~`
{dollarSign} := \$ # `$`
{atSign} := @ # `@`
{hashTagSign} := \# # `#`
{semicolon} := ; # `;`
{colon} := : # `:`
{leftParen} := \( # `(`
{rightParen} := \) # `)`
{leftSquareBracket} := \[ # `[`
{rightSquareBracket} := \] # `]`
{leftCurlyBracket} := \{ # `{`
{rightCurlyBracket} := \} # `}`
{comma} := , # `,`

# For some annotations
{repetitionString} := x # The small letter `x`

# Mixture of symbols
{rightArrow} := {equalSign}{greaterThanSign} # `=>`
{memberOfPointer} := {dash}{greaterThanSign} # `->`

# For space
{whitespace} := # a whitespace  ` `
{tab} := \t # a tab `\t`
{space} := ({whitespace}|{tab})
{spaces} := {space}+
{spacesOptional} := {space}*

# For quotation
{singleQuotation} := ' # `'`
{doubleQuotation} := " # `"` 
{backslash} := \\ # `\` 
{ampersand} := & # `&`
{asterisk} := \* # `*`

# For basic data type
## For integer
{nonnegativeInteger} := {digit}+
{positiveInteger} := {nonzeroDigit}({digit})*
{negativeInteger} := {minus}{positiveInteger}

{integer} := ({negativeInteger}|{nonnegativeInteger})

## For float
{float} := (({plus}|{minus})? {nonnegativeInteger}){dot}({positiveInteger})

## For number
{number} := ({integer}|{float})

## For string
{anyCharExceptSingleQuotation} := [^{singleQuotation}]
{anyCharsExceptUnespacedSingleQuotation}:= ({anyCharExceptSingleQuotation}*{backslash}{singleQuotation}?)+

{anyCharExceptDoubleQuotation} := [^{doubleQuotation}]
{anyCharsExceptUnespacedDoubleQuotation}:= ({anyCharExceptDoubleQuotation}*{backslash}{doubleQuotation}?)+

{singleQuotationString} := ({singleQuotation}{anyCharsExceptUnespacedSingleQuotation}{singleQuotation}
{doubleQuotationString} := ({doubleQuotation}{anyCharsExceptUnespacedDoubleQuotation}{doubleQuotation}

{string} := ({singleQuotationString}|{doubleQuotationString})

# For arrow
{rightArrowWithEqualSign} := {equalSign}{greaterThen} # `=>`

# For assignment
{assigment} := {equalSign} # `=`

# For comparisons
## For comparisons of two numbers and two booleans
{eq} := {equalSign}{equalSign} # equal to 
{ne} := {exclamationSign}{equalSign} # not equal to

## For comparisons of two numbers
{lt} := {lessThanSign} # less than
{gt} := {greaterThanSign} # greater than
{le} := {lessThanSign}{equalSign} # less than or equal to
{ge} := {greaterThanSign}{equalSign} # greater than or equal to

## For other comparisons of two numbers
{numbercmp} := {lessThanSign}{equalSign}{greaterThanSign} # The operator `<=>`acts strcmp in C. For two numbers `x` and `y`, it will return ` iff `x>y`. It will return 0 iff `x==y`. It will return -1 iff `x<y`.

{numberComparisonOperator} := ({eq}|{ne}|{lt}|{gt}|{le}|{ge}|{numbercmp})

## For comparisons of two strings.
{eqString} := eq
{neString} := ne
{ltString} := lt
{gtString} := gt
{leString} := le
{geString} := ge

{stringComparisonOperator} := ({eqString}|{neString}|{ltString}|{gtString}|{leString}|{geString})
```

The re of `variable` as follows.

```
# For variable without prefix
{variableName} := {identifier}
{variable} := {vaariableName}
```

Then we define `keyword` in re.

```
# For keyword
{keyword} := see the keywords in Perl.
```

The re of `identifier` as follows.

```
# For identifier
{identifier} := {alphabet}({alphabet}|{digit}|{underscore})*
```

The re of `variable` with `basic` type as follows.

```
# For variable with prefix
## About basic data type
{basicTypeVariable} := {dollarSign}{variable}
```

The re of `variable` with `array` type as follows.

```
## About array type
{arrayTypeVariable} := {atSign}{variable}
```

The re of `variable` with `list` type as follows.

```
## About list type
{listTypeVariable} := {atSign}{variable}
```

The re of `variable` with `hash` type as follows.

```
## About hash type
{hashTypeVariable} := {modulus}{variable} # for example, `%hash1`
```

The re of `variable` with `prefix` type as follows.

```
## About prefix of a variable
{variableWithPefix} := ({basicTypeVariable}|{arrayTypeVariable}|{listTypeVariable}|{hashTypeVariable})
```

> [!NOTE]
> In Perl, according to different type of return value about a variable, it will add different prefix. It will be discussed later.
>
>> If type of return value about a variable is basic data type, it will add `$` as prefix.
>>
>> If type of return value about a variable is array type, it will add `@` as prefix.
>>
>> If type of return value about a variable is hash data type, it will add `%` as prefix.

The re of `operator` for `basic` type as follows.

```
# For operator
## About numbers
{arthimeticalOperator} := ({plus}|{minus}|{multiplication}|{division}|{exponent}|{modulus})
{numberAllOperator} := ({arthimeticalOperator}|{numberComparisonOperator})

## About string
{concatenationString} := {dot}
{stringAllOperator} := ({stringComparisonOperator}|{concatenationString})
```

> [!NOTE]
> Here, in re, I don't consider expression about operations of variables with array, list, and hash type.

The re of `parameter` in built-in function call or subroutine call as follows.

```
# For parameter 
{parameter} := ({variableWithPefix}|{expression})
{parameters} := {parameter}({comma}{parameter})*
```

The re of `built-in` function and its call as follows.

```
# For function or subroutine
## For function
### About function name
<builtinFunctionName> := # A built in function in Perl.

### About function call
{builtinFunctionCall} := <builtinFunctionName>{leftParen}{parameters}?{rightParen}
```

The re of `my own` function (or called subroutine in Perl) and its call as follows.

```
## For subroutine
### About subroutine name
{subroutineName} := {identifier}

### About subroutine call
{subroutineCall} := (({subroutineName}{leftParen}{parameters}?{rightParen})|({ampersand}{subroutineName})) # For the left group, such as `subroutine1($args).` For the right group, such as `&subroutine2`.

### About call
{call} := ({builtinFunctionCall}|{subroutineCall})
```

The re of `expression` as follows.

```
# For expression
## About numbers
{numberExpression} := ({number}|{call}|{basicTypeVariable}){spacesOptional}((({numberComparisonOperator}|{arthimeticalOperator}){spacesOptional}({number}|{call}|{basicTypeVariable}))* # expression about two numbers such as `3 + $var1`

## About string
{stringExpression} := ({string}|{call}|{basicTypeVariable}){spacesOptional}((({stringComparisonOperator}|{concatenationString}){spacesOptional}({string}|{call}|{basicTypeVariable}))|({repetiveString}{spacesOptional}({positiveInteger}|{call}|{basicTypeVariable})))* # expression about two strings such as `"Hello World!\n"."This is Perl.\n"`

## About simple expression
{simpleExpression} := ({numberExpression}|{stringExpression}|{call})

## About more complicated expression
{complicatedExpression} := ({simpleExpression}|{expressionWithAssignment}) # Definition of {expressionWithAssignment}, see below.
```

The re of `array` as follows.

```
# For complicated data type
## For array
{arrayDefinition} := qw{leftParen}({parameter}({space}+{parameter})*)?{rightParen} # such as `qw()`, `qw(1)`, `qw(apple banana)` which is equivalent to `("apple","banana")`
```

The re of `list` as follows.

```
## For list
{listDefinition} := {leftParen}({parameter}{spaceOptional}({comma}{spaceOptional}{parameter})*)?{rightParen} # such as `()`, `(1)`, `("apple","banana")` which is equivalent to `qw(apple banana)`
```

The re of `hash` as follows.

```
## For hash
{key} := {parameter} # key in key-value pair
{val} := ({parameter}|{expression}) # value in key-value pair
{pair} := {key}{spaceOptional}{rightArrow}{spaceOptional}{val} # pair value in key-value pair
{pairs} := {pair}+ # one or more pairs
{hashDefinition} := {leftParen}{spaceOptional}{pairs}{spaceOptional}{rightParen} # such as `()`, `(1)`, `("apple","banana")` which is equivalent to `qw(apple banana)`
```


> [!IMPORTANT]
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

> [!TIP]
> For what the `print` function, see [`print` section](#print)

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

The re of `lvalue` (i.e. left value, right hand side of equal sign) as follows.

```
# For value
## For left value
<lvalue> := {variableWithPrefix}
```

The re of `rvalue` (i.e. right value, right hand side of equal sign) as follows.

```
## For right value
<rvalue> := {complicatedExpression} # Definition of {complicatedExpression}, see above.
```

The re of `expression` with assignment operator (`=`) as follows.

```
# For other expression
## For expression with assignment
<expreesionWithAssignment> := <lvalue>{spaceOptional}{equalSign}{spaceOptional}<rvalue> # such as <lvalue> = <rlvalue>
```

The re of `statement` as follows.

```
# For statement
<statement> := {complicatedExpression}{semicolon} # i.e. A more complicated expression followed by `;`
```

The re of `statements` as follows.

```
# For statements
<statements> := <statement>+ # one or more statements
```

The re of `body` as follows.

```
# For body
<body> := <statements>
```

The re of `block` as follows.

```
# For block
<block> := {leftCurlyBracket}{body}{rightCurlyBracket}
```

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

### function 
#### define your own function
> [!TIP]
> You can NOT directly define your own function in Perl since Perl treats functions as subroutines.
>
> However, you can define a subroutine to do same thing.
>
> For how to define your own subroutine, see [`subroutine` section](#subroutine).

#### call a function
> [!IMPORTANT]
> There are two styles to call a function,
>
> 1. With a pair of parenthesis `()`. Such as `print("\n");`
> 2. Without a pair of parenthesis `()`, use a whitespace before parameter list. Such as `print "\n";`
>
> However, in some cases, one can NOT use two styles.
>
> If you read the above text carefully, then the second style is NOT applied to those for **ZERO** parameters.


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

- First form: Like that in C.

```
while(<condition>){<body>}
```

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

- Second form: if there are only one expression, one can put the expression (NOT including `;` at the front the keyword `while`). See the following example.

> [!CAUTION]
> It is NOT similar to C. In C, there are no this form.

```
<expression> while(<condition>);
```

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

**NOT** output

```
5
```

then get stuck.

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
##### if
In `if` function, the `<body>` which in `if` block or `<expression>` will be executed iff the `<condition>` is evaluated to true.

There are two forms of `if` function in Perl.

+ First form: like `if` in C.
```
if(<condition>){
	<body>
}
```

> [!CAUTION]
> DON'T like it in C.
>
> In Perl, the `{}` can NOT be omitted even if there is only one statement.
>
> Consider the following example.
>
> ```
> if(false) 
>	print("It may be executed.");
> print("It will be always executed.");
> ```
>
> is NOT equivalent to
>
> ```
> if(false){ 
>	print("It may be executed.");
> }
> print("It will be always executed.");
> ```
>
> and it will throw error.

+ Second form: if there is only one expression as body, one can use this shorthand form.
```
<expression> if <condition>;
```

In second form, if `<condition>` is true, it will execute `<expression>`. 

Otherwise, it will NOT execute `undef`.

The most commonly used example as follows.

- Example 1:

```
$x=5;
$expr=10;
$condition=($x<5);

print $expr if $condition==true;
```

is roughly equivalent to

```
$x=5;
$expr=10;
$condition=($x<5);

if($conditon==true){
	print($expr);
}
```

In this example, it will output

```
10
```

##### if else
Like `if-else` in C. If `<condition>` is evaluated to true., `<body1>` which is in `if` block will be executed. Otherwise, `<body2>` which is in `else` block will be executed.

+ First form:
```
if(<condition>){
	<body1>
}else{
	<body2>
}
```

> [!CAUTION]
> The above concepts can be applied to here.
> 
> DON'T like it in C. The `{}` can NOT be omitted.
>
> Consider the following example.
>
> ```
> if(false) 
>	print("It may be executed.");
> else
> 	print("It may be executed.");
> print("It is NOT in if-else.");
> ```
>
> is NOT equivalent to
>
> ```
> if(false) {
>	print("It may be executed.");
> }
> else{
> 	print("It may be executed.");
> }
> print("It is NOT in if-else.");
> ```
>
> and will throw error.

##### if-elsif
Image that one puts another `if` in one `if-else` where `<body2>` in `else` DOES wrapped with curly bracket `{}`. This form is made.

+ First form:
  
```
if(<condition1>){
	<body1>
}else {
	if(<condition2>){
		<body2>
	}
}
```

this is another form.

```
if(<condition1>){
	<body1>
}elsif(<condition>){
	<body2>
}
```

+ Example 3:

```
$x=5;

if ($x<5){
	print "$x<5.\n";
}elsif($x==5){
	print "$x==5.\n";
}
```

will output

```
5==5
```

We can also use mutliple `if-elsif` in Perl.

We can also add `else` after `if-elsif` in Perl.

+ Example 4:

```
$x=5;

if ($x<5){
	print "$x<5.\n";
}elsif($x==5){
	print "$x==5.\n";
}else{
	print "$x>5.\n";
}
```

will output

```
5==5
```

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

> [!TIP]
> The tip to remember the use of the annotation `->{}`.
>
> Consider following examples.
>
> An example that be applied to get element with index from array or list.
> 
> Given a reference in the statement `$rarray = \@array;` and a nonegative integer `$index`.
> 
> They are equivalent.
>
> ```
> $$rarray[$index] # is noisy. One have to think about precedence.
> ```
>
> ```
> ${$rarray}[$index] # will get tendinitis! 
> ```
>
> ```
> $rarray->[$index] # recommended
> ```
>
> It can also be applied to get element with key from hash. See the following example.
> 
> Given a reference in the statement `$rhash = \%hash;` and a key with string type `$key`.
> 
> They are equivalent.
>
> ```
> $$rhash{$key} # is noisy. One have to think about precedence.
> ```
>
> ```
> ${$rhash}{$key}  # will get tendinitis! 
> ```
>
> ```
> $$rhash->{$key}  # recommended
> ```

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

#### no automatic dereferencing
In perl, there are NO automatic dereferencing. So, one has to explicitly dereference using the constructs just described. 

Like it in C, in which you have to say *p to indicate the object pointed to by p. 

Compare the following examples.

```
$rarray = \@array; 
push ($rarray, 1, 2, 3); # Error: $rarray is a scalar, not an array.
```

```
$rarray = \@array; 
push ( @$rarray , 1, 2, 3); # OK, since one explicits it as an array.
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

+ Example 1:

```
sub say_something{
	print "Hi, this is the first subroutine\n";
}

&say_something;
say_something();
```

will output

```
Hi, this is the first subroutine
Hi, this is the first subroutine
```

In some cases, the ampersand ( &) is required, for example:

- When you use a reference that refers to the subroutine name.

+ Example 2:

```
sub say_something{
	print "Hi, this is the first subroutine\n";
}

&say_something;
say_something();

$subref = \&say_something;

print $subref."\n";

&$subref;
&{$subref};
```

will output

```
Hi, this is the first subroutine
Hi, this is the first subroutine
CODE(0x2ac292c)
Hi, this is the first subroutine
Hi, this is the first subroutine
```

#### call a subroutine by passing a value

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

print &sum(1..10), "\n";

sub sum{
	my $total = 0;
	for my $i(@_){
		$total += $i;
	}
	return $total;
}
```

will output

```
55
```

#### call a subroutine by passing a reference

+ Example 1:

```
use warnings;
use strict;

@array1 = (1, 2, 3);
@array2 = (4, 5, 6, 7);
addArrays (\@array1, \@array2); # Passing the arrays by reference.
print "@array1 \n";
sub addArrays {
        my ($rarray1, $rarray2) = @_;
        $len2 = @$rarray2;  # Length of array2
        for ($i = 0 ; $i  < $len2 ;  $i++) {
            $rarray1->[$i] += $rarray2->[$i];   
        }
}
```

#### return a value in subroutine

+ Example 1:
  
```
#!/usr/bin/perl
use warnings;
use strict;

print &say_hi , "\n";
sub say_hi{
	my $name = 'Bob';
	print "Hi $name \n";
	$name;
}
```

will output

```
Hi Bob 
Bob
```

+ Example 2:

```
#!/usr/bin/perl
use warnings;
use strict;

print &say_hi , "\n";
sub say_hi{
	my $name = 'Bob';
	print "Hi $name \n";
	return $name;
}
```

will output

```
Hi Bob 
Bob
```

+ Example 3:

```
#!/usr/bin/perl
use warnings;
use strict;

my @a = ();
my $j = min(@a);

if(defined $j){
   print("Min of @a is $j \n");
}else{
   print("The array is empty.\n");
}

my @b = (100,12,31);
my $k = min(@b);

if(defined $k){
  print("Min of @b is $k \n");
}else{
   print("The array b is empty.\n");
}

sub min{
   my $m = shift;
   return undef unless defined $m;
   for (@_){
      $m = $_ if $m > $_;
   }
   return $m;
}
```

will ouput

```
The array is empty.
Min of 100 12 31 is 12 
```

+ Example 4:

```
#!/usr/bin/perl
use warnings;
use strict;

my $a = 10;
my $b = 20;

do_something($a,$b);

print "after calling subroutine a = $a, b = $b \n";

sub do_something{
	$_[0] = 1;
	$_[1] = 2;
}
```

will output

```
after calling subroutine a = 1, b = 2 
```

+ Example 5:

```
#!/usr/bin/perl
use warnings;
use strict;

my $a = 10;
my $b = 20;

do_something($a,$b);

print "after calling subroutine a = $a, b = $b \n";

sub do_something{
	my ($p1,$p2) = @_;
	$p1 = 1;
	 $p2 = 2;
}
```

will output

```
after calling subroutine a = 10, b = 20
```

+ Example 6:

```
#!/usr/bin/perl
use warnings;
use strict;

my @a = (1,3,2,6,8,4,9);

my $m = &max(\@a);

print "The max of @a is $m\n";

sub max{
    my $aref = $_[0];
    my $k = $aref->[0];

    for(@$aref){
        $k = $_ if($k < $_);
    }
    return $k;
}
```

will output

```
The max of 1 3 2 6 8 4 9 is 9
```

+ Example 7:

```
#!/usr/bin/perl
use warnings;
use strict;

my @a = (1,3,2,6,7);
my @b = (8,4,9);

my @c = pops(\@a,\@b);
print("@c \n"); # 7, 9

sub pops{
	my @ret = ();
	for my $aref(@_){
		push(@ret, pop @$aref);
	}
	return @ret;
}
```

will output

```
7 9 
```

### module 
#### defining a module
To define a module, use `package` keyword at begin, followed by the package name (without file extension). And save the file as package name with file extension `.pm`. For more details, see the following example.

#### use the module
To use a module, use `use` keyword, followed by the package name (without file extension).  For more details, see the following example.

+ Example 1:

To define a `FileLogger` module in Perl, write code that begins with the statement `package FileLogger;`. And save it as `FileLogger.pm`. Such as

```
package FileLogger;
# FileLogger.pm

use strict;
use warnings;

my $LEVEL = 1; # default log level

sub open{
   my $logfile = shift;
   # open log file for appending
   open(LFH, '>>', $logfile) or die "cannot open the log file $logfile: $!";
   # write logged time:
   print LFH "Time: ", scalar(localtime), "\n";
}

sub log{
   my($log_level,$log_msg) = @_;
   # append log if the passed log level is lower than
   # the module log level
   if($log_level <= $LEVEL){
      print LFH "$log_msg\n";
   }
}

sub close{
   close LFH;
}

sub set_level{
   # set the log level
   my $log_level = shift;
   # check if the passed log level is a number
   if($log_level =~ /^\d+$/){
      $LEVEL = $log_level;
   }
}

1;
```

==================================

To use the module `FileLogger`, write code with statement `use FileLogger;`. Such as

```
#!/usr/bin/perl
use strict;
use warnings;

use FileLogger;

FileLogger::open("logtest.log");

FileLogger::log(1,"This is a test message");

FileLogger::close();
```

### class
To create a class, follow these steps.

1. Define a package with `className`. According to above section, to do that, one has to 

- use the statement `package <className>;` at begin.
- save the file as `<className>.pm`.

The re of `<className>` as follows.

```
# For class
## About class name.
<className> := {identifier}
```
> [!IMPORTANT]
> The class name and package name must be consistent.

The part of code will looks like this

`Product.pm`

```
package Product;
```

2. Define a subroutine with `new` keyword.

The part of code will looks like this

```
sub new{
	# body of class.
}
```

3. To define the member of the class for instantiating a new object, use `bless` keyword, followed by a wrapped `{}`, the keys in `{}` are members of class. Such as

```
# init product with serial, name and price
sub new{
    my ($class,$args) = @_;
    my $self = bless { serial => $args->{serial},
                       name => $args->{name}, 
                       price => $args->{price}
                     }, $class;
}
```

> [!NOTE]
> The syntax of `bless` function as follows. 
>
> ```
> my (<classVar>,<classArgs>) = @_;
> my <objectName> = bless <reference>, <classVar>;
> ```
>
> For more details,see [What exactly does Perl's "bless" do?](https://stackoverflow.com/questions/392135/what-exactly-does-perls-bless-do)

The re of `<classVar>` as follows.

```
## About the class variable name in class definition
<classVar> := {basicTypeVariable} # i.e. `$` followed by the class variable name.
```

The re of `<reference>` as follows.

```
<reference> := {leftCurlyBracket}{spaceOptional}{pairs}{spaceOptional}{rightCurlyBracket}
```

The re of `<objectName>` as follows.

```
<objectName> := {identifier}
```

For example,

```
# init product with serial, name and price
sub new{
    my ($class,$args) = @_;
    my $self = bless { serial => $args->{serial},
                       name => $args->{name}, 
                       price => $args->{price}
                     }, $class;
}
```

4. To instantiate an `Product` class in a new program, use the following code snippets.

```
#!/usr/bin/perl
use strict;
use warnings;

use Product;

my $iphone = Product->new({
                          serial =>"100",
                          name => "iPhone 5", 
                  price => 650.00});
```

5. That's done. The complete code snippets as follows. 

In `Product.pm`,

```
package Product;

use strict;
use warnings;

# init product with serial, name and price
sub new{
    my ($class,$args) = @_;
    my $self = bless { serial => $args->{serial},
                       name => $args->{name}, 
                       price => $args->{price}
                     }, $class;
}
# get name of the product
sub get_name{
   my $self = shift;
   return $self->{name};
}

# set new name for the product
sub set_name{
   my ($self,$new_name) = @_;
   $self->{name} = $new_name;
}

# get price of the product
sub get_price{
   my $self = shift;
   return $self->{price};
}

# set price for the product
sub set_price{
   my ($self,$new_price) = @_;
   $self->{price} = $new_price;
}
# get serial
sub get_serial{
   my $self = shift;
   return $self->{serial};   
}
# set serial
sub set_serial{
   my ($self,$new_price) = @_;
   $self->{price} = $new_price;
}
# return formatted string of the product
sub to_string{
   my $self = shift;
   return "Serial: $self->{serial}\nName: $self->{name}\nPrice: $self->{price}USD\n";
}

1;
```

In other program (e.g. `oop1.pl`),

```
#!/usr/bin/perl
use strict;
use warnings;

use Product;

my $iphone = Product->new({
                          serial =>"100",
                          name => "iPhone", 
		          price => 650.00});
my $nexus = Product->new({ serial =>"101",
			   name => "Nexus",
                           price => 299.00});

print $iphone->to_string();
print $nexus->to_string();
```

It will output as follows.

![image](https://github.com/user-attachments/assets/dd09f89f-d7c4-4119-bac0-d374ad49eaea)

For details, see [Perl OOP](https://www.perltutorial.org/perl-oop/).

### built-in function
#### print 
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

> [!CAUTION]
> There are **NO** built-in function `println()`.

Wrong Example:

+ Wrong Example 1:

![image](https://github.com/user-attachments/assets/430d419a-80ec-46f9-9401-7048a4b46a88)

+ Wrong Example 2:

![image](https://github.com/user-attachments/assets/fbb3001b-5bef-4269-b872-54fa2981c282)

#### sort
There are three forms of `sort` function.

```
sort <listTypeVariable>;
sort <block> <listTypeVariable>;
sort <subroutineName> <listTypeVariable>;
```

+ The first form 

```
sort <listTypeVariable>;
```

will sort the `<listTypeVariable>` with default sort algorithm (here is, in alphabetical order) and return the sorted list (as `sort` function is NOT in-place).

+ The second form

```
sort <block> <listTypeVariable>;
```

will sort the `<listTypeVariable>` with algorithm defined in `<block>` and return the sorted list (as `sort` function is NOT in-place).
  
+ The third form

```
sort <subroutineName> <listTypeVariable>;
```

will sort the `<listTypeVariable>` with algorithm defined in `<subroutineName>` and return the sorted list (as `sort` function is NOT in-place).

For more details and examples, see [`sort in array` section](#sort-in-array).

#### reverse
It is often used with `sort` function.

It can be sort the array or list reversely.

The form as follows.

```
reverse sort ...
```

### file handling
#### opening file
+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my $filename = 'c:\temp\test.txt';

open(FH, '<', $filename) or die $!;

print("File $filename opened successfully!\n");

close(FH);
```

will output

```
No such file or directory at CH16/ex16_1_1.pl line 7.
```

#### reading file

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my $filename = 'C:\Users\40843\OneDrive\桌面\Perl\ex\CH16\test.txt';

open(FH, '<', $filename) or die $!;

while(<FH>){
   print $_;
}

close(FH);
```

will output

```
No such file or directory at CH16/ex16_2_1.pl line 7.
```

### file test

+ Example 1:

```
#!/usr/bin/perl
use warnings;
use strict;

my $filename = shift @ARGV;
if(-e $filename){
   print("File $filename exists\n");
}else{
   print("File $filename does not exists\n");
}
```

> [!TIP]
> Whenever you use the file test operator, Perl will make a new call of stat(), which can be expensive
>
> However, Perl stores the result from the last stat() call to a special filehandle named `_`,
>
> so the subsequent file test operators can use the result that stores in the `_` filehandle.

+ Example 2:

```
#!/usr/bin/perl
use warnings;
use strict;

my $filename = shift @ARGV;
if(-e $filename && -f _ && -r _ ){
   print("File $filename exists and readable\n");	
}else{
   print("File $filename does not exists or is NOT readable\n");
}
```


The following list illustrates the most important Perl file test operators:

- \-r: check if the file is readable
- \-w: check if the file is writable
- \-x: check if the file is executable
- \-o: check if the file is owned by effective uid.
- \-R: check if file is readable
- \-W: check if file is writable
- \-X: check if file is executable
- \-O: check if the file is owned by real uid.
- \-e: check if the file exists.
- \-z: check if the file is empty.
- \-s: check if the file has nonzero size (returns size in bytes).
- \-f: check if the file is a plain file.
- \-d: check if the file is a directory.
- \-l: check if the file is a symbolic link.
- \-p: check if the file is a named pipe (FIFO): or Filehandle is a pipe.
- \-S: check if the file is a socket.
- \-b: check if the file is a block special file.
- \-c: check if the file is a character special file.
- \-t: check if the file handle is opened to a tty.
- \-u: check if the file has setuid bit set.
- \-g: check if the file has setgid bit set.
- \-k: check if the file has sticky bit set.
- \-T: check if the file is an ASCII text file (heuristic guess).
- \-B: check if the file is a “binary” file (opposite of -T).
  
### [Perl DBI(Database Independent) module](https://www.perltutorial.org/perl-dbi/)
To use Perl DBI module, please follow these steps.

1. Ensure that you have a MySQL server installed on your system.
2. Installing `DBD::mysql` module in Perl (can be done with `CPAN`).

To do so, running these commands in terminal.

```
perl -MCPAN -e shell
```

Example result:

```
C:\>perl -MCPAN -e shell

cpan shell -- CPAN exploration and modules installation (v1.9800)
Enter 'h' for help.
```

and installing `DBD::mysql` module in Perl with `CPAN` by running these commands in terminal. 

```
install DBD:mysql
```

Example result:

```
cpan> install DBD:mysql
```

3. Connecting to MySQL database server.

To connect to MySQL database, you use the following syntax.

```
my $dbh = DBI->connect("DBI:mysql:classicmodels",'root','');
```

4. Check the connection to MySQL database server.

To check the connection to MySQL database server, simply check the variable `$dbh` is null. 

If it is null, then it means the connection failed.

Otherwise, then it means the connection success.

```
if(!$dbh){
 die "failed to connect to MySQL database DBI->errstr()";
}else{
 print("Connected to MySQL server successfully.\n");
}
```

5. Do some operations in MySQL database server.

To fully execute a MySQL command in Perl, one has to do similar thing like [PDO style in PHP](https://www.php.net/manual/en/class.pdo.php).
        1. prepare the command via `prepare` method. And it will return the SQL 
	2. check it is success to run `prepare` method at runtime. If success, then continues next step. Otherwsie, print error message.
        3. execute the command via `execute` method.
	4. check it is success to run `execute` method at runtime. If success, then continues next step. Otherwsie, print error message.
        5. do things you want.
	6. call the `finish` method.

  
6. Disconnect the connection.

> [!IMPORTANT]
> Always disconnect or close the connection after it will NOT be used. 

To disconnect the connection. Simply use

```
$dbh->disconnect();
```

+ Example 1:

```
#!/usr/bin/perl
use strict;
use warnings;
use DBI;

my $dbh = DBI->connect("DBI:mysql:classicmodels",'root','');

die "failed to connect to MySQL database:DBI->errstr()" unless($dbh);

# prepare SQL statement
my $sth = $dbh->prepare("SELECT lastname, firstname, extension FROM employees")
                   or die "prepare statement failed: $dbh->errstr()";

$sth->execute() or die "execution failed: $dbh->errstr()"; 

my($lname,$fname,$ext);

# loop through each row of the result set, and print it
while(($lname,$fname,$ext) = $sth->fetchrow()){
   print("$lname, $fname\t$ext\n");                   
}

$sth->finish();
$dbh->disconnect();
```

+ Example 2:

```
#!/usr/bin/perl
use strict;
use warnings;
use DBI;

my $dbh = DBI->connect("DBI:mysql:classicmodels",'root','');

die "failed to connect to MySQL database:DBI->errstr()" unless($dbh);

# prepare SQL statement
my $sql = <<EOF;
 SELECT lastname, firstname, extension 
 FROM employees 
 WHERE lastname = ? OR firstname = ?
EOF

my $sth = $dbh->prepare($sql)
                 or die "prepare statement failed: $dbh->errstr()";

my($lname,$fname,$ext);
my($name, $answer);

print("\nPlease enter the employee firstname or lastname:");
while(<STDIN>){
   $name = $_;
   chomp($name);
   $sth->execute($name,$name) or die "execution failed: $dbh->errstr()"; 
   # loop through each row of the result set, and print it
   while(($lname,$fname,$ext) = $sth->fetchrow()){
      print("$lname, $fname\t$ext\n");                   
   }

   print("\nDo you want to continue? (Y/N)");
   $answer = <STDIN>;
   chomp($answer);
   last if $answer eq 'N';

   print("\nPlease enter the employee firstname or lastname:");
}

$sth->finish();
$dbh->disconnect();
```

[^1]: [ideone online IDE](https://ideone.com)
