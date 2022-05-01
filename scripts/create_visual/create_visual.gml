/// @function create_visual(player_id);
/// @param {index} spr sprite
/// @param {index} spd speed of animation
/// @param {index} length length  of hitbox
/// @param {index} size_x size in the x direction
/// @param {index} size_y size in the y direction
/// @param {index} pos_x x
/// @param {index} pos_y y
/// @param {bool} attached if hbox is attached to player
/// @param {bool} link if the animation is linked


function create_visual(spr, spd, length, size_x, size_y, pos_x, pos_y, attached, link){
	var hBoxID = (instance_create_layer(x,y, "Instances", hitboxVisualise)){
		
		hBoxID.image_index = 0;
		hBoxID.sprite_index = spr;
		hBoxID.image_xscale = size_x;
		hBoxID.image_yscale = size_y;
		hBoxID.image_speed = spd;
		hBoxID.x = pos_x;
		hBoxID.y = pos_y;
		
		hBoxID.hBox_owner = id;
		hBoxID.timer = length;
		hBoxID.attached = attached;
		hBoxID.link = link;
		
		hBoxID.depth = -20;
		
		return hBoxID
		
	}
}