if image_index >= image_number - 1 instance_destroy(); // destroy if animation is over
if timer < 0 instance_destroy(); // destroy if timer runs out

timer-=1;

if (hBox_attached == true) {
	x=hBox_owner.x
	y=hBox_owner.y
}

if(link){
	image_index = hBox_owner.image_index;	
}


var _list = ds_list_create();
var _num = instance_place_list(x, y, hurtbox, _list, false);

if _num > 0
{
    for (var i = 0; i < _num; ++i;)
    {
		var col = _list[| i]
		if(hBox_owner != col.parentID and col.parentID.lastHit != id and variable_instance_exists(col.parentID, "player")){
			
			
			
			col.parentID.lastHit = id;
			col.parentID.hitstun_timer = hBox_hitstun;
			col.parentID.percent+=hBox_damage;
			
			if(col.parentID.x < hBox_owner.x and hBox_angle_flipper == 1){	var dir = -1;	} else{	var dir = 1;	}
			
			var kb  = calculate_knockback(hBox_kb, hBox_growth, col.parentID.percent, col.parentID.weight)
			debug_knockback = kb; // sends data to debugger to print
			
			
			var diUp = (col.parentID.downHeld-col.parentID.upHeld)*-1;
			var diRight = col.parentID.rightHeld-col.parentID.leftHeld;
			
			// var diUp = round(random_range(-1, 1));
			// var diRight = round(random_range(-1, 1));
			
			var vkb = (calculate_vkb(kb, hBox_angle_flipper, hBox_angle)+(hBox_diM*diUp*(kb/7)))*1.2;
			var hkb = (calculate_hkb(kb, hBox_angle_flipper, hBox_angle)+(hBox_diM*diRight*(kb/10)))*dir;		
			
			
			col.parentID.phy_speed_x = hkb;
			col.parentID.phy_speed_y = vkb;
			
			debugger.hitpause_timer = hBox_hitpause;
			debugger.screenshakeTimer = hBox_screenshakeTime;
			debugger.screenshakeIntensity = hBox_screenshakeIntensity;
			debugger.beginHitpause = 1;
			
			
				
			if(diRight != 0 or diUp != 0){	
				var di = instance_create_layer(col.x,col.y-16, "Instances", DIobject)
				di.image_angle = point_direction(0,0, diRight, diUp);
			}
			
			hBox_owner.hitLanded = 1;
			
			col.parentID.hitflash = 1;
			col.parentID.image_blend = c_red;
			
		}
    }
}

ds_list_destroy(_list);