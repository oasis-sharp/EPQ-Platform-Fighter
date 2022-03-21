if(keyboard_check_pressed(ord("R"))){
	dmenu*=-1;	
}

if(keyboard_check_pressed(ord("T"))){
	dhitboxes*=-1;	
}


if(keyboard_check_pressed(ord("Y"))){
	room_restart();
}

if(keyboard_check_pressed(vk_escape)){
	room-=1;	
}


if(hitpause_timer > 0){

	instance_deactivate_all(true);
	physics_world_update_speed(0);
	
	if(!sprite_exists(screenShot)){
        screenShot = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);   
    }
	
}
else{
	
	 if(sprite_exists(screenShot)){
        sprite_delete(screenShot);
    }
	
	instance_activate_all()	
	physics_world_update_speed(60);
}

if(screenshakeTimer > 0){
	camera_set_view_target(view_camera[0], noone);
	screenshakeTimer -=1;
	screenshake(screenshakeIntensity,screenshakeIntensity/1.2);
}
else{
	camera_set_view_target(view_camera[0], id);
}