# GameMaker Studio 2 Mathematical Scripts

<a href="https://adam-rumpf.itch.io/gamemaker-studio-2-mathematical-scripts"><img src="https://img.shields.io/badge/download-itch.io-fa5c5c?style=plastic&logo=itch.io&logoColor=white" alt="itch.io page"/></a> <a href="https://github.com/adam-rumpf/game-maker-scripts/search?l=game-maker-language"><img src="https://img.shields.io/badge/language-gml-blue?style=plastic"/></a> <a href="https://github.com/adam-rumpf/game-maker-scripts/releases"><img src="https://img.shields.io/github/v/release/adam-rumpf/game-maker-scripts?style=plastic"/></a> <a href="https://github.com/adam-rumpf/game-maker-scripts/blob/master/LICENSE"><img src="https://img.shields.io/github/license/adam-rumpf/game-maker-scripts?style=plastic"/></a> <a href="https://github.com/adam-rumpf/game-maker-scripts/commits/master"><img src="https://img.shields.io/maintenance/yes/2021?style=plastic"/></a>

A collection of general utility and mathematical functions for [GameMaker Studio 2](https://www.yoyogames.com/) (Version 2.3). These mostly consist of functions that I have found useful during my own game development, and I expect to periodically add more over time.

A [local asset package](https://docs2.yoyogames.com/source/_build/2_interface/2_extras/local_asset_packages.html) containing all scripts can be found on the [releases](https://github.com/adam-rumpf/game-maker-scripts/releases) or from my [itch.io page](https://adam-rumpf.itch.io/gamemaker-studio-2-mathematical-scripts). I encourage you to download it, use it in your own projects, and modify the source code as much as you like.

Each script defines a single function. Most functions are standalone and are meant to be taken à la carte, but some of the more mathematically complicated functions depend on other scripts, indicated in a `@requires` tag. All function names begin with an underscore (`_`) in order to distinguish them from built-in functions.

The following is a brief description of the included functions, divided into rough categories.

## Analysis Functions

A variety of scripts dealing with sequences, functions, and sets, which may have some uses for managing data structures.

* [`_integer_to_natural`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_integer_to_natural/_integer_to_natural.gml): Maps an integer to a unique natural number using the zig-zagging bijection from _(0, 1, -1, 2, -2, ...)_ to _(0, 1, 2, 3, 4, ...)_. This is the inverse of `_natural_to_integer`.
* [`_natural_to_integer`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_natural_to_integer/_natural_to_integer.gml): Maps a natural number to a unique integer using the zig-zagging bijection from _(0, 1, 2, 3, 4, ...)_ to _(0, 1, -1, 2, -2, ...)_. This is the inverse of `_integer_to_natural`.
* [`_natural_to_pair`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_natural_to_pair/_natural_to_pair.gml): Maps a natural number to a unique ordered pair of natural numbers using the [inverse Cantor pairing function](https://en.wikipedia.org/wiki/Pairing_function#Inverting_the_Cantor_pairing_function). This is the inverse of `_pair_to_natural`.
* [`_pair_to_natural`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_pair_to_natural/_pair_to_natural.gml): Maps an ordered pair of natural numbers to a unique natural number using the [Cantor pairing function](https://en.wikipedia.org/wiki/Pairing_function#Cantor_pairing_function). This is the inverse of `_natural_to_pair`.

## Array Functions

Common array functions (such as searching and counting).

* [`_array_count`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_count/_array_count.gml): Counts the number of occurrences of a specified value in an array.
* [`_array_function`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_function/_array_function.gml): Applies a given function to every element of a given array, and returns an array of results.
* [`_array_index`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_index/_array_index.gml): Finds the first index at which a specified value occurs in an array (or -1 if not found). An optional argument allows the search to begin from a specified index.
* [`_array_max`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_max/_array_max.gml): Returns the maximum value (or the index of the maximum value) in an array.
* [`_array_min`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_min/_array_min.gml): Returns the minimum value (or the index of the minimum value) in an array.
* [`_invert_permutation`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_invert_permutation/_invert_permutation.gml): Generates a permutation array to invert a given permutation array.
* [`_linspace`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_linspace/_linspace.gml): Generates an array with a specified number of equally-spaced values that cover a specified range.
* [`_permute`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_permute/_permute.gml): Permutes the elements of an array according to a given permutation array.
* [`_range`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_range/_range.gml): Generates an array of equally-spaced values over a specified range with a specified step size.

## Computational Mathematics Functions

Numerical algorithms for computational mathematics.

* [`_cubic_spline_coefficients`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_cubic_spline_coefficients/_cubic_spline_coefficients.gml): Calculates vectors of polynomial coefficients for the natural [cubic spline](https://en.wikipedia.org/wiki/Spline_interpolation) interpolating a given data set.
* [`_cubic_spline_evaluate`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_cubic_spline_evaluate/_cubic_spline_evaluate.gml): Evaluates a piecewise cubic polynomial at a specific value given a given set of coefficient vectors and intervals.
* [`_root_bisection`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_root_bisection/_root_bisection.gml): Finds the root of a continuous function on a specified interval using the [bisection method](https://en.wikipedia.org/wiki/Bisection_method). This requires that the function change sign over the interval.
* [`_root_newton`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_root_newton/_root_newton.gml): Finds the root of a differentiable function using [Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method). This requires an initial guess and a derivative function.

## Linear Algebra Functions

Common linear algebra algorithms for dealing with matrices and vectors. In all functions, _vectors_ are considered to be 1D arrays while _matrices_ are 2D arrays (i.e. arrays of arrays).

* [`_coordinate_remap`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_coordinate_remap/_coordinate_remap.gml): Remaps a coordinate from one rectangular region to another.
* [`_linear_solve`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_linear_solve/_linear_solve.gml): Solves a linear system of the form _Ax = b_ (using [Gaussian elimination with partial pivoting](https://en.wikipedia.org/wiki/Pivot_element)).
* [`_matrix_multiply`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_matrix_multiply/_matrix_multiply.gml): Performs matrix-matrix, matrix-vector, and vector-vector multiplication.
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

* [`_random_weighted_index`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_random_weighted_index/_random_weighted_index.gml): Chooses a random array index with probabilities defined by a given weight array.
* [`_random_sample`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_random_sample/_random_sample.gml): Draws a set of random samples from an array, either with or without replacement.
