/// @function shine_class(id);
/// @param {index} id  player id

function shine_class(id){
	
		//// input handling ////
		
		// movement
		
		var rightHeld = keyboard_check(right);
		var leftHeld = keyboard_check(left);
		
		var jumpPressed = keyboard_check_pressed(up);
		
		// attacks
		
		var specialPressed = keyboard_check_pressed(special);
		var normalPressed = keyboard_check_pressed(normal);



		//// begin attacking code ////

		var attackable = 0;
		
		if(find_in_array(STATE, "attacking") == -4 and find_in_array(STATE, "histun") == -4){
			attackable = 1;	
		}
		
		// default shine attack
		
		if(attackable and normalPressed){
			
			image_speed = 0.5;
			sprite_index = shine;
			image_index = 0;
			add_to_array(STATE, "shineNspec");
			add_to_array(STATE, "attacking");
			
			shineID = create_hitbox(shineBox, image_speed, 100, 7, 45, 1, image_xscale, image_yscale, x, y, true, 20, 0.7, 2, 3);	
			hitbox_effects(shineID, 2, 1, 4)
		}
		
		if(find_in_array(STATE, "shineNspec")){
			
			image_speed = 0.5;
			add_to_array(STATE, "noControlGround");


			if(image_index >= image_number - 1){
				cancel_attack("shineNspec")
				instance_destroy(shineID);
			}
			

			if(jumpPressed and image_index > 1){
				cancel_attack("shineNspec");
				instance_destroy(shineID);
				jumpbuffer = 1;
			}	
			
			if(find_in_array(STATE, "hitstun")){
				cancel_attack("shineNspec");
				instance_destroy(shineID);			
			}
		}
		
		// power shine attack
		
		
		if(attackable and specialPressed){
			
			sprite_index = powerShine;
			image_index = 0;
			add_to_array(STATE, "pShineNspec");
			add_to_array(STATE, "attacking");
			
			shineID = create_hitbox(pShineBox, image_speed, 100, 2, 40, 2, image_xscale, image_yscale, x, y, true, 30, 3, 6, 5);	
			hitbox_effects(shineID, 3, 2, 15);
		}
		
		if(find_in_array(STATE, "pShineNspec")){
			
			image_speed = 0.45;
			add_to_array(STATE, "noControlGround");


			if(image_index >= image_number - 1){
				cancel_attack("pShineNspec")
				instance_destroy(shineID);
			}
			

			if(find_in_array(STATE, "hitstun")){
				cancel_attack("pShineNspec");
				instance_destroy(shineID);			
			}
		}
		
		
		if(find_in_array(STATE, "attacking") != -4){
			add_to_array(STATE, "interruptAnims");	
		}
		else{
			delete_from_array(STATE, "interruptAnims");	
		}

}