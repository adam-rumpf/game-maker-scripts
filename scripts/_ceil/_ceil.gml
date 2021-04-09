/// @func _ceil(x[, step])
/// @desc Rounds a number up to a multiple of a given step size. This generalizes the built-in ceil() function, which uses a step size of 1.
/// @param {real} x - Number to round.
/// @param {real} [step=1.0] - Step size to round to.
/// @return {real} Least multiple of step which is greater than or equal to x.

function _ceil(xx)
{
	// Get step size argument
	var step = (argument_count > 1 ? argument[1] : 1.0);
	
	// Verify that step size is positive
	if (step <= 0)
		return undefined;
	
	// Subtract generalized fractional part from x and add one step
	return xx - (xx mod step) + step;
}
