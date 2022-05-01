/// @function setup(player_id);
/// @param {index} player_id  Description

// setup scripts that all players have, to intialise variables etc.

function setup(player_id){
	with(player_id){

		// standard 
		
		depth = -10;
		
		
		// gameplay vars //
		
		hitflash = noone;
		
		facing = 1;
		lastDash = 0;
		initialDashTimer = 0;
		backdash = 0;

		wavedashing = 0;
		
		lastHit = noone;
		
		jumpDir = 0;
		
		canDoubleJump = 0;
		canDodge = 0;
		fastfalling = 0;
		jumpSquat = 0;
		
		smokeEff = 0;

		hitstun_timer = 0;

		STATE = [];

		percent = 0;
		
		hurtboxID = noone;
		
		hitLanded = 0;
		
		// controls
		
		rightHeld = keyboard_check(right);
		leftHeld = keyboard_check(left);
		jumpHeld = keyboard_check(up);
		downHeld = keyboard_check(down); 
		walkHeld = keyboard_check(walk1);
		upHeld = keyboard_check(upDir);
		
		jumpPressed = keyboard_check_pressed(up);
		dodgePressed = keyboard_check_pressed(dodge);
		
		normalPressed = keyboard_check_pressed(normal);
		specialPressed = keyboard_check_pressed(special);
		
		with(instance_create_layer(x,y, "Instances", hurtbox)){
			parentID = other.id;
			other.hurtboxID = id;
		}
		
		with(instance_create_layer(x,y, "Instances", hat_obj)){
			owner = other.id
			image_xscale = 4;
			image_yscale = 4;
			depth = 15;
			if(other.player == 1){
				image_blend = c_blue;
			}
			if(other.player == 2){
				image_blend = c_red;
			}
			
			image_alpha = 0.50;
			
		}
	
		jumpbuffer = 0;

	}
}