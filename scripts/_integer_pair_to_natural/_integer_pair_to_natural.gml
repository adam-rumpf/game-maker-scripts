/// @func _integer_pair_to_natural(m, n)
/// @desc Returns a unique natural number (beginning with 0) for a given ordered pair of integers.
/// @requires _integer_to_natural
/// @requires _natural_pair_to_natural
/// @param {int} m - First integer coordinate.
/// @param {int} n - Second integer coordinate.
/// @return {int} Natural number (at least 0) corresponding to the ordered pair (m, n).

function _integer_pair_to_natural(m, n)
{
	// Compose _natural_pair_to_natural on _integer_to_natural
	var np = [_integer_to_natural(m), _integer_to_natural(n)];
	return _natural_pair_to_natural(np[0], np[1]);
}
