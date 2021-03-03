/// @func _matrix_det(a)
/// @desc Calculates the determinant of a square matrix using LU decomposition.
/// @requires _matrix_lu
/// @param {real[][]} a - Square matrix.
/// @return {real} Determinant of input matrix.

function _matrix_det(a)
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
	// General case
	else
	{
		// Calculate LU decomposition
		var decomp = _matrix_lu(a);
		
		// Calculate determinant as product of all diagonals
		var prod = 1.0; // final product
		for (var i = 0; i < n; i++)
		{
			prod *= decomp[0][i][i]*decomp[1][i][i];
			
			// Break early if zero
			if (prod == 0)
				break;
		}
		
		// Return product
		return prod;
	}
}
