/// @function animation(playerID);
/// @param {index} id Player ID

function animation(playerID){

	with(playerID){
				
		if(find_in_array(STATE, "interruptAnims") == -4){
			
			// default to idle if nothing else
			
			var lastAnim = sprite_index;
			var tempIdle = image_index;
			sprite_index=idle; // default to idle state
			
			
			image_index=tempIdle;	
			
			
			// animations
			
			if(find_in_array (STATE, "walking") != -4){
				sprite_index= walk;	
				image_speed= 0.3;
			}
			
			if(find_in_array (STATE, "jumpsquat") != -4){
				sprite_index= jumpsquat;	
				image_speed= 1;
				if(image_index > image_number-1){
					image_index=image_number-2;
				}	
			}
			
			if(find_in_array(STATE, "air") != -4){
				sprite_index = air;	
				image_speed = 0.5;
				
				if(image_index>6){
					image_speed=0.2;	
				}
			
				if(image_index > image_number-1){
					image_index=6;
				}					
			}
			
			if(find_in_array(STATE, "initialDash") != -4){
				sprite_index = initial;
				image_speed = 0.5;
				if(image_index > image_number-1){
					image_index=image_number-1;
				}	
			}
			
			
			// reset animation frame if starting a new animation
			
			if(lastAnim != sprite_index){
				image_index=0;	
			}
		
		}

	}
}
