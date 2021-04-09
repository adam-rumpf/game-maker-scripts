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
/// @requires _array_index
/// @param {obj_vertex} s - Path origin vertex.
/// @param {obj_vertex} t - Path destination vertex.
/// @return {[real, obj_vertex[], obj_edge[]]} Triple containing the shortest path length, the list of vertices in the path (in order), and the list of edges in the path (in order).

shortest_path = function(s, t)
{
	// Ensure that selected vertices are present
	var si = _array_index(v, s); // origin vertex array index
	var ti = _array_index(v, t); // destination vertex array index
	if ((si < 0) || (ti < 0))
		return undefined;
	
	// Initialize tentative distances and predecessor arrays
	var dist = array_create(array_length(v), infinity);
	var vpred = array_create(array_length(v), undefined); // predecessor vertex index
	var epred = array_create(array_length(v), undefined); // predecessor edge index
	dist[si] = 0; // origin's distance to self is 0
	vpred[si] = -1; // negative predecessor index to indicate the beginning of the path
	
	// Get adjacency list for quickly determining out-neighborhoods
	var adj = adjacency_list();
	
	// Initialize priority queue of tentative distances
	var q = ds_priority_create();
	for (var i = 0; i < array_length(v); i++)
		ds_priority_add(q, i, dist[i]);
	
	// Main Dijkstra loop (halt early after destination is removed from queue)
	while ((ds_priority_size(q) > 0) && (ds_priority_find_priority(q, ti) != undefined))
	{
		// Remove vertex with minimum tentative distance from queue
		var i = ds_priority_find_min(q);
		ds_priority_delete_min(q);
		
		// If minimum distance is infinite, no path exists
		if (dist[i] == infinity)
			return [infinity, [], []];
		
		// Update chosen vertex's neighbors
		for (var j = 0; j < array_length(adj[i]); j++)
		{
			// Find tentative distance through current vertex
			var dist_new = dist[i] + v[i].e_out[j].cost;
			if (dist_new < dist[adj[i][j]])
			{
				// If distance is shorter, update tentative distance and predecessor
				dist[adj[i][j]] = dist_new;
				ds_priority_change_priority(q, adj[i][j], dist_new);
				vpred[adj[i][j]] = i;
				epred[adj[i][j]] = _array_index(e, v[i].e_out[j]);
			}
		}
	}
	
	// Destroy queue
	ds_priority_destroy(q);
	
	// Initialize shortest path structures
	var vstack = ds_stack_create(); // stack of vertices (for easy reversal)
	ds_stack_push(vstack, ti); // begin with final vertex
	var estack = ds_stack_create(); // stack of edges (for easy reversal)
	
	// Trace predecessor list backwards
	var top = ds_stack_top(vstack); // current vertex
	while (vpred[top] >= 0)
	{
		// Find the previous vertex and edge and push onto stacks
		ds_stack_push(vstack, vpred[top]);
		ds_stack_push(estack, epred[top]);
		top = ds_stack_top(vstack);
	}
	
	// Initialize shortest path output lists
	var total = 0; // total distance
	var vlist = array_create(ds_stack_size(vstack)); // vertex list
	var elist = array_create(ds_stack_size(estack)); // edge list
	
	// Trace vertex path forwards
	var i = 0; // list index
	while (ds_stack_size(vstack) > 0)
	{
		vlist[i] = ds_stack_pop(vstack);
		i++;
	}
	ds_stack_destroy(vstack);
	
	// Trace edge path forwards and total distance
	i = 0;
	while (ds_stack_size(estack) > 0)
	{
		elist[i] = ds_stack_pop(estack);
		total += e[elist[i]].cost;
		i++;
	}
	ds_stack_destroy(estack);
	
	// Convert list IDs back into objects
	for (var i = 0; i < array_length(vlist); i++)
		vlist[i] = v[vlist[i]];
	for (var i = 0; i < array_length(elist); i++)
		elist[i] = e[elist[i]];
	
	// Return distance, vertex path list, and edge path list
	return [total, vlist, elist];
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
/// @requires _array_index
/// @param {obj_vertex} s - Origin vertex.
/// @return {real[]} Array of distances from s to every other vertex, in the same order as the graph's vertex list.

all_distances = function(s)
{
	// Ensure that selected vertex is present
	var si = _array_index(v, s); // origin vertex array index
	if (si < 0)
		return undefined;
	
	// Initialize tentative distances to all vertices
	var dist = array_create(array_length(v), infinity);
	dist[si] = 0; // origin's distance to self is 0
	
	// Get adjacency list for quickly determining out-neighborhoods
	var adj = adjacency_list();
	
	// Initialize priority queue of tentative distances
	var q = ds_priority_create();
	for (var i = 0; i < array_length(v); i++)
		ds_priority_add(q, i, dist[i]);
	
	// Main Dijkstra loop
	while (ds_priority_size(q) > 0)
	{
		// Remove vertex with minimum tentative distance from queue
		var i = ds_priority_find_min(q);
		ds_priority_delete_min(q);
		
		// If minimum distance is infinite, no path exists
		if (dist[i] == infinity)
			break;
		
		// Update chosen vertex's neighbors
		for (var j = 0; j < array_length(adj[i]); j++)
		{
			// Find tentative distance through current vertex
			var dist_new = dist[i] + v[i].e_out[j].cost;
			if (dist_new < dist[adj[i][j]])
			{
				// If distance is shorter, update tentative distance
				dist[adj[i][j]] = dist_new;
				ds_priority_change_priority(q, adj[i][j], dist_new);
			}
		}
	}
	
	// Destroy queue and return distance array
	ds_priority_destroy(q);
	return dist;
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
