/// @func _natural_to_pair(x)
/// @desc Returns a unique ordered pair of natural numbers (beginning with 0) for a given natural numbers (via the inverse Cantor pairing function).
/// @param {int} x Nonnegative integer for which to find a coordinate.
/// @return {int[]} Array of length 2 containing a pair of natural numbers (at least 0) corresponding to the input number.

function _natural_to_pair(xx)
{
	// Apply the inverse Cantor pairing function
	var sum = floor((sqrt(8*xx+1)-1)/2);
	var triangle = (sqr(sum)+sum)/2;
	var yy = xx - triangle;
	return [sum - yy, yy];
}
