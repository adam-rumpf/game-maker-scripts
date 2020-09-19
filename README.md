# GameMaker Scripts

A collection of general utility scripts for GameMaker Studio 2 (Version 2.3).

All scripts are included in the `scripts/` folder of this repository. Each script defines a single function. Most functions are standalone and are meant to be taken à la carte, but some of the more mathematically complicated functions depend on other scripts, indicated in a `@requires` tag. All function names begin with an underscore (`_`) in order to distinguish them from built-in functions.

The following is a brief description of the included functions, divided into rough categories.

## Array Functions

Common array functions (such as searching and counting).

* `_array_count`: Counts the number of occurrences of a specified value in an array.
* `_array_index`: Finds the first index at which a specified value occurs in an array (or -1 if not found). An optional argument allows the search to begin with a specified index.
* `_array_max`: Returns the maximum value in an array.
* `_array_min`: Returns the minimum value in an array.

## Computational Mathematics Functions

Algorithms from computational mathematics (such as regression and interpolation).

* `...`

## Linear Algebra Functions

Common linear algebra algorithms for dealing with matrices and vectors.

* `_vector_distance`: Calculates the Lp-distance between two vectors.
* `_vector_norm`: Calculates the Lp-norm of a vector.

## Random Functions

Functions which involve randomization.

* `_random_weighted_index`: Chooses a random array index with probabilities defined by a given weight array.
