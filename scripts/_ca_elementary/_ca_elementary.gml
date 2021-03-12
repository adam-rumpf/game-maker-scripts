/// @func _ca_elementary(input, rule[, base[, circular]])
/// @desc Computes one iteration of a given elementary cellular automaton for a given input array.
/// @requires _ca_wolfram_decode
/// @requires _k_tuples
/// @param {int[]} input - Array of binary input values.
/// @param {int} rule - Wolfram code number for the elementary CA rule. Should be an integer from 0 to 255 (in the case of base 2).
/// @param {int} [base=2] - Number base.
/// @param {bool} [circular=false] - If true, the edges of the array are considered to be adjacent.
/// @return {int[]} Binary array resulting from one iteration of the given CA rule on the input array.

/**
 * Note: This function involves generating a map of tuples converted into strings.
 * Because of this, there may be key collisions if a base larger than 9 is used (although that would also lead to a prohibitively large number of tuples to begin with).
 * In addition, this function requires generating a map of rule correspondences each time it is executed.
 * In practice it would be better to implement this as a method in a storage object, to maintain the map between iterations.
 */

function _ca_elementary(input, rule)
{
	// Get optional arguments
	var base = (argument_count > 2 ? argument[2] : 2);
	var circular = (argument_count > 3 ? argument[3] : false);
	
	// Get input length
	var n = array_length(input);
	if (n < 3)
		return undefined;
	
	// Decode Wolfram code rule
	var arr = _ca_wolfram_decode(rule, 3, base);
	
	// Generate a map of input/output pairs, using a string version of each neighborhood tuple as a key
	var tuples = _k_tuples(3, base, true); // list of k-tuples
	var map = ds_map_create(); // rule map
	for (var i = 0; i < array_length(tuples); i++)
	{
		// Convert tuple to string
		var str = string(tuples[i][0]) + string(tuples[i][1]) + string(tuples[i][2]);
		
		// Use the string as a map for the rule
		ds_map_add(map, str, arr[i]);
	}
	
	// Generate an output array by looking at each 3-tuple of inputs in order
	var out = array_create(n, 0);
	for (var i = 1; i < n - 1; i++)
	{
		// Generate neighborhood string
		var str = string(input[i-1]) + string(input[i]) + string(input[i+1]);
		
		// Apply rule map to find output
		out[i] = ds_map_find_value(map, str);
	}
	
	// If circular, generate endpoints
	if (circular == true)
	{
		// Left endpoint
		var str = string(input[n-1]) + string(input[0]) + string(input[1]);
		out[0] = ds_map_find_value(map, str);
		
		// Right endpoint
		str = string(input[n-2]) + string(input[n-2]) + string(input[0]);
		out[n-1] = ds_map_find_value(map, str);
	}
	
	// Return result
	return out;
}
