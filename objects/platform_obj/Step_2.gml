oneAbove = 0;
twoAbove = 0; // variable that the player can grab to check grounded state


// store the players inputs in a variable
var down2 = player2_obj.downPressed;
var down1 = player1_obj.downPressed;

if(down1){
	if(down1Timer > 0){
		fall1 = 5;
	}
	else{
		down1Timer = downTime;	
	}
}

if(down2){
	if(down2Timer > 0){
		fall2 = 5;
	}
	else{
		down2Timer = downTime;	
	}
}

down1Timer-=1;
down2Timer-=1; // double tap buffer timer
fall1 -= 1;
fall2 -= 1; // time platform is solid for decreases



if(player1_obj.y < y and !fall1){
	oneAbove = 1; // platform is solid
}

if(player2_obj.y < y and !fall2){
	twoAbove = 1;
}


if(oneAbove == 1 and solid1 == 0){
	solid1 = physics_fixture_bind_ext(playerOneFix, id, image_xscale*16, 16) // create fixture
}
else{
	if(oneAbove = 0){
		physics_remove_fixture(id, solid1);
		solid1 = 0; // delete fixture if not needed
	}
}

if(twoAbove == 1 and solid2 == 0){
	solid2 = physics_fixture_bind_ext(playerTwoFix, id, image_xscale*16, 16)
}
else{
	if(twoAbove = 0){
		physics_remove_fixture(id, solid2);
		solid2 = 0; 
	}
}
