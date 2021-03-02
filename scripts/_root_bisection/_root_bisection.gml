/// @func _root_bisection(f, a, b[, err[, cutoff]])
/// @func Finds the root of a real-valued, continuous function on a specified interval using the bisection method.
/// @param {function} f - Function (which maps reals to reals) to find the root of. The signs of f(a) and f(b) must be opposite.
/// @param {real} a - Lower bound of search interval.
/// @param {real} b - Upper bound of search interval.
/// @param {real} [err=0.01] - Error bound to define stopping criterion. The search ends as soon as the bound falls below this value.
/// @param {int} [cutoff=100] - Iteration cutoff. The search ends as soon as the number of iterations crosses this bound, regardless of the error.
/// @return {real} Estimate of root (or undefined in case of problem).

function _root_bisection(f, a, b)
{
	// Check for optional arguments
	var err = (argument_count > 3 ? argument[3] : 0.01);
	var cutoff = (argument_count > 4 ? argument[4] : 100);
	
	// Test for trivial roots at boundaries
	if (f(a) == 0)
		return a;
	if (f(b) == 0)
		return b;
	
	// Verify that sign of function is opposite on boundaries
	if (sign(f(a)) == sign(f(b)))
		return undefined;
	
	// Define local variables for boundaries
	var lb, ub;
	lb = a; // lower bound
	ub = b; // upper bound
	
	// Ensure that boundaries are in order
	if (lb >= ub)
	{
		lb = b;
		ub = a;
	}
	
	// Main search loop (error bound equals half of search interval)
	var iter = 0; // iteration number
	while (((ub - lb)/2 > err) && (iter < cutoff))
	{
		iter++;
		
		// Find midpoint and its sign
		var mid, midsign;
		mid = mean(lb, ub);
		midsign = sign(f(mid));
		
		// Check whether midpoint is a root
		if (f(mid) == 0)
			return mid;
		
		// Choose upper or lower subinterval so that signs of endpoints remain opposite
		if (midsign == sign(f(lb)))
			lb = mid;
		else
			ub = mid;
	}
	
	// Return final midpoint
	return mean(lb, ub);
}
