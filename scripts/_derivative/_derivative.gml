/// @func _derivative(arr, dx[, wrap])
/// @desc Numerically approximates the derivative of an array of function values using finite differences.
/// @param {real[]} arr - Array of function values.
/// @param {real} dx - Constant step size between nodes.
/// @param {bool} [wrap=false] - Whether to treat the function as if it "wraps around" (default false).
/// @return {real[]} Array of numerically approximated derivative values.
/**
 * The input array is meant to represent a numerical approximation of a function f(x) of the form
 *     [f(x0), f(x0+dx), f(x0+2dx), f(x0+3dx), ...]
 * where dx is a constant difference between input values.
 *
 * The values in the output array are mostly generated using central differences.
 * If wrap is false, the left and right endpoints are computed using forward and backward differences, respectively.
 * If wrap is true, central differences are used for all values, treating the first element as the successor of the last and the last element as the predecessor of the first.
 *
 * If the input array contains only 1 value or the step size is nonpositive, nothing is returned.
 */

function _derivative(arr, dx)
{
	// Get optional wrap argument
	var wrap = (argument_count > 2 ? argument[2] : false);
	
	// Validate inputs
	if ((dx <= 0) || (array_length(arr) < 2))
		return undefined;
	
	// Initialize output array
	var n = array_length(arr); // number of elements
	var ddx = 2*dx; // double step size
	var der = array_create(n);
	
	// Handle the case of an input array of length 2
	if (n == 2)
	{
		if (wrap == true)
			// A wrapped pair of function values has zero average rate of change
			return [0, 0];
		else
		{
			// Constant slope between two points
			der[0] = (arr[1] - arr[0])/dx;
			return [der[0], der[0]];
		}
	}
	
	// Use central differences for all intermediate elements
	for (var i = 1; i < n-1; i++)
		der[i] = (arr[i+1] - arr[i-1])/ddx;
	
	// Evaluate endpoints depending on whether the function wraps
	if (wrap == true)
	{
		// If wrapping, use central difference
		der[0] = (arr[1] - arr[n-1])/ddx;
		der[n-1] = (arr[0] - arr[n-2])/ddx;
	}
	else
	{
		// Otherwise use forward and backward difference at the endpoints
		der[0] = (der[1] - der[0])/dx;
		der[n-1] = (der[n-1] - der[n-2])/dx;
	}
	
	return der;
}
