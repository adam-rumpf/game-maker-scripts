/// @func _factorial(n)
/// @desc Calculates the factorial (n! = n * (n-1) * (n-2) * ... * 2 * 1) of a nonnegative integer n.
/// @param {int} n - Nonnegative integer.
/// @return {int} Value of n!, or undefined if n is not a nonnegative integer.

function _factorial(n)
{
	// Validate input
	n = floor(n);
	if (n < 0)
		return undefined;
	
	// Handle the zero case
	if (n == 0)
		return 1;
	
	// Iteratively multiply a sequence of integers
	var total = 1;
	for (var i = 1; i <= n; i++)
		total *= i;
	
	return total;
}
