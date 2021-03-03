/// @func _det(a)
/// @desc Calculates the determinant of a square matrix using LU decomposition.
/// @requires _lu
/// @param {real[][]} a - Square matrix.
/// @return {real} Determinant of input matrix.

function _det(a)
{
	// Get matrix dimension and verify that the matrix is square
	var n = array_length(a); // matrix size
	if (array_length(a[0]) != n)
		return undefined;
	
	// 1x1 base case
	if (n == 1)
		return a[0][0];
	// 2x2 base case
	else if (n == 2)
		return a[0][0]*a[1][1] - a[0][1]*a[1][0];
	// Recursive case
	else
	{
		//###
	}
}
