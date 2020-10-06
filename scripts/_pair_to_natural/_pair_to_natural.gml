/// @func _pair_to_natural(m, n)
/// @desc Returns a unique natural number (beginning with 0) for a given ordered pair of natural numbers (via the Cantor pairing function).
/// @param {int} m First nonnegative integer coordinate.
/// @param {int} n Second nonnegative integer coordinate.
/// @return {int} Natural number (at least 0) corresponding to the ordered pair (m, n).

function _pair_to_natural(m, n)
{
	// Apply the definition of the Cantor pairing function
	return floor(((m+n)*(m+n+1))/2 + n);
}
