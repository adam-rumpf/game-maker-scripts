/// @func _cubic_spline_evaluate(a, b, c, d, x, t)
/// @desc Evaluates a - natural cubic spline at point t for coefficient vectors a, b, c, and d and input data vector x.
/// @param {real[]} a - Vector of cubic coefficients [a0, a1, ..., a(n-1)].
/// @param {real[]} b - Vector of quadratic coefficients [b0, b1, ..., b(n-1)].
/// @param {real[]} c - Vector of linear coefficients [c0, c1, ..., c(n-1)].
/// @param {real[]} d - Vector of contant coefficients [d0, d1, ..., d(n-1)].
/// @param {real[]} x - Vector of sample input values [x0, x1, ..., xn], in ascending order.
/// @param {real} t - Value at which to evaluate the spline.
/// @return {real} Value of spline function evaluated at point t, depending on which interval if falls into, undefined in case of array size mismatch.
/**
 * For a data set of the form [x0, x1, ..., xn], [y0, y1, ..., yn], the cubic spline
 * consists of n-1 piecewise polynomials of the form:
 *     si(x) = ai (x-xi)^3 + bi (x-xi)^2 + ci (x-xi) + di
 * on interval (xi, x(i+1)).
 */

function _cubic_spline_evaluate(a, b, c, d, xx, t)
{
	// Verify that all arguments have the appropriate length
	var n = array_length(xx);
	if ((array_length(a) != n-1) || (array_length(b) != n-1) || (array_length(c) != n-1) || (array_length(d) != n-1))
		return undefined;
	
	// Find which subinterval the input value belongs to
	var ii = 0; // index of subinterval
	while ((t >= xx[ii+1]) && (ii < n-2))
		ii++;
	
	// Evaluate the polynomial using Horner's method and the coefficients for the chosen interval
	var dx = t - xx[ii]; // position within interval
	return ((a[ii]*dx + b[ii])*dx + c[ii])*dx + d[ii];
}
