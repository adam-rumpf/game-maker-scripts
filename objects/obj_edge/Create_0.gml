/// @desc Edge object. Assumed to belong to exactly one graph object. Exists mostly to store attributes.

// Define default edge attributes (meant to be overwritten when the graph is defined)
tail = undefined; // origin vertex object
head = undefined; // destination vertex object
cost = 0; // cost value (for use in path length calculation)
capacity = infinity; // capacity value (for network flows)
