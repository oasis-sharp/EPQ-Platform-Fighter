/// @function shine_setup(id);
/// @param {index} id  player id

// sets up the shine class specific variables and traits

function shine_setup(id){
	
		// physics limits //

		
		x_cap = 14;
		y_cap = 20;
		
		air_xcap = 10;

		// player traits //
		
		weight = 1000;

		walksp = 8;
		groundFriction = 1.23;
		airFriction = 1.01;
		jumpheight = 16;
		airAccel = 1.05;
		doubleJumpHeight = 13;
		shortHopHeight = 10;
		
		wavedashDown = 4;
		
		jumpSquatTime = 5;
		
		fallSpMultiplier = 1.1;
		fastfallSpMultiplier = 1.8;
		
		
		initialDashTime = 8;
		initialDashSpeed = 12;

		
		airdodgeSpeed = 15;
		

		
		// gameplay vars

		shineID = noone;
		
		
}