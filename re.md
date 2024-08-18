# Perl 
## re (regular expression)
### overview
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

### all definitions
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

# For variable without prefix
{variableName} := {identifier}
{variable} := {vaariableName}

# For keyword
{keyword} := see the keywords in Perl.

# For identifier
{identifier} := {alphabet}({alphabet}|{digit}|{underscore})*

# For variable with prefix
## About basic data type
{basicTypeVariable} := {dollarSign}{variable}

## About array type
{arrayTypeVariable} := {atSign}{variable}

## About list type
{listTypeVariable} := {atSign}{variable}

## About hash type
{hashTypeVariable} := {modulus}{variable} # for example, `%hash1`

## About prefix of a variable
{variableWithPefix} := ({basicTypeVariable}|{arrayTypeVariable}|{listTypeVariable}|{hashTypeVariable})

# For operator
## About numbers
{arthimeticalOperator} := ({plus}|{minus}|{multiplication}|{division}|{exponent}|{modulus})
{numberAllOperator} := ({arthimeticalOperator}|{numberComparisonOperator})

## About string
{concatenationString} := {dot}
{stringAllOperator} := ({stringComparisonOperator}|{concatenationString})

# For parameter 
{parameter} := ({variableWithPefix}|{expression})
{parameters} := {parameter}({comma}{parameter})*

# For function or subroutine
## For function
### About function name
<builtinFunctionName> := # A built in function in Perl.

### About function call
{builtinFunctionCall} := <builtinFunctionName>{leftParen}{parameters}?{rightParen}

## For subroutine
### About subroutine name
{subroutineName} := {identifier}

### About subroutine call
{subroutineCall} := (({subroutineName}{leftParen}{parameters}?{rightParen})|({ampersand}{subroutineName})) # For the left group, such as `subroutine1($args).` For the right group, such as `&subroutine2`.

### About call
{call} := ({builtinFunctionCall}|{subroutineCall})

# For expression
## About numbers
{numberExpression} := ({number}|{call}|{basicTypeVariable}){spacesOptional}((({numberComparisonOperator}|{arthimeticalOperator}){spacesOptional}({number}|{call}|{basicTypeVariable}))* # expression about two numbers such as `3 + $var1`

## About string
{stringExpression} := ({string}|{call}|{basicTypeVariable}){spacesOptional}((({stringComparisonOperator}|{concatenationString}){spacesOptional}({string}|{call}|{basicTypeVariable}))|({repetiveString}{spacesOptional}({positiveInteger}|{call}|{basicTypeVariable})))* # expression about two strings such as `"Hello World!\n"."This is Perl.\n"`

## About simple expression
{simpleExpression} := ({numberExpression}|{stringExpression}|{call})

## About more complicated expression
{complicatedExpression} := ({simpleExpression}|{expressionWithAssignment}) # Definition of {expressionWithAssignment}, see below.

# For complicated data type
## For array
{arrayDefinition} := qw{leftParen}({parameter}({space}+{parameter})*)?{rightParen} # such as `qw()`, `qw(1)`, `qw(apple banana)` which is equivalent to `("apple","banana")`

## For list
{listDefinition} := {leftParen}({parameter}{spaceOptional}({comma}{spaceOptional}{parameter})*)?{rightParen} # such as `()`, `(1)`, `("apple","banana")` which is equivalent to `qw(apple banana)`

## For hash
{key} := {parameter} # key in key-value pair
{val} := ({parameter}|{expression}) # value in key-value pair
{pair} := {key}{spaceOptional}{rightArrow}{spaceOptional}{val} # pair value in key-value pair
{pairs} := {pair}+ # one or more pairs
{hashDefinition} := {leftParen}{spaceOptional}{pairs}{spaceOptional}{rightParen} # such as `()`, `(1)`, `("apple","banana")` which is equivalent to `qw(apple banana)`

# For value
## For left value
<lvalue> := {variableWithPrefix}

## For right value
<rvalue> := {complicatedExpression} # Definition of {complicatedExpression}, see above.

# For expression
## For expression with assignment
<expreesionWithAssignment> := <lvalue>{spaceOptional}{equalSign}{spaceOptional}<rvalue> # such as <lvalue> = <rlvalue>

# For statement
<statement> := {complicatedExpression}{semicolon} # i.e. A more complicated expression followed by `;`

# For statements
<statements> := <statement>+ # one or more statements

# For body
<body> := <statements>

# For class
## About class name.
<className> := {identifier}
```
