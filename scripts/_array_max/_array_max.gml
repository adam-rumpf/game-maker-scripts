/// @func _array_max(arr)
/// @desc Finds the maximum value in an array.
/// @param {real[]} arr Array to search.
/// @return {real} Maximum value in arr.

function _array_max(arr)
{
	// Go through array to find largest value
	var val = -infinity;
	for (var i = 0; i < array_length(arr); i++)
	{
		if (arr[i] > val)
			val = arr[i];
	}
	
	// Return largest value
	return val;
}
