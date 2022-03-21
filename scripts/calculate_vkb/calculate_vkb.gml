/// @function calculate_vkb(flipper, angle){
/// @param {index} flipper  angle flipper
/// @param {index}  angle  given angle
function calculate_vkb(kb, flipper, angle){
	if(flipper == 0){ // flipper 0 = outwards from offensive player
		return -kb/5;
	}
	
	if(flipper == 1){ // 1 = at exact kb angle
		return lengthdir_y(kb, angle);
	}


	if(flipper == 2){
		return lengthdir_y(kb, angle);
	}
}

