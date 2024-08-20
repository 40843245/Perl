=begin
  package name: MatrixHandler
  package intro: A handler for matrix operations.
  expected number of subroutines in package: 3
  expected subroutine in package: 
    1. print_matrix
    2. input_one
	3. input_two
	4. addition
=cut

package MatrixHandler;

use warnings;
use strict;

=begin
  subroutine name: print_matrix
  subroutine intro: To print the content of a matrix.
  expected subroutine paras length: 3
  expected subroutine paras:
    1. @matrixA: It should be array type. The matrix.
    2. $rowA: It should be a positive integer. The row of the matrix.
    3. $columnA: It should be a positive integer. The column of the matrix.
  expected returned value length: 0
  expected returned value: Null
=cut

sub print_matrix {
	
	my @matrixA = $_[0];
	my $rowA = $_[1];
	my $columnA = $_[2];	

	foreach my $m (0..$rowA - 1)
	{
		foreach my $n (0..$columnA - 1)
		{
			print($matrixA[$m][$n]);
			print(" ");
		}
		print("\n");
	}	
}

=begin
  subroutine name: input_one
  subroutine intro: To fetch all element of a matrix from <STDIN> (i.e. an input stream). One inputs the row of the matrix, column of that and all elements by row, respectively.
  expected subroutine paras length: 1
  expected subroutine paras:
    1.$matrixName: It should be a string. Indicates the name of the matrix.
  expected returned value length: 
  expected returned value:
	1. @matrixA: It should be array type. The matrix.
    2. $rowA: It should be a positive integer or -1. Return the row of the matrix in other case. If the size from given input can NOT make a matrix, then return -1.
    3. $columnA: It should be a positive integer or -1. The column of the matrix. If the size from given input can NOT make a matrix, then return -1.
=cut

sub input_one {
	my $matrixName = $_[0];

	my @matrixA = ();
	my $rowA;
	my $columnA;
	
	print "Please fill in a matrix named ".$matrixName."."."\n";
	print "\t".$matrixName." rows:";
	chomp($rowA = <>); # CHOMP TO TAKE USER INPUT
	print "\t".$matrixName." columns:";
	chomp($columnA = <>);

	if($rowA<=0 || $columnA<=0){
		return ((),-1,-1);
	}

	print "Enter $rowA * $columnA elements in ".$matrixName.":"."\n"; 

	foreach my $m (0..$rowA - 1)
	{
		foreach my $n (0..$columnA - 1)
		{
			chomp($matrixA[$m][$n] = <>); # TO READ THE VALUES
		}
	}

	print("In input_one subroutine,");
	print("\n");
	print($rowA);
	print("\n");
	print($columnA);
	print("\n");

	foreach my $m (0..$rowA - 1)
	{
		foreach my $n (0..$columnA - 1)
		{
			chomp($matrixA[$m][$n] = <>); # TO READ THE VALUES
		}
	}

	return (@matrixA,$rowA,$columnA);
}

=begin
  subroutine name: input_two
  subroutine intro: To fetch all element of two matrices from <STDIN> (i.e. an input stream). One inputs the row of the matrix, column of that and all elements by row, respectively, then repeats it twice.
  expected subroutine paras length: 2
  expected subroutine paras:
    1.$matrixNameA: It should be a string. Indicates the name of the first matrix.
	2.$matrixNameB: It should be a string. Indicates the name of the second matrix.
  expected returned value length: 6
  expected returned value:
	1. @matrixA: It should be array type. The first matrix.
    2. $rowA: It should be a positive integer or -1. Return the row of the matrix in other case. If the size from given input can NOT make a matrix, then return -1.
    3. $columnA: It should be a positive integer or -1. The column of the matrix. If the size from given input can NOT make a matrix, then return -1.
	4. @matrixB: It should be array type. The second matrix.
    5. $rowB: It should be a positive integer or -1. Return the row of the matrix in other case. If the size from given input can NOT make a matrix, then return -1.
    6. $columnB: It should be a positive integer or -1. The column of the matrix. If the size from given input can NOT make a matrix, then return -1.
=cut

sub input_two {

	my $matrixNameA = $_[0];
	my $matrixNameB = $_[1];

	my @matrixA = ();
	my @matrixB =();
	my $rowA;
	my $columnA;
	my $rowB;
	my $columnB;

	(@matrixA,$rowA,$columnA) = input_one($matrixNameA);
	(@matrixB,$rowB,$columnB) = input_one($matrixNameB);

	if($rowA==-1||$rowB==-1){
		return ((),(),-1,-1,-1,-1);
	}

	return (@matrixA,@matrixB,$rowA,$columnA,$rowB,$columnB);
}

=begin
  subroutine name: addition
  subroutine intro: To add two matrices from <STDIN>. If the size does NOT match 
  		(i.e. NOT ( ( $rowA == $rowB and $columnA == $columnB ) and ( $rowA >= 1 and $columnA>= 1 and $rowB >= 1 and $columnB >= 1) ) is evaluated to true), 
  					it is NOT allowed to add two matrices. In this case, it will return ( (),-1,-1)
  expected subroutine paras length: 2
  expected subroutine paras:
	1. @matrixA: It should be array type. The first matrix.
    2. $rowA: It should be a positive integer.
    3. $columnA: It should be a positive integer.
	4. @matrixB: It should be array type. The second matrix.
    5. $rowB: It should be a positive integer. 
    6. $columnB: It should be a positive integer.
  expected returned value length: 3
  expected returned value:
  	1.@Resultant: It should be array type. The resultant matrix after addition. See above  [`subroutine intro`](#subroutine-intro).
	2.$rowA: It should be a positive integer or -1. The row of resultant matrix. See above  [`subroutine intro`](#subroutine-intro).
	3.$columnA: It should be a positive integer or -1. The column of resultant matrix. See above  [`subroutine intro`](#subroutine-intro).
=cut

sub addition {

	my (@MatrixA,@MatrixB,$rowA,$columnA,$rowB,$columnB)=($_[0],$_[1],$_[2],$_[3],$_[4],$_[5]);
	
	my @Resultant = ();

	if ( ( $rowA == $rowB and $columnA == $columnB ) and ( $rowA >= 1 and $columnA>= 1 and $rowB >= 1 and $columnB >= 1) )
	{	
		# sum of Matrices
		foreach my $m (0..$rowB - 1)
		{
			foreach my $n (0..$columnB - 1)
			{
				$Resultant[$m][$n] = $MatrixA[$m][$n];
			}
		}
		foreach my $m (0..$rowB - 1)
		{
			foreach my $n (0..$columnB - 1)
			{
				$Resultant[$m][$n] = $MatrixB[$m][$n];
			}
		}
		return (@Resultant,$rowA,$columnA);
	}
	# Error if Matrices are of different order
	else
	{
		print "Either the size of two matrices does not MATCH or one of the size of two matrices is NOT a positive integer, it is not possible to add these two matrix.";
		return ((),-1,-1);
	}
}


1;
