/// @func _integer_to_natural(n)
/// @desc Returns a unique natural number (beginning with 0) for a given integer, according to the straightforward zig-zagging bijection (0, 1, -1, 2, -2, ...).
/// @param {int} n Integer for which to generate a unique natural number.
/// @return {int} Natural number (at least 0) corresponding to integer n.
/**
 * This function is meant to be the inverse of the _nautral_to_integer()
 * function. Both are based on the bijection which maps (0, 1, -1, 2, -2, ...)
 * to (0, 1, 2, 3, 4, ...).
 *
 * For the Z -> N bijection we use the following piecewise definition:
 *     |2n|-1    if n > 0
 *     |2n|      if n <= 0
 */

function _integer_to_natural(n)
{
	// Apply piecewise definition depending on the sign of n
	if (n > 0)
		return floor(2*n - 1);
	else
		return floor(-2*n);
}
