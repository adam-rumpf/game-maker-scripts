/// @func _k_tuples(k[, b[, descending]])
/// @desc Generates an array of every possible k-tuple of base-b integers, in lexicographically ascending (or descending) order.
/// @requires _decimal_to_base
/// @param {int} k - Number of elements in each k-tuple.
/// @param {int} [b=2] - Base of the number system.
/// @param {bool} [descending=false] - Whether to list the tuples in descending order rather than ascending.
/// @return {int[][]} Array of every possible base-b k-tuple, in the specified order (or an empty array in case of error).

function _k_tuples(k)
{
	// Get optional arguments
	var b = (argument_count > 1 ? argument[1] : 2);
	var descending = (argument_count > 2 ? argument[2] : false);
	
	// Validate arguments
	k = floor(k);
	b = floor(b);
	if ((k < 1) || (b < 2))
		return [];
	
	// Initialize output array
	var tuples = array_create(power(b, k), array_create(k, 0));
	
	// Loop through all numbers in ascending or descending order
	for (var i = 0; i < power(b, k); i++)
	{
		// Find array coordinate to use depending on whether the sequence is ascending or descending
		var row = i;
		if (descending == true)
			row = power(b, k) - i - 1;
		
		// Convert to base b (with padding)
		var arr = _decimal_to_base(i, b, true, k);
		
		// Read digits into tuple array
		for (var j = 0; j < k; j++)
			tuples[row][j] = arr[j];
	}
	
	return tuples;
}
