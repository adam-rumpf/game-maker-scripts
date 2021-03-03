/// @desc Graph object. Stores lists of vertices and edges and defines several graph algorithm methods.

// Initialize vertex and edge lists
v = []; // vertex object list
e = []; // edge object list

//////////////////////////////////////////////////////////////////////////////
// Adjacency Methods
//////////////////////////////////////////////////////////////////////////////

/// @func adjacency_matrix([weighted])
/// @desc Returns the adjacency matrix representation of the graph.
/// @requires _array_index
/// @param {bool} [weighted=false] - Whether to use edge costs in place of 0-1 adjacency counts. If true, entry (i,j) is the total cost of all edges from i to j. If false, it's the total number of edges from i to j.
/// @return {real[][]} Matrix with a column and row for each vertex, where element (i,j) is the number of edges (or the total edge weight) from i to j.

adjacency_matrix = function()
{
	// Check for optional weight argument
	var weighted = (argument_count > 0 ? argument[0] : false);
	
	// Initialize adjacency matrix
	var n = array_length(v); // number of vertices
	var a = array_create(n, array_create(n));
	for (var i = 0; i < n; i++)
	{
		for (var j = 0; j < n; j++)
			a[i][j] = 0;
	}
	
	// Process the edges incident to each vertex
	for (var i = 0; i < n; i++)
	{
		// Out-neighbors
		for (var j = 0; j < array_length(v[i].e_out); j++)
		{
			var k = _array_index(v, v[i].e_out[j].head); // out-neighbor vertex list index
			if (weighted == true)
				a[i][k] += v[i].e_out[j].cost;
			else
				a[i][k] += 1;
		}
	}
	
	return a;
}

/// @func adjacency_list()
/// @desc Returns the adjacency list of the graph.
/// @requires _array_index
/// @return {int[][]} List of out-neighbor lists for each vertex. Each sub-list corresponds to a vertex from the graph's vertex list, and consists of the indices of that vertex's out-neighbors.

adjacency_list = function()
{
	// Initialize list
	var a = array_create(array_length(v));
	
	// Process the out-neighborhood of each vertex
	for (var i = 0; i < array_length(v); i++)
	{
		a[i] = array_create(array_length(v[i].e_out));
		for (var j = 0; j < array_length(v[i].e_out); j++)
			a[i][j] = _array_index(v, v[i].e_out[j].head);
	}
	
	return a;
}

//////////////////////////////////////////////////////////////////////////////
// Path Methods
//////////////////////////////////////////////////////////////////////////////

/// @func shortest_path(s, t)
/// @desc Finds the shortest path from s to t.
/// @param {obj_vertex} s - Path origin vertex.
/// @param {obj_vertex} t - Path destination vertex.
/// @return {[real, obj_vertex[], obj_edge[]]} Triple containing the shortest path length, the list of vertices in the path (in order), and the list of edges in the path (in order).

shortest_path = function(s, t)
{
	//###
}

/// @func distance(s, t)
/// @desc Finds the distance between s and t (via the shortest path).
/// @param {obj_vertex} s - Path origin vertex.
/// @param {obj_vertex} t - Path destination vertex.
/// @return {real} Distance from s to t (infinity if they are disconnected).

distance = function(s, t)
{
	return shortest_path(s, t)[0];
}

/// @func all_distances(s)
/// @desc Finds the distance from s to every other vertex in the graph (via the shortest path).
/// @param {obj_vertex} s - Origin vertex.
/// @return {real[]} Array of distances from s to every other vertex, in the same order as the graph's vertex list.

all_distances = function(s)
{
	//###
}

/// @func connected([s, t])
/// @desc Determines whether the graph is connected, or whether a given pair of vertices is connected.
/// @param {obj_vertex} [s=undefined] - Origin vertex. Must either be left blank or accompanied by a destination vertex.
/// @param {obj_vertex} [t=undefined] - Destination vertex. Must either be left blank or accompanied by an origin vertex.
/// @return {bool} True if the graph (or vertex pair) is connected, false otherwise.

connected = function()
{
	// Check for optional pair of arguments
	var s = undefined;
	var t = undefined;
	if (argument_count >= 2)
	{
		s = argument[0];
		t = argument[1];
	}
	
	// If either vertex is undefined, use all-distances from an arbitrary origin
	if ((s == undefined) || (t == undefined))
	{
		var dist = all_distances(v[0]); // array of all distances from vertex 0
		
		// Search array for infinite values
		for (var i = 0; i < array_length(dist); i++)
			if (dist[i] == infinity)
				return false;
		
		// If all values were finite, the graph is connected
		return true;
	}
	// Otherwise simply find the pairwise distance
	else
	{
		if (distance(s, t) == infinity)
			return false;
		else
			return true;
	}
}
