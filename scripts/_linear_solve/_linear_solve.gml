/// @func _linear_solve(a, b)
/// @desc Solves a linear system of the form Ax = b (via Gaussian elimination) for a given coefficient matrix and constant vector.
/// @requires _triangular_solve
/// @param {real[]} a Square coefficient matrix (as a 2D array).
/// @param {real[]} b Constraint vector (as a 1D array whose length matches a).
/// @return {real[]} Solution vector x of the linear system Ax = b (undefined in case of inconsistent dimensions or singular matrix).

function _linear_solve(a, b)
{
	// Verify that the inputs have compatible dimensions
	if ((array_length(a) != array_length(a[0])) || (array_length(a) != array_length(b)))
		return undefined;
	
	// Initialize system
	var n, l, u;
	n = array_length(b); // size of system
	l = array_create(n, array_create(n, 0)); // lower triangular matrix
	for (var i = 0; i < n; i++)
		l[i][i] = 1; // initialize as identity matrix
	u = a; // upper triangular matrix
	
	// Perform Gaussian elimination to obtain LU decomposition
	for (var i = 0; i < n-1; i++)
	{
		for (var j = i+1; j < n; j++)
		{
			// Verify that we are not dividing by zero
			if (u[i][i] == 0)
				return undefined;
			
			l[j][i] = u[j][i]/u[i][i];
			for (var k = i; k < n; k++)
				u[j][k] = u[j][k] - l[j][i]*u[i][k];
		}
	}
	
	// Solve Ly = b
	var yy = _triangular_solve(l, b, false);
	
	// Solve Ux = y
	return _triangular_solve(u, yy, true);
}
