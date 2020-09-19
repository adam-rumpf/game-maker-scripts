/// @func _vector_distance(u, v[, p])
/// @desc Calculates the distance between two vectors (using the Lp-norm).
/// @requires _vector_norm
/// @param {real[]} u First vector.
/// @param {real[]} v Second vector.
/// @param {real} [p=2] Parameter to define Lp-norm (must be between 1 and infinity, inclusive).
/// @return {real} Distance between vectors u and v (or -1 if an error occurs).

function _vector_distance(u, v)
{
	// Check for optional p argument
	var p = (argument_count > 2 ? argument[2] : 2);
	
	// Verify that vectors are the same dimension
	if (array_length(u) != array_length(v))
		return -1;
	
	// Verify that p >= 1
	if (p < 1)
		return -1;
	
	// Calculate the distance as ||u-v||
	var diff = array_create(array_length(u)); // difference vector
	for (var i = 0; i < array_length(diff); i++)
		diff[i] = u[i] - v[i];
	
	// Return the norm of u-v
	return _vector_norm(diff, p);
}
