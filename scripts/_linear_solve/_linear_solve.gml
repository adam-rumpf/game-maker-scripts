/// @func _linear_solve(a, b)
/// @desc Solves a linear system of the form Ax = b (via Gaussian elimination with partial pivoting) for a given coefficient matrix and constant vector.
/// @param {real[][]} a - Square coefficient matrix.
/// @param {real[]} b - Constant vector (as an array whose length matches a).
/// @return {real[]} Solution vector x of the linear system Ax = b (undefined in case of inconsistent dimensions or singular matrix).

function _linear_solve(a, b)
{
	// Verify that the inputs have compatible dimensions
	if ((array_length(a) != array_length(a[0])) || (array_length(a) != array_length(b)))
		return undefined;
	
	// Initialize system
	var n, aa, bb, xx, perm;
	n = array_length(b); // size of system
	aa = a; // diagonalized matrix
	bb = b; // constant vector
	xx = array_create(n); // solution vector
	perm = array_create(n); // row permutation array
	for (var i = 0; i < n; i++)
		perm[i] = i;
	
	// Perform Gaussian elimination with partial pivoting
	for (var i = 0; i < n; i++)
	{
		// Find maximum absolute value in current column's subdiagonal
		var p = i; // pivot row index
		for (var j = i+1; j < n; j++)
		{
			if (abs(aa[perm[j]][i]) > abs(aa[perm[p]][i]))
				p = j;
		}
		
		// Verify that the element is nonzero
		if (aa[perm[p]][i] == 0)
			return undefined;
		
		// Set permutation array to exchange the current row and the pivot row
		if (i != p)
		{
			var temp = perm[i];
			perm[i] = perm[p];
			perm[p] = temp;
		}
		
		// Perform elimination using pivot element
		for (var j = 0; j < n; j++)
		{
			// Ignore pivot row
			if (j == i)
				continue;
			
			// Calculate multiplicative factor
			var multi = aa[perm[j]][i]/aa[perm[i]][i];
			
			// Eliminate row
			for (var k = i; k < n; k++)
				aa[perm[j]][k] -= multi*aa[perm[i]][k];
			
			// Transform constant vector
			bb[perm[j]] -= multi*bb[perm[i]];
		}
	}
	
	// Solve diagonalized system
	for (var i = 0; i < n; i++)
		xx[i] = bb[perm[i]]/aa[perm[i]][i];
	
	return xx;
}
