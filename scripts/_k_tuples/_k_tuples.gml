/// @func _k_tuples(k[, b[, descending]])
/// @desc Generates an array of every possible k-tuple of base-b integers, in lexicographically ascending (or descending) order.
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
	if (descending == false)
	{
		for (var i = 0; i < power(b, k); i++)
		{
			// Convert to base b
		}
	}
	else
	{
		for (var i = power(b, k) - 1; i >= 0; i--)
		{
			
		}
	}
}
