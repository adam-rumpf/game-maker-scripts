/// @func _round(x[, step[, down]])
/// @desc Rounds a number to the nearest multiple of a given step size. This generalizes the built-in round() function, which uses a step size of 1.
/// @param {real} x - Number to round.
/// @param {real} [step=1.0] - Step size to round to.
/// @param {bool} [down=true] - Whether to round down in case of a tie. If false, rounds up instead.
/// @return {real} Nearest multiple of step to x.

function _round(xx)
{
	// Get step size and direction arguments
	var step = (argument_count > 1 ? argument[1] : 1.0);
	var down = (argument_count > 2 ? argument[2] : true);
	
	// Verify that step size is positive
	if (step <= 0)
		return undefined;
	
	// Get normalized distance between consecutive multiples of the step
	var dist = (xx mod step)/step;
	
	// Use distance to decide rounding direction
	if (dist < 0.5)
	{
		// Round down if less than half
		return xx - (xx mod step);
	}
	else if (dist > 0.5)
	{
		// Round up if more than half
		return xx - (xx mod step) + step;
	}
	else
	{
		// Break ties based on direction argument
		if (down == true)
			return xx - (xx mod step);
		else
			return xx - (xx mod step) + step;
	}
}
