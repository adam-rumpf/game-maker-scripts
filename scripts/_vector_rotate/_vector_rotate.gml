/// @func _vector_rotate(v, theta)
/// @desc Rotates a 2D vector by a specified angle (in radians counterclockwise).
/// @param {real[]} v - 2D vector to rotate.
/// @param {real} theta - Angle of rotation (in radians, with positive being counterclockwise).
/// @return {real[]} Rotated 2D vector.

function _vector_rotate(v, theta)
{
	// Verify that the vector is 2D
	if (array_length(v) != 2)
		return v;
	
	// Apply a rotation vector (negate angle to account for inverted y-axis)
	return [v[0]*cos(-theta) - v[1]*sin(-theta), v[0]*sin(-theta) + v[1]*cos(-theta)];
}
