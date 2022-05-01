/// @function create_hitbox(player_id);
/// @param {index} spr sprite
/// @param {index} spd speed of animation
/// @param {index} length length  of hitbox
/// @param {index} knockback knockback
/// @param {index} angle angle
/// @param {index} angle_flipper type of angle
/// @param {index} size_x size in the x direction
/// @param {index} size_y size in the y direction
/// @param {index} pos_x x
/// @param {index} pos_y y
/// @param {bool} attached if hbox is attached to player
/// @param {index} hitstun hitstun
/// @param {index} growth
/// @param {index} damage
/// @param {index} diM DI multiplier
/// @param {bool} link


function create_hitbox(spr, spd, length, knockback, angle, angle_flipper, size_x, size_y, pos_x, pos_y, attached, hitstun, growth, damage, DiM, link){
	
	var hBoxID = (instance_create_layer(x,y, "Instances", hitbox)){
		
		hBoxID.image_index = 0;
		hBoxID.sprite_index = spr;
		hBoxID.image_xscale = size_x;
		hBoxID.image_yscale = size_y;
		hBoxID.image_speed = spd;
		


		hBoxID.x = pos_x;
		hBoxID.y = pos_y;
		
		hBoxID.hBox_kb = knockback;
		hBoxID.hBox_angle = angle;
		hBoxID.hBox_angle_flipper = angle_flipper;
		hBoxID.hBox_attached = attached;
		hBoxID.hBox_growth = growth;
		hBoxID.hBox_damage = damage;
		
		hBoxID.hBox_owner = id;
		hBoxID.timer = length;
		
		hBoxID.hBox_hitstun = hitstun;
		hBoxID.hBox_diM = DiM;
		hBoxID.link = link;
		
		return hBoxID
		
	}

}