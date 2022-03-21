/// @function calculate_hkb(flipper, angle){
/// @param {index} flipper  angle flipper
/// @param {index}  angle  given angle
function calculate_hkb(kb ,flipper, angle){
	if(flipper == 0){ // flipper 0 = outwards from offensive player
		return lengthdir_x(kb, angle);
	}
	
	if(flipper == 1){ // at exact knockback angle
		return lengthdir_x(kb, angle);
	}


	if(flipper == 2){ // at opposite of knockback angle horizontally
		
		var facing = 0;
		
		if(image_xscale > 0){
			facing = -1;	
		}
		else{
			facing = 1;
		}
		
		return lengthdir_x(kb, angle)*facing;
	}
}