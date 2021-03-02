/// @func _shape_arrow(x1, y1, x2, y2[, thickness[, rounded[, hlength[, hwidth[, barbs]]]]])
/// @desc Generates an array of graphics primitive vertices for an arrow pointing from (x1,y1) to (x2,y2).
/// @requires _vector_norm
/// @requires _vector_rotate
/// @param {int} x1 - Arrow tail x-coordinate (px).
/// @param {int} y1 - Arrow tail y-coordinate (px).
/// @param {int} x2 - Arrow head x-coordinate (px).
/// @param {int} y2 - Arrow head y-coordinate (px).
/// @param {int} [thickness=4] - Arrow line thickness (px), as a radius (total width is twice this value).
/// @param {bool} [rounded=True] - Whether to round the tail (true for rounded, false for flat).
/// @param {int} [hlength=24] - Length of arrowhead (px).
/// @param {int} [hwidth=16] - Width of arrowhead (px), as a radius (total width is twice this value).
/// @param {int} [barbs=4] - Arrowhead barb size (px). 0 creates a perfectly triangular arrowhead, while larger values create larger cutouts and sharper barbs.
/// @return {int[][]} Array of vertex coordinate pairs defining an arrow from (x1,y1) to (x2,y2).

/*
 * See below for a diagram of the point labels "t", "tr", "hr", "hrb", "h", "tlb", "hl", and "tl".
 *
 *                                     tlb
 *                                        O---\
 *                                         \   \--\
 *          tl                              \      \--\
 *            O------------------------------O         \--\
 *            |                               hl           \--\
 *  t (x1,y1) O                                                O h (x2,y2)
 *            |                               hr           /--/
 *            O------------------------------O         /--/
 *          tr                              /      /--/
 *                                         /   /--/
 *                                        O---/
 *                                     hrb
 */

function _shape_arrow(x1, y1, x2, y2)
{
	// Check for optional arguments
	var thickness = (argument_count > 4 ? argument[4] : 4);
	var rounded = (argument_count > 5 ? argument[5] : true);
	var hlength = (argument_count > 6 ? argument[6] : 24);
	var hwidth = (argument_count > 7 ? argument[7] : 16);
	var barbs = (argument_count > 8 ? argument[8] : 4);
	
	// Find angle between points
	var angle = arctan2(y1 - y2, x2 - x1);
	
	// Define point labels (see above for diagram)
	var t, tr, hr, hrb, h, hlb, hl, tl;
	t = [x1, y1]; // tail
	h = [x2, y2]; // head
	
	// Define other arrow measures
	var alength, llength;
	alength = 0; // total arrowhead length //###
	llength = 0; // total line length //###
	
	//### calculate points, ensure that arrowhead is always full-sized no matter how far apart the endpoints are
	
	//### _vector_norm(), _vector_rotate()
}
