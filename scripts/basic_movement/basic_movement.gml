/// @function basic_movement(playerID);
/// @param {index} id Player ID

// basic movements consisting of running, jumping, double jumping and wall jumpinh

function basic_movement(playerID){
	
	with(playerID){
		
		phy_rotation = false;
		
		//// input handling ////
		
		// movement
		
		var rightHeld = keyboard_check(right);
		var leftHeld = keyboard_check(left);
		var jumpHeld = keyboard_check(up);
		var downHeld = keyboard_check(down); 
		var walkHeld = keyboard_check(walk1);
		var upHeld = keyboard_check(upDir);
		
		var jumpPressed = keyboard_check_pressed(up);
		var dodgePressed = keyboard_check_pressed(dodge);

		// histun 
		
		hitstun_timer -= 1;
		
		if(hitstun_timer > 0){
			add_to_array(STATE, "noControlGround");	
			add_to_array(STATE, "noControlAir");	
			add_to_array(STATE, "hitstun");
			
			phy_speed_x/=1.01
		}
		
		if(hitstun_timer = 0){
			delete_from_array(STATE, "noControlGround");
			delete_from_array(STATE, "noControlAir");
			delete_from_array(STATE, "hitstun");
		}


		//// begin movement code ////

		var move = rightHeld-leftHeld;


		// grounded checks // 
		
		var grounded = (place_meeting(x,y+1,tile_obj) and phy_speed_y=0);
		var canFastFall = 1;
		
		
		if(grounded == 0){
			
			// platform code
			
			if (place_meeting(x,y+1, platform_obj)){
				
				canFastFall = 0;
				var plat = instance_place(x,y+1, platform_obj);
				
				if(player == 1){
					if(plat.oneAbove== 1 and phy_speed_y=0){
						grounded = 1;
					}
				}
				
				if(player == 2){
					if(plat.twoAbove == 1 and phy_speed_y=0){
						grounded = 1;
					}				
				}
			}	
		}
		

		// sliding mechanics
		
		if(grounded and (move = 0 or find_in_array(STATE, "noControlGround")) and find_in_array(STATE, "initialDash") == -4 and phy_speed_x != 0){
			phy_speed_x/=groundFriction;
			
			if(abs(phy_speed_x) <= 1){
				phy_speed_x=0;	
			}
			
			add_to_array(STATE, "sliding");
		}
		else{
			delete_from_array(STATE, "sliding");	
		}
		
		
		// grounded code

		if(grounded){
			
			if(move == 0 or (move != facing and find_in_array(STATE, "grounded") != -4)){	
				//canInitial = 1;
			}
			
			add_to_array(STATE, "grounded");
			canDoubleJump = 1;
			canDodge = 1;
			fastfalling = 0;
			

		}
		else
		{
			canInitial = 0;
			delete_from_array(STATE, "grounded");
		}
		
		
		// slow down movement in air
		
		if(!grounded and find_in_array(STATE, "noControlAir") == -4 and move = 0){
			phy_speed_x/=airFriction;
		}
		
		
		// walking

		if(move != 0 and find_in_array(STATE, "noControlGround") == -4 and grounded){
			phy_speed_x=walksp*move;
			facing = move;
			add_to_array(STATE, "walking") ;
			
			if(canInitial and !walkHeld){ // start initial
				
				smokeEff = 5;
				add_to_array(STATE, "initialDash")
				initialDashTimer=initialDashTime;
				
				if(wavedashing == 1){
					wavedashing = 0;
					if(downHeld){
						initialDashTimer= wavedashDown;
					}
				}
			
				image_index = 0;
				lastDash=move;	
			}
			
			canInitial = 0;
		}
		else{
			delete_from_array(STATE, "walking");	
		}
		
		
		// initial dash 
		
		if(initialDashTimer > 0 and grounded and jumpSquat == 0){
			phy_speed_x = initialDashSpeed*lastDash;
			initialDashTimer-=1;
			canInitial = 0;
			create_trail(12.5, c_black, 70, 5, 0.95, x, y);

			if(backdash == 1){
				facing = -lastDash;	
			}
		}
		else{
			delete_from_array(STATE, "initialDash");	
			initialDashTimer = 0;
		}	
		
		// shifting air speed
		
		if(move != 0 and find_in_array(STATE, "noControlAir") == -4 and !grounded){
			phy_speed_x += airAccel*move;	
		}


		// jumping
		
		if((jumpPressed or jumpbuffer) and grounded and jumpSquat = 0 and find_in_array(STATE, "noControlGround") == -4){
			jumpSquat = jumpSquatTime;
			jumpDir = facing;
			add_to_array(STATE, "noControlGround");
		}
		
		jumpbuffer = 0;
		
		// jump squat code
		
		if(jumpSquat > 0){
			jumpSquat-=1;
			
			if(jumpSquat = 1){
				delete_from_array(STATE, "noControlGround")
				delete_from_array(STATE, "noControlAir")
				phy_speed_y=-jumpheight;
				
				if(move!=0){
					facing = move;
				}
				else{ 
					if(rightHeld){
						facing = -jumpDir;
					}
				}
				
				if(!jumpHeld){ // short hop
					phy_speed_y=-shortHopHeight;	
				}
			}
		}
		
		
		// double jumping
		
		if(jumpPressed and !grounded and canDoubleJump = 1){
			canDoubleJump = 0;
			effect_create_below(ef_ellipse, x+(16*move), y+16, 0, c_black);
			phy_speed_y = -doubleJumpHeight;
			
			if(move != 0){
				phy_speed_x = air_xcap*move;	
			}
		}
		
		// airdodge 
		
		wavedashing = 0;
		
		if(dodgePressed and (!grounded or jumpSquat > 0) and canDodge = 1){
			canDodge = 0;	
			phy_speed_y = airdodgeSpeed;
			phy_speed_x = (move)*airdodgeSpeed
			
			if(move!=0){
				facing = move;	
			}
			
			jumpSquat = 0;
			delete_from_array(STATE, "noControlGround");
			
			canInitial = 1; // enables the player to wavedash
			wavedashing = 1;
			
			create_trail(5, c_black, 75, 10, 1.02, x, y);
		}
		
		
		// fast falling
		/*
		if(!grounded and downPressed and canFastFall = 1 and (phy_speed_y >= 0 or (phy_speed_y < 0 and phy_speed_y > -shortHopHeight))){
			fastfalling = 1;	
			create_trail(5, c_black, 75, 10, 0.99, x, y);
		}
		
		canFastFall = 1;
		*/
		
		// speed checks //
		
		if(hitstun_timer < 0){

		if(abs(phy_speed_x) > x_cap){ // ensures speed doesn't go over limit
			if(phy_speed_x < 0){ phy_speed_x = -x_cap; }
			else{ phy_speed_x = x_cap; }
		}


		if(abs(phy_speed_y) > y_cap){ // ensures speed doesn't go over limit
			if(phy_speed_y < 0){ phy_speed_y = -y_cap; }
			else{ phy_speed_y = y_cap; }
		}
		
		if(!grounded and find_in_array(STATE, "noControlAir") == -4){
			if(abs(phy_speed_x) > air_xcap){ // ensures speed doesn't go over limit
			if(phy_speed_x < 0){ phy_speed_x = -air_xcap; }
			else{ phy_speed_x = air_xcap; }
			}	
		}
		
		}
		
		// fast fall physics
		
		if(!grounded){
			phy_speed_y+=fallSpMultiplier;	
			if(fastfalling){
				phy_speed_y+=fastfallSpMultiplier
			}
		}
		
		// limit rotation 
		
		phy_rotation = false;

		// after all functions decide if the player is still airborne or not
		
		if(grounded == 0){
			add_to_array(STATE, "air");	
		}
		else{
			delete_from_array(STATE, "air");	
		}
			
			
		// update image scale 
		
		image_xscale=5*facing;
		image_yscale=5;
		
		if(jumpSquat > 0){
			add_to_array(STATE, "jumpsquat");
		}
		else{
			delete_from_array(STATE, "jumpsquat")
		}
	
	}
	
		
}

