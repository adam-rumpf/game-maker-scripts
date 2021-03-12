/// @func _decimal_to_base(num, b[, padding])
/// @desc Converts a given decimal number to base b. Returns an array of base-b digits.
/// @param {int} num - Nonnegative integer to convert.
/// @param {int} b - Nonnegative integer base to convert to.
/// @param {int} [padding=0] - Minimum number of digits to include, which may result in adding zeros to pad the output array.
/// @return {int[]} Array of base-b digits, in ascending order of significance beginning with the 1's place.

function _decimal_to_base(num, b)
{
	// Get optional padding argument
	var padding = (argument_count > 2 ? argument[2] : 0);
	
	// Handle the zero case
	if (num == 0)
		return array_create(max(padding, 1), 0);
	
	// Iteratively evaluate quotients and remainders after division by the base
	var arr = array_create(max(floor(logn(b, num)+1), padding), 0); // initialize array with the number of needed digits
	var total = num; // running total of the given number
	for (var n = 0; n < array_length(arr); n++)
	{
		arr[n] = total mod b;
		total = floor(total/b);
	}
	
	return arr;
}
