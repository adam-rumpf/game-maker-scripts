/// @func _invert_permutation(perm)
/// @desc Creates the inverse of a given permutation array.
/// @param {int[]} perm - Permutation array, consisting of a sequence of indices 0, 1, 2, ...
/// @return {int[]} Permutation array which inverts the permutation defined by perm (undefined in case of error).

function _invert_permutation(perm)
{
	// Get array length
	var n = array_length(perm);
	
	// Initialize inverse
	var inv = array_create(n);
	
	// Determine values of inverse array
	for (var i = 0; i < n; i++)
	{
		// Verify that index is within bounds
		if ((perm[i] < 0) || (perm[i] >= n))
			return undefined;
		
		// Reverse mapping
		inv[perm[i]] = i;
	}
	
	return inv;
}
