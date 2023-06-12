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
	
	// Calculate the direction vector from u to v and rescale it
	return _vector_scale(array_map(u, method({ v: v }, function(value, index) {
        return self.v[index] - value;
    })), 1);
}
