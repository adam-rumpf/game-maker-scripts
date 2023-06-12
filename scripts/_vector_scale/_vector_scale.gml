/// @func _vector_scale(v, r[, p])
/// @desc Scales a vector so that it achieves a given (Lp-) norm while maintaining its direction.
/// @requires _vector_norm
/// @param {real[]} v - Vector to scale.
/// @param {real} r - Target norm.
/// @param {real} [p=2] - Parameter to define Lp-norm (must be between 1 and infinity, inclusive).
/// @return {real[]} Rescaled input vector with the specified norm.

function _vector_scale(v, r)
{
	// Check for optional p argument
	var p = (argument_count > 2 ? argument[2] : 2);
	
	// Verify that p >= 1
	if (p < 1)
		return v;
	
	// Calculate initial norm
	var ri = _vector_norm(v, p);
	
	// If the norm is 0, do nothing
	if (ri == 0)
		return v;
	
	// Otherwise rescale each component of the vector
    return array_map(v, method({ f: r / ri }, function(value, index) {
        return value * self.f;
    }));
}
