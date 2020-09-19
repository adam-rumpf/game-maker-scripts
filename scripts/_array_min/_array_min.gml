/// @func _array_min(arr)
/// @desc Finds the minimum value in an array.
/// @param {real[]} arr Array to search.
/// @return {real} Minimum value in arr.

function _array_min(arr)
{
	// Go through array to find smallest value
	var val = infinity;
	for (var i = 0; i < array_length(arr); i++)
	{
		if (arr[i] < val)
			val = arr[i];
	}
	
	// Return smallest value
	return val;
}
