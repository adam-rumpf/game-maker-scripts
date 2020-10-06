/// @func _natural_to_integer(n)
/// @desc Returns a unique integer for a given natural number (beginning with 0), according to the straightforward zig-zagging bijection (0, 1, -1, 2, -2, ...).
/// @param {int} n Natural number for which to generate a unique integer.
/// @return {int} Integer corresponding to natural number n.
/**
 * This function is meant to be the inverse of the _integer_to_natural()
 * function. Both are based on the bijection which maps (0, 1, 2, 3, 4, ...)
 * to (0, 1, -1, 2, -2, ...).
 *
 * For the N -> Z bijection we use the following piecewise definition:
 *        -n/2    if n is even
 *     (n+1)/2    if n is odd
 */

function _natural_to_integer(n)
{
	// Apply piecewise definition depending on the parity of n
	if (n % 2 == 0)
		return floor(-n/2);
	else
		return floor((n+1)/2);
}
