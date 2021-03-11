/// @func _ca_wolfram_decode(code, size[, base])
/// @desc Generates an ordered list of explicit output states corresponding to a given Wolfram code.
/// @requires _k_tuples
/// @param {int} code - Wolfram code for the given rule.
/// @param {int} size - Size of the neighborhood, which dictates the lengths of the tuples returned in the output mappings.
/// @param {int} [base=2] - Base of the number system.
/// @return {int[][]} Array of arrays of output states (dimensions 'base^size' x 'size'), listing the output for every possible input tuple in descending order (see _k_tuples).

//###

//### Add a CA section to the README.
