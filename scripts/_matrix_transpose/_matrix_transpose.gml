/// @func _matrix_transpose(a)
/// @desc Transposes a 2D array.
/// @param {*[][]} a - Matrix to transpose.
/// @return {*[][]} The transpose of the input array a.

function _matrix_transpose(a)
{
	// Get matrix dimensions
	var m, n;
	m = array_length(a);
	n = array_length(a[0]);
	
	// Verify that the array has at least two dimensions
	if ((m < 1) || (n < 1))
		return a;
	
	// Construct the transpose
	var at = array_create(n, array_create(m));
	for (var i = 0; i < m; i++)
	{
		for (var j = 0; j < n; j++)
			at[j][i] = a[i][j];
	}
	
	// Return the transpose
	return at;
}
