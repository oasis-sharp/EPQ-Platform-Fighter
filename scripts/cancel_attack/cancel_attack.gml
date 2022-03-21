/// @function example(attack);
/// @param {string} attack  Description

function cancel_attack(attack){
	delete_from_array(STATE, "attacking");
	delete_from_array(STATE, "noControlGround");
	delete_from_array(STATE, "noControlAir");
	return delete_from_array(STATE, attack);	
}