/// @func _create_graph(v, e[, supply[, cost[, capacity]]])
/// @desc Creates a graph object with all associated vertex and edge objects from a vertex list and an adjacency list.
/// @requires obj_graph
/// @requires obj_vertex
/// @requires obj_edge
/// @param {real[]} v - List of vertex indices. The order of these indices will match the order of the graph's vertex list.
/// @param {real[][]} e - List of lists of vertex index pairs, in [tail, head] order. The order of these edges will match the order of the graph's edge list.
/// @param {(real|real[])} [supply=0] supply - List of supply values for each vertex. A scalar argument is applied to all vertices, and otherwise a list argument must correspond to the vertex index list.
/// @param {(real|real[])} [cost=0] cost - List of cost values for each edge. A scalar argument is applied to all edges, and otherwise a list argument must correspond to the edge adjacency list.
/// @param {(real|real[])} [capacity=infinity] capacity - List of capacity values for each edge. A scalar argument is applied to all edges, and otherwise a list argument must correspond to the edge adjacency list.
/// @return {obj_graph} Returns the graph object created from the input lists. This object's 'v' and 'e' attributes can be used to access the created vertex and edge objects.

function _create_graph(v, e)
{
	// Check for optional arguments
	var supply = (argument_count > 2 ? argument[2] : 0);
	var cost = (argument_count > 3 ? argument[3] : 0);
	var capacity = (argument_count > 4 ? argument[4] : infinity);
	
	// Verify dimensions of arguments
	for (var i = 0; i < array_length(e); i++)
		if (array_length(e[i]) != 2)
			return undefined;
	if (is_array(supply) == true)
		if (array_length(supply) != array_length(v))
			return undefined;
	if (is_array(cost) == true)
		if (array_length(cost) != array_length(e))
			return undefined;
	if (is_array(capacity) == true)
		if (array_length(capacity) != array_length(e))
			return undefined;
}
