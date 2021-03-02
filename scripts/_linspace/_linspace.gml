/// @func _linspace(start, stop, n)
/// @desc Generates a specified number of equally-spaced values within a specified range.
/// @param {real} start - First value of array.
/// @param {real} stop - Last value of array.
/// @param {int} n - Number of values in array. Must be at least 2 (unless the endpoints are equal).
/// @return {real[]} An array with first value start, final value stop, and a total of n elements (or empty array in case of error).

function _linspace(start, stop, n)
{
	// Verify that number of elements is valid
	if (n < 2)
	{
		// n=1 is allowed only if the endpoints are equal
		if ((start == stop) && (n == 1))
			return [start];
		
		// Otherwise we return an empty array
		return [];
	}
	
	// Determine step size
	var step = (stop - start)/(n - 1);
	
	// Generate array
	var arr = array_create(n);
	for (var i = 0; i < n-1; i++)
		arr[i] = start + i*step;
	arr[n-1] = stop; // ensure that final value is exact
	
	return arr;
}
