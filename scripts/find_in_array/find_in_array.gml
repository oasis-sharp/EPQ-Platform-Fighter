/// @function find_in_array(array, term);
/// @param {array} array
/// @ param {string} term to search for
function find_in_array(array, term){
	var loop = 0;
	repeat (array_length_1d(array)) if (array[loop++] == term) return loop;
	return -4;
}


