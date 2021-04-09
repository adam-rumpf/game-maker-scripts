/// @func _permute(arr, perm)
/// @desc Permutes a given array according to a given permutation array.
/// @param {*[]} arr - Array to be permuted.
/// @param {int[]} perm - Permutation array (length must match arr and consist of consecutive integers 0, 1, 2, ...).
/// @return {*[]} Array consisting of values in arr permutated according to perm (or original array if lengths mismatch).

function _permute(arr, perm)
{
	// Verify that array lengths match
	if (array_length(arr) != array_length(perm))
		return arr;
	
	// Get array length
	var n = array_length(arr);
	
	// Apply permutation
	var arrp = array_create(n); // permuted array
	for (var i = 0; i < n; i++)
	{
		// Verify that index is within bounds
		if ((perm[i] < 0) || (perm[i] >= n))
			return arr;
		
		arrp[i] = arr[perm[i]];
	}
	
	return arrp;
}
