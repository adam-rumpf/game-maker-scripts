/// @func _array_reverse(arr)
/// @desc Reverses a given array.
/// @param {*[]} arr - Array to be reversed.
/// @return {*[]} The input array with its elements in reversed order.

function _array_reverse(arr)
{
	// Read input array into an output array in reverse order
	var n = array_length(arr); // array length
	var out = array_create(n);
	for (var i = 0; i < n; i++)
		out[i] = arr[n-i-1];
	
	return out;
}
