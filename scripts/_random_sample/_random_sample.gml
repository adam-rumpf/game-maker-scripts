/// @func _random_sample(arr[, n[, rep]])
/// @desc Generates random samples from a given array (either with or without replacement).
/// @param {*[]} arr - Array to gather samples from.
/// @param {int} [n=1] - Number of samples to gather. If n=1 a scalar is returned, and otherwise an array of samples is returned.
/// @param {bool} [rep=true] - True if sampling with replacement and false otherwise, in which case n is capped at the length of the input array.
/// @return {*[]} Sample or array of samples (if n>1).

function _random_sample(arr)
{
	// Check for optional arguments
	var n = (argument_count > 1 ? argument[1] : 1);
	var rep = (argument_count > 2 ? argument[2] : true);
	
	// Get array length
	var m = array_length(arr);
	
	// If only gathering one sample, return a random scalar
	if (n == 1)
		return arr[irandom(m-1)];
	
	// If sampling without replacement, cap number of samples at array length
	if (rep == false)
		n = min(n, m);
	
	// Select samples
	var s = array_create(n); // sample array
	if (rep == true)
	{
		// If replacing, simply choose a random index repeatedly
		for (var i = 0; i < n; i++)
			s[i] = arr[irandom(m-1)];
	}
	else
	{
		// If not replacing, create a priority queue of choices with random priorities
		var q = ds_priority_create();
		for (var i = 0; i < m; i++)
			ds_priority_add(q, arr[i], irandom(10000000));
		
		// Draw the specified number of choices
		for (var i = 0; i < n; i++)
		{
			s[i] = ds_priority_find_max(q);
			ds_priority_delete_max(q);
		}
		
		// Destroy priority queue
		ds_priority_destroy(q);
	}
	
	// Return sample array
	return s;
}
