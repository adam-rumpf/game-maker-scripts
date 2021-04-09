/// @func _array_function(f, arr)
/// @desc Applies a given function to every value in an array.
/// @param {function} f - Function to be applied. Should accept a single input.
/// @param {*[]} arr - 1D array to apply function to.
/// @return {*[]} Array consisting of f applied to every value in arr.

function _array_function(f, arr)
{
	// Get array size
	var n = array_length(arr);
	
	// Apply function to all values in input array
	var out = array_create(n); // output array
	for (var i = 0; i < n; i++)
		out[i] = f(arr[i]);
	
	// Return output array
	return out;
}
