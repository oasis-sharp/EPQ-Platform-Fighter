/// @function shineAI(ID, opponentID);

function shine_ai(ID, opID){
	
	if(offence_timer + defence_timer < 1){
		offence_timer = 20
	}	
	
	var rightFloor = place_meeting(x+48, y+16, tile_obj)+place_meeting(x+48, y+16, platform_obj);
	var leftFloor = place_meeting(x-48, y+16, tile_obj)+place_meeting(x-48, y+16, platform_obj);



	if(offence_timer > 0){
		offence_timer -= 1;
		
		if(find_in_array(STATE, "grounded") != -4 and jumpSquat < 1){
			jumpKeyBuffer = round(random_range(2,6));	
		}
		
		if(phy_speed_y > -3 and opID.y < y){
			//jumpKeyBuffer = round(random_range(2,6));	
		}
		
		
		if(opID.x > x and rightFloor){
			rightBuffer = 5;
		}
		else{
			if(leftFloor){
				leftBuffer = 5;
			}
		}
		
		if(offence_timer = 0){
			defence_timer = round(random_range(3, 20));	
		}
	}
	
	if(defence_timer > 0){
		defence_timer-=1;
		
		if(opID.x > x and leftFloor){
			leftHeld = 1;
		}
		else{
			if(rightFloor){
				rightHeld = 1;	
			}
		}
		
		if(find_in_array(STATE, "grounded") == -4){
			if(distance_to_object(opID) < 30){
				if(x > opID.x){
					leftHeld = 1;
				}
				else{
					rightHeld = 1;
				}
			}
			else{
				
				if(x > room_width/2){
					leftHeld = 1;
				}
				
				else{
					rightHeld = 1;
				}
					
			
			}
		}
		
		if(defence_timer = 0){
			offence_timer = round(random_range(3, 60));	;	
		}
	}
	
	
	if(dashdance_timer > 0){
		dashdance_timer -=1;
	}
	
	if(!rightFloor and find_in_array(STATE, "grounded") != -4){
		leftBuffer = 5;	
	}
	
	if(!leftFloor and find_in_array(STATE, "grounded") != -4){
		rightBuffer = 5;	
	}



	if(rightBuffer > 0){
		rightHeld = 1;
		rightBuffer -=1;
	}
	
	if(leftBuffer > 0){
		leftBuffer-=1;
		leftHeld = 1;
	}
	
	
	if(jumpKeyBuffer > 0){
		jumpKeyBuffer-=round(random_range(1,2))	
		
		if(jumpKeyBuffer = 1){
			jumpPressed = 1;	
			jumpKeyBuffer = -3;
		}
	}
	
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, hurtbox, _list, false);

	if _num > 0
	{
	    for (var i = 0; i < _num; ++i;)
	    {
			var col = _list[| i]
			if(id != col.parentID and col.parentID.lastHit != id and variable_instance_exists(col.parentID, "player")){
			
				if((opID.x > x and facing = 1) or opID.x < x and facing = -1){
					normalPressed=round(random_range(-2, 1));
				}
				
				else{
					normalPressed = round(random_range(1, 3));
					specialPressed = 1;	
				}
				
				offence_timer = 50;
				defence_timer = 0;
				
				upHeld = round(random_range(-1, 1));
				downHeld = round(random_range(-1, 1));
			}
	    }
	}

	ds_list_destroy(_list);
	
	if(hitLanded = 1){
		jumpKeyBuffer = round(random_range(2,3));
		hitLanded = 0;
	}
	
	if(jumpSquat > 0){
		var fuck = round(random_range(0, 5));
		
		if (fuck == 3){
			dodgePressed = 1;	
		}
		
		if(opID.y < y){
			jumpHeld = round(random_range(0, 1))+round(random_range(0, 1));	
		}
		
		if(opID.percent > 30 and jumpSquat = 3){
			rightHeld = 1;
			leftHeld = 1;
		}
	}
	
	if(opID.y-32 > y and find_in_array(STATE, "grounded") == -4){
		dodgePressed = round(random_range(-10, 1));	
	}
	
	
	if(find_in_array(STATE, "grounded") != -4){
		downPressed = round(random_range(0, 1));	
	}
	
	
	

}