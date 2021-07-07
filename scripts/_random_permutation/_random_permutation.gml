/// @func _random_permutation(n)
/// @desc Generates a random permutation array of a given length.
/// @param {int} n - Length of permutation array.
/// @return {int[]} Uniform random permutation of the array [0, 1, ..., n-1].

function _random_permutation(n)
{
	// Create a priority queue with random priorities
	var q = ds_priority_create();
	for (var i = 0; i < n; i++)
		ds_priority_add(q, i, irandom_range(0, 10000000));
	
	// Load elements of priority queue into an output array
	var arr = array_create(n);
	for (var i = 0; i < n; i++)
	{
		arr[i] = ds_priority_find_max(q);
		ds_priority_delete_max(q);
	}
	ds_priority_destroy(q);
	
	return arr;
}
