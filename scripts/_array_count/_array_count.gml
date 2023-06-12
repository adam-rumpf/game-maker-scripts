/// @func _array_count(arr, val)
/// @desc Counts the number of occurrences of a value in an array.
/// @param {*[]} arr - Array to search.
/// @param {*} val - Value to count.
/// @return {int} Number of occurrences of val in arr.

function _array_count(arr, val)
{
	// Go through array to tally instances of value
    return array_reduce(arr, method({ val: val }, function(previous, current, index) {
        if (current == self.val)
            return previous + 1;
        return previous;
    }), 0);
}
