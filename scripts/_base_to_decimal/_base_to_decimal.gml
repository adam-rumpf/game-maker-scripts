/// @func _base_to_decimal(arr, b)
/// @desc Converts a given base-b number to decimal, based on an array of base-b digits.
/// @param {int[]} arr - Array of nonnegative integer base-b digits.
/// @param {int} b - Nonnegative integer base to convert from.
/// @return {int} Decimal value equivalent to base-b value, interpreted using its digits in ascending order of significance.

function _base_to_decimal(arr, b)
{
	// Calculate a linear combination of ascending powers of the base
	var total = 0; // running total
	for (var n = 0; n < array_length(arr); n++)
		total += power(b, n) * arr[n];
	
	return total;
}
