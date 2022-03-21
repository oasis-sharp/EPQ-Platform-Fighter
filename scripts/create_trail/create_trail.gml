/// @function create_trail(player_id);
/// @param {index} _length  length
/// @param {color} c colour
/// @param {index} a alpha
/// @param {index} s shake
/// @param {index} g grow
/// @param {index} pos_x x
/// @param {index} pos_y y

function create_trail(_length,c, a,s, g, pos_x, pos_y){
	
	var trail = (instance_create_layer(x,y, "Instances", trail_obj)){
		trail.image_index = image_index;
		trail.sprite_index = sprite_index;
		trail.image_xscale = image_xscale;
		trail.image_yscale = image_yscale
		trail.image_blend = c;
		trail.image_speed = 0;
		trail.image_angle+=random_range(-s,s);
		trail.timer = a;
		trail.grow = g;
		trail.life = _length;
		trail.x = pos_x;
		trail.y = pos_y;
		
	}

}