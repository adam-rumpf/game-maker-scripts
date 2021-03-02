/// @func _matrix_multiply(a, b)
/// @desc Multiplies two matrices and/or vectors of compatible dimensions.
/// @param {real[]*} a - 1D or 2D array to use as the left factor of the product.
/// @param {real[]*} b - 1D or 2D array to use as the right factor of the product.
/// @return {real[]} Product of matrix multiplication (undefiend if dimensions not compatible; scalar for vector-vector products).

function _matrix_multiply(a, b)
{
	// Get dimensions of arrays
	var am, an, bm, bn; // rows/columns in array a/b
	am = array_length(a);
	an = array_length(a[0]);
	bm = array_length(b);
	bn = array_length(b[0]);
	
	// Interpret 1D arrays as 2D arrays with one row (if first) or column (if second)
	if (an == 0)
	{
		// Transpose column vector
		an = am;
		am = 1;
	}
	if (bn == 0)
		bn = 1;
	
	// Verify that dimensions are compatible
	if (an != bm)
		return undefined;
	
	// Perform calculations depending on whether one or both factors is a vector
	if ((am == 1) && (bn == 1))
	{
		// Vector-vector product (dot product)
		var tot = 0; // output scalar
		for (var i = 0; i < an; i++)
			tot += a[i]*b[i];
		return tot;
	}
	else if (am == 1)
	{
		// Vector-matrix product
		var vec = array_create(bn, 0); // output vector
		for (var j = 0; j < bn; j++)
		{
			for (var i = 0; i < bm; i++)
				vec[j] += a[i]*b[i][j];
		}
		return vec;
	}
	else if (bn == 1)
	{
		// Matrix-vector product
		var vec = array_create(am, 0); // output vector
		for (var i = 0; i < am; i++)
		{
			for (var j = 0; j < an; j++)
				vec[i] += a[i][j]*b[j];
		}
		return vec;
	}
	else
	{
		// Matrix-matrix product
		var mat = array_create(am, array_create(bn)); // output matrix
		for (var i = 0; i < am; i++)
		{
			for (var j = 0; j < bn; j++)
			{
				mat[i][j] = 0;
				for (var k = 0; k < an; k++)
					mat[i][j] += a[i][k]*b[k][j];
			}
		}
		return mat;
	}
}
