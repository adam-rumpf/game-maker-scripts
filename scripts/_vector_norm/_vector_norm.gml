/// @func _vector_norm(v[, p])
/// @desc Calculates a vector Lp-norm.
/// @param {real[]} v Vector to evaluate the norm of.
/// @param {real} [p=2] Parameter to define Lp-norm (must be between 1 and infinity, inclusive).
/// @return {real} Lp-norm of v (or -1 if an error occurs).

function _vector_norm(v)
{
	// Check for optional p argument
	var p = (argument_count > 1 ? argument[1] : 2);
	
	// Verify that p >= 1
	if (p < 1)
		return -1;
	
	// Use separate procedures for finite and infinite p-norms
	if (p == infinity)
	{
		// Infinity-norm
		
		// Calculate the maximum value of |vi|
		var maxval = -infinity;
		for (var i = 0; i < array_length(v); i++)
		{
			if (abs(v[i]) > maxval)
				maxval = abs(v[i]);
		}
		
		// Return the maximum
		return maxval;
	}
	else
	{
		// Finite p-norm
		
		// Calculate the sum of |vi|^p
		var tot = 0;
		for (var i = 0; i < array_length(v); i++)
			tot += power(abs(v[i]), p);
		
		// Return the 1/p power of the sum
		return power(tot, 1/p);
	}
}
