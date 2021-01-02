/// @func _coordinate_remap(xi1, yi1, xi2, yi2, xf1, yf1, xf1, yf2, x, y)
/// @desc Remaps a coordinate from one rectangular region to another.
/// @param {real} xi1 Initial rectangular region's minimum x-value.
/// @param {real} yi1 Initial rectangular region's minimum y-value.
/// @param {real} xi2 Initial rectangular region's maximum x-value.
/// @param {real} yi2 Initial rectangular region's maximum y-value.
/// @param {real} xf1 Final rectangular region's minimum x-value.
/// @param {real} yf1 Final rectangular region's minimum y-value.
/// @param {real} xf2 Final rectangular region's maximum x-value.
/// @param {real} yf2 Final rectangular region's maximum y-value.
/// @param {real} x x-coordinate to be remapped.
/// @param {real} y y-coordinate to be remapped.
/// @return {real[]} Remapped coordinates of input point, as an ordered pair [x, y].

function _coordinate_remap(xi1, yi1, xi2, yi2, xf1, yf1, xf2, yf2, xx, yy)
{
	// Calculate remapped coordinates
	var xf, yf;
	xf = ((xx - xi1)*(xf2 - xf1))/(xi2 - xi1) + xf1;
	yf = ((yy - yi1)*(yf2 - yf1))/(yi2 - yi1) + yf1;
	
	return [xf, yf];
}
