/// @function shine_class(id);
/// @param {index} id  player id

function sword_class(id){


		//// begin attacking code ////

		var attackable = 0;
		
		if(find_in_array(STATE, "attacking") == -4 and find_in_array(STATE, "histun") == -4){
			attackable = 1;	
		}
		
		// up air
		
		if(attackable and normalPressed){
			
			sprite_index = p_sword_up_air;
			image_index = 0;
			image_speed = 0.8;
			add_to_array(STATE, "upAir");
			add_to_array(STATE, "attacking");
			
			with(create_visual(sword_up_air, image_speed, 10000, image_xscale, image_yscale, x, y, 1, 1)){
				image_blend = c_blue;	
			}
			
			swordID = create_hitbox(sword_up_air_box, image_speed, 100, 2, 90, 1, image_xscale, image_yscale, x, y, true, 34, 3, 6, 3, 1);	
			hitbox_effects(swordID, 3, 2, 15);
		}
		
		if(find_in_array(STATE, "upAir")){
			
			image_speed = 0.7;
			add_to_array(STATE, "noControlGround");


			if(image_index >= image_number - 1){
				cancel_attack("upAir")
				instance_destroy(swordID);
			}
			

			if(find_in_array(STATE, "hitstun")){
				cancel_attack("upAir");
				instance_destroy(swordID);			
			}
		}
		
		var attackable = 0;
		
		if(find_in_array(STATE, "attacking") == -4 and find_in_array(STATE, "histun") == -4){
			attackable = 1;	
		}
		
		
		// power shine attack
		
		
		if(attackable and specialPressed){
			
			sprite_index = powerShine;
			image_index = 0;
			add_to_array(STATE, "pShineNspec");
			add_to_array(STATE, "attacking");
			
			shineID = create_hitbox(pShineBox, image_speed, 100, 2, 40, 2, image_xscale, image_yscale, x, y, true, 34, 3, 6, 3, 0);	
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
		
		var attackable = 0;
		
		if(find_in_array(STATE, "attacking") == -4 and find_in_array(STATE, "histun") == -4){
			attackable = 1;	
		}
		
		
		if(find_in_array(STATE, "attacking") != -4){
			add_to_array(STATE, "interruptAnims");	
		}
		else{
			delete_from_array(STATE, "interruptAnims");	
		}
		
		if(!instance_exists(swordID)){
			swordID = noone;	
		}

}