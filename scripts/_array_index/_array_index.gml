/// @func _array_index(arr, val[, start])
/// @desc Finds the first index at which a value occurs in an array.
/// @param {*[]} arr - Array to search.
/// @param {*} val - Value to search for.
/// @param {int} [start=0] - Index to begin searching.
/// @return {int} First index (after start) where val occurs in arr (or -1 if not found).

function _array_index(arr, val, start = 0)
{
    return array_get_index(arr, val, start);
}
