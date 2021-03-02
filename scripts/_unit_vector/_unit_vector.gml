/// @func _unit_vector(u, v)
/// @desc Finds the unit vector pointing from coordinate u to coordinate v.
/// @requires _vector_norm
/// @requires _vector_scale
/// @param {real[]} u - Tail of direction vector.
/// @param {real[]} v - Head of direction vector.
/// @return {real[]} Vector pointing from u to v with norm 1.

function _unit_vector(u, v)
{
	// Verify that vectors are the same dimension
	if (array_length(u) != array_length(v))
		return undefined;
	
	// Calculate the direction vector from u to v.
	var dir = array_create(array_length(u));
	for (var i = 0; i < array_length(u); i++)
		dir[i] = v[i] - u[i];
	
	// Return a rescaled direction vector
	return _vector_scale(dir, 1);
}
