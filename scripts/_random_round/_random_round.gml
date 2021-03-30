/// @func _random_round(x[, step])
/// @desc Randomly rounds a real up or down with a probability equal to the fractional part.
/// @param {real} x - Number to be rounded.
/// @param {real} [step=1.0] - Step size to round to.
/// @return {int} Either ceil(x) or floor(x), with the probability of the ceiling being the fractional part of x.

function _random_round(xx)
{
	// Get step size argument
	var step = (argument_count > 1 ? argument[1] : 1.0);
	
	// Verify that step size is positive
	if (step <= 0)
		return undefined;
	
	// Get generalized fractional part of x
	var fraction = (xx mod step);
	
	// Decide random return value based on fractional part
	if (random_range(0.0, 1.0) < fraction)
		return xx - (xx mod step) + step; // round up with probability equal to fractional part
	else
		return xx - (xx mod step); // otherwise round down
}
