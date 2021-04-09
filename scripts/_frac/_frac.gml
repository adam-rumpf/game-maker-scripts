/// @func _frac(x[, step])
/// @desc Finds the fractional part of a number above a multiple of a given step size. This generalizes the built-in frac() function, which uses a step size of 1.
/// @param {real} x - Number to find the fractional part of.
/// @param {real} [step=1.0] - Step size.
/// @return {real} Amount by which x exceeds the greatest multiple of step that does not exceed x. Equivalent to x - _floor(x, step).

function _frac(xx)
{
	// Get step size argument
	var step = (argument_count > 1 ? argument[1] : 1.0);
	
	// Verify that step size is positive
	if (step <= 0)
		return undefined;
	
	// Find the generalized fractional part
	return (xx mod step);
}
