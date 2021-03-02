/// @func _array_index(arr, val[, start])
/// @desc Finds the first index at which a value occurs in an array.
/// @param {*[]} arr - Array to search.
/// @param {*} val - Value to search for.
/// @param {int} [start=0] - Index to begin searching.
/// @return {int} First index (after start) where val occurs in arr (or -1 if not found).

function _array_index(arr, val)
{
	// Check for optional start argument
	var start = (argument_count > 2 ? argument[2] : 0);
	
	// Go through array until finding the value
	for (var i = start; i < array_length(arr); i++)
	{
		if (arr[i] == val)
			return i;
	}
	
	// If we went through the entire array without finding the value, return -1
	return -1;
}
