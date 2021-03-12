/// @func _decimal_to_base(num, b)
/// @desc Converts a given decimal number to base b. Returns an array of base-b digits.
/// @param {int} num - Nonnegative integer to convert.
/// @param {int} b - Nonnegative integer base to convert to.
/// @return {int[]} Array of base-b digits, in ascending order of significance beginning with the 1's place.

function _decimal_to_base(num, b)
{
	// Handle the zero case
	if (num == 0)
		return [0];
	
	// Iteratively evaluate quotients and remainders after division by the base
	var arr = array_create(floor(logn(b, num)+1)); // initialize array with the number of needed digits
	var total = num; // running total of the given number
	for (var n = 0; n < array_length(arr); n++)
	{
		arr[n] = total mod b;
		total = floor(total/b);
	}
	
	return arr;
}
