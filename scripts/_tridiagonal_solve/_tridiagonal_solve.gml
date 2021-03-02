/// @func _tridiagonal_solve(lower, diag, upper, b)
/// @desc Solves a tridiagonal linear system (via the Thomas algorithm) defined by a given set of diagonal and constant vectors.
/// @param {real[]} lower - Lower diagonal vector (of length 1 less than size of matrix).
/// @param {real[]} diag - Diagonal vector (of length equal to size of matrix).
/// @param {real[]} upper - Upper diagonal vector (of length 1 less than size of matrix).
/// @param {real[]} b - Constant vector (of length equal to size of matrix).
/// @return {real[]} Solution vector of linear system (or undefined if system is singular).

function _tridiagonal_solve(lower, diag, upper, b)
{
	// Verify that dimensions are valid
	var n = array_length(diag); // size of system
	if ((n != array_length(b)) || (n-1 != array_length(lower)) || (n-1 != array_length(upper)))
		return undefined;
	
	// Forward sweep
	var u, bb;
	u = upper; // modified upper diagonal
	bb = b; // modified righthand side
	u[0] = upper[0]/diag[0];
	bb[0] = b[0]/diag[0];
	for (var i = 1; i < n-1; i++)
	{
		var denom = diag[i] - lower[i-1]*u[i-1];
		u[i] = upper[i]/denom;
		bb[i] = (b[i] - lower[i-1]*bb[i-1])/denom;
	}
	bb[n-1] = (b[n-1] - lower[n-2]*bb[n-2])/(diag[n-1] - lower[n-2]*u[n-2]);
	
	// Back substitution
	var xx = array_create(n); // solution vector
	xx[n-1] = bb[n-1];
	for (var i = n-2; i >= 0; i--)
		xx[i] = bb[i] - u[i]*xx[i+1];
	
	return xx;
}
