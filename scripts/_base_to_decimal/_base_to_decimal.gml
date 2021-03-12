/// @func _base_to_decimal(arr, b[, descending])
/// @desc Converts a given base-b number to decimal, based on an array of base-b digits.
/// @param {int[]} arr - Array of nonnegative integer base-b digits.
/// @param {int} b - Nonnegative integer base to convert from.
/// @param {bool} [descending=false] - Whether to interpret the digits in descending order of significance rather than ascending.
/// @return {int} Decimal value equivalent to base-b value, interpreted using its digits in ascending order of significance.

function _base_to_decimal(arr, b)
{
	// Get optional argument
	var descending = (argument_count > 2 ? argument[2] : false);
	
	// Get array length
	var len = array_length(arr);
	
	// Calculate a linear combination of ascending powers of the base
	var total = 0; // running total
	for (var n = 0; n < len; n++)
	{
		// If descending, use array in reverse order
		if (descending == true)
			total += power(b, n) * arr[len-n-1];
		else
			total += power(b, n) * arr[n];
	}
	
	return total;
}
