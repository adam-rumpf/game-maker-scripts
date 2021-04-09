/// @func _array_max(arr[, val])
/// @desc Finds the maximum value (or its index) in an array.
/// @param {real[]} arr - Array to search.
/// @param {bool} [val=true] - If true the maximum value is returned, if false the (first) index of the maximum value is returned.
/// @return {real} Maximum value (or its index) in arr.

function _array_max(arr)
{
	// Check for optional index argument
	var val = (argument_count > 1 ? argument[1] : true);
	
	// Go through array to find largest value
	var mv = -infinity; // maximum value
	var mi = -1; // index of maximum value
	for (var i = 0; i < array_length(arr); i++)
	{
		if (arr[i] > mv)
		{
			mv = arr[i];
			mi = i;
		}
	}
	
	// Return largest value or its index
	if (val == true)
		return mv;
	else
		return mi;
}
