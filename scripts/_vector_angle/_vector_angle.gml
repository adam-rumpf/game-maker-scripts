/// @func _vector_angle(u, v)
/// @desc Calculates the angle (in radians) between a pair of vectors.
/// @param {real[]} u - First vector.
/// @param {real[]} v - Second vector.
/// @return {real} Measure (in radians) of the acute angle between u and v (returns undefined if dimensions incompatible).

function _vector_angle(u, v)
{
	// Verify that vectors are the same dimension
	if (array_length(u) != array_length(v))
		return undefined;
	
	// Get dimension
	var n = array_length(u);
	
	// Calculate u.v, ||u||, and ||v||
	var uv, unorm, vnorm;
	uv = 0;
	unorm = 0;
	vnorm = 0;
	for (var i = 0; i < n; i++)
	{
		uv += u[i]*v[i];
		unorm += sqr(u[i]);
		vnorm += sqr(v[i]);
	}
	unorm = sqrt(unorm);
	vnorm = sqrt(vnorm);
	
	// If either norm is 0, return 0
	if ((unorm == 0) || (vnorm == 0))
		return 0;
	
	// Calculate angle as the arccosine of (u.v)/(||u|| ||v||)
	return arccos(uv/(unorm*vnorm));
}
