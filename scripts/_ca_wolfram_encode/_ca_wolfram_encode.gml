/// @func _ca_wolfram_encode(states, size[, base])
/// @desc Computes the Wolfram code for a given set of explicitly-listed output states.
/// @requires _k_tuples
/// @param {int[][]} states - Array of arrays of output states (dimensions 'base^size' x 'size'). There must be one element for each possible input tuple, listed in descending order (see _k_tuples).
/// @param {int} size - Size of the neighborhood, which should match the length of each element of the state array.
/// @param {int} [base=2] - Base of the number system.
/// @return {int} Wolfram code (as a positive integer) for the rule defined by the given list of states.

//###
//### Ensure that all 'states' elements are length 'size'
//### Ensure that 'states' includes exactly base^size elements.
//### Validate integer ranges of all elements and input arguments.

//### Add a CA section to the README.
