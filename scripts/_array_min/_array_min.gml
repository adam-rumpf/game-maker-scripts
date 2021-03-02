/// @func _array_min(arr[, val])
/// @desc Finds the minimum value (or its index) in an array.
/// @param {real[]} arr - Array to search.
/// @param {bool} [val=true] - If true the minimum value is returned, if false the (first) index of the minimum value is returned.
/// @return {real} Minimum value (or its index) in arr.

function _array_min(arr)
{
	// Check for optional index argument
	var val = (argument_count > 1 ? argument[1] : true);
	
	// Go through array to find smallest value
	var mv = infinity; // minimum value
	var mi = -1; // index of minimum value
	for (var i = 0; i < array_length(arr); i++)
	{
		if (arr[i] < mv)
		{
			mv = arr[i];
			mi = i;
		}
	}
	
	// Return smallest value or its index
	if (val == true)
		return mv;
	else
		return mi;
}
