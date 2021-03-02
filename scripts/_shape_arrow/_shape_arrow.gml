/// @func _shape_arrow(x1, y1, x2, y2[, thickness[, rounded[, hlength[, hwidth[, barbs]]]]])
/// @desc Generates an array of graphics primitive vertices for an arrow pointing from (x1,y1) to (x2,y2).
/// @param {int} x1 Arrow tail x-coordinate (px).
/// @param {int} y1 Arrow tail y-coordinate (px).
/// @param {int} x2 Arrow head x-coordinate (px).
/// @param {int} y2 Arrow head y-coordinate (px).
/// @param {int} [thickness=4] Arrow line thickness (px), as a radius, so total width is twice this value.
/// @param {bool} [rounded=True] Whether to round the tail (true for rounded, false for flat).
/// @param {int} [hlength=24] Length of arrowhead (px).
/// @param {int} [hwidth=16] Width of arrowhead (px), as a radius, so total width is twice this value.
/// @param {int} [barbs=4] Arrowhead barb size (px). 0 creates a perfectly triangular arrowhead, while larger values create larger cutouts and sharper barbs.
/// @return {int[][]} Array of vertex coordinate pairs defining an arrow from (x1,y1) to (x2,y2).

/*
 * See below for a diagram of the point labels "tr", "hr", "hrr", "h", "tll", "hl", and "tl".
 *
 *                             tll
 *                                O---\
 *                                 \   \--\
 *   tl                             \      \--\
 *    O------------------------------O         \--\
 *    |                              hl            \--\
 *    |                                                O h
 *    |                              hr            /--/
 *    O------------------------------O         /--/
 *   tr                             /      /--/
 *                                 /   /--/
 *                                O---/
 *                             hrr
 */

function _shape_arrow(x1, y1, x2, y2)
{
	// Check for optional arguments
	var thickness = (argument_count > 4 ? argument[4] : 4);
	var rounded = (argument_count > 5 ? argument[5] : true);
	var hlength = (argument_count > 6 ? argument[6] : 24);
	var hwidth = (argument_count > 7 ? argument[7] : 16);
	var barbs = (argument_count > 8 ? argument[8] : 4);
	
	// Define point labels (see above for diagram)
	var tr, hr, hrr, h, hll, hl, tl;
}
