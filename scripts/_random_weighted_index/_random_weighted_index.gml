/// @func _random_weighted_index(wt)
/// @desc Returns a random array index with probabilities defined by a given weight array.
/// @param {real[]} wt Array of weights (corresponding to indices 0, 1, 2, ...). Negative weights are treated as zero.
/// @return {int} Randomly chosen array index.

function _random_weighted_index(wt)
{
	// Calculate total weight
	var tot, n;
	tot = 0.0; // total weight
	n = array_length(wt); // number of indices
	for (var i = 0; i < n; i++)
	{
		// Ignore negative weights
		if (wt[i] < 0)
			continue;
		
		tot += wt[i];
	}

	// Generate a random number
	var r = random_range(0, tot);

	// Find which interval this number belongs to
	var i = 0;
	while (r > 0 && i < n)
	{
		r -= wt[i];
		i++;
	}

	// Return the specified index
	return i-1;
}
