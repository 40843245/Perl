# Perl
## how to
### list lib path that the Perl will search to
#### in terminal
To list lib path that the Perl will search to, run these commands in terminal.

```
Perl -V
```

### add lib path that the Perl will search to
#### in Perl code
To add lib path that the Perl will search to, one can type these statements in Perl code.

```
use lib <libPath>;
```

### add a relative directory to `@INC`
#### in code.
To add a relative directory to `@INC`, one can follow one of these solutions:

+ FindBin module:

Use the following code snippets.

```
use FindBin;
use File::Spec;
use lib File::Spec->catdir($FindBin::Bin, '..', 'lib');
```

- Example 1:

```
use strict;
use warnings;
use 5.010;
 
use FindBin;
use File::Spec;
use lib File::Spec->catdir($FindBin::Bin, '..', 'lib');
 
use App::Module;
use App::Other::Class;
```

+ `File::Spec` subroutine with parameter `$0` which always contains the name of the current executable script.

Use the following code snippets.

```
use File::Basename;
use File::Spec;
use lib File::Spec->catdir(
            File::Basename::dirname(File::Spec->rel2abs($0)),
            '..',
            'lib');
```

+ `Cwd::abs_path` subroutine with parameter `$0` which always contains the name of the current executable script.

Use the following code snippets.

```
use File::Basename;
use File::Spec;
use lib File::Spec->catdir(
            File::Basename::dirname(Cwd::abs_path($0)),
            '..',
            'lib');
```

+ `Dir::Self` subroutine.

Use the following code snippets.

```
use Dir::Self;
use lib File::Spec->catdir(
            __DIR__,
            '..',
            'lib');
```
  
