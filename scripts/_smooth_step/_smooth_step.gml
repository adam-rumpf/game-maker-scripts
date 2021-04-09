/// @func _smooth_step(x)
/// @desc Increases smoothly from 0 to 1 over the interval [0, 1]. Clamps to [0, 1] otherwise.
/// @param {real} x - Input variable.
/// @return {real} Value between 0 and 1.

function _smooth_step(xx)
{
	// Apply piecewise definition
	if (xx <= 0)
		return 0.0;
	else if (xx >= 1)
		return 1.0;
	else
		return (3 - 2*xx)*xx*xx;
}
