/// @function add_to_array(array, term);
/// @param {array} array
/// @ param {string} term to search for/add if it isnt present
function add_to_array(array, term){
	if(find_in_array(array, term) == -4){
		array_push(array, term)
		return true;
	}
	
	return false;
}

