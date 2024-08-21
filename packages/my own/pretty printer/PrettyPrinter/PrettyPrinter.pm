=begin
  package name: PrettyPrinter
  package intro: a package that prints the value more pretty
  expected number of subroutines in package: 6
  expected subroutine in package: 
    1. pretty_print
    2. print_scalar
	3. print_ref
	4. print_array
	5. print_hash
	6. print_indented
=cut

use warnings;
use strict;

package PrettyPrinter;

$level = -1; # Level of indentation 

=begin
  subroutine name: pretty_print
  subroutine intro: print a value or all values with an array of any data types or any data types.
  expected subroutine paras length: a positive integer
  expected subroutine paras:
    1. @_: It should be an array of any data type. @_ contains all parameters. 
		   To print all parameter more pretty one-by-one with `foreach` keyword. 
  expected returned value length: 0
  expected returned value: None
=cut
sub pretty_print { 
	my $var; 
	foreach $var (@_) { 
		if (ref ($var)) { 
			print_ref($var); 
		} else { 
			print_scalar($var); 
		} 
	} 
} 

=begin
  subroutine name: print_scalar
  subroutine intro: print a value with scalar data types.
  expected subroutine paras length: 1
  expected subroutine paras:
    1. $var: It should be scalar type. To print a scalar more pretty.
  expected returned value length: 0
  expected returned value: None
=cut
sub print_scalar { 
	++$level; 
	my $var = shift; 
	print_indented ($var); 
	--$level; 
} 

=begin
  subroutine name: print_ref
  subroutine intro: print a value with a reference.
  expected subroutine paras length: 1
  expected subroutine paras:
    1. $var: It should be a reference. To print a reference more pretty.
  expected returned value length: 0
  expected returned value: None
=cut
sub print_ref { 
	my $r = shift; 
	if (exists ($already_seen{$r})) { 
		print_indented ("$r (Seen earlier)");
	 	return; 
	} else { 
		$already_seen{$r}=1; 
	} 
	my $ref_type = ref($r); 
	if ($ref_type eq "ARRAY") { 
		print_array($r); 
	} elsif ($ref_type eq "SCALAR") { 
		print "Ref -> $r"; 
		print_scalar($$r); 
	} elsif ($ref_type eq "HASH") { 
		print_hash($r); 
	} elsif ($ref_type eq "REF") { 
		++$level; 
		print_indented("Ref -> ($r)"); 
		print_ref($$r); 
		--$level; 
	} else { 
		print_indented ("$ref_type (not supported)"); 
	} 
} 

=begin
  subroutine name: print_array
  subroutine intro: print all values with an array one-by-one with `foreach` keyword.
  expected subroutine paras length: 1
  expected subroutine paras:
    1. $r_array: It should be an array. To print an array more pretty.
  expected returned value length: 0
  expected returned value: None
=cut
sub print_array { 
	my ($r_array) = @_; 
	++$level; 
	print_indented ("[ # $r_array"); 
	foreach $var (@$r_array) { 
		if (ref ($var)) { 
			print_ref($var); 
		} else { 
			print_scalar($var); 
		} 
	}
	print_indented ("]"); 
	--$level; 
} 

=begin
  subroutine name: print_hash
  subroutine intro: print all values with a hash one-by-one for its key-value pairs with `foreach` keyword.
  expected subroutine paras length: 1
  expected subroutine paras:
    1. $r_hash: It should be a hash. To print a hash more pretty.
  expected returned value length: 0
  expected returned value: None
=cut
sub print_hash { 
	my($r_hash) = @_; 
	my($key, $val); 
	++$level; 
	print_indented ("{ # $r_hash"); 
	while (($key, $val) = each %$r_hash) {
		 $val = ($val ? $val : '""'); 
		 ++$level; 
		 if (ref ($val)) { 
			print_indented ("$key => "); 
			print_ref($val); 
		} else { 
			print_indented ("$key => $val"); 
		} 
		--$level; 
	} 
	print_indented ("}"); 
	--$level; 
}

=begin
  subroutine name: print_indented
  subroutine intro: print a values with indentation which is according to $level.
  expected subroutine paras length: 1
  expected subroutine paras:
    1. $_[0]: It should be any type.
  expected returned value length: 0
  expected returned value: None
=cut
sub print_indented { 
	$spaces = ": " x $level; 
	print "${spaces}$_[0]\n"; 
}
