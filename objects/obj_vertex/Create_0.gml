/// @desc Vertex object. Assumed to belong to exactly one graph object. Exists mostly to store attributes.

// Define default vertex attributes (meant to be overwritten when the graph is defined)
e_in = []; // list of incoming edge objects
e_out = []; // list of outgoing edge objects
supply = 0; // supply value (for network flows)
