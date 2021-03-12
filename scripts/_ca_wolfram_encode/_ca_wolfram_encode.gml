/// @func _ca_wolfram_encode(states, size[, base])
/// @desc Computes the Wolfram code for a given set of explicitly-listed output states.
/// @requires _k_tuples
/// @param {int[][]} states - Array of arrays of output states (dimensions 'base^size' x 'size'). There must be one element for each possible input tuple, listed in descending order (see _k_tuples).
/// @param {int} size - Size of the neighborhood, which should match the length of each element of the state array.
/// @param {int} [base=2] - Base of the number system.
/// @return {int} Wolfram code (as a positive integer) for the rule defined by the given list of states, or -1 in case of error.

function _ca_wolfram_encode(states, size)
{
	// Get base
	var base = (argument_count > 2 ? argument[2] : 2);
	
	// Validate arguments
	if (array_length(states) != power(base, size))
		return -1;
	for (var i = 0; i < array_length(states); i++)
	{
		if (array_length(states[i]) != size)
			return -1;
		for (var j = 0; j < array_length(states[i]); j++)
		{
			if ((states[i][j] < 0) || (states[i][j] >= base))
				return -1;
		}
	}
	
	return 1;
}
