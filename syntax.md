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
>  The `warnings` pragma (such as `use warnings;`) was introduced in Perl 5.6. 
#### strict mode
[^1]: [ideone online IDE](https://ideone.com)

