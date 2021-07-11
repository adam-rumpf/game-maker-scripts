# GameMaker Studio 2 Mathematical Scripts

<a href="https://adam-rumpf.itch.io/gamemaker-studio-2-mathematical-scripts"><img src="https://img.shields.io/badge/download-itch.io-fa5c5c?style=plastic&logo=itch.io&logoColor=white" alt="itch.io page"/></a> <a href="https://github.com/adam-rumpf/game-maker-scripts/search?l=game-maker-language"><img src="https://img.shields.io/badge/language-gml-blue?style=plastic"/></a> <a href="https://github.com/adam-rumpf/game-maker-scripts/releases"><img src="https://img.shields.io/github/v/release/adam-rumpf/game-maker-scripts?style=plastic"/></a> <a href="https://github.com/adam-rumpf/game-maker-scripts/blob/master/LICENSE"><img src="https://img.shields.io/github/license/adam-rumpf/game-maker-scripts?style=plastic"/></a> <a href="https://github.com/adam-rumpf/game-maker-scripts/commits/master"><img src="https://img.shields.io/maintenance/yes/2021?style=plastic"/></a>

A collection of general utility and mathematical objects and functions for [GameMaker Studio 2](https://www.yoyogames.com/) (Version 2.3). These mostly consist of utilities that I have found useful during my own game development, and I expect to periodically add more over time.

A [local asset package](https://docs2.yoyogames.com/source/_build/2_interface/2_extras/local_asset_packages.html) containing all scripts can be found on the [releases](https://github.com/adam-rumpf/game-maker-scripts/releases) or from my [itch.io page](https://adam-rumpf.itch.io/gamemaker-studio-2-mathematical-scripts). I encourage you to download it, use it in your own projects, and modify the source code as much as you like.

Each script defines a single function. Most functions are standalone and are meant to be taken à la carte, but some of the more mathematically complicated functions depend on other scripts, indicated in a `@requires` tag.

All function names begin with an underscore (`_`) in order to distinguish them from built-in functions. All object names begin with the `obj_` prefix. Some include methods, which are always defined in the object's Create event.

The following is a brief description of the included functions, divided into rough categories.

## Categories

* [Number Theory Functions](#number-theory-functions)
* [Array Functions](#array-functions)
* [Computational Mathematics Functions](#computational-mathematics-functions)
* [Linear Algebra Functions](#linear-algebra-functions)
* [Random Functions](#random-functions)
* [Graph Objects and Functions](#graph-objects-and-functions)
* [Cellular Automata Functions](#cellular-automata-functions)
* [File Handling](#file-handling)

## Number Theory Functions

A variety of scripts dealing with sequences, functions, and sets, which may have some uses for managing data structures. For example, the various pairing and inverse pairing functions can be used to store pairs of numbers as single numbers in data structures (like stacks and queues) and then recovered.

* [`_base_to_decimal`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_base_to_decimal/_base_to_decimal.gml): Converts a number from an array of base-_b_ digits to decimal. The inverse of `_decimal_to_base`.
* [`_ceil`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_ceil/_ceil.gml): Generalized ceiling function which accepts a step size argument.
* [`_decimal_to_base`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_decimal_to_base/_decimal_to_base.gml): Converts a number from decimal to an array of base-_b_ digits. The inverse of `_base_to_decimal`.
* [`_factorial`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_factorial/_factorial.gml): Calculates the factorial (_n!_) of a nonnegative integer.
* [`_floor`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_floor/_floor.gml): Generalized floor function which accepts a step size argument.
* [`_frac`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_frac/_frac.gml): Generalized fractional part function which accepts a step size argument.
* [`_integer_pair_to_natural`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_integer_pair_to_natural/_integer_pair_to_natural.gml): Maps an ordered pair of integers to a unique natural number (by composing `_nautral_pair_to_natural` on `_integer_to_natural`). This is the inverse of `_natural_to_integer_pair`.
* [`_integer_to_natural`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_integer_to_natural/_integer_to_natural.gml): Maps an integer to a unique natural number using the zig-zagging bijection from _(0, 1, -1, 2, -2, ...)_ to _(0, 1, 2, 3, 4, ...)_. This is the inverse of `_natural_to_integer`.
* [`_k_tuples`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_k_tuples/_k_tuples.gml): Generates an array of all possible base-_b_ _k_-tuples, in ascending (or descending) order.
* [`_natural_to_integer`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_natural_to_integer/_natural_to_integer.gml): Maps a natural number to a unique integer using the zig-zagging bijection from _(0, 1, 2, 3, 4, ...)_ to _(0, 1, -1, 2, -2, ...)_. This is the inverse of `_integer_to_natural`.
* [`_natural_to_integer_pair`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_natural_to_integer_pair/_natural_to_integer_pair.gml): Maps a natural number to a unique ordered pair of integers (by composing `_nautral_to_integer` on `_natural_to_natural_pair`). This is the inverse of `_integer_pair_to_natural`.
* [`_natural_to_natural_pair`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_natural_to_natural_pair/_natural_to_natural_pair.gml): Maps a natural number to a unique ordered pair of natural numbers using the [inverse Cantor pairing function](https://en.wikipedia.org/wiki/Pairing_function#Inverting_the_Cantor_pairing_function). This is the inverse of `_pair_to_natural`.
* [`_natural_pair_to_natural`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_natural_pair_to_natural/_natural_pair_to_natural.gml): Maps an ordered pair of natural numbers to a unique natural number using the [Cantor pairing function](https://en.wikipedia.org/wiki/Pairing_function#Cantor_pairing_function). This is the inverse of `_natural_to_pair`.
* [`_round`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_round/_round.gml): Generalized rounding function which accepts a step size argument.

## Array Functions

Common array functions (such as searching and counting).

* [`_array_count`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_count/_array_count.gml): Counts the number of occurrences of a specified value in an array.
* [`_array_function`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_function/_array_function.gml): Applies a given function to every element of a given array, and returns an array of results.
* [`_array_index`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_index/_array_index.gml): Finds the first index at which a specified value occurs in an array (or -1 if not found). An optional argument allows the search to begin from a specified index.
* [`_array_max`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_max/_array_max.gml): Returns the maximum value (or the index of the maximum value) in an array.
* [`_array_min`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_min/_array_min.gml): Returns the minimum value (or the index of the minimum value) in an array.
* [`_array_reverse`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_reverse/_array_reverse.gml): Reverses the order of elements in an array.
* [`_invert_permutation`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_invert_permutation/_invert_permutation.gml): Generates a permutation array to invert a given permutation array.
* [`_linspace`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_linspace/_linspace.gml): Generates an array with a specified number of equally-spaced values that cover a specified range.
* [`_permute`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_permute/_permute.gml): Permutes the elements of an array according to a given permutation array.
* [`_range`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_range/_range.gml): Generates an array of equally-spaced values over a specified range with a specified step size.

## Computational Mathematics Functions

Numerical algorithms for computational mathematics, including things like root finding and interpolation.

* [`_cubic_spline_coefficients`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_cubic_spline_coefficients/_cubic_spline_coefficients.gml): Calculates vectors of polynomial coefficients for the natural [cubic spline](https://en.wikipedia.org/wiki/Spline_interpolation) interpolating a given data set.
* [`_cubic_spline_evaluate`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_cubic_spline_evaluate/_cubic_spline_evaluate.gml): Evaluates a piecewise cubic polynomial at a specific value given a given set of coefficient vectors and intervals.
* [`_root_bisection`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_root_bisection/_root_bisection.gml): Finds the root of a continuous function on a specified interval using the [bisection method](https://en.wikipedia.org/wiki/Bisection_method). This requires that the function change sign over the interval.
* [`_root_newton`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_root_newton/_root_newton.gml): Finds the root of a differentiable function using [Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method). This requires an initial guess and a derivative function.
* [`_smooth_step`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_smooth_step/_smooth_step.gml): A piecewise function that increases smoothly from _0_ to _1_ over the interval _[0, 1]_.

## Linear Algebra Functions

Common linear algebra algorithms for dealing with matrices and vectors. In all functions, _vectors_ are considered to be 1D arrays while _matrices_ are 2D arrays (i.e. arrays of arrays).

* [`_coordinate_remap`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_coordinate_remap/_coordinate_remap.gml): Remaps a coordinate from one rectangular region to another.
* [`_linear_solve`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_linear_solve/_linear_solve.gml): Solves a linear system of the form _Ax = b_ (using [Gaussian elimination with partial pivoting](https://en.wikipedia.org/wiki/Pivot_element)).
* [`_matrix_multiply`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_matrix_multiply/_matrix_multiply.gml): Performs matrix-matrix, matrix-vector, and vector-vector multiplication.
* [`_matrix_trace`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_matrix_trace/_matrix_trace.gml): Calculates the trace (sum of diagonal elements) of a square matrix.
* [`_matrix_transpose`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_matrix_transpose/_matrix_transpose.gml): Transposes a 2D matrix.
* [`_tridiagonal_solve`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_tridiagonal_solve/_tridiagonal_solve.gml): Solves a tridiagonal system (using the [Thomas algorithm](https://en.wikipedia.org/wiki/Tridiagonal_matrix_algorithm)).
* [`_triangular_solve`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_triangular_solve/_triangular_solve.gml): Solves an upper or lower triangular system (using [forward or back substitution](https://www.cs.cornell.edu/~bindel/class/cs6210-f12/notes/lec08.pdf)).
* [`_unit_vector`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_unit_vector/_unit_vector.gml): Defines a unit direction vector between two coordinates.
* [`_vector_angle`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_vector_angle/_vector_angle.gml): Calculates the acute angle between two vectors.
* [`_vector_distance`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_vector_distance/_vector_distance.gml): Calculates the [Lp-distance](https://en.wikipedia.org/wiki/Lp_space) between two vectors.
* [`_vector_norm`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_vector_norm/_vector_norm.gml): Calculates the [Lp-norm](https://en.wikipedia.org/wiki/Lp_space) of a vector.
* [`_vector_rotate`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_vector_rotate/_vector_rotate.gml): Rotates a 2D vector by a specified angle.
* [`_vector_scale`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_vector_scale/_vector_scale.gml): Scales a vector to maintain its direction while giving it a specified norm.

## Random Functions

Functions which involve randomization.

* [`_random_round`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_random_round/_random_round.gml): Rounds a number either up or down to an integer value with a probability based on its fractional part.
* [`_random_sample`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_random_sample/_random_sample.gml): Draws a set of random samples from an array, either with or without replacement.
* [`_random_weighted_index`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_random_weighted_index/_random_weighted_index.gml): Chooses a random array index with probabilities defined by a given weight array.

## Cellular Automata Functions

Functions for [cellular automata](https://en.wikipedia.org/wiki/Cellular_automaton) (CA) models. Most models are defined using a [Wolfram code](https://en.wikipedia.org/wiki/Wolfram_code), an integer index that uniquely defines all possible input/output pairs for a given state space. Wolfram codes are generally indexed to correspond to a descending sequence of _k_-tuples, which can be generated using the `_k_tuples` function from the [Number Theory Functions](#number-theory-functions) section.

* [`_ca_elementary`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_ca_elementary/_ca_elementary.gml): Evaluates an [elementary CA](https://en.wikipedia.org/wiki/Elementary_cellular_automaton) on a 1D array, based on a rule defined by its [Wolfram code](https://en.wikipedia.org/wiki/Wolfram_code).
* [`_ca_wolfram_decode`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_ca_wolfram_decode/_ca_wolfram_decode.gml): Converts a [Wolfram code](https://en.wikipedia.org/wiki/Wolfram_code) into an explicit list of ordered output tuples. The inverse of `_ca_wolfram_encode`.
* [`_ca_wolfram_encode`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_ca_wolfram_encode/_ca_wolfram_encode.gml): Generates the [Wolfram code](https://en.wikipedia.org/wiki/Wolfram_code) for a given complete list of output tuples. The inverse of `_ca_wolfram_decode`.

## Graph Objects and Functions

Objects and functions for representing graphs and networks (as abstract data structures on the "Instances" layer). The graph objects are meant to act as abstract data structures, and so are included in the `scripts/graph` group alongside the graph functions.

Three main objects, `obj_graph`, `obj_vertex`, and `obj_edge` are defined to represent a graph, its vertices, and its edges, respectively. The main graph object consists mostly of a vertex array and an edge array, but also defines some methods for common graph algorithms (like finding shortest paths). Graphs can technically be defined manually, but it is recommended to instead make use of the included [`_create_graph`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_create_graph/_create_graph.gml) function, which automatically defines all necessary objects from an [adjacency list](https://en.wikipedia.org/wiki/Adjacency_list) representation and returns the resulting graph object.

It is assumed that all vertices and edges belong to only one graph. Edges are directed, so if you would like for connections to be bidirectional, you must include one edge in each direction.

* [`_create_graph`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_create_graph/_create_graph.gml): A function for generating a graph object with accompanying vertex and edge objects from a list of vertex indices and an [adjacency list](https://en.wikipedia.org/wiki/Adjacency_list). Optional arguments allow the vertex and edge attributes to be defined.
* `obj_graph`: The main graph object. On destruction, it automatically destroys all associated vertices and edges. Attributes include:
  * `obj_graph.v`: List of vertex objects.
  * `obh_graph.e`: List of edge objects.

  Methods include:
  * [`obj_graph.adjacency_list`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/objects/obj_graph/Create_0.gml#L48): Returns the [adjacency list](https://en.wikipedia.org/wiki/Adjacency_list) of the graph, as a list of lists of vertex indices.
  * [`obj_graph.adjacency_matrix`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/objects/obj_graph/Create_0.gml#L11): Returns the [adjacency matrix](https://en.wikipedia.org/wiki/Adjacency_matrix) of the graph, as a matrix for which element _(i,j)_ indicates the number of edges (or the total weight of edges) from vertex _i_ to vertex _j_.
  * [`obj_graph.all_distances`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/objects/obj_graph/Create_0.gml#L193): Finds the distance from one vertex to every other vertex in the graph (using [Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)) based on the `cost` attributes of the edges.
  * [`obj_graph.connected`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/objects/obj_graph/Create_0.gml#L248): Determines whether the graph is (strongly) connected, or whether a given pair of vertices is (strongly) connected.
  * [`obj_graph.distance`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/objects/obj_graph/Create_0.gml#L182): Finds the distance between two vertices (using [Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)) based on the `cost` attributes of the edges.
  * [`obj_graph.shortest_path`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/objects/obj_graph/Create_0.gml#L73): Finds the shortest path between a pair of vertices (using [Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)) based on the `cost` attributes of the edges. Returns the cost of the path, the sequence of vertices, and the sequence of edges.
* `obj_vertex`: Vertex object. Attributes include:
  * `obj_vertex.e_in`: List of incoming edge objects.
  * `obj_vertex.e_out`: List of outgoing edge objects.
  * `obj_vertex.supply`: Supply value, for potential use in [network flows](https://en.wikipedia.org/wiki/Flow_network) problems.
* `obj_edge`: Edge object. Attributes include:
  * `obj_edge.tail`: Origin vertex object.
  * `obj_edge.head`: Destination vertex object.
  * `obj_edge.cost`: Cost value, for use in minimum-cost path calculation.
  * `obj_edge.capacity`: Capacity value, for potential use in [network flows](https://en.wikipedia.org/wiki/Flow_network) problems.

## File Handling

Functions for handling files, to cover some basic tasks that aren't built into GameMaker Studio.

* [`_ini_keys`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_ini_keys/_ini_keys.gml): Finds all keys in a given section of an [INI file](https://en.wikipedia.org/wiki/INI_file).
* [`_ini_sections`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_ini_sections/_ini_sections.gml): Finds all sections in a given [INI file](https://en.wikipedia.org/wiki/INI_file).
