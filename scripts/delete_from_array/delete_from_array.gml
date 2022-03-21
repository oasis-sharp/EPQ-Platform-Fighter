
/// @function delete_from_array(array, term);
/// @param {array} array
/// @ param {string} term to search for/add if it isnt present
function delete_from_array(array, term){
	
	var find = find_in_array(array, term)
	
	if(find != -4){
		array_delete(array, find-1, 1)
	}
}

