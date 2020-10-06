# GameMaker Scripts

A collection of general utility and mathematical functions for GameMaker Studio 2 (Version 2.3).

All scripts are included in the `scripts/` folder of this repository. Each script defines a single function. Most functions are standalone and are meant to be taken à la carte, but some of the more mathematically complicated functions depend on other scripts, indicated in a `@requires` tag. All function names begin with an underscore (`_`) in order to distinguish them from built-in functions. A [local asset package](https://docs2.yoyogames.com/source/_build/2_interface/2_extras/local_asset_packages.html) containing all scripts can be found on the [releases](https://github.com/adam-rumpf/game-maker-scripts/releases) page.

The following is a brief description of the included functions, divided into rough categories.

## Analysis Functions

A variety of scripts dealing with functions and sets, which may have some uses for managing data structures.

* [`_integer_to_natural`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_integer_to_natural/_integer_to_natural.gml): Converts an integer to a unique natural number using the zig-zagging bijection from _(0, 1, -1, 2, -2, ...)_ to _(0, 1, 2, 3, 4, ...)_. The inverse of `_natural_to_integer`.
* [`_natural_to_integer`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_natural_to_integer/_natural_to_integer.gml): Converts a natural number to a unique integer using the zig-zagging bijection from _(0, 1, 2, 3, 4, ...)_ to _(0, 1, -1, 2, -2, ...)_. The inverse of `_integer_to_natural`.
* [`_natural_to_pair`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_natural_to_pair/_natural_to_pair.gml): Converts a natural number to a unique ordered pair of natural numbers using the [inverse Cantor pairing function](https://en.wikipedia.org/wiki/Pairing_function#Inverting_the_Cantor_pairing_function). The inverse of `_pair_to_natural`.
* [`_pair_to_natural`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_pair_to_natural/_pair_to_natural.gml): Converts an ordered pair of natural numbers to a unique natural number using the [Cantor pairing function](https://en.wikipedia.org/wiki/Pairing_function#Cantor_pairing_function). The inverse of `_natural_to_pair`.

## Array Functions

Common array functions (such as searching and counting).

* [`_array_count`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_count/_array_count.gml): Counts the number of occurrences of a specified value in an array.
* [`_array_index`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_array_index/_array_index.gml): Finds the first index at which a specified value occurs in an array (or -1 if not found). An optional argument allows the search to begin with a specified index.
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
* [`_root_bisection`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_root_bisection/_root_bisection.gml): Finds a function root on a specified interval using the [bisection method](https://en.wikipedia.org/wiki/Bisection_method).
* [`_root_newton`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_root_newton/_root_newton.gml): Finds a function root given a derivative and an initial guess using [Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method).

## Linear Algebra Functions

Common linear algebra algorithms for dealing with matrices and vectors. In all functions, _vectors_ are considered to be 1D arrays while _matrices_ are 2D arrays (i.e. arrays of arrays).

* [`_linear_solve`](https://github.com/adam-rumpf/game-maker-scripts/blob/master/scripts/_linear_solve/_linear_solve.gml): Solves a linear system given a coefficient matrix and righthand vector (using [Gaussian elimination with partial pivoting](https://en.wikipedia.org/wiki/Pivot_element)).
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
