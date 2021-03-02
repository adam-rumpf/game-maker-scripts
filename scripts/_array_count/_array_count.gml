/// @func _array_count(arr, val)
/// @desc Counts the number of occurrences of a value in an array.
/// @param {*[]} arr - Array to search.
/// @param {*} val - Value to count.
/// @return {int} Number of occurrences of val in arr.

function _array_count(arr, val)
{
	// Go through array to tally instances of value
	var count = 0;
	for (var i = 0; i < array_length(arr); i++)
	{
		if (arr[i] == val)
			count++;
	}
	
	// Return final tally
	return count;
}
