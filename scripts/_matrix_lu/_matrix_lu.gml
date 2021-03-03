/// @func _matrix_lu(a)
/// @desc Produces the LU factorization of a square matrix, decomposing it into a lower triangular and an upper triangular matrix.
/// @param {real[][]} a - Square matrix.
/// @return {real[][][]} Pair of 2D arrays of the form [L, U], where L is lower triangular and U is upper triangular.

function _matrix_lu(a)
{
	// Get matrix dimension and verify that the matrix is square
	var n = array_length(a); // matrix size
	if (array_length(a[0]) != n)
		return undefined;
	
	//###
}
