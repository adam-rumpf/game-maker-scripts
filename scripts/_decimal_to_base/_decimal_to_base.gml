/// @func _decimal_to_base(num, b[, descending[, padding]])
/// @desc Converts a given decimal number to base b. Returns an array of base-b digits.
/// @param {int} num - Nonnegative integer to convert.
/// @param {int} b - Nonnegative integer base to convert to.
/// @param {bool} [descending=false] - Whether to return the digits in descending order of significance rather than ascending.
/// @param {int} [padding=0] - Minimum number of digits to include, which may result in adding zeros to pad the output array.
/// @return {int[]} Array of base-b digits, in ascending order of significance beginning with the 1's place.

function _decimal_to_base(num, b)
{
	// Get optional padding argument
	var descending = (argument_count > 2 ? argument[2] : false);
	var padding = (argument_count > 3 ? argument[3] : 0);
	
	// Handle the zero case
	if (num == 0)
		return array_create(max(padding, 1), 0);
	
	// Get array length
	var len = max(floor(logn(b, num)+1), padding);
	
	// Iteratively evaluate quotients and remainders after division by the base
	var arr = array_create(len, 0); // initialize array with the number of needed digits
	var total = num; // running total of the given number
	for (var n = 0; n < array_length(arr); n++)
	{
		// If descending, load array in reverse order
		if (descending == true)
			arr[len-n-1] = total mod b;
		else
			arr[n] = total mod b;
		total = floor(total/b);
	}
	
	return arr;
}
