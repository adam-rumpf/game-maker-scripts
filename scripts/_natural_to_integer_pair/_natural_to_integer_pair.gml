/// @func _natural_to_integer_pair(x)
/// @desc Returns a unique ordered pair of integers for a given natural number.
/// @requires _natural_to_integer
/// @requires _natural_to_natural_pair
/// @param {int} x - Nonnegative integer for which to find a coordinate.
/// @return {int[]} Array of length 2 containing a pair of integers corresponding to the input number.

function _natural_to_integer_pair(xx)
{
	// Compose _natural_to_integer on _natural_to_natural_pair
	var np = _natural_to_natural_pair(xx);
	return [_natural_to_integer(np[0]), _natural_to_integer(np[1])];
}
