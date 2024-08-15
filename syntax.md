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

> [!NOTE]
> A variable is case-sensitive. Such as `Var1` and `var1` are NOT same variables.

+ Example 1:

```
$x=10;
```

It will define a variable whose name is `x` and assign the value `10` into the variable `x`.

### assignment 

+ Example 1:
  
```
$x=10;
```

It will define a variable whose name is `x` and assign the value `10` into the variable `x`.

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
> A statement can consist of one expression or one expression with assignment operator. (See `Perl`->`syntax`->`assginment` section).

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
> To print a new line after print the value, please ~~first concatenate the value and new line (`"\n"`) then use `print()` function. Or~~ simply call `print("\n")` after using `print()` function.

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
     $a = 1; # override the value of `$a` on outer scope.
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
