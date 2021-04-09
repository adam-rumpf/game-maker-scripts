/// @func _root_newton(f, fp, x0[, err[, cutoff]])
/// @func Finds the root of a real-valued, differentiable function from an initial guess using Newton's method.
/// @param {function} f - Differentiable function (which maps reals to reals) to find the root of.
/// @param {function} fp - First derivative of function.
/// @param {real} x0 - Initial guess.
/// @param {real} [err=0.01] - Error bound to use as a cutoff criterion. The search ends as soon as the absolute function value falls below this bound.
/// @param {int} [cutoff=100] - Iteration cutoff. The search ends as soon as the number of iterations crosses this bound, regardless of the error.
/// @return {real} Estimate of root (or undefined in case of problem).

function _root_newton(f, fp, x0)
{
	// Check for optional arguments
	var err = (argument_count > 3 ? argument[3] : 0.01);
	var cutoff = (argument_count > 4 ? argument[4] : 100);
	
	// Initialize guess and corresponding function values
	var xx, fx, fpx;
	xx = x0; // current guess
	fx = f(xx); // function value for current guess
	fpx = fp(xx); // derivative of function guess
	
	// Main search loop (error is absolute value of function value)
	var iter = 0; // iteration number
	while ((abs(fx) > err) && (iter < cutoff))
	{
		iter++;
		
		// Check for division by zero
		if (fpx == 0)
			return undefined;
		
		// Newton iteration
		xx -= fx/fpx;
		
		// Update function values
		fx = f(xx);
		fpx = fp(xx);
	}
	
	// Return latest guess
	return xx;
}
