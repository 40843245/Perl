# Perl
## Q&A
### Q1: Can't locate ... in @INC
### A1:
`Can't locate <packageName>.pm in @INC` means that `<packageName>.pm` is missing or NOT be found.

Someone may wonder a question -- `Why Perl cannot find the module?`.

There are lots of reasons:

1. The intuitive reason is the `<packageName>.pm` does NOT exist (may be a typo) or it is replaced into wrong place.
2. There are syntax error in `<packageName>.pm`. Including: A typo of `use warning;`(The correct one is `use warnings;`).
3. It does NOT return value `true` in `<packageName>.pm`.

> [!IMPORTANT]
> In Perl, a package must return value `true`.

> [!NOTE]
> The most and easiest way to return value `true` is `1;`. The number `1` is evaluated to `true`. While here, one can omit the `return` keyword, leaving `1;`. For more details about omit the `return` keyword, see [syntax.md](https://github.com/40843245/Perl/blob/main/syntax.md).
