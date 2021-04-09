/// @func _cubic_spline_coefficients(x, y)
/// @desc Calculates the coefficients for a natural cubic spline interpolating a set of points.
/// @requires _tridiagonal_solve
/// @param {real[]} x - Sample inputs, as a 1D array in ascending order.
/// @param {real[]} y - Sample outputs, as a 1D array the same length as the input array.
/// @return {real[][]} Set of coefficients to define each segment of the natural cubic spline (see documentation for details), undefined in case of error.
/**
 * For a data set of the form [x0, x1, ..., xn], [y0, y1, ..., yn], the natural cubic spline
 * consists of n-1 piecewise polynomials of the form:
 *     si(x) = ai (x-xi)^3 + bi (x-xi)^2 + ci (x-xi) + di
 * on interval (xi, x(i+1)). The spline is twice differentiable with a second derivative
 * that vanishes at x0 and xn.
 *
 * The return value of this function is a list of 4 lists, each of length n-1 and consisting
 * of the coefficients of the form:
 *     [
 *         [a0, a1, ..., a(n-1)],
 *         [b0, b1, ..., b(n-1)],
 *         [c0, c1, ..., c(n-1)],
 *         [d0, d1, ..., d(n-1)]
 *     ]
 */

function _cubic_spline_coefficients(xx, yy)
{
	// Verify that argument lists have equal length
	if (array_length(xx) != array_length(yy))
		return undefined;
	
	// Get length of data lists
	var n = array_length(xx);
	
	// Calculate interval differences in x and y
	var dx, dy;
	dx = array_create(n-1);
	dy = array_create(n-1);
	for (var i = 0; i < n-1; i++)
	{
		dx[i] = xx[i+1] - xx[i];
		dy[i] = yy[i+1] - yy[i];
	}
	
	// Define a tridiagonal system to calculate the quadratic coefficients
	var upper, lower, diag, rhs;
	upper = array_create(n-1, 0); // upper diagonal
	lower = array_create(n-1, 0); // lower diagonal
	diag = array_create(n, 1); // main diagonal
	rhs = array_create(n, 0); // constant vector
	for (var i = 1; i < n-1; i++)
	{
		lower[i-1] = dx[i-1];
		upper[i] = dx[i];
		diag[i] = 2*(dx[i-1] + dx[i]);
		rhs[i] = 3*((dy[i]/dx[i]) - (dy[i-1]/dx[i-1]));
	}
	
	// Solve for quadratic coefficients
	var bb = _tridiagonal_solve(lower, diag, upper, rhs);
	
	// Substitute to solve for remaining coefficients, and trim long coefficient arrays
	var a, b, c, d;
	a = array_create(n-1);
	b = array_create(n-1);
	c = array_create(n-1);
	d = array_create(n-1);
	for (var i = 0; i < n-1; i++)
	{
		// Calculate cubic and linear coefficients
		a[i] = (bb[i+1] - bb[i])/(3*dx[i]);
		c[i] = (dy[i]/dx[i]) - (dx[i]/3)*(2*bb[i] + bb[i+1]);
		
		// Trim quadratic and constant coefficients (constants come directly from data)
		b[i] = bb[i];
		d[i] = yy[i];
	}
	
	// Return all coefficient arrays
	return [a, b, c, d];
}
