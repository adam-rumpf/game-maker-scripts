/// @func _range(start, stop[, step])
/// @desc Generates an array of equally-spaced values over a specified range with a specified step size.
/// @param {real} start - First value of array.
/// @param {real} stop - Final value of array (if the step size evenly divides the array; otherwise gives an upper bound to the final value).
/// @param {real} [step=1] - Step size. May be positive if start <= stop and negative otherwise.
/// @return {real[]} Array of values beginning with start, incrementing by step, and ending with the last value that does not extend beyond stop.

function _range(start, stop)
{
	// Check for optional step argument
	var step = (argument_count > 2 ? argument[2] : 1);
	
	// Generate array depending on whether we are counting up or down
	if (step > 0)
	{
		// Counting up
		
		// Verify that bounds are valid
		if (start > stop)
			return [];
		
		// Determine number of elements
		var n = floor((stop - start)/step) + 1;
		
		// Generate array
		var arr = array_create(n);
		for (var i = 0; i < n; i++)
			arr[i] = start + i*step;
		
		return arr;
	}
	else if (step < 0)
	{
		// Counting down
		
		// Verify that bounds are valid
		if (start < stop)
			return [];
		
		// Determine number of elements
		var n = floor(abs((stop - start)/step)) + 1;
		
		// Generate array
		var arr = array_create(n);
		for (var i = 0; i < n; i++)
			arr[i] = start + i*step;
		
		return arr;
	}
	else
		return []; // zero step size
}
