/// @func _create_graph(v, e[, supply[, cost[, capacity]]])
/// @desc Creates a graph object with all associated vertex and edge objects from a vertex list and an adjacency list.
/// @requires _array_index
/// @requires obj_graph
/// @requires obj_vertex
/// @requires obj_edge
/// @param {int[]} v - List of vertex indices. The order of these indices will match the order of the graph object's vertex list.
/// @param {int[][]} e - List of lists of vertex index pairs, in [tail, head] order. The order of these edges will match the order of the graph object's edge list.
/// @param {(real|real[])} [supply=0] supply - List of supply values for each vertex. A scalar argument is applied to all vertices, and otherwise a list argument must correspond to the vertex index list.
/// @param {(real|real[])} [cost=1] cost - List of cost values for each edge. A scalar argument is applied to all edges, and otherwise a list argument must correspond to the edge adjacency list.
/// @param {(real|real[])} [capacity=infinity] capacity - List of capacity values for each edge. A scalar argument is applied to all edges, and otherwise a list argument must correspond to the edge adjacency list.
/// @return {obj_graph} Returns the graph object created from the input lists. This object's 'v' and 'e' attributes can be used to access the created vertex and edge objects.

function _create_graph(v, e)
{
	// Check for optional arguments
	var supply = (argument_count > 2 ? argument[2] : 0);
	var cost = (argument_count > 3 ? argument[3] : 1);
	var capacity = (argument_count > 4 ? argument[4] : infinity);
	
	// Get vertex and edge list sizes
	var n = array_length(v); // number of vertices
	var m = array_length(e); // number of edges
	
	// Verify dimensions of arguments
	for (var i = 0; i < array_length(e); i++)
		if (array_length(e[i]) != 2)
			return undefined;
	if (is_array(supply) == true)
		if (array_length(supply) != n)
			return undefined;
	if (is_array(cost) == true)
		if (array_length(cost) != m)
			return undefined;
	if (is_array(capacity) == true)
		if (array_length(capacity) != m)
			return undefined;
	
	// Expand scalar arguments into lists
	if (is_array(supply) == false)
		supply = array_create(n, supply);
	if (is_array(cost) == false)
		cost = array_create(m, cost);
	if (is_array(capacity) == false)
		capacity = array_create(m, capacity);
	
	// Initialize vertex and edge lists
	var vv = array_create(n);
	var ee = array_create(m);
	
	// Initialize vertex objects
	for (var i = 0; i < n; i++)
	{
		vv[i] = instance_create_layer(0, 0, "Instances", obj_vertex);
		vv[i].supply = supply[i];
	}
	
	// Initialize edge objects and tie to vertices
	for (var i = 0; i < m; i++)
	{
		// Initialize attributes
		ee[i] = instance_create_layer(0, 0, "Instances", obj_edge);
		ee[i].cost = cost[i];
		ee[i].capacity = capacity[i];
		
		// Find head and tail vertex objects
		var tail = vv[_array_index(v, e[i][0])];
		var head = vv[_array_index(v, e[i][1])];
		
		// Associate edge and vertices with each other
		ee[i].tail = tail;
		ee[i].head = head;
		tail.e_out[array_length(tail.e_out)] = ee[i];
		head.e_in[array_length(head.e_in)] = ee[i];
	}
	
	// Define and return graph object
	var g = instance_create_layer(0, 0, "Instances", obj_graph);
	g.v = vv;
	g.e = ee;
	return g;
}
