/// @func _ca_wolfram_decode(code, size[, base])
/// @desc Generates an ordered list of explicit output states corresponding to a given Wolfram code.
/// @requires _decimal_to_base
/// @requires _k_tuples
/// @param {int} code - Wolfram code for the given rule.
/// @param {int} size - Size of the neighborhood, which dictates the lengths of the tuples returned in the output mappings.
/// @param {int} [base=2] - Base of the number system.
/// @return {int[]} Array of output states (dimension 'base^size'), listing the output for every possible neighborhood tuple in descending order (see _k_tuples).

function _ca_wolfram_decode(code, size)
{
	// Get base
	var base = (argument_count > 2 ? argument[2] : 2);
	
	// Convert code number to the specified base
	return _decimal_to_base(code, base, true, power(base, size));
}
