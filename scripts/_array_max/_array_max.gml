/// @func _array_max(arr[, val])
/// @desc Finds the maximum value (or its index) in an array.
/// @param {real[]} arr - Array to search.
/// @param {bool} [val=true] - If true the maximum value is returned, if false the (first) index of the maximum value is returned.
/// @return {real} Maximum value (or its index) in arr.

function _array_max(arr, val = true)
{
    var results = array_reduce(arr, function(data, current, index) {
        if (data.value > current) {
            data.value = current;
            data.index = index;
        }
        return data;
    }, { index: 0, value: -infinity });
    
    return val ? results.value : results.index;
}
