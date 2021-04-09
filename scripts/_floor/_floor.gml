/// @func _floor(x[, step])
/// @desc Rounds a number down to a multiple of a given step size. This generalizes the built-in floor() function, which uses a step size of 1.
/// @param {real} x - Number to round.
/// @param {real} [step=1.0] - Step size to round to.
/// @return {real} Greatest multiple of step which is less than or equal to x.

function _floor(xx)
{
	// Get step size argument
	var step = (argument_count > 1 ? argument[1] : 1.0);
	
	// Verify that step size is positive
	if (step <= 0)
		return undefined;
	
	// Subtract generalized fractional part from x
	return xx - (xx mod step);
}
