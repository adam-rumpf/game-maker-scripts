/// @func _triangular_solve(a, b[, upper])
/// @desc Solves a triangular system of the form Ax = b for a given triangular coefficient matrix and constant vector.
/// @param {real[][]} a - Triangular, square coefficient matrix.
/// @param {real[]} b - Constant vector (as a 1D array whose length matches a).
/// @param {bool} [upper=true] - True if a is upper triangular, false if a is lower triangular.
/// @return {real[]} Solution vector x of the triangular system Ax = b (undefined in case of inconsistent dimensions or singular matrix).

function _triangular_solve(a, b)
{
	// Check for optional upper argument
	var upper = (argument_count > 2 ? argument[2] : true);
	
	// Verify that the inputs have compatible dimensions
	if ((array_length(a) != array_length(a[0])) || (array_length(a) != array_length(b)))
		return undefined;
	
	// Initialize system
	var n, xx;
	n = array_length(b); // size of system
	xx = array_create(n); // solution vector
	
	// Verify that no diagonal element is zero
	for (var i = 0; i < n; i++)
	{
		if (a[i][i] == 0)
			return undefined;
	}
	
	// Separate procedure for upper or lower triangular systems
	if (upper == true)
	{
		// Use back substitution for upper triangular
		for (var i = n-1; i >= 0; i--)
		{
			xx[i] = b[i];
			for (var j = i+1; j < n; j++)
				xx[i] -= a[i][j]*xx[j];
			xx[i] /= a[i][i];
		}
	}
	else
	{
		// Use forward substitution for lower triangular
		for (var i = 0; i < n; i++)
		{
			xx[i] = b[i];
			for (var j = 0; j < i; j++)
				xx[i] -= a[i][j]*xx[j];
		}
	}
	
	return xx;
}
