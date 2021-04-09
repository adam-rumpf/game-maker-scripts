/// @func _matrix_trace(a)
/// @desc Calculates the trace of a square matrix.
/// @param {real[][]} a - Input matrix.
/// @returns {real} Trace (sum of diagonal elements) of input matrix.

function _matrix_trace(a)
{
	// Get matrix dimension and verify that the matrix is square
	var n = array_length(a); // matrix size
	if (array_length(a[0]) != n)
		return undefined;
	
	// Calculate sum of diagonal elements
	var total = 0.0;
	for (var i = 0; i < n; i++)
		total += a[i][i];
	
	return total;
}
